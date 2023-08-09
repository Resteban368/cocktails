part of '../bloc/cocktail_bloc.dart';

abstract class CocktailEvent extends Equatable {
  const CocktailEvent();

  @override
  List<Object> get props => [];
}


//evento de carga de loadcocktail
class LoadedCocktail extends CocktailEvent {
  const LoadedCocktail();
}

