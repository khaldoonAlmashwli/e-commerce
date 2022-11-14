

class Cart{
  final int id;
  final int cart_id;
  final String title;
  final String price;
  final String description;
  final String category;
  final String image;
  final String rate;
  final String count;


  const Cart({
    required this.id,
    required this.cart_id,
    required this.title ,
    required this.description ,
    required this.price,
    required this.category ,
    required this.image,
    required this.rate,
    required this.count,
  });

  Cart.getMap(Map<String, dynamic> map):
        id = map['id'],
        cart_id = map['cart_id'],
        title = map['title'],
        description= map['description'],
        price= map['price'],
        category= map['category'],
        image = map['image'],
        rate = map["rate"],
        count = map["count"];

  Map<String, dynamic> toMap(){
    return {
      'id': id,
      'cart_id': cart_id,
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