import 'package:amzon_clone_app/constant.dart';
import 'package:amzon_clone_app/widgets/category_card.dart';
import 'package:amzon_clone_app/widgets/drawer.dart';
import 'package:amzon_clone_app/widgets/options_card.dart';
import 'package:amzon_clone_app/widgets/other_categories.dart';
import 'package:amzon_clone_app/widgets/slider_home.dart';
import 'package:amzon_clone_app/widgets/titlebar_with_logo.dart';
import 'package:amzon_clone_app/widgets/top_deals.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  static final String id = "home-screen";
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: lightBlue,
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              icon: Icon(Icons.menu, color: Colors.black,),
              onPressed: () => Scaffold.of(context).openDrawer(),
            );
          },
        ),
        title: titleBar(),
        bottom:PreferredSize(
          preferredSize: Size.fromHeight(50),
          child: Container(
            margin: EdgeInsets.all(10),
            height: 40,
            decoration: BoxDecoration(
                borderRadius:  BorderRadius.all(
                  Radius.circular(5.0),
                ),
                color: Colors.white),
            child: TextFormField(
              textAlignVertical: TextAlignVertical.bottom,
              textAlign: TextAlign.start,
              style: TextStyle(color: Colors.black, fontSize: 16.0),
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.search,color: Colors.black,),
                suffixIcon: Icon(Icons.camera_alt_outlined),
                hintText: 'Search',
                hintStyle: TextStyle(color: Colors.grey),
                focusedBorder:OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(5.0),
                    ),
                    borderSide: BorderSide(
                      color: Color(0xff7a7a7a),
                    )
                ),
                border: OutlineInputBorder(
                    borderRadius:  BorderRadius.all(
                      Radius.circular(5.0),
                    ),
                    borderSide: BorderSide(
                      color: Color(0xff7a7a7a),
                    ),
                ),
              ),
            ),
          ),
        ),
        elevation: 0,
      ),
      drawer: drawerWidget(),
      body: ListView(
        children: [
          Container(
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: Colors.lightBlue,
            ),
            child: Row(
              children: [
                Icon(Icons.location_on, size: 17,),
                Text('\tSelect a location to see product availability',style: TextStyle(fontWeight: FontWeight.w700),),
              ],
            ),
          ),
          listCategories(),
          sliderImages(),
          listOptions(),
          topDealsToday(),
          otherWidgetsCategories(context),
        ],
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
