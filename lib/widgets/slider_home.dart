import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget sliderImages(){
  ValueNotifier<int> _current = ValueNotifier(0);
  return FutureBuilder(
      future: FirebaseFirestore.instance.collection('OtherData').doc('SliderImagesHome').get(),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return Text("Something went wrong");
        }

        if (!snapshot.hasData) {
          return Container(
            height: 100,
            margin: EdgeInsets.only(bottom: 10, top: 10),
            child: Image.asset('images/logo_black.png'),
          );
        }

        if (snapshot.connectionState == ConnectionState.done) {
          Map<String, dynamic> sliderImages = (snapshot.data as dynamic)!.data() as Map<String, dynamic>;
          List<Widget> sliderImagesWidget = <Widget>[];
          List images = sliderImages['images'];
          List<Widget> indicators = <Widget>[];

          images.forEach((image){
            sliderImagesWidget.add(
                Container(
                  child: InkWell(
                    onTap: (){

                    },
                    child: Center(
                        child: ClipRRect(
                            child: Container(
                              color: Colors.white,
                              child:CachedNetworkImage(
                                placeholder: (context, url) =>
                                    SizedBox(
                                      width: 50,
                                      height: 50,
                                      child: Container(
                                        height: 50,
                                        margin: EdgeInsets.only(bottom: 10, top: 10),
                                        child: Image.asset('images/logo_black.png'),
                                      ),
                                    ),
                                imageUrl: image,
                                width: MediaQuery.of(context).size.width,
                                fit: BoxFit.cover,
                              ),
                            )
                        )
                    ),
                  ),
                )
            );

            int index = images.indexOf(image);
            indicators.add( //are changed
                ValueListenableBuilder(
                  valueListenable: _current,
                  builder: (BuildContext context, value, Widget? child) {
                    return Container(
                      width: 8.0,
                      height: 8.0,
                      margin: EdgeInsets.symmetric(vertical: 5.0, horizontal: 2.0),
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: _current.value == index
                              ? Color(0xffffffff)
                              : Color(0xffcccccc)
                      ),
                    );
                  },
                )
            );
          });

          return Container(
              child: Stack(
                children: [
                  CarouselSlider(
                    options: CarouselOptions(
                        enlargeCenterPage: false,
                        enableInfiniteScroll: true,
                        initialPage: 0,
                        viewportFraction: 1.0,
                        autoPlay: false,
                        onPageChanged: (index, reason) {
                          _current.value = index;
                        }
                    ),
                    items: sliderImagesWidget,
                  ),
                  Container(
                    height: 190,
                    alignment:Alignment.bottomCenter,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: indicators,
                    ),
                  ),
                ],
              )
          );
        }
        return SizedBox();
      }
  );
}