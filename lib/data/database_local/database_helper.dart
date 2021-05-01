import 'package:my_restaurant/provider/database_provider.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper {
  static DatabaseHelper _databaseHelper;
  static Database _database;

  DatabaseHelper._createObject();

  factory DatabaseHelper() {
    if (_databaseHelper == null) {
      _databaseHelper = DatabaseHelper._createObject();
    }
    return _databaseHelper;
  }

  static const String _tblRestaurant = 'restaurant';

  Future<Database> _initializeDb() async {
    var path = await getDatabasesPath();
    var db = openDatabase(
      '$path/restaurantapp.db',
      onCreate: (db, version) async {
        await db.execute(
          '''CREATE TABLE $_tblRestaurant(
          id TEXT PRIMARY KEY,
          name TEXT,
          description TEXT,
          city TEXT,
          address TEXT,
          pictureId TEXT
          )''',
        );
      },
      version: 1,
    );

    return db;
  }

  Future<Database> get database async {
    if (_database == null) {
      _database = await _initializeDb();
    }
    return _database;
  }

  // Method menyimpan restorant favorit
  Future<void> insertRestaurant(ModelRestaurantFavorite restaurant) async {
    final db = await database;
    print('insert $db');
    await db.insert(_tblRestaurant, restaurant.toJson());
  }

  // Mebaca data yang ada di database lokal
  Future<List<ModelRestaurantFavorite>> getRestaurant() async {
    final db = await database;
    List<Map<String, dynamic>> results = await db.query(_tblRestaurant);

    return results.map((res) => ModelRestaurantFavorite.fromJson(res)).toList();
  }

  // mencari idrestauran yang digunakan untuk favorite restaurant
  Future<Map> getRestaurantById(String id) async {
    final db = await database;

    List<Map<String, dynamic>> results = await db.query(
      _tblRestaurant,
      where: 'id = ?',
      whereArgs: [id],
    );

    if (results.isNotEmpty) {
      return results.first;
    } else {
      return {};
    }
  }

  // Meghapus data restaurant favorite
  Future<void> removeRestaurant(String id) async {
    final db = await database;
    print('remove $db');
    await db.delete(
      _tblRestaurant,
      where: 'id = ?',
      whereArgs: [id],
    );
  }
}
