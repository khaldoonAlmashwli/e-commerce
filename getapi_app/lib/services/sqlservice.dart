
//import 'package:getapi_app/model/cart.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:getapi_app/model/product.dart';

class SqlService {
    Database? db;

    Future openDB() async {
      try {
        // Get a location using getDatabasesPath
        var databasesPath = await getDatabasesPath();
        String path = join(databasesPath, 'shopping.db');
        // open the database
        db = await openDatabase(
          path,
          version: 8,
          onCreate: (Database db, int version) async {
            print(db);
            this.db = db;
            createTables();
            },
        );
        return true;
      } catch (e) {
        print("ERROR IN OPEN DATABASE $e");
        return Future.error(e);
      }
    }
    createTables() async {
      print("table cart is exists 1");
      try {
        var qry = "CREATE TABLE IF NOT EXISTS cart ( "
            "id INTEGER,"
            "cart_id INTEGER PRIMARY KEY not null,"
            "title TEXT,"
            "description Text,"
            "price Text,"
            "category Text,"
            "image Text,"
            "rate Text,"
            "count Text)";
        await db?.execute(qry);
      } catch (e) {
        print(e);
      }
    }
    Future<int> addToCart(Product item) async{
      print(item.toMap());
      var dbClient = await db;
      int res = await dbClient!.insert("cart", item.toMap());
      print("$res ----------------");
      return res;
    }

    Future<List>selectCartList() async  {
      var dbClient = await db;
      var result = await dbClient!.rawQuery("Select * from cart");
      return result.toList();
    }
    
    Future<int>removeFromCart(int index) async {
      var dbClient = await db;
      var res = await dbClient!.delete("cart", where: "cart_id =?", whereArgs: [index]);
      return res;
    }
}

/*

    // Future insertsql(Product item) async {
    //   await this.db?.transaction((txn) async {
    //     var qry =
    //         'INSERT INTO cart(title, description, price, category, image, rate, count) VALUES(${item.title},"${item.description}",${item.price}, "${item.image}", ${item.rate},${item.count})';
    //     int id1 = await txn.rawInsert(qry);
    //     return id1;
    //   });
    // }
 */