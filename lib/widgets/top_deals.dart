import 'package:amzon_clone_app/models/Product.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget topDealsToday() {
  List<Product> productsList = [];
  ValueNotifier<int> _current = ValueNotifier(0);

  return FutureBuilder(
      future: FirebaseFirestore.instance.collection('Products').get(),
      builder: (context, snapshot) {
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
          List<DocumentSnapshot> slider = (snapshot.data as dynamic)!.docs as List<DocumentSnapshot>;
          List<Widget> sliderImagesWidget = <Widget>[];
          List<Widget> smallImagesWidget = <Widget>[];

          slider.forEach((document){
            Product product = Product.fromMap((document.data() as Map<String, dynamic>));
            productsList.add(product);
            sliderImagesWidget.add(
                Container(
                  child: InkWell(
                    onTap: () {
                        // hack for adding Products from here ;)
                        /*await FirebaseFirestore.instance.collection('Products').doc().set({
                          'name': 'Aman Shaikh',
                          'imagesList': [
                            'https://firebasestorage.googleapis.com/v0/b/clone-amazo.appspot.com/o/Slider%2Fslider4.jpg?alt=media&token=108f2a89-ef5e-498e-91f0-fd6f5add3fe7',
                          ],
                          'price': 25.5,
                          'originalPrice': 30.5,
                          'categoryRange': '30,000 - 40,000',
                          'isAmazonChoice': false,
                          'deliveredInDays': '4'
                        });
                        print('Done');*/

                        // Product Page Remaining So Not Including Now
                        /*Navigator.push(context, PageTransition(
                            child: ProductPage(product: product,),
                            type: PageTransitionType.rightToLeft));*/
                    },
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
                            imageUrl: product.imagesList[0],
                            width: MediaQuery.of(context).size.width,
                            fit: BoxFit.fitHeight,
                          ),
                        )
                    ),
                  ),
                )
            );
            smallImagesWidget.add(
                Container(
                  padding: EdgeInsets.all(4),
                  child: InkWell(
                    onTap: () {
                    },
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
                        imageUrl: product.imagesList[0],
                        width: MediaQuery.of(context).size.width / 4 - 10,
                      ),
                    ),
                  ),
                )
            );
          });

          return Card(
            child: Column(
              children: [
                Container(
                  padding: EdgeInsets.only(left: 10, top: 10),
                  alignment: Alignment.centerLeft,
                    child: Text(
                      'Deals of the Day',
                      style: TextStyle(fontSize: 19,fontWeight: FontWeight.w300),
                      textAlign: TextAlign.start,)
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 10),
                    child: Divider()
                ),
                Container(
                    child: CarouselSlider(
                      options: CarouselOptions(
                          enlargeCenterPage: false,
                          enableInfiniteScroll: true,
                          initialPage: 0,
                          viewportFraction: 1.0,
                          autoPlay: true,
                          onPageChanged: (index, reason) {
                            _current.value = index;
                          }
                      ),
                      items: sliderImagesWidget,
                    )
                ),
                ValueListenableBuilder(
                  valueListenable: _current,
                  builder: (BuildContext context, value, Widget? child) {
                    return Container(
                      alignment: Alignment.centerLeft,
                      padding: EdgeInsets.all(10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(bottom: 4.0),
                            child: Text('${productsList[_current.value].name}',style: TextStyle(fontSize: 14,),overflow: TextOverflow.ellipsis,),
                          ),
                          Text('${productsList[_current.value].categoryRange}',style: TextStyle(fontSize: 14),),
                        ],
                      ),
                    );
                  }
                ),
                Container(
                  child: Row(
                    children: smallImagesWidget,
                  ),
                ),
                Container(
                    padding: EdgeInsets.all(10),
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'See all deals',
                      style: TextStyle(fontSize: 15,fontWeight: FontWeight.w300, color: Colors.blue),
                      textAlign: TextAlign.start,)
                ),
              ],
            ),
          );
        }
        return SizedBox();
      }
  );
}