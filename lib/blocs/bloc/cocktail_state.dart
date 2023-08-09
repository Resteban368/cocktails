// ignore_for_file: overridden_fields

part of '../bloc/cocktail_bloc.dart';

 abstract class CocktailState extends Equatable {
  const CocktailState(
  );

  @override
  List<Object> get props => [
      ];
}
class CocktailInitial extends CocktailState {
}

class CocktailLoaded extends CocktailState {
  final List<Cocktails> cocktails;

  const CocktailLoaded(this.cocktails) : super( );
}


class CocktailError extends CocktailState {
  final String message;

  const CocktailError(this.message) : super();

  @override
  List<Object> get props => [message];
}
