import 'package:logger/logger.dart';

final logger = Logger(
  printer: PrettyPrinter(
    methodCount: 0,      // Сколько методов в стеке вызовов показывать
    errorMethodCount: 5, // Сколько методов показывать, если это ошибка
    lineLength: 80,      // Длина разделительной линии
    colors: true,        // Раскрашивать сообщения
    printEmojis: true,   // Добавлять эмодзи (🚀, ❌, ℹ️)
    printTime: true,     // Показывать время
  ),
);