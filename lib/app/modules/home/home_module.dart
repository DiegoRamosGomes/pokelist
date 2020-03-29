import 'package:dio/dio.dart';
import 'package:pokelist/app/modules/home/home_controller.dart';
import 'package:pokelist/app/modules/home/poke_repository.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:pokelist/app/modules/home/home_page.dart';
import 'package:pokelist/app/modules/home/show_pokemon_page.dart';

class HomeModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind((i) => HomeController(i.get<PokeRepository>())),
        Bind((i) => PokeRepository(client: i.get<Dio>())),
        Bind((i) => Dio()),
      ];

  @override
  List<Router> get routers => [
        Router('/', child: (_, args) => HomePage()),
        Router('/pokemon', child: (_, args) => ShowPokemonPage()),
      ];

  static Inject get to => Inject<HomeModule>.of();
}
