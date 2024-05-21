class NetworkServiceResponse<T> {
  bool success;
  String message;

  NetworkServiceResponse({this.success = false, this.message = ""});
}

class MappedNetworkServiceResponse<T> {
  dynamic mappedResult;
  NetworkServiceResponse<T> networkServiceResponse;

  MappedNetworkServiceResponse({this.mappedResult, required this.networkServiceResponse});
}