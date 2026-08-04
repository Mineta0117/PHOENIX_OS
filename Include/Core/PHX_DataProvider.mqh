//+------------------------------------------------------------------+
//| PHOENIX OS                                                       |
//| PHX_DataProvider.mqh                                             |
//+------------------------------------------------------------------+
#ifndef __PHX_DATAPROVIDER_MQH__
#define __PHX_DATAPROVIDER_MQH__

#include "PHX_Config.mqh"

//==================================================
// Market Data
//==================================================

struct MarketData
{
   datetime Time;

   double Bid;
   double Ask;
   double Spread;

   double MA20;
   double MA50;
   double MA200;

   double ATR;

   double ADX;
   double PlusDI;
   double MinusDI;
};

//==================================================
// Data Provider
//==================================================

class CDataProvider
{
private:

   int hMA20;
   int hMA50;
   int hMA200;

   int hADX;
   int hATR;

public:

   bool Initialize()
   {
      hMA20=iMA(_Symbol,
                PHX_ENTRY_TIMEFRAME,
                PHX_FAST_MA,
                0,
                MODE_EMA,
                PRICE_CLOSE);

      hMA50=iMA(_Symbol,
                PHX_ENTRY_TIMEFRAME,
                PHX_MIDDLE_MA,
                0,
                MODE_EMA,
                PRICE_CLOSE);

      hMA200=iMA(_Symbol,
                 PHX_ENTRY_TIMEFRAME,
                 PHX_SLOW_MA,
                 0,
                 MODE_EMA,
                 PRICE_CLOSE);

      hADX=iADX(_Symbol,
                PHX_ENTRY_TIMEFRAME,
                PHX_ADX_PERIOD);

      hATR=iATR(_Symbol,
                PHX_ENTRY_TIMEFRAME,
                PHX_ATR_PERIOD);

      if(hMA20==INVALID_HANDLE) return(false);
      if(hMA50==INVALID_HANDLE) return(false);
      if(hMA200==INVALID_HANDLE) return(false);
      if(hADX==INVALID_HANDLE) return(false);
      if(hATR==INVALID_HANDLE) return(false);

      return(true);
   }

   //--------------------------------------------

   bool Update(MarketData &data)
   {
      double buffer[];

      data.Time=TimeCurrent();

      data.Bid=SymbolInfoDouble(_Symbol,SYMBOL_BID);
      data.Ask=SymbolInfoDouble(_Symbol,SYMBOL_ASK);

      data.Spread=
      (data.Ask-data.Bid)/_Point;

      //============================
      // MA20
      //============================

      if(CopyBuffer(hMA20,0,0,1,buffer)<=0)
         return(false);

      data.MA20=buffer[0];

      //============================
      // MA50
      //============================

      if(CopyBuffer(hMA50,0,0,1,buffer)<=0)
         return(false);

      data.MA50=buffer[0];

      //============================
      // MA200
      //============================

      if(CopyBuffer(hMA200,0,0,1,buffer)<=0)
         return(false);

      data.MA200=buffer[0];

      //============================
      // ATR
      //============================

      if(CopyBuffer(hATR,0,0,1,buffer)<=0)
         return(false);

      data.ATR=buffer[0];

      //============================
      // ADX
      //============================

      if(CopyBuffer(hADX,0,0,1,buffer)<=0)
         return(false);

      data.ADX=buffer[0];

      //============================
      // +DI
      //============================

      if(CopyBuffer(hADX,1,0,1,buffer)<=0)
         return(false);

      data.PlusDI=buffer[0];

      //============================
      // -DI
      //============================

      if(CopyBuffer(hADX,2,0,1,buffer)<=0)
         return(false);

      data.MinusDI=buffer[0];

      return(true);
   }

   //--------------------------------------------

   void Release()
   {
      IndicatorRelease(hMA20);
      IndicatorRelease(hMA50);
      IndicatorRelease(hMA200);

      IndicatorRelease(hADX);
      IndicatorRelease(hATR);
   }

};

#endif
