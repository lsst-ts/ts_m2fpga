/*
 * Example code to C/C++ developer
 * Use NiFpga_ReadFifoU16() to read FIFO elements
 * Use m2-crio-simulator.ls.lsst.org
 * Use NI FPGA C API Interface
 * Use cRIO-9049
 * lessElementsFifoDesign1
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
	 uint32_t waitInMs = 5000; // 5000 miliseconds
         status = NiFpga_WriteU32(session, NiFpga_mainFPGA_ControlU32_waitInMs, waitInMs);
         
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
         int32_t fpgaError = 0;
     
         int j = 0;
         timeout = 0; 
	 printf("Start reading...\n");
         while(j < 20)
         {
            printf("while iteration = %d\n", j);
            // set the following value to 11 when want to test this branch
            numberOfElements = 9; //request more elements than FPGA sends, same as read less (9) than requested (11)
            status = NiFpga_ReadFifoU16(session, NiFpga_mainFPGA_TargetToHostFifoU16_daqFIFO,
                              &data[0],
                              numberOfElements,
                              timeout,
                              &elementsRemaining);
                        
            printf("status to read FIFO is %d\n", status);
            //printf("Elements remaining = %d, status = %d\n", elementsRemaining, status);
            
            /* Read data if there are elements in FIFO only */
            if (status == 0){
               printf("Data:\t");
               for (int i = 0; i < numberOfElements; i++){              
                   printf("%d\t", data[i]);
                   }
               printf("\n"); 
               //status = NiFpga_ReleaseFifoElements(session, NiFpga_mainFPGA_TargetToHostFifoU16_daqFIFO, numberOfElements);
               //printf("status = %d\n", status);
               } // end if             
            else printf("No data to read yet...\n");
            usleep(1000000); // 1000 ms
            j++;
            status = NiFpga_ReadBool(session, NiFpga_mainFPGA_IndicatorBool_dataFifoFull, &fifoStatus);
            printf("fifoStatus = %d, status = %d\n",(int)fifoStatus, status);

            status = NiFpga_ReadI32(session, NiFpga_mainFPGA_IndicatorI32_fpgaError, &fpgaError);
            printf("fpgaError = %d, status = %d\n", fpgaError, status);
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
