/*
 * Example code to C/C++ developer
 * Using m2-crio-simulator.ls.lsst.org
 * And C API interface
 * cRIO-9049
 */

#include "../fpgaInterface/NiFpga_mainFPGA.h"
#include <stdio.h>
#include <stdlib.h>

int main()
{
   printf("Initializing...\n");
   NiFpga_Status status = NiFpga_Initialize();
   if (NiFpga_IsNotError(status))
   {
      NiFpga_Session session;
      /* opens a session and downloads the bitstream */
      printf("Opening a session...\n");
      //NiFpga_MergeStatus(&status);
      NiFpga_Open(NiFpga_mainFPGA_Bitfile,
                                        NiFpga_mainFPGA_Signature,
                                        "RIO0",
                                        NiFpga_OpenAttribute_NoRun,
                                        &session);
      
      if (NiFpga_IsNotError(status))
      {
         /* run the FPGA application */
         NiFpga_Run(session, 0);
   
         // Variables //
         uint16_t* data;
         size_t numberOfElements;
         uint32_t timeout;
         size_t* elementsRemaining;
         
         numberOfElements = 0;
         timeout = 0;     
         NiFpga_ReadFifoU16(session, NiFpga_mainFPGA_TargetToHostFifoU16_daqFIFO, 
                              &data, 
                              numberOfElements, 
                              timeout, 
                              &elementsRemaining);
         
         if (elementsRemaining >= 9)
         {
            printf("Elements Remaining = %d\n", &elementsRemaining);
            numberOfElements = 9;
            timeout = 0;
            NiFpga_ReadFifoU16(session, NiFpga_mainFPGA_TargetToHostFifoU16_daqFIFO, 
                              &data, 
                              numberOfElements, 
                              timeout, 
                              &elementsRemaining);
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