import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:pokelist/app/modules/home/home_controller.dart';

class ShowPokemonPage extends StatefulWidget {
  final String title;
  const ShowPokemonPage({Key key, this.title = "ShowPokemon"})
      : super(key: key);

  @override
  _ShowPokemonPageState createState() => _ShowPokemonPageState();
}

class _ShowPokemonPageState extends State<ShowPokemonPage> {
  HomeController controller = Modular.get<HomeController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(controller.pokemon.name.toUpperCase()),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            Image.network(controller.pokemon.sprite, scale: 0.5),
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey[200],
                    blurRadius: 5,
                    spreadRadius: 2,
                    offset: Offset(2, 2),
                  )
                ],
              ),
              width: MediaQuery.of(context).size.width - 100,
              height: MediaQuery.of(context).size.height / 3,
              child: Padding(
                padding: const EdgeInsets.only(top: 10.0, left: 14.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text("Abilities",
                        style: TextStyle(fontWeight: FontWeight.bold)),
                    Expanded(
                      child: ListView.builder(
                        itemCount: controller.pokemon.abilities.length,
                        itemBuilder: (_, int index) {
                          return ListTile(
                              title: Text(controller.pokemon.abilities[index]));
                        },
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
