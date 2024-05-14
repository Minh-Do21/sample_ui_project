enum HTTPRequestMethods { get, post, put, patch, delete }

enum ApiURL {
  getListGroup,
}

// Handle this case.
extension ApiURLState on ApiURL {
  String get path {
    switch (this) {
      default:
        return 'undefine';
    }
  }

  HTTPRequestMethods? get methods {
    switch (this) {
      //- API Using Get Method
      case ApiURL.getListGroup:
        return HTTPRequestMethods.get;

      default:
        return null;
    }
  }
}
