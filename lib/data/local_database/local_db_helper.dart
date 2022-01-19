import 'package:nectar_app/data/model/cart_item.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class LocalDbHelper {
  static final LocalDbHelper _instance = LocalDbHelper.internal();
  factory LocalDbHelper() => _instance;
  LocalDbHelper.internal();
  static late Database _db;

  Future<Database> createDatabase() async {
    String path = join(await getDatabasesPath(), 'cart.db');
    _db = await openDatabase(path, version: 1,
        onCreate: (Database db, int version) {
      db.execute(
          'create table cartItems(id integer primary key autoincrement,productId integer,productName varchar(255),productPriceg varchar(255),productImage varchar(255),productPrice REAL,quantity integer )');
    });
    return _db;
  }

  Future<int> addToCart(CartItem cartItem) async {
    Database db = await createDatabase();
    return await db.insert('cartItems', cartItem.toJson());
  }

  Future<List> allCartProducts() async {
    Database db = await createDatabase();
    return await db.query('cartItems');
  }

  Future<int> updateProduct(CartItem cartItem) async {
    Database db = await createDatabase();

    return await db.update('cartItems', cartItem.toJson(),
        where: 'productId = ?', whereArgs: [cartItem.productId]);
  }

  Future<int> deleteFromCart(CartItem cartItem) async {
    Database db = await createDatabase();

    return await db.delete('cartItems',
        where: 'productId = ?', whereArgs: [cartItem.productId]);
  }
}
