/// Model for tracking completed/skipped steps during cooking
class CookingStepLogModel {
  final int id;
  final int cookingHistoryId;
  final int recipeStepId;
  final DateTime startedAt;
  final DateTime? completedAt;
  final bool skipped;

  const CookingStepLogModel({
    required this.id,
    required this.cookingHistoryId,
    required this.recipeStepId,
    required this.startedAt,
    this.completedAt,
    this.skipped = false,
  });

  /// Create model from JSON
  factory CookingStepLogModel.fromJson(Map<String, dynamic> json) {
    return CookingStepLogModel(
      id: json['id'] as int,
      cookingHistoryId: json['cooking_history_id'] as int,
      recipeStepId: json['recipe_step_id'] as int,
      startedAt: DateTime.parse(json['started_at'] as String),
      completedAt: json['completed_at'] != null
          ? DateTime.parse(json['completed_at'] as String)
          : null,
      skipped: json['skipped'] as bool? ?? false,
    );
  }

  /// Convert model to JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'cooking_history_id': cookingHistoryId,
      'recipe_step_id': recipeStepId,
      'started_at': startedAt.toIso8601String(),
      'completed_at': completedAt?.toIso8601String(),
      'skipped': skipped,
    };
  }

  /// Create a copy with modified fields
  CookingStepLogModel copyWith({
    int? id,
    int? cookingHistoryId,
    int? recipeStepId,
    DateTime? startedAt,
    DateTime? completedAt,
    bool? skipped,
  }) {
    return CookingStepLogModel(
      id: id ?? this.id,
      cookingHistoryId: cookingHistoryId ?? this.cookingHistoryId,
      recipeStepId: recipeStepId ?? this.recipeStepId,
      startedAt: startedAt ?? this.startedAt,
      completedAt: completedAt ?? this.completedAt,
      skipped: skipped ?? this.skipped,
    );
  }

  /// Check if step is completed
  bool get isCompleted => completedAt != null && !skipped;

  @override
  String toString() {
    return 'CookingStepLogModel(id: $id, historyId: $cookingHistoryId, stepId: $recipeStepId, skipped: $skipped)';
  }
}
