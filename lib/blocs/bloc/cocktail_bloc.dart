// ignore_for_file: avoid_print

import 'package:bloc/bloc.dart';
import 'package:cocktails_app/repository/cocktails_repository.dart';
import 'package:equatable/equatable.dart';

import '../../models/models.dart';

part 'cocktail_event.dart';
part 'cocktail_state.dart';

class CocktailBloc extends Bloc<CocktailEvent, CocktailState> {
  CocktailBloc() : super(CocktailInitial()) {
    
    on<LoadedCocktail>((event, emit) async{
      try{
        // emit(const CocktailLoaded([]));
        final cocktails = await getCocktails();
        if( cocktails != null){
          emit(CocktailLoaded(cocktails));
        }else{
          emit(const CocktailError('Error al cargar los cocktails'));
        }
      }catch(e){
        emit(CocktailError(e.toString()));
        print('Error en el bloc $e');
      }

    });
    add(const LoadedCocktail());

 


  }
}

Future<List<Cocktails>?> getCocktails() async {
  final consulta = await CocktailsRepository().getAllCocktails();
  return consulta;
  
}
