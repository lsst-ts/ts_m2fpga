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
   /* must be called before any other calls */
   printf("Initializing...\n");
   printf("Reading dataFifoFull indicator...\n");
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
         NiFpga_Run(session, 0);
         NiFpga_Bool fifoStatus = NiFpga_False;
         int i = 0;             
         // read indicator during 10 seconds
         while (i < 10)
         {
            NiFpga_ReadBool(session, NiFpga_mainFPGA_IndicatorBool_dataFifoFull,&fifoStatus);               
            if (fifoStatus)
               printf("dataFifoFull is TRUE\n");
            else 
               printf("dataFifoFull is FALSE\n");
                      
            i += 1;
            sleep(1);
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