/*
 * Example code to C/C++ developer
 * Use NiFpga_ReadFifoU16() to read FIFO elements
 * Use m2-crio-simulator.ls.lsst.org
 * Use NI FPGA C API Interface
 * Use cRIO-9049
 * I want to add more elements in FIFO
 * but there is no available space
 */

#include "../fpgaInterface/NiFpga_mainFPGA.h"
#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>

int main()
{
   NiFpga_Status status = 0;
   
   printf("Initializing...\n");
   status = NiFpga_Initialize();
   
   /* Use the NiFpga_mainFPGA.lvbitx instead the original bitfile */
   char* bitfilePath = "fpgaInterface/NiFpga_mainFPGA.lvbitx"; 

   if (NiFpga_IsNotError(status))
   {
      NiFpga_Session session;
      /* opens a session and downloads the bitstream */
      printf("Opening a session...\n");
      
      status = NiFpga_Open(bitfilePath,
                                        NiFpga_mainFPGA_Signature,
                                        "RIO0",
                                        NiFpga_OpenAttribute_NoRun,
                                        &session);
      printf("Status to open the NiFPGA bitfile is %d\n", status);
      
      /* Reset the FPGA (suggested by Petr) */
      //status = NiFpga_Reset(session);
      //printf("Status to reset the FPGA is %d\n", status);
   
      // If there is no error we run the FPGA
      if (NiFpga_IsNotError(status))
      {
         /* run the FPGA application */
  	 printf("Running the FPGA...\n");
         status = NiFpga_Run(session, 0);
         printf("Status to run the FPGA is %d\n", status);
   
         /* Declare Variables */
         uint16_t data[9] = {0};
         size_t numberOfElements;
         uint32_t timeout, errorCode = 0;
         size_t elementsRemaining = 0;
	 NiFpga_Bool timedOut = 0;
         int j = 0;
     
         while (j <= 20){ 
            printf("j = %d\n", j);
            status = NiFpga_ReadBool(session, NiFpga_mainFPGA_IndicatorBool_TimedOut, &timedOut);
            printf("Timed Out? = %d, status = %d\n", (int)timedOut, status);
            status = NiFpga_ReadI32(session, NiFpga_mainFPGA_IndicatorI32_errorCode, &errorCode);
            printf("errorCode = %d, status = %d\n", errorCode, status);
            j++;
            usleep(1000000); // 1 s
            } // end while
         
         /* stop the FPGA loops */
         printf("Stopping the FPGA...\n");
         
         /* close the session now that we're done */
         printf("Closing the session...\n");
         status = NiFpga_Close(session, 0);
         printf("Status to close the FPGA %d\n", status);
      }
      /* must be called after all other calls */
      printf("Finalizing...\n");
      status = NiFpga_Finalize();
      printf("Status to finalize the FPGA %d\n", status);
   } //end if
   
   /* check if anything went wrong */
   if (NiFpga_IsError(status))
   {
      printf("Error %d!\n", status);
      printf("Press <Enter> to quit...\n");
      getchar();
   }
   return status;
}
