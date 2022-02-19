import 'dart:io'; 
import 'package:http/http.dart' as http; 
import 'dart:convert'; 
import 'pizza.dart'; 

class HttpHelper {
 final String authority = '0g7je.mocklab.io';
 final String path = 'pizzalist';

 Future<List<Pizza>> getPizzaList() async {
   Uri url = Uri.https(authority, path);
   http.Response result = await http.get(url);

   List<Pizza> myPizzas = [];
    if (result.statusCode == HttpStatus.ok) {

      List myMap = jsonDecode(result.body);
      myMap.forEach((dynamic pizza) {
            Pizza myPizza = Pizza.fromJson(pizza);
            myPizzas.add(myPizza);
      });
      }
      return myPizzas;
  }
}