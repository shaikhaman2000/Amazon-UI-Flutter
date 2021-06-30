import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../Constant.dart';

Widget drawerWidget() {
  ScrollController controller = ScrollController();

  return Drawer(
    child: Scrollbar(
      controller: controller,
      thickness: 5,
      child: ListView(
        controller: controller,
        children: [
          Container(
            padding: EdgeInsets.all(15),
            height: 60,
            decoration: BoxDecoration(
              color: lightBlue,
            ),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children:[
                  Text(
                    'Hello,\t',
                    style: TextStyle(
                        fontSize: 22, fontStyle: FontStyle.italic
                    ),
                  ),
                  Text(
                    'User',
                    style: TextStyle(
                        fontSize: 22, fontStyle: FontStyle.italic
                    ),
                  ),
                ]
            ),
          ),
          ListTile(
            contentPadding: EdgeInsets.only(left: 25),
            title: Text('Home',
              style: TextStyle(fontSize: 15),),
            onTap: () {

            },
          ),
          ListTile(
            contentPadding: EdgeInsets.only(left: 25),
            title: Text('Shop by Category',
              style: TextStyle(fontSize: 15),),
            onTap: () {

            },
          ),
          ListTile(
            contentPadding: EdgeInsets.only(left: 25),
            title: Text('Today\'s Deals',
              style: TextStyle(fontSize: 15),),
            onTap: () {

            },
          ),
          Divider(),
          ListTile(
            contentPadding: EdgeInsets.only(left: 25),
            title: Text('Your Orders',
              style: TextStyle(fontSize: 15),),
            onTap: () {

            },
          ),
          ListTile(
            contentPadding: EdgeInsets.only(left: 25),
            title: Text('Buy Again',
              style: TextStyle(fontSize: 15),),
            onTap: () {

            },
          ),
          ListTile(
            contentPadding: EdgeInsets.only(left: 25),
            title: Text('Your Wish List',
              style: TextStyle(fontSize: 15),),
            onTap: () {

            },
          ),
          ListTile(
            contentPadding: EdgeInsets.only(left: 25),
            title: Text('Your Account',
              style: TextStyle(fontSize: 15),),
            onTap: () {

            },
          ),
          ListTile(
            contentPadding: EdgeInsets.only(left: 25),
            title: Text('Amazon Pay',
              style: TextStyle(fontSize: 15),),
            onTap: () {

            },
          ),
          ListTile(
            contentPadding: EdgeInsets.only(left: 25),
            title: Text('Try Prime',
              style: TextStyle(fontSize: 15),),
            onTap: () {

            },
          ),
          ListTile(
            contentPadding: EdgeInsets.only(left: 25),
            title: Text('Sell on Amazon',
              style: TextStyle(fontSize: 15),),
            onTap: () {

            },
          ),
          ListTile(
            contentPadding: EdgeInsets.only(left: 25),
            title: Text('Programs and Features',
              style: TextStyle(fontSize: 15),),
            onTap: () {

            },
            trailing: IconButton(
              onPressed: (){},
              icon: Icon(Icons.arrow_forward_ios, size: 18,),
            ),
          ),
          Divider(),
          ListTile(
            contentPadding: EdgeInsets.only(left: 25),
            title: Text('Language \tA/क',
              style: TextStyle(fontSize: 15),),
            onTap: () {

            },
          ),
          ListTile(
            contentPadding: EdgeInsets.only(left: 25),
            title: Text('Your Notifications',
              style: TextStyle(fontSize: 15),),
            onTap: () {

            },
          ),
          ListTile(
            contentPadding: EdgeInsets.only(left: 25),
            title: Text('Settings\t 🇮🇳',
              style: TextStyle(fontSize: 15),),
            onTap: () {

            },
            trailing: IconButton(
              onPressed: (){},
              icon: Icon(Icons.arrow_forward_ios, size: 18,),
            ),
          ),
          ListTile(
            contentPadding: EdgeInsets.only(left: 25),
            title: Text('Customer Service',
              style: TextStyle(fontSize: 15),),
            onTap: () {

            },
          )
        ],
      ),
    ),
  );
}