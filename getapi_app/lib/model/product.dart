import 'rate.dart';
class Product{

  final int id;
  final String title;
  final String price;
  final String description;
  final String category;
  final String image;
  final String rate;
  final String count;

  const Product({
    required this.id,
    required this.title ,
    required this.description ,
    required this.price,
    required this.category ,
    required this.image,
    required this.rate,
    required this.count,
  });

  Product.getMap(Map<String, dynamic> map):
        id = map['id'],
        title = map['title'],
        description= map['description'],
        price= map['price'].toString(),
        category= map['category'],
        image = map['image'],
        rate = map["rating"]["rate"].toString(),
        count = map["rating"]["count"].toString();

  Map<String, dynamic> toMap(){
    return {
      'id': id,
      'title': title,
      'description': description,
      'price': price,
      'category': category,
      'image': image,
      'rate': rate,
      'count': count
    };
  }
}