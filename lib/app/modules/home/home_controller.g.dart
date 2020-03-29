// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$HomeController on _HomeBase, Store {
  final _$pokemonsAtom = Atom(name: '_HomeBase.pokemons');

  @override
  ObservableFuture<List<PokeModel>> get pokemons {
    _$pokemonsAtom.context.enforceReadPolicy(_$pokemonsAtom);
    _$pokemonsAtom.reportObserved();
    return super.pokemons;
  }

  @override
  set pokemons(ObservableFuture<List<PokeModel>> value) {
    _$pokemonsAtom.context.conditionallyRunInAction(() {
      super.pokemons = value;
      _$pokemonsAtom.reportChanged();
    }, _$pokemonsAtom, name: '${_$pokemonsAtom.name}_set');
  }

  @override
  String toString() {
    final string = 'pokemons: ${pokemons.toString()}';
    return '{$string}';
  }
}
