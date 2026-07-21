import 'package:flutter/material.dart';
import 'database/database.dart';
import 'app.dart';

void main() {
  // Start SQLite if needed and initialize the database:
  AppDatabase.instance.start();
  runApp(MyApp());
}
