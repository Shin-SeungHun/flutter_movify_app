enum WatchProviderEnums {
  netflix,
  watcha,
  disney,
  wavve,
  amazon,
  apple,
}

extension WatchProviderEnumsExtension on WatchProviderEnums {
  int get watchProvider {
    switch (this) {
      case WatchProviderEnums.netflix:
        return 8;
      case WatchProviderEnums.watcha:
        return 97;
      case WatchProviderEnums.disney:
        return 337;
      case WatchProviderEnums.wavve:
        return 356;
      case WatchProviderEnums.amazon:
        return 119;
      case WatchProviderEnums.apple:
        return 350;
    }
  }
}
