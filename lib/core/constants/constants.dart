class Constants {
  factory Constants() {
    return _instance;
  }
  Constants._internal();
  static final Constants _instance = Constants._internal();
  static const String loginEndPoint = 'login';
  static const String systemEndPoint = 'public/systems';
  static const String classEndPoint = 'public/classrooms';
  static const String termEndPoint = 'public/terms';
}
