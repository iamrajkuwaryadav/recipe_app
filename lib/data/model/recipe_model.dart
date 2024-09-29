class Recipe {
   String? sid;
   String? name;
   String? instruction;
   String? description;
   String? imageUrl;
   List<Ingredient> ingredient =[];

   Recipe(
       {  this.name,
          this.instruction,
          this.description,
          this.imageUrl,
          required this.ingredient});

   Recipe.fromJson(Map<String, dynamic> json) {
      sid = json['sid'];
      name = json['name'];
      instruction = json['instruction'];
      description = json['description'];
      imageUrl = json['image_url'];
      if (json['ingredient'] != null) {
         ingredient = <Ingredient>[];
         json['ingredient'].forEach((v) {
            ingredient!.add(new Ingredient.fromJson(v));
         });
      }
   }

   Map<String, dynamic> toJson() {
      final Map<String, dynamic> data = new Map<String, dynamic>();
      data['name'] = this.name;
      data['instruction'] = this.instruction;
      data['description'] = this.description;
      data['image_url'] = this.imageUrl;
      if (this.ingredient != null) {
         data['ingredient'] = this.ingredient!.map((v) => v.toJson()).toList();
      }
      return data;
   }
}

class Ingredient {
   String? name;
   double? quantity;
   String? mesagerment;
   String? imageUrl;

   Ingredient({this.name, this.quantity, this.mesagerment, this.imageUrl});

   Ingredient.fromJson(Map<String, dynamic> json) {
      name = json['name'];
      quantity = json['quantity'];
      mesagerment = json['mesagerment'];
      imageUrl = json['image_url'];
   }

   Map<String, dynamic> toJson() {
      final Map<String, dynamic> data = new Map<String, dynamic>();
      data['name'] = this.name;
      data['quantity'] = this.quantity;
      data['mesagerment'] = this.mesagerment;
      data['image_url'] = this.imageUrl;
      return data;
   }
}
