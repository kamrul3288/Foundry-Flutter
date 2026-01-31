enum ApiServices {
  auth,
  app,
  googleMap,
}

extension ApiServicesExtension on ApiServices {
  String get baseUrl {
    switch (this) {
      case ApiServices.auth:
        return 'https://api.example.com/auth';
      case ApiServices.app:
        return 'http://jsonplaceholder.typicode.com';
      case ApiServices.googleMap:
        return 'https://api.example.com/google-map';
    }
  }
}
