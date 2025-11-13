/// Model for recipe ingredient
class RecipeIngredientModel {
  final int id;
  final int recipeId;
  final String name;
  final String amount;
  final String unit;
  final int order;
  final bool isOptional;
  final DateTime createdAt;

  const RecipeIngredientModel({
    required this.id,
    required this.recipeId,
    required this.name,
    required this.amount,
    required this.unit,
    this.order = 0,
    this.isOptional = false,
    required this.createdAt,
  });

  /// Create model from JSON
  factory RecipeIngredientModel.fromJson(Map<String, dynamic> json) {
    return RecipeIngredientModel(
      id: json['id'] as int,
      recipeId: json['recipe_id'] as int,
      name: json['name'] as String,
      amount: json['amount'] as String,
      unit: json['unit'] as String,
      order: json['order'] as int? ?? 0,
      isOptional: json['is_optional'] as bool? ?? false,
      createdAt: DateTime.parse(json['created_at'] as String),
    );
  }

  /// Convert model to JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'recipe_id': recipeId,
      'name': name,
      'amount': amount,
      'unit': unit,
      'order': order,
      'is_optional': isOptional,
      'created_at': createdAt.toIso8601String(),
    };
  }

  /// Create a copy with modified fields
  RecipeIngredientModel copyWith({
    int? id,
    int? recipeId,
    String? name,
    String? amount,
    String? unit,
    int? order,
    bool? isOptional,
    DateTime? createdAt,
  }) {
    return RecipeIngredientModel(
      id: id ?? this.id,
      recipeId: recipeId ?? this.recipeId,
      name: name ?? this.name,
      amount: amount ?? this.amount,
      unit: unit ?? this.unit,
      order: order ?? this.order,
      isOptional: isOptional ?? this.isOptional,
      createdAt: createdAt ?? this.createdAt,
    );
  }

  /// Display formatted ingredient (e.g., "2 sdm Kecap manis")
  String get displayText => '$amount $unit $name';

  @override
  String toString() {
    return 'RecipeIngredientModel(id: $id, recipeId: $recipeId, name: $name, amount: $amount $unit, order: $order)';
  }
}
