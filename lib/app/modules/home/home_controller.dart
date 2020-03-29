import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:pokelist/app/modules/home/poke_model.dart';
import 'package:pokelist/app/modules/home/poke_repository.dart';
part 'home_controller.g.dart';

class HomeController = _HomeBase with _$HomeController;

abstract class _HomeBase with Store {
  final PokeRepository repository;

  PokeModel pokemon;

  @observable
  ObservableFuture<List<PokeModel>> pokemons;

  _HomeBase(this.repository) {
    pokemons = repository.fetchPokes().asObservable();
  }

  showPokemon(PokeModel pokeModel) async {
    this.pokemon = await repository.showPokemon(pokeModel);
    Modular.to.pushNamed('/pokemon');
  }
}
