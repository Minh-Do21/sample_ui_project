class Singleton {
  static final Singleton _appConfig = Singleton._internal();
  static Singleton get instance => _appConfig;
  factory Singleton() {
    return _appConfig;
  }
  Singleton._internal() {}
}
