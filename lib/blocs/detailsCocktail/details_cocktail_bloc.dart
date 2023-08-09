// ignore_for_file: avoid_print

import 'package:bloc/bloc.dart';
import 'package:cocktails_app/models/models.dart';
import 'package:equatable/equatable.dart';

import '../../repository/cocktails_repository.dart';

part 'details_cocktail_event.dart';
part 'details_cocktail_state.dart';

class DetailsCocktailBloc
    extends Bloc<DetailsCocktailEvent, DetailsCocktailState> {



  DetailsCocktailBloc(
    int id
  ) : super(DetailsCocktailInitial()) {


    on<LoadedCocktailById>((event, emit) async {
      try {

print('event.id ${event.id}');
        final cocktailsById = await getCocktailById(event.id);

        print('cocktailsById $cocktailsById');

        if (cocktailsById != null) {
          emit(CocktailDetailsLoaded(cocktailsById));
        } else {
          emit(const CocktailDetailsError('Error al cargar los cocktails'));
        }
      } catch (e) {
        print('Error en el bloc detailsCocktail $e');
      }
    });

    add( LoadedCocktailById(id));
  }
}

Future<CocktailDetails?> getCocktailById(int id) async {
  print('id---- $id');
  final consulta = await CocktailsRepository().getCocktailById(id);
  print('consulta---- $consulta');
  return consulta;
}
