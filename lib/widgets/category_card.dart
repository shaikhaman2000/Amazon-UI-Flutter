import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget listCategories() {
  return FutureBuilder(
    future: FirebaseFirestore.instance.collection('OtherData').doc('Categories').get(),
    builder: (context, snapshot){
      if (snapshot.hasError) {
        return Text("Something went wrong");
      }

      if (!snapshot.hasData) {
        return Container(
          alignment: Alignment.center,
          height: 100,
          width: 50,
          padding: EdgeInsets.all(15),
          child: CircularProgressIndicator(
            strokeWidth: 2.0,
          ),
        );
      }

      if (snapshot.connectionState == ConnectionState.done) {
        Map<String, dynamic> data = (snapshot.data as dynamic)!.data() as Map<String, dynamic>;
        return Card(
          child: Container(
            height: 70,
            child: ListView.builder(
              itemCount: (data['categoriesList'] as List).length,
              itemBuilder: (context, index){
                String image = data['categoriesList'][index].toString().toLowerCase();
                return new Container(
                  width: 70.0,
                  child: Column(
                    children: [
                      Image.asset('images/cat_icons/$image.jpg',height: 50,),
                      Text('${data['categoriesList'][index]}',style: TextStyle(fontSize: 12),),
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
      return SizedBox();
    },
  );
}
