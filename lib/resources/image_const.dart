enum IMAGE_CONST {
  logoApp,
  kriso,
  background,
}

// ignore: camel_case_extensions
extension IMAGE_CONST_VALUE on IMAGE_CONST {
  String get path {
    switch (this) {
      case IMAGE_CONST.logoApp:
        return 'assets/images/logo_app.png';
      case IMAGE_CONST.kriso:
        return 'assets/images/kriso.png';
      case IMAGE_CONST.background:
        return 'assets/images/background.jpg';
      default:
        return '';
    }
  }
}
