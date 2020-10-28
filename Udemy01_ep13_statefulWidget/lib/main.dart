import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(title: 'Stateful App Example X', home: FavoriteCity()));
}

class FavoriteCity extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _FavoriteCityState();
  }
}

class _FavoriteCityState extends State<FavoriteCity> {
  String nameCity = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Stateful App Example !.'),
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            TextField(
              onChanged: (String userInput) {
                setState(() {  // ต้องใช้ set state จึงจะ redraw
                  nameCity = userInput;
                });
              },
            ),
            Padding(
              padding: EdgeInsets.all(30.0),
              child: Text(
                'Your City is $nameCity',
                style: TextStyle(fontSize: 25.0),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
