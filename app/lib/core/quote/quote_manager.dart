import 'package:app/core/quote/cache_manager.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/get.dart';

class QuoteManager extends GetxController with CacheManager {
  final quote = {}.obs;

  void logOut() {
    quote.value = {};
    removeToken();
  }

  void setQuote(Map<String, dynamic> data) async {
    quote.value = {
      ...quote.value,
      ...data,
    };
    //Token is cached
    /* await saveToken(token); */
  }

  void checkLoginStatus() {
    /* final token = getToken(); */

    /*  if (token != null) {
      isLogged.value = true;
    } */
  }

  Map getQuote() {
    return quote.value;
  }
}
