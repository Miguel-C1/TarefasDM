enum ApiEndpoint {
  mockableBaseUrl;

  String get url {
    switch (this) {
      case ApiEndpoint.mockableBaseUrl:
        return "http://demo7662495.mockable.io/";
    }
  }
}
