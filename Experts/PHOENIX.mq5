//+------------------------------------------------------------------+
//| PHOENIX OS                                                       |
//| Version 0.1.0                                                    |
//+------------------------------------------------------------------+
#property copyright "PHOENIX Project"
#property version   "0.1.0"
#property strict

#include "../Include/Core/PHX_Config.mqh"
#include "../Include/Core/PHX_Types.mqh"

//-------------------------------------------------------------

int OnInit()
{
   Print("=======================================");
   Print("PHOENIX OS Started");
   Print("Version : ",PHX_VERSION);
   Print("=======================================");

   Comment(
      "PHOENIX OS\n",
      "Version : ",PHX_VERSION,"\n",
      "Status : READY"
   );

   return(INIT_SUCCEEDED);
}

//-------------------------------------------------------------

void OnTick()
{

}

//-------------------------------------------------------------

void OnDeinit(const int reason)
{
   Comment("");
}

//-------------------------------------------------------------
