/// Enum for cooking session status
enum CookingStatus {
  inProgress,
  completed,
  abandoned;

  String toJson() => name;

  static CookingStatus fromJson(String json) {
    return CookingStatus.values.firstWhere(
      (e) => e.name == json,
      orElse: () => CookingStatus.abandoned,
    );
  }
}

/// Model for cooking history/session
class CookingHistoryModel {
  final int id;
  final int recipeId;
  final DateTime startedAt;
  final DateTime? completedAt;
  final CookingStatus status;
  final int currentStep;
  final String? notes;

  const CookingHistoryModel({
    required this.id,
    required this.recipeId,
    required this.startedAt,
    this.completedAt,
    required this.status,
    this.currentStep = 0,
    this.notes,
  });

  /// Create model from JSON
  factory CookingHistoryModel.fromJson(Map<String, dynamic> json) {
    return CookingHistoryModel(
      id: json['id'] as int,
      recipeId: json['recipe_id'] as int,
      startedAt: DateTime.parse(json['started_at'] as String),
      completedAt: json['completed_at'] != null
          ? DateTime.parse(json['completed_at'] as String)
          : null,
      status: CookingStatus.fromJson(json['status'] as String),
      currentStep: json['current_step'] as int? ?? 0,
      notes: json['notes'] as String?,
    );
  }

  /// Convert model to JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'recipe_id': recipeId,
      'started_at': startedAt.toIso8601String(),
      'completed_at': completedAt?.toIso8601String(),
      'status': status.toJson(),
      'current_step': currentStep,
      'notes': notes,
    };
  }

  /// Create a copy with modified fields
  CookingHistoryModel copyWith({
    int? id,
    int? recipeId,
    DateTime? startedAt,
    DateTime? completedAt,
    CookingStatus? status,
    int? currentStep,
    String? notes,
  }) {
    return CookingHistoryModel(
      id: id ?? this.id,
      recipeId: recipeId ?? this.recipeId,
      startedAt: startedAt ?? this.startedAt,
      completedAt: completedAt ?? this.completedAt,
      status: status ?? this.status,
      currentStep: currentStep ?? this.currentStep,
      notes: notes ?? this.notes,
    );
  }

  @override
  String toString() {
    return 'CookingHistoryModel(id: $id, recipeId: $recipeId, status: ${status.name}, currentStep: $currentStep)';
  }
}
