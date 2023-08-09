// To parse this JSON data, do
//
//     final cocktailDetails = cocktailDetailsFromMap(jsonString);

import 'dart:convert';

class CocktailDetails {
    String? id;
    String? title;
    String? difficulty;
    String? portion;
    String? time;
    String? description;
    List<String>? ingredients;
    List<String>? method;
    String? image;

    CocktailDetails({
        this.id,
        this.title,
        this.difficulty,
        this.portion,
        this.time,
        this.description,
        this.ingredients,
        this.method,
        this.image,
    });

    factory CocktailDetails.fromJson(String str) => CocktailDetails.fromMap(json.decode(str));


    factory CocktailDetails.fromMap(Map<String, dynamic> json) => CocktailDetails(
        id: json["id"],
        title: json["title"],
        difficulty: json["difficulty"],
        portion: json["portion"],
        time: json["time"],
        description: json["description"],
        ingredients: json["ingredients"] == null ? [] : List<String>.from(json["ingredients"]!.map((x) => x)),
        method: json["method"] == null ? [] : List<String>.from(json["method"]!.map((x) => (x as Map).values.first)),
        image: json["image"],
    );

}


