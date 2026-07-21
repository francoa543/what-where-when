import 'package:sqflite_common_ffi/sqflite_ffi.dart';
import 'package:path/path.dart';
import 'package:flutter/services.dart';
import 'dart:io';

/// Singleton class to manage the SQLite database for the app.
/// The database's public methods can be accessed through the singleton
/// "instance".
class AppDatabase {
  // Create a singleton instance:
  AppDatabase._();
  static final AppDatabase instance = AppDatabase._();

  /// The database object that SQLite commands will be run on.
  Database? _db;

  // TODO: configure these bools to be togglable from the app home screen
  /// If this is true, the database will be made in an easy-to-reach spot.
  bool devModeOn = true;

  /// If this is true, the database will be fully refreshed.
  bool shouldReset = true;

  /// Returns the device's appropriate database path, or in the project
  /// directory if in 'dev mode' via [devModeOn].
  Future<String> get databasePath async {
    return devModeOn
        ? join(current, 'www_data.db') // If devMode is on
        : join(await getDatabasesPath(), 'www_data.db'); // If devmode is off
  }

  /// Opens the database, fully resetting it if [shouldReset] is true. Calls
  /// [createDatabase].
  Future<void> start() async {
    // Initialize sqflite via FFI if needed:
    if (Platform.isWindows || Platform.isLinux) {
      sqfliteFfiInit();
      databaseFactory = databaseFactoryFfi;
    }

    final dbPath = await databasePath;

    // Delete the database before calling createDatabase if needed and able.
    if (shouldReset) {
      await deleteDatabase(dbPath);
    }

    await _db?.close();

    _db = await openDatabase(
      dbPath,
      version: 1,
      onCreate: (db, version) async => await createDatabase(db),
    );
  }

  /// Executes SQL for the .sql asset given by [assetPath] on the database [db].
  Future<void> _executeSQL(String assetPath, Database db) async {
    // Load the SQL asset and read it before executing:
    final sql = await rootBundle.loadString(assetPath);
    final statements = sql
        .split(';')
        .map((statement) => statement.trim())
        .where((statement) => statement.isNotEmpty);

    for (final statement in statements) {
      await db.execute(statement);
    }
  }

  /// Executes SQL to build the app's database structure.
  Future<void> createDatabase(Database db) async {
    // Execute SQL to create tables:
    _executeSQL('lib/database/create.sql', db);

    // Load test data if devMode is on and no reset is happening:
    if (devModeOn == true && shouldReset == false) {}
  }
}
