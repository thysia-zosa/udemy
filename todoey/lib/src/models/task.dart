class Task {
  final String _title;
  bool _isDone;

  Task({
    required String title,
    bool isDone = false,
  })  : _title = title,
        _isDone = isDone;

  String get title => _title;
  bool get isDone => _isDone;

  void toggleDone() => _isDone = !_isDone;
}
