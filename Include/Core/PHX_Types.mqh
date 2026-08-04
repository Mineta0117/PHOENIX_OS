//+------------------------------------------------------------------+
//| PHOENIX OS                                                       |
//| PHX_Types.mqh                                                    |
//+------------------------------------------------------------------+
#ifndef __PHX_TYPES_MQH__
#define __PHX_TYPES_MQH__

enum ENUM_PHX_TREND
{
   TREND_NONE = 0,
   TREND_BULL,
   TREND_BEAR,
   TREND_RANGE
};

struct TrendResult
{
   ENUM_PHX_TREND Trend;

   bool Alignment;

   bool PriceAbove20;
   bool PriceAbove50;
   bool PriceAbove200;

   double MA20;
   double MA50;
   double MA200;

   double MA20Slope;
   double MA50Slope;
   double MA200Slope;

   double ADX;
   double PlusDI;
   double MinusDI;
};

#endif
