class Backend {
  static Backend? _instance;

  Backend._();

  factory Backend() => _instance ??= Backend._();
}
