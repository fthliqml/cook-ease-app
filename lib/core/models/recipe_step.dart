/// Model for recipe cooking steps
class RecipeStepModel {
  final int id;
  final int recipeId;
  final int stepOrder;
  final String stepTitle;
  final String stepDescription;
  final int? durationMinutes;
  final String? timerLabel;
  final DateTime createdAt;

  const RecipeStepModel({
    required this.id,
    required this.recipeId,
    required this.stepOrder,
    required this.stepTitle,
    required this.stepDescription,
    this.durationMinutes,
    this.timerLabel,
    required this.createdAt,
  });

  /// Create model from JSON
  factory RecipeStepModel.fromJson(Map<String, dynamic> json) {
    return RecipeStepModel(
      id: json['id'] as int,
      recipeId: json['recipe_id'] as int,
      stepOrder: json['step_order'] as int,
      stepTitle: json['step_title'] as String,
      stepDescription: json['step_description'] as String,
      durationMinutes: json['duration_minutes'] as int?,
      timerLabel: json['timer_label'] as String?,
      createdAt: DateTime.parse(json['created_at'] as String),
    );
  }

  /// Convert model to JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'recipe_id': recipeId,
      'step_order': stepOrder,
      'step_title': stepTitle,
      'step_description': stepDescription,
      'duration_minutes': durationMinutes,
      'timer_label': timerLabel,
      'created_at': createdAt.toIso8601String(),
    };
  }

  /// Create a copy with modified fields
  RecipeStepModel copyWith({
    int? id,
    int? recipeId,
    int? stepOrder,
    String? stepTitle,
    String? stepDescription,
    int? durationMinutes,
    String? timerLabel,
    DateTime? createdAt,
  }) {
    return RecipeStepModel(
      id: id ?? this.id,
      recipeId: recipeId ?? this.recipeId,
      stepOrder: stepOrder ?? this.stepOrder,
      stepTitle: stepTitle ?? this.stepTitle,
      stepDescription: stepDescription ?? this.stepDescription,
      durationMinutes: durationMinutes ?? this.durationMinutes,
      timerLabel: timerLabel ?? this.timerLabel,
      createdAt: createdAt ?? this.createdAt,
    );
  }

  @override
  String toString() {
    return 'RecipeStepModel(id: $id, recipeId: $recipeId, stepOrder: $stepOrder, title: $stepTitle)';
  }
}
