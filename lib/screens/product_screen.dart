import 'package:amzon_clone_app/models/Product.dart';
import 'package:amzon_clone_app/widgets/drawer.dart';
import 'package:amzon_clone_app/widgets/titlebar_with_logo.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import '../constant.dart';

class ProductPage extends StatefulWidget {
  static final String id = "product-screen";

  final Product product;

  ProductPage({required this.product});
  @override
  _ProductPageState createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {

  ValueNotifier<int> _current = ValueNotifier(0);
  List<Widget> sliderImagesWidget = <Widget>[];
  List<Widget> indicators = <Widget>[];

  @override
  Widget build(BuildContext context) {

    widget.product.imagesList.forEach((image) {
      sliderImagesWidget.add(
          Container(
            child: InkWell(
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
                      fit: BoxFit.fitHeight,
                    ),
                  )
              ),
            ),
          )
      );
      int index = widget.product.imagesList.indexOf(image);
      indicators.add( //are changed
          ValueListenableBuilder(
            valueListenable: _current,
            builder: (BuildContext context, value, Widget? child) {
              return Container(
                width: 8.0,
                height: 8.0,
                margin: EdgeInsets.symmetric(vertical: 5.0, horizontal: 2.0),
                decoration: BoxDecoration(
                  border: Border.all(color: Color(0xffbbbbbb)),
                    shape: BoxShape.circle,
                    color: _current.value == index
                        ? Color(0xffcccccc)
                        : Color(0xffffffff)
                ),
              );
            },
          )
      );
    });

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
        elevation: 0,
      ),
      drawer: drawerWidget(),
      body: ListView(
        children: [
          Padding(
              padding: EdgeInsets.symmetric(vertical: 5,horizontal: 10),
              child: Text('${widget.product.name}',maxLines: 3,),
          ),
          Container(
              child: CarouselSlider(
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
              )
          ),
          ValueListenableBuilder(
              valueListenable: _current,
              builder: (BuildContext context, value, Widget? child) {
                return Container(
                  alignment: Alignment.centerLeft,
                  padding: EdgeInsets.all(10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: indicators,
                  ),
                );
              }
          ),
          Card(
            child: Container(
              padding: EdgeInsets.all(15),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: Text('M.R.P.:',style: TextStyle(fontSize: 17,color: Color(0xff2d2d2d)),),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: Text('Deal of the Day:',style: TextStyle(fontSize: 17,color: Color(0xff2d2d2d)),),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: Text('You Save:',style: TextStyle(fontSize: 17,color: Color(0xff2d2d2d)),),
                          )
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: Text('₹ ${widget.product.originalPrice}',style: TextStyle(fontSize: 17,color: Color(0xff2d2d2d)),),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: Text('₹ ${widget.product.price}',style: TextStyle(fontSize: 17,color: Colors.red),),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: Text('₹ ${widget.product.originalPrice - widget.product.price} (${double.parse('${100 - (widget.product.price*100)/widget.product.originalPrice}').toStringAsFixed(2)}%) ',style: TextStyle(fontSize: 17,color: Colors.red),),
                          )
                        ],
                      ),
                    ],
                  ),
                  Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text('FREE Delivery:',style: TextStyle(color: Colors.blueAccent),),
                        Text('\tMonday, June 21',style: TextStyle(fontWeight: FontWeight.bold),)
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ) // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
