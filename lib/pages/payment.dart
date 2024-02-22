import 'package:flutter/material.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';

class Payment{
  Razorpay? razorpay;
  int? amount;
  String? name;

  Payment({this.amount,this.name}){
    razorpay =Razorpay();
    
    razorpay?.on(Razorpay.EVENT_PAYMENT_SUCCESS, handlerPaySuccess);
    razorpay?.on(Razorpay.EVENT_PAYMENT_ERROR, handlerPayFailure);
    razorpay?.on(Razorpay.EVENT_EXTERNAL_WALLET, handlerExternal);

  }
  void openCheckOut(){
    var options={
      "key":"",
      "amount": amount,
      "name": name,
      "description": "Payment",
      "prefill":{
        "contact": "8193893317",
        "email": "mayankk074@gmail.com"
      },
      "external":{
        "wallets": ["paytm"]
      }
    };
    try{
      razorpay?.open(options);
    }catch(e){
      print(e.toString());
    }

  }

  void handlerPaySuccess(){
    print("payment success");
  }
  void handlerPayFailure(){
    print("payment failure");
  }
  void handlerExternal(){
    print("payment wallet");
  }
}
