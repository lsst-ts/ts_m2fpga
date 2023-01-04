/*
 * Example code to C/C++ developer
 * Use NiFpga_ReadFifoU16() to read FIFO elements
 * Use m2-crio-simulator.ls.lsst.org
 * Use NI FPGA C API Interface
 * Use cRIO-9049
 * I want to release 1 element and there is 1 element in FIFO
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
         /* Run the FPGA application */
  	 printf("Running the FPGA...\n");
         status = NiFpga_Run(session, 0);
         printf("Status to run the FPGA is %d\n", status);
   
         /* Declare Variables */
         uint16_t data[9] = {0};
         size_t numberOfElements;
         uint32_t timeout;
         size_t elementsRemaining = 0;
     
         /* Read Fifo elements */
	 printf("Start reading...\n");
         timeout = 0; // in miliseconds 
         numberOfElements = 1;                                      
         status = NiFpga_ReadFifoU16(session, NiFpga_mainFPGA_TargetToHostFifoU16_daqFIFO,
                              &data[0],
                              numberOfElements,
                              timeout,
                              &elementsRemaining);
         printf("status to read FIFO is %d\n", status);       
         
         /* Print elements read */
         printf("Data:\t");
         for (int i = 0; i < numberOfElements; i++){              
             printf("%d\t", data[i]);
             }
         printf("\n");         
                
         //usleep(100000); // 100 ms
         
         /* Release elements */
         size_t elements = 1; // number of elements to release
         status =  NiFpga_ReleaseFifoElements(session, NiFpga_mainFPGA_TargetToHostFifoU16_daqFIFO, elements);
         printf("Status to release elements = %d\n", status);

	 /* Check whether or not there are elements remaining */
         numberOfElements = 0;
         status = NiFpga_ReadFifoU16(session, NiFpga_mainFPGA_TargetToHostFifoU16_daqFIFO,
                              &data[0],
                              numberOfElements,
                              timeout,
                              &elementsRemaining);
         printf("Elements Remaining = %d, status = %d\n", elementsRemaining, status);

         /* Stop the FPGA loops */
         printf("Closing the FPGA session...\n");
         status = NiFpga_Close(session, 0);
         printf("Status to close the FPGA %d\n", status);
      } // end second if
   
      /* must be called after all other calls */
      printf("Finalizing...\n");
      status = NiFpga_Finalize();
      printf("Status to finalize the FPGA %d\n", status);
   } //end first if
   
   /* check if anything went wrong */
   if (NiFpga_IsError(status))
   {
      printf("Error %d!\n", status);
      printf("Press <Enter> to quit...\n");
      getchar();
   }
   return status;
}
