import 'package:meal_app/model/meal_model.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DbHelper {
  Database? _database;

  Future<Database> get database async {
    if (_database != null) {
      return _database!;
    } else {
      _database = await inintDatabase();
      return _database!;
    }
  }

  Future<Database> inintDatabase() async {
    String path = join(await getDatabasesPath(), 'meal.db');
    return await openDatabase(path, version: 1, onCreate: _creatDataBase);
  }

  void _creatDataBase(Database db, int version) async {
    await db.execute('''
      CREATE TABLE meals (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        name TEXT,
        imageUrl TEXT,
        description TEXT,
        rate REAL,
        created_at TEXT
      )
''');
  }

  Future<int> insertMeal(MealModel meal) async {
    final db = await database;
    return await db.insert('meals', meal.toMap());
  }

  Future<List<MealModel>> getMeals() async {
    final db = await database;
    List<Map<String, dynamic>> meals = await db.query('meals');
    List<MealModel> mealsList =
        meals.map((meal) => MealModel.fromMap(meal)).toList();
    return mealsList;
  }
}
