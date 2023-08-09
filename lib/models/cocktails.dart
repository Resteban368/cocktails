// To parse this JSON data, do
//
//     final cocktails = cocktailsFromMap(jsonString);

import 'dart:convert';

class Cocktails {
    String? id;
    String? title;
    Difficulty? difficulty;
    String? image;

    Cocktails({
        this.id,
        this.title,
        this.difficulty,
        this.image,
    });

    factory Cocktails.fromJson(String str) => Cocktails.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory Cocktails.fromMap(Map<String, dynamic> json) => Cocktails(
        id: json["id"],
        title: json["title"],
        difficulty: difficultyValues.map[json["difficulty"]]!,
        image: json["image"],
    );

    Map<String, dynamic> toMap() => {
        "id": id,
        "title": title,
        "difficulty": difficultyValues.reverse[difficulty],
        "image": image,
    };
}

enum Difficulty { EASY, MEDIUM }

final difficultyValues = EnumValues({
    "Easy": Difficulty.EASY,
    "Medium": Difficulty.MEDIUM
});

class EnumValues<T> {
    Map<String, T> map;
    late Map<T, String> reverseMap;

    EnumValues(this.map);

    Map<T, String> get reverse {
        reverseMap = map.map((k, v) => MapEntry(v, k));
        return reverseMap;
    }
}
