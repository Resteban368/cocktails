// ignore_for_file: avoid_print, body_might_complete_normally_nullable

import 'dart:convert';

import 'package:cocktails_app/models/models.dart';

import '../infraestructura/enviroments.dart';
import 'package:http/http.dart' as http;

class CocktailsRepository {
  factory CocktailsRepository() => _cocktailsRepository;

  CocktailsRepository._();

  static final CocktailsRepository _cocktailsRepository =
      CocktailsRepository._();

  final String aPI_URL = "https://the-cocktail-db3.p.rapidapi.com/";
  final String x_RapidAPI_Key =
      "18e38367e7msh4dc08e0761458abp111e71jsn3005ac1ffdf7";
  final String x_RapidAPI_Host = "the-cocktail-db3.p.rapidapi.com";

  Future<List<Cocktails>?> getAllCocktails() async {
    var headers = {
      'X-RapidAPI-Key': x_RapidAPI_Key,
      'X-RapidAPI-Host': x_RapidAPI_Host,
    };
    var request = http.Request('GET', Uri.parse(aPI_URL));

    request.headers.addAll(headers);

    try {
      final response = await request.send();

      if (response.statusCode < 400) {
        var jsonObject = json.decode(await response.stream.bytesToString());
        List<Cocktails> cocktails = [];
        for (var item in jsonObject) {
          cocktails.add(Cocktails.fromMap(item));
        }
        return cocktails;
      } else {
        print(response.reasonPhrase);
      }
    } catch (e) {
      print('Error en la peticion del repository $e');
    }
  }

  Future<CocktailDetails?> getCocktailById(int id) async {
    var headers = {
      'X-RapidAPI-Key': x_RapidAPI_Key,
      'X-RapidAPI-Host': x_RapidAPI_Host,
    };
    var request = http.Request('GET', Uri.parse('$aPI_URL$id'));

    request.headers.addAll(headers);

    try {
      final response = await request.send();

      if (response.statusCode < 400) {
        print('entramos');
        var jsonObject = json.decode(await response.stream.bytesToString());
        CocktailDetails cocktailDetails = CocktailDetails.fromMap(jsonObject);
        print('cocktailDetails $cocktailDetails');
        return cocktailDetails;
      } else {
        print(response.reasonPhrase);
      }
    } catch (e, s) {
      print('Error en la peticion del repository by id$e, $s');
    }
  }
}
