import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget titleBar(){
  return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children:[
        Padding(
          padding: const EdgeInsets.only(top: 8.0),
          child: Image.asset('images/logo_black.png', height: 20,),
        ),
        IconButton(onPressed: (){}, icon:Icon(Icons.shopping_cart_outlined,color: Colors.black,))
      ]
  );
}