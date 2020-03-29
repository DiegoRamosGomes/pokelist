import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:pokelist/app/modules/home/home_controller.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  HomeController controller = Modular.get<HomeController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Lista de pokemons"),
      ),
      body: Observer(
        builder: (_) {
          if (controller.pokemons.error != null) {
            return Center(
              child: Text('erro'),
            );
          }

          if (controller.pokemons.value == null) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }

          var list = controller.pokemons.value;

          return ListView.builder(
            itemCount: list.length,
            itemBuilder: (_, int index) {
              return ListTile(
                onTap: () { controller.showPokemon(list[index]); },
                title: Text(list[index].name.toUpperCase()),
              );
            },
          );
        },
      ),
    );
  }
}
