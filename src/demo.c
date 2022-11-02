/*
 * Example code to C/C++ developer
 * Using m2-crio-simulator.ls.lsst.org
 * And C API interface
 * cRIO-9049
 */

#include "../fpgaInterface/NiFpga_mainFPGA.h"
#include <stdio.h>
#include <stdlib.h>
#include <unistd.h> // avoid warning in sleep()
#include <time.h>

int main()
{
   printf("Initializing...\n");
   NiFpga_Status status = NiFpga_Initialize();
   char* bitfilePath = "fpgaInterface/NiFpga_mainFPGA.lvbitx"; 
   if (NiFpga_IsNotError(status))
   {
      NiFpga_Session session;
      /* opens a session and downloads the bitstream */
      printf("Opening a session...\n");
      
      NiFpga_Status status = 0;
      status = NiFpga_Open(bitfilePath,
                                        NiFpga_mainFPGA_Signature,
                                        "RIO0",
                                        NiFpga_OpenAttribute_NoRun,
                                        &session);
      printf("Status to open the NiFPGA bitfile is %d\n", status);
      
      if (NiFpga_IsNotError(status))
      {
         /* run the FPGA application */
  	 printf("Running the FPGA...\n");
         NiFpga_Run(session, 0);
   
         // Variables //
         uint16_t data[9] = {0};
         size_t numberOfElements;
         uint32_t timeout;
         size_t elementsRemaining = 0; // variable declaration
	 NiFpga_Bool fifoStatus = 0;
     
         while(1)
	 {
          numberOfElements = 0;
          timeout = 0;     
          status = NiFpga_ReadFifoU16(session, NiFpga_mainFPGA_TargetToHostFifoU16_daqFIFO, 
                              &data[0], 
                              numberOfElements, 
                              timeout, 
                              &elementsRemaining);
      
          printf("Elements Remaining Before = %d, status = %d\n", elementsRemaining, status);

          if (elementsRemaining > 9) 
           {
            numberOfElements = 9;
            
            status = NiFpga_ReadFifoU16(session, NiFpga_mainFPGA_TargetToHostFifoU16_daqFIFO,
                              &data[0],
                              numberOfElements,
                              timeout,
                              &elementsRemaining);
      		          
            printf("Elements Remaining After = %d, status = %d\n", elementsRemaining, status);
            
            printf("Data:\t");
            for (int i = 0; i < numberOfElements; i++)
               {              
                printf("%d\t", data[i]);
               }
            printf("\n"); 
            NiFpga_ReleaseFifoElements(session, NiFpga_mainFPGA_TargetToHostFifoU16_daqFIFO, numberOfElements);
           }
                                 

	  usleep(20000); // 20 ms
        }
         printf("Press <Enter> to stop and quit...");
         getchar();
         /* stop the FPGA loops */


         printf("Stopping the FPGA...\n");
         
         /* close the session now that we're done */
         printf("Closing the session...\n");
         NiFpga_Close(session, 0);
      }
      /* must be called after all other calls */
      printf("Finalizing...\n");
      NiFpga_Finalize();
   }
   /* check if anything went wrong */
   if (NiFpga_IsError(status))
   {
      printf("Error %d!\n", status);
      printf("Press <Enter> to quit...\n");
      getchar();
   }
   return status;
}