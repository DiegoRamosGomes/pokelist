import 'package:flutter_modular/flutter_modular.dart';
import 'package:dio/dio.dart';
import 'package:pokelist/app/modules/home/poke_model.dart';

class PokeRepository extends Disposable {
  final Dio client;
  PokeRepository({this.client});

  Future<List<PokeModel>> fetchPokes() async {
    var response =
        await client.get('https://pokeapi.co/api/v2/pokemon?limit=151');
    List<PokeModel> list = [];
    for (var item in (response.data['results'] as List)) {
      PokeModel model = PokeModel.fromJson(item);
      list.add(model);
    }
    return list;
  }

  Future<PokeModel> showPokemon(PokeModel pokeModel) async {
    var response = await client.get(pokeModel.url);
    pokeModel.sprite = response.data['sprites']['front_default'];
    for (var item in (response.data['abilities'] as List)) {
      pokeModel.abilities.add(item['ability']['name']);
    }
    
    return pokeModel;
  }

  //dispose will be called automatically
  @override
  void dispose() {}
}
