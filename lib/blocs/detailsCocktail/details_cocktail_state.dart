part of 'details_cocktail_bloc.dart';

abstract class DetailsCocktailState extends Equatable {
  const DetailsCocktailState();
  
  @override
  List<Object> get props => [];
}

class DetailsCocktailInitial extends DetailsCocktailState {}


//estado de cargar el cocktail por id
class CocktailDetailsLoaded extends DetailsCocktailState {
  final CocktailDetails cocktailDetails;

  const CocktailDetailsLoaded(this.cocktailDetails) : super();

  @override
  List<Object> get props => [cocktailDetails];
}


class CocktailDetailsError extends DetailsCocktailState {
  final String message;

  const CocktailDetailsError(this.message) : super();

  @override
  List<Object> get props => [message];
}
