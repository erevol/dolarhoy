import 'dart:convert';

Dollar dollarFromJson(String str) => Dollar.fromJson(json.decode(str));

String dollarToJson(Dollar data) => json.encode(data.toJson());

class Dollar {
  Dollar({
    this.id,
    this.date = '',
    this.buy = '0.00',
    this.sell = '0.00',
    this.variation = '0.00%',
    this.classVariation = 'up',
  });

  int id;
  String date;
  String buy;
  String sell;
  String variation;
  String classVariation;

  factory Dollar.fromJson(Map<String, dynamic> json) => Dollar(
        id: json["id"],
        date: json["fecha"],
        buy: json["compra"],
        sell: json["venta"],
        variation: json["variacion"],
        classVariation: json["class-variacion"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "fecha": date,
        "compra": buy,
        "venta": sell,
        "variacion": variation,
        "class-variacion": classVariation,
      };
}
