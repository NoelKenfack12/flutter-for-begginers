import 'package:flutter/material.dart';
import 'dart:convert';
import './pizza.dart';
import './savedata.dart';

void main() {
    runApp(MyApp());
}

class MyApp extends StatelessWidget {
    @override
    Widget build(BuildContext context) {
        return MaterialApp(
            title: 'Flutter JSON Demo',
            theme: ThemeData(
                primarySwatch: Colors.blue,
                visualDensity: VisualDensity
                 .adaptivePlatformDensity,
            ),
            home: MyHomePage(),
        );
    }
}

class MyHomePage extends StatefulWidget {
    @override
    _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

    @override
    void initState() {
        readJsonFile();
        super.initState();
    }

    String pizzaString = '';

    @override
    Widget build(BuildContext context) {

        List<PopupMenuItem<String>> menuItems = <PopupMenuItem<String>>[PopupMenuItem(
          value: 'Savedata',
          child: Text('Savedata'),
        )];

        void goToSavedata(BuildContext context) {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => SavedataScreen()));
        }

        /*
        menuItems.add(PopupMenuItem(
          value: 'Configurations',
          child: Text('Configurations'),
        ));*/

        return Scaffold(
            appBar: AppBar(
              title: Text('JSON'),
              actions: [
                PopupMenuButton<String>(
                  icon: Icon(Icons.more_horiz),
                  itemBuilder: (BuildContext context) {
                    return menuItems.toList();
                  },
                  onSelected: (s) {
                    if (s == 'Savedata') {
                      goToSavedata(context);
                    }
                  }
                )
              ]
            ),
            body: Container(
              //child: Text(pizzaString)
                child: FutureBuilder(
                    future: readJsonFile(),
                    builder: (BuildContext context, AsyncSnapshot<List<Pizza>> pizzas) {
                        return ListView.builder(
                            itemCount: pizzas.data?.length ?? 0,
                            itemBuilder: (BuildContext context, int position) {
                                return ListTile(
                                    title: Text(pizzas.data![position].pizzaName ?? 'Noel'),
                                    subtitle: Text((pizzas.data![position].description ?? '') + ' - € ' + (pizzas.data![position].price?.toString() ?? '')),
                                );
                        }
                    );
                    }
                ),
            ),
        );
    }

    Future<List<Pizza>> readJsonFile() async {
        String myString = await DefaultAssetBundle.of(context)
        .loadString('assets/pizzalist.json');
        List myMap = jsonDecode(myString);
        List<Pizza> myPizzas = [];
        
        myMap.forEach((dynamic pizza) {
            Pizza myPizza = Pizza.fromJson(pizza);
            myPizzas.add(myPizza);
        });
        
        /*
        setState(() {
            pizzaString = myString;
        });*/
        String json = convertToJSON(myPizzas);
        print(json);

        return myPizzas;
    }

    String convertToJSON(List<Pizza> pizzas) {
      Pizza last = pizzas.last;
      String json = '[';
            pizzas.forEach((pizza) {
              json += jsonEncode(pizza);
              if (pizza != last){
                json += ',';
              }
            });
            json += ']';
            return json;
      }
  }
