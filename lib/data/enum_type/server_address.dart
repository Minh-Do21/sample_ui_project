enum ServerAddress {
  URL,
  PORT,
}

extension ServerAddressExtension on ServerAddress {
  int get type {
    switch (this) {
      case ServerAddress.URL:
        return 1;
      default:
        return 2;
    }
  }

  String get name {
    switch (this) {
      case ServerAddress.URL:
        return 'URL';
      case ServerAddress.PORT:
        return 'PORT';
      default:
        return '';
    }
  }
}
