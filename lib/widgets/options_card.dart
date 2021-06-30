import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget listOptions() {
        List<String> imagesPath = [
          'images/options_icons/amazon_pay.jpg',
          'images/options_icons/send_money.jpg',
          'images/options_icons/sacn_upi_qr.jpg',
          'images/options_icons/pay_bills.jpg',
          'images/options_icons/covid.jpg',
        ];
        List<String> namePath = [
          'Amazon Pay',
          'Send Money',
          'Scan UPI QR',
          'Pay Bills',
          'Covid - 19'
        ];

        return Card(
          child: Container(
            height: 120,
            padding: EdgeInsets.only(bottom: 10),
            child: ListView.builder(
              itemCount: namePath.length,
              itemBuilder: (context, index){
                return new Container(
                  width: 90.0,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(imagesPath[index],height: 70,),
                      Padding(
                        padding: const EdgeInsets.only(top: 4.0),
                        child: Text(namePath[index],style: TextStyle(fontSize: 13.5),),
                      ),
                    ],
                  ),
                  alignment: Alignment.center,
                );
              },
              scrollDirection: Axis.horizontal,
            ),
          ),
        );
}
