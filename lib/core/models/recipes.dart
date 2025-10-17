/// Domain model for a Recipe used by UI/ViewModels.
/// Keeps UI decoupled from the Drift-generated types.

enum RecipeDifficulty { one, two, three, four, five }

class RecipeModel {
  final int id; // 0 if not yet persisted
  final String title;
  final String description;
  final String imgUrl;
  final String cookTime;
  final String category;
  final RecipeDifficulty difficulty;
  final bool isFavorited;

  const RecipeModel({
    required this.id,
    required this.title,
    required this.description,
    required this.imgUrl,
    required this.cookTime,
    required this.category,
    required this.difficulty,
    required this.isFavorited,
  });

  RecipeModel copyWith({
    int? id,
    String? title,
    String? description,
    String? imgUrl,
    String? cookTime,
    String? category,
    RecipeDifficulty? difficulty,
    bool? isFavorited,
  }) {
    return RecipeModel(
      id: id ?? this.id,
      title: title ?? this.title,
      description: description ?? this.description,
      imgUrl: imgUrl ?? this.imgUrl,
      cookTime: cookTime ?? this.cookTime,
      category: category ?? this.category,
      difficulty: difficulty ?? this.difficulty,
      isFavorited: isFavorited ?? this.isFavorited,
    );
  }

  factory RecipeModel.fromJson(Map<String, dynamic> json) {
    return RecipeModel(
      id: (json['id'] ?? 0) as int,
      title: (json['title'] ?? '') as String,
      description: (json['description'] ?? '') as String,
      imgUrl: (json['imgUrl'] ?? '') as String,
      cookTime: (json['cookTime'] ?? '') as String,
      category: (json['category'] ?? '') as String,
      difficulty: RecipeDifficulty.values[(json['difficulty'] ?? 2) as int],
      isFavorited: (json['isFavorited'] ?? false) as bool,
    );
  }

  Map<String, dynamic> toJson() => {
    'id': id,
    'title': title,
    'description': description,
    'imgUrl': imgUrl,
    'cookTime': cookTime,
    'category': category,
    'difficulty': difficulty.index,
    'isFavorited': isFavorited,
  };

  @override
  String toString() =>
      'RecipeModel(id: $id, title: $title, category: $category, favorited: $isFavorited)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is RecipeModel &&
        other.id == id &&
        other.title == title &&
        other.description == description &&
        other.imgUrl == imgUrl &&
        other.cookTime == cookTime &&
        other.category == category &&
        other.difficulty == difficulty &&
        other.isFavorited == isFavorited;
  }

  @override
  int get hashCode => Object.hash(
    id,
    title,
    description,
    imgUrl,
    cookTime,
    category,
    difficulty,
    isFavorited,
  );
}
