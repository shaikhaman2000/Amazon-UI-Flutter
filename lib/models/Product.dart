
class Product {

    String name;
    List<dynamic> imagesList;
    double price;
    double originalPrice;
    String categoryRange;
    bool isAmazonChoice;
    String deliveredInDays;

    Product({
      required this.name,
      required this.imagesList,
      required this.price,
      required this.originalPrice,
      required this.categoryRange,
      required this.isAmazonChoice,
      required this.deliveredInDays,
    });

    factory Product.fromMap(Map<String, dynamic> map) {
      return Product(
        name: map['name'],
        imagesList: map['imagesList'],
        price: map['price'],
        originalPrice: map['originalPrice'],
        categoryRange: map['categoryRange'],
        isAmazonChoice: map['isAmazonChoice'],
        deliveredInDays: map['deliveredInDays']
      );
    }

}