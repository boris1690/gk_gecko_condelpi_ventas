class OptionRequestModel {
  Map? data;

  OptionRequestModel({this.data});

  String toUriParameters() {
    String response = "";

    this.data?.forEach((key, value) {
      response = "$response&$key=$value";
    });

    return response;
  }
}
