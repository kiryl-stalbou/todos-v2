part of data_di;

final Provider<ApiProvider> apiProvider = Provider<ApiProvider>(
  (ProviderRef<ApiProvider> ref) => ApiProvider(errorHandler: ErrorHandler()),
);
