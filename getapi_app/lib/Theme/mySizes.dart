import 'package:flutter/material.dart';
class MySizes{
  late double _height;
  late double _mainHeight;
  late double _width;
  late double _mainWidth;
  late String currentOrint;
  late double appBarHeight;
  MySizes(this._height, this._width);

  MySizes.getSizes(MediaQueryData mq){
    if(mq.orientation == Orientation.portrait) {
      currentOrint = "vt";
      _mainHeight = mq.size.height;
      _mainWidth = mq.size.width;
      if(mq.size.height < 400) {
        appBarHeight = 400 * (16 / 100);
      }
      else if(mq.size.height >= 400 && mq.size.height < 600 ) {
        appBarHeight = mq.size.height * (14 / 100);
      }
      else{
        appBarHeight = mq.size.height * (10 / 100);
      }
      if(mq.size.height<400) {
        _height = 400 - appBarHeight;
      }else {
        _height = mq.size.height - appBarHeight;
      }
      if(mq.size.width < 300) {
        _width = 300;
      }
      else{
        _width = mq.size.width;
      }
    }    //return MySizes(mq.size.height, mq.size.width);
    else{
      currentOrint = "ht";
      _mainHeight = mq.size.height;
      _mainWidth = mq.size.width;
      if(mq.size.height < 400){
        appBarHeight=400 *(16/100);
        _height = 400 - appBarHeight;
      }else{
        appBarHeight=mq.size.height *(15/100);
        _height = mq.size.height - appBarHeight;
      }
      if(mq.size.width<300){
        _width =300;
      }
      else{
        _width = mq.size.width;
      }
      //_height = mq.size.height - appBarHeight;
      //_width = mq.size.width;
    }
  }

  double getHeight(double rate){
    if(rate >= 0 && rate <= 100){
      return (_height) * (rate / 100);
    }
    else{
      throw( Exception("use value between 0 and 100 only"));
    }
  }
  double getWidth(double rate){
    if(rate>=0 && rate<=100){
      return _width * (rate / 100);
    }
    else{
      throw( Exception("use value between 0 and 100 only"));
    }
  }

  double getTextSize(double rate){
    if(rate>=0 && rate<=100){
      double scall= (_width + _height)/2;
      if(scall>500)
        scall = 500;

      if(scall<300)
        scall = 300;
      return scall * (rate / 100);
    }
    else{
      throw( Exception("use value between 0 and 100 only"));
    }
  }

}