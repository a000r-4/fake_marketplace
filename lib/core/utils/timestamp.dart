String timestamp(DateTime timestamp) {
  final now = DateTime.now();
  if (now.day == timestamp.day) {
    return '${timestamp.hour.toString().padLeft(2, '0')}:'
        '${timestamp.minute.toString().padLeft(2, '0')}';
  } else {
    return '${timestamp.day.toString().padLeft(2, '0')}.'
        '${timestamp.month.toString().padLeft(2, '0')}.'
        '${timestamp.year.toString().substring(2)}';
  }
}