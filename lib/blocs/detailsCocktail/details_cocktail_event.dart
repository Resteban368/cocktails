part of 'details_cocktail_bloc.dart';

abstract class DetailsCocktailEvent extends Equatable {
  const DetailsCocktailEvent();

  @override
  List<Object> get props => [];
}


//evento de carga de cocktail por id
class LoadedCocktailById extends DetailsCocktailEvent {
  final int id;

  const LoadedCocktailById(this.id);
}
