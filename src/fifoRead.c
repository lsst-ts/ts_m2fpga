/*
 * Example code to C/C++ developer
 * Use NiFpga_ReadFifoU16() to read FIFO elements
 * Use m2-crio-simulator.ls.lsst.org
 * Use NI FPGA C API Interface
 * Use cRIO-9049
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
         /* Write the waitInMs */
	 /* Time delay in the FPGA code to write elements */
	 uint32_t waitInMs = 5000; // 5000 miliseconds
         status = NiFpga_WriteU32(session, NiFpga_mainFPGA_ControlU32_waitInMs, waitInMs);
	 printf("Status to write the waitInMs control in FPGA code is %d.\n", status);         

         /* run the FPGA application */
  	 printf("Running the FPGA...\n");
         /* run the FPGA application */
         status = NiFpga_Run(session, 0);
         printf("Status to run the FPGA is %d\n", status);
   
         // Variables //
         uint16_t data[9] = {0};
         size_t numberOfElements;
         uint32_t timeout;
         size_t elementsRemaining = 0;
	      NiFpga_Bool fifoStatus = 0;
     
         int j = 0;
	 printf("Start reading...\n");
         while(j < 50)
         {
            printf("while iteration = %d\n", j);
            timeout = -1;     

               numberOfElements = 5;
               status = NiFpga_ReadFifoU16(session, NiFpga_mainFPGA_TargetToHostFifoU16_daqFIFO,
                              &data[0],
                              numberOfElements,
                              timeout,
                              &elementsRemaining);
                        
               printf("Status to read FIFO elements is %d\n", status);

	       printf("Address:\n");  
               for (int i = 0; i < numberOfElements; i++)
                  { 
                     printf("%p\t", &data[i]);
                  }
               printf("\n"); 
               printf("Data:\n");
               for (int i = 0; i < numberOfElements; i++)
                  {              
                     printf("%d\t", data[i]);
                  }
               printf("\n"); 
               printf("Elements remaining = %d\n", elementsRemaining);
               //status = NiFpga_ReleaseFifoElements(session, NiFpga_mainFPGA_TargetToHostFifoU16_daqFIFO, numberOfElements);
               //printf("status = %d\n", status);
                            
            usleep(1000000); // 1000 ms
            j++;
            status = NiFpga_ReadBool(session, NiFpga_mainFPGA_IndicatorBool_dataFifoFull, &fifoStatus);
            printf("Status to read dataFifoFull boolean is %d\n", status);
            printf("fifoStatus from FPGA = %d\n",(int)fifoStatus);
         } // end while

         
	      // check whether or not there are elements remaining
         numberOfElements = 0;
         status = NiFpga_ReadFifoU16(session, NiFpga_mainFPGA_TargetToHostFifoU16_daqFIFO,
                              &data[0],
                              numberOfElements,
                              timeout,
                              &elementsRemaining);
         printf("Elements Remaining = %d, status = %d\n", elementsRemaining, status);

         // printf("Press <Enter> to stop and quit...");
         // getchar();

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
