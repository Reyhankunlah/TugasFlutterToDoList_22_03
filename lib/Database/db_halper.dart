import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:flutter_todolist/Models/task_model.dart';

class DBHelper {
  static final DBHelper _instance = DBHelper._internal();
  factory DBHelper() => _instance;
  DBHelper._internal();

  static Database? _db;

  Future<Database> get db async {
    if (_db != null) return _db!;
    _db = await initDb();
    return _db!;
  }

  // Inisialisasi database
  Future<Database> initDb() async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, 'tasks.db');

    return await openDatabase(
      path,
      version: 1,
      onCreate: (db, version) async {
        await db.execute('''
          CREATE TABLE tasks (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            title TEXT,
            status TEXT,
            dueDate TEXT,
            tags TEXT
          )
        ''');
      },
    );
  }

  // =========================
  // CRUD OPERATIONS
  // =========================

  Future<int> insertTask(TaskModel task) async {
    final dbClient = await db;
    return await dbClient.insert('tasks', {
      'title': task.title,
      'status': task.status.name,
      'dueDate': task.dueDate?.toIso8601String(),
      'tags': task.tags.join(','),
    });
  }

  Future<List<TaskModel>> getTasks() async {
    final dbClient = await db;
    final List<Map<String, dynamic>> maps = await dbClient.query('tasks');

    return List.generate(maps.length, (i) {
      final data = maps[i];
      return TaskModel(
        id: data['id'],
        title: data['title'],
        status: TaskStatus.values.firstWhere(
          (e) => e.name == data['status'],
          orElse: () => TaskStatus.notStarted,
        ),
        dueDate: data['dueDate'] != null
            ? DateTime.parse(data['dueDate'])
            : null,
        tags: data['tags'] != null && data['tags'].isNotEmpty
            ? data['tags'].split(',')
            : [],
      );
    });
  }

  Future<int> updateTask(TaskModel task) async {
    final dbClient = await db;
    return await dbClient.update(
      'tasks',
      {
        'title': task.title,
        'status': task.status.name,
        'dueDate': task.dueDate?.toIso8601String(),
        'tags': task.tags.join(','),
      },
      where: 'id = ?',
      whereArgs: [task.id],
    );
  }

  Future<int> deleteTask(int id) async {
    final dbClient = await db;
    return await dbClient.delete('tasks', where: 'id = ?', whereArgs: [id]);
  }

  Future<void> clearTasks() async {
    final dbClient = await db;
    await dbClient.delete('tasks');
  }
}
