import 'dart:convert';

class Character {
  Character({
    required this.charId,
    required this.name,
    required this.birthday,
    required this.occupation,
    required this.img,
    required this.status,
    required this.nickname,
    required this.appearance,
    required this.portrayed,
    required this.category,
    required this.betterCallSaulAppearance,
  });

  int charId;
  String name;
  String img;
  String nickname;
  String portrayed;
  String? status;
  String? birthday;
  List<String>? category;
  List<String>? occupation;
  List<int>? appearance;
  List<int>? betterCallSaulAppearance;

  factory Character.fromMap(Map<String, dynamic> json) => Character(
        charId: json["char_id"],
        name: json["name"],
        birthday: json["birthday"],
        portrayed: json["portrayed"],
        img: json["img"],
        status: json["status"],
        nickname: json["nickname"],
        occupation: json["occupation"] == null
            ? null
            : List<String>.from(json["occupation"].map((x) => x)),
        appearance: json["appearance"] == null
            ? null
            : List<int>.from(json["appearance"].map((x) => x)),
        category: json["category"] == null
            ? null
            : List<String>.from(json["occupation"].map((x) => x)),
        betterCallSaulAppearance: json["better_call_saul_appearance"] == null
            ? null
            : List<int>.from(json["better_call_saul_appearance"].map((x) => x)),
      );

  static List<Character> success(response) {
    dynamic results = json.decode(response.body);
    return (response.statusCode >= 200 && response.statusCode <= 299)
        ? List<Character>.from(results.map((x) => Character.fromMap(x)))
        : throw "Error en el servidor";
  }
}
