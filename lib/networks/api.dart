import 'package:http/http.dart' as http;

class Api {
  String _baseUrl = "https://api.unsplash.com/photos/";
  String _clientId =
      "9d2bde1dd88e38a0e340542bc583fa7256f87e48217b5e40619f6ac6e97d144a";

  Future getData() async {
    return await http.get("$_baseUrl?client_id=$_clientId");
  }
}
