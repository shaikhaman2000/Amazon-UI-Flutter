import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';



Widget otherWidgetsCategories(BuildContext context) {

    List<int> imgList = [1, 2, 3, 4];
    List<String> nameList = [
      'Gift for men',
      'Gift for women',
      'Gift for boys',
      'Gift for girls',
    ];
    double width = MediaQuery.of(context).size.width;
    List<Widget> widgets = <Widget>[];

    imgList.forEach((element) {
      widgets.add(
        Container(
          width: width / 2,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset('images/other_widgets_icon/${element.toString()}.jpeg'),
              Padding(
                padding: const EdgeInsets.all(4.0),
                child: Text('${nameList[element - 1]}',style: TextStyle(fontSize: 13),textAlign: TextAlign.right,),
              ),
            ],
          ),
          alignment: Alignment.center,
        )
      );
    });

    return Card(
      child: Container(
        padding: EdgeInsets.only(top: 5),
        width: width,
        height: 420,
        child: GridView.count(
          physics: NeverScrollableScrollPhysics(),
          children: widgets,
          childAspectRatio: 0.865,
          crossAxisSpacing: 5,
          mainAxisSpacing: 5,
          crossAxisCount: 2,
        ),
      ),
    );

}
