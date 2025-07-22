import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseHelper {
  static final DatabaseHelper _instance = DatabaseHelper._internal();
  factory DatabaseHelper() => _instance;
  static Database? _database;

  DatabaseHelper._internal();

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    String path = await getDatabasesPath();
    String databasePath = join(path, 'ventas_app.db');
    return await openDatabase(
      databasePath,
      version: 1,
      onCreate: _onCreate,
    );
  }

  Future<void> _onCreate(Database db, int version) async {
    await db.execute('''
      CREATE TABLE productos(
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        nombre TEXT,
        precio_compra REAL,
        precio_venta REAL
      )
    ''');
    await db.execute('''
      CREATE TABLE ventas(
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        fecha_hora TEXT,
        ruta_venta TEXT,
        total_venta REAL,
        denominacion_pago_cliente REAL,
        cambio REAL,
        id_producto INTEGER,
        cantidad INTEGER,
        tipo_unidad TEXT,
        FOREIGN KEY (id_producto) REFERENCES productos(id)
      )
    ''');
  }

  // Métodos para Productos
  Future<int> insertProduct(Map<String, dynamic> product) async {
    Database db = await database;
    return await db.insert('productos', product);
  }

  Future<List<Map<String, dynamic>>> getProducts() async {
    Database db = await database;
    return await db.query('productos');
  }

  // Métodos para Ventas
  Future<int> insertSale(Map<String, dynamic> sale) async {
    Database db = await database;
    return await db.insert('ventas', sale);
  }

  Future<List<Map<String, dynamic>>> getSales() async {
    Database db = await database;
    // Puedes unirte con la tabla de productos para obtener nombres, etc.
    return await db.rawQuery('''
      SELECT
        v.*,
        p.nombre AS nombre_producto
      FROM
        ventas v
      JOIN
        productos p ON v.id_producto = p.id
    ''');
  }

  // Otros métodos: updateProduct, deleteProduct, updateSale, deleteSale, etc.
}
