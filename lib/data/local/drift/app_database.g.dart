// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_database.dart';

// ignore_for_file: type=lint
class $RecipesTable extends Recipes with TableInfo<$RecipesTable, Recipe> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $RecipesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _titleMeta = const VerificationMeta('title');
  @override
  late final GeneratedColumn<String> title = GeneratedColumn<String>(
    'title',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _descriptionMeta = const VerificationMeta(
    'description',
  );
  @override
  late final GeneratedColumn<String> description = GeneratedColumn<String>(
    'description',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _imgUrlMeta = const VerificationMeta('imgUrl');
  @override
  late final GeneratedColumn<String> imgUrl = GeneratedColumn<String>(
    'img_url',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _cookTimeMeta = const VerificationMeta(
    'cookTime',
  );
  @override
  late final GeneratedColumn<String> cookTime = GeneratedColumn<String>(
    'cook_time',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _categoryMeta = const VerificationMeta(
    'category',
  );
  @override
  late final GeneratedColumn<String> category = GeneratedColumn<String>(
    'category',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  @override
  late final GeneratedColumnWithTypeConverter<Difficulty, int> difficultyLevel =
      GeneratedColumn<int>(
        'difficulty_level',
        aliasedName,
        false,
        type: DriftSqlType.int,
        requiredDuringInsert: true,
      ).withConverter<Difficulty>($RecipesTable.$converterdifficultyLevel);
  static const VerificationMeta _isFavoritedMeta = const VerificationMeta(
    'isFavorited',
  );
  @override
  late final GeneratedColumn<bool> isFavorited = GeneratedColumn<bool>(
    'is_favorited',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("is_favorited" IN (0, 1))',
    ),
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    title,
    description,
    imgUrl,
    cookTime,
    category,
    difficultyLevel,
    isFavorited,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'recipes';
  @override
  VerificationContext validateIntegrity(
    Insertable<Recipe> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('title')) {
      context.handle(
        _titleMeta,
        title.isAcceptableOrUnknown(data['title']!, _titleMeta),
      );
    } else if (isInserting) {
      context.missing(_titleMeta);
    }
    if (data.containsKey('description')) {
      context.handle(
        _descriptionMeta,
        description.isAcceptableOrUnknown(
          data['description']!,
          _descriptionMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_descriptionMeta);
    }
    if (data.containsKey('img_url')) {
      context.handle(
        _imgUrlMeta,
        imgUrl.isAcceptableOrUnknown(data['img_url']!, _imgUrlMeta),
      );
    } else if (isInserting) {
      context.missing(_imgUrlMeta);
    }
    if (data.containsKey('cook_time')) {
      context.handle(
        _cookTimeMeta,
        cookTime.isAcceptableOrUnknown(data['cook_time']!, _cookTimeMeta),
      );
    } else if (isInserting) {
      context.missing(_cookTimeMeta);
    }
    if (data.containsKey('category')) {
      context.handle(
        _categoryMeta,
        category.isAcceptableOrUnknown(data['category']!, _categoryMeta),
      );
    } else if (isInserting) {
      context.missing(_categoryMeta);
    }
    if (data.containsKey('is_favorited')) {
      context.handle(
        _isFavoritedMeta,
        isFavorited.isAcceptableOrUnknown(
          data['is_favorited']!,
          _isFavoritedMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_isFavoritedMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Recipe map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Recipe(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      title: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}title'],
      )!,
      description: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}description'],
      )!,
      imgUrl: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}img_url'],
      )!,
      cookTime: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}cook_time'],
      )!,
      category: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}category'],
      )!,
      difficultyLevel: $RecipesTable.$converterdifficultyLevel.fromSql(
        attachedDatabase.typeMapping.read(
          DriftSqlType.int,
          data['${effectivePrefix}difficulty_level'],
        )!,
      ),
      isFavorited: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}is_favorited'],
      )!,
    );
  }

  @override
  $RecipesTable createAlias(String alias) {
    return $RecipesTable(attachedDatabase, alias);
  }

  static JsonTypeConverter2<Difficulty, int, int> $converterdifficultyLevel =
      const EnumIndexConverter<Difficulty>(Difficulty.values);
}

class Recipe extends DataClass implements Insertable<Recipe> {
  final int id;
  final String title;
  final String description;
  final String imgUrl;
  final String cookTime;
  final String category;
  final Difficulty difficultyLevel;
  final bool isFavorited;
  const Recipe({
    required this.id,
    required this.title,
    required this.description,
    required this.imgUrl,
    required this.cookTime,
    required this.category,
    required this.difficultyLevel,
    required this.isFavorited,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['title'] = Variable<String>(title);
    map['description'] = Variable<String>(description);
    map['img_url'] = Variable<String>(imgUrl);
    map['cook_time'] = Variable<String>(cookTime);
    map['category'] = Variable<String>(category);
    {
      map['difficulty_level'] = Variable<int>(
        $RecipesTable.$converterdifficultyLevel.toSql(difficultyLevel),
      );
    }
    map['is_favorited'] = Variable<bool>(isFavorited);
    return map;
  }

  RecipesCompanion toCompanion(bool nullToAbsent) {
    return RecipesCompanion(
      id: Value(id),
      title: Value(title),
      description: Value(description),
      imgUrl: Value(imgUrl),
      cookTime: Value(cookTime),
      category: Value(category),
      difficultyLevel: Value(difficultyLevel),
      isFavorited: Value(isFavorited),
    );
  }

  factory Recipe.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Recipe(
      id: serializer.fromJson<int>(json['id']),
      title: serializer.fromJson<String>(json['title']),
      description: serializer.fromJson<String>(json['description']),
      imgUrl: serializer.fromJson<String>(json['imgUrl']),
      cookTime: serializer.fromJson<String>(json['cookTime']),
      category: serializer.fromJson<String>(json['category']),
      difficultyLevel: $RecipesTable.$converterdifficultyLevel.fromJson(
        serializer.fromJson<int>(json['difficultyLevel']),
      ),
      isFavorited: serializer.fromJson<bool>(json['isFavorited']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'title': serializer.toJson<String>(title),
      'description': serializer.toJson<String>(description),
      'imgUrl': serializer.toJson<String>(imgUrl),
      'cookTime': serializer.toJson<String>(cookTime),
      'category': serializer.toJson<String>(category),
      'difficultyLevel': serializer.toJson<int>(
        $RecipesTable.$converterdifficultyLevel.toJson(difficultyLevel),
      ),
      'isFavorited': serializer.toJson<bool>(isFavorited),
    };
  }

  Recipe copyWith({
    int? id,
    String? title,
    String? description,
    String? imgUrl,
    String? cookTime,
    String? category,
    Difficulty? difficultyLevel,
    bool? isFavorited,
  }) => Recipe(
    id: id ?? this.id,
    title: title ?? this.title,
    description: description ?? this.description,
    imgUrl: imgUrl ?? this.imgUrl,
    cookTime: cookTime ?? this.cookTime,
    category: category ?? this.category,
    difficultyLevel: difficultyLevel ?? this.difficultyLevel,
    isFavorited: isFavorited ?? this.isFavorited,
  );
  Recipe copyWithCompanion(RecipesCompanion data) {
    return Recipe(
      id: data.id.present ? data.id.value : this.id,
      title: data.title.present ? data.title.value : this.title,
      description: data.description.present
          ? data.description.value
          : this.description,
      imgUrl: data.imgUrl.present ? data.imgUrl.value : this.imgUrl,
      cookTime: data.cookTime.present ? data.cookTime.value : this.cookTime,
      category: data.category.present ? data.category.value : this.category,
      difficultyLevel: data.difficultyLevel.present
          ? data.difficultyLevel.value
          : this.difficultyLevel,
      isFavorited: data.isFavorited.present
          ? data.isFavorited.value
          : this.isFavorited,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Recipe(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('description: $description, ')
          ..write('imgUrl: $imgUrl, ')
          ..write('cookTime: $cookTime, ')
          ..write('category: $category, ')
          ..write('difficultyLevel: $difficultyLevel, ')
          ..write('isFavorited: $isFavorited')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    title,
    description,
    imgUrl,
    cookTime,
    category,
    difficultyLevel,
    isFavorited,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Recipe &&
          other.id == this.id &&
          other.title == this.title &&
          other.description == this.description &&
          other.imgUrl == this.imgUrl &&
          other.cookTime == this.cookTime &&
          other.category == this.category &&
          other.difficultyLevel == this.difficultyLevel &&
          other.isFavorited == this.isFavorited);
}

class RecipesCompanion extends UpdateCompanion<Recipe> {
  final Value<int> id;
  final Value<String> title;
  final Value<String> description;
  final Value<String> imgUrl;
  final Value<String> cookTime;
  final Value<String> category;
  final Value<Difficulty> difficultyLevel;
  final Value<bool> isFavorited;
  const RecipesCompanion({
    this.id = const Value.absent(),
    this.title = const Value.absent(),
    this.description = const Value.absent(),
    this.imgUrl = const Value.absent(),
    this.cookTime = const Value.absent(),
    this.category = const Value.absent(),
    this.difficultyLevel = const Value.absent(),
    this.isFavorited = const Value.absent(),
  });
  RecipesCompanion.insert({
    this.id = const Value.absent(),
    required String title,
    required String description,
    required String imgUrl,
    required String cookTime,
    required String category,
    required Difficulty difficultyLevel,
    required bool isFavorited,
  }) : title = Value(title),
       description = Value(description),
       imgUrl = Value(imgUrl),
       cookTime = Value(cookTime),
       category = Value(category),
       difficultyLevel = Value(difficultyLevel),
       isFavorited = Value(isFavorited);
  static Insertable<Recipe> custom({
    Expression<int>? id,
    Expression<String>? title,
    Expression<String>? description,
    Expression<String>? imgUrl,
    Expression<String>? cookTime,
    Expression<String>? category,
    Expression<int>? difficultyLevel,
    Expression<bool>? isFavorited,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (title != null) 'title': title,
      if (description != null) 'description': description,
      if (imgUrl != null) 'img_url': imgUrl,
      if (cookTime != null) 'cook_time': cookTime,
      if (category != null) 'category': category,
      if (difficultyLevel != null) 'difficulty_level': difficultyLevel,
      if (isFavorited != null) 'is_favorited': isFavorited,
    });
  }

  RecipesCompanion copyWith({
    Value<int>? id,
    Value<String>? title,
    Value<String>? description,
    Value<String>? imgUrl,
    Value<String>? cookTime,
    Value<String>? category,
    Value<Difficulty>? difficultyLevel,
    Value<bool>? isFavorited,
  }) {
    return RecipesCompanion(
      id: id ?? this.id,
      title: title ?? this.title,
      description: description ?? this.description,
      imgUrl: imgUrl ?? this.imgUrl,
      cookTime: cookTime ?? this.cookTime,
      category: category ?? this.category,
      difficultyLevel: difficultyLevel ?? this.difficultyLevel,
      isFavorited: isFavorited ?? this.isFavorited,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (title.present) {
      map['title'] = Variable<String>(title.value);
    }
    if (description.present) {
      map['description'] = Variable<String>(description.value);
    }
    if (imgUrl.present) {
      map['img_url'] = Variable<String>(imgUrl.value);
    }
    if (cookTime.present) {
      map['cook_time'] = Variable<String>(cookTime.value);
    }
    if (category.present) {
      map['category'] = Variable<String>(category.value);
    }
    if (difficultyLevel.present) {
      map['difficulty_level'] = Variable<int>(
        $RecipesTable.$converterdifficultyLevel.toSql(difficultyLevel.value),
      );
    }
    if (isFavorited.present) {
      map['is_favorited'] = Variable<bool>(isFavorited.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('RecipesCompanion(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('description: $description, ')
          ..write('imgUrl: $imgUrl, ')
          ..write('cookTime: $cookTime, ')
          ..write('category: $category, ')
          ..write('difficultyLevel: $difficultyLevel, ')
          ..write('isFavorited: $isFavorited')
          ..write(')'))
        .toString();
  }
}

class $RecipeStepsTable extends RecipeSteps
    with TableInfo<$RecipeStepsTable, RecipeStepData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $RecipeStepsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _recipeIdMeta = const VerificationMeta(
    'recipeId',
  );
  @override
  late final GeneratedColumn<int> recipeId = GeneratedColumn<int>(
    'recipe_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES recipes (id) ON DELETE CASCADE',
    ),
  );
  static const VerificationMeta _stepOrderMeta = const VerificationMeta(
    'stepOrder',
  );
  @override
  late final GeneratedColumn<int> stepOrder = GeneratedColumn<int>(
    'step_order',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _stepTitleMeta = const VerificationMeta(
    'stepTitle',
  );
  @override
  late final GeneratedColumn<String> stepTitle = GeneratedColumn<String>(
    'step_title',
    aliasedName,
    false,
    additionalChecks: GeneratedColumn.checkTextLength(
      minTextLength: 1,
      maxTextLength: 200,
    ),
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _stepDescriptionMeta = const VerificationMeta(
    'stepDescription',
  );
  @override
  late final GeneratedColumn<String> stepDescription = GeneratedColumn<String>(
    'step_description',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _durationMinutesMeta = const VerificationMeta(
    'durationMinutes',
  );
  @override
  late final GeneratedColumn<int> durationMinutes = GeneratedColumn<int>(
    'duration_minutes',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _timerLabelMeta = const VerificationMeta(
    'timerLabel',
  );
  @override
  late final GeneratedColumn<String> timerLabel = GeneratedColumn<String>(
    'timer_label',
    aliasedName,
    true,
    additionalChecks: GeneratedColumn.checkTextLength(maxTextLength: 100),
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    defaultValue: currentDateAndTime,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    recipeId,
    stepOrder,
    stepTitle,
    stepDescription,
    durationMinutes,
    timerLabel,
    createdAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'recipe_steps';
  @override
  VerificationContext validateIntegrity(
    Insertable<RecipeStepData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('recipe_id')) {
      context.handle(
        _recipeIdMeta,
        recipeId.isAcceptableOrUnknown(data['recipe_id']!, _recipeIdMeta),
      );
    } else if (isInserting) {
      context.missing(_recipeIdMeta);
    }
    if (data.containsKey('step_order')) {
      context.handle(
        _stepOrderMeta,
        stepOrder.isAcceptableOrUnknown(data['step_order']!, _stepOrderMeta),
      );
    } else if (isInserting) {
      context.missing(_stepOrderMeta);
    }
    if (data.containsKey('step_title')) {
      context.handle(
        _stepTitleMeta,
        stepTitle.isAcceptableOrUnknown(data['step_title']!, _stepTitleMeta),
      );
    } else if (isInserting) {
      context.missing(_stepTitleMeta);
    }
    if (data.containsKey('step_description')) {
      context.handle(
        _stepDescriptionMeta,
        stepDescription.isAcceptableOrUnknown(
          data['step_description']!,
          _stepDescriptionMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_stepDescriptionMeta);
    }
    if (data.containsKey('duration_minutes')) {
      context.handle(
        _durationMinutesMeta,
        durationMinutes.isAcceptableOrUnknown(
          data['duration_minutes']!,
          _durationMinutesMeta,
        ),
      );
    }
    if (data.containsKey('timer_label')) {
      context.handle(
        _timerLabelMeta,
        timerLabel.isAcceptableOrUnknown(data['timer_label']!, _timerLabelMeta),
      );
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  List<Set<GeneratedColumn>> get uniqueKeys => [
    {recipeId, stepOrder},
  ];
  @override
  RecipeStepData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return RecipeStepData(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      recipeId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}recipe_id'],
      )!,
      stepOrder: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}step_order'],
      )!,
      stepTitle: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}step_title'],
      )!,
      stepDescription: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}step_description'],
      )!,
      durationMinutes: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}duration_minutes'],
      ),
      timerLabel: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}timer_label'],
      ),
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
    );
  }

  @override
  $RecipeStepsTable createAlias(String alias) {
    return $RecipeStepsTable(attachedDatabase, alias);
  }
}

class RecipeStepData extends DataClass implements Insertable<RecipeStepData> {
  final int id;
  final int recipeId;
  final int stepOrder;
  final String stepTitle;
  final String stepDescription;
  final int? durationMinutes;
  final String? timerLabel;
  final DateTime createdAt;
  const RecipeStepData({
    required this.id,
    required this.recipeId,
    required this.stepOrder,
    required this.stepTitle,
    required this.stepDescription,
    this.durationMinutes,
    this.timerLabel,
    required this.createdAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['recipe_id'] = Variable<int>(recipeId);
    map['step_order'] = Variable<int>(stepOrder);
    map['step_title'] = Variable<String>(stepTitle);
    map['step_description'] = Variable<String>(stepDescription);
    if (!nullToAbsent || durationMinutes != null) {
      map['duration_minutes'] = Variable<int>(durationMinutes);
    }
    if (!nullToAbsent || timerLabel != null) {
      map['timer_label'] = Variable<String>(timerLabel);
    }
    map['created_at'] = Variable<DateTime>(createdAt);
    return map;
  }

  RecipeStepsCompanion toCompanion(bool nullToAbsent) {
    return RecipeStepsCompanion(
      id: Value(id),
      recipeId: Value(recipeId),
      stepOrder: Value(stepOrder),
      stepTitle: Value(stepTitle),
      stepDescription: Value(stepDescription),
      durationMinutes: durationMinutes == null && nullToAbsent
          ? const Value.absent()
          : Value(durationMinutes),
      timerLabel: timerLabel == null && nullToAbsent
          ? const Value.absent()
          : Value(timerLabel),
      createdAt: Value(createdAt),
    );
  }

  factory RecipeStepData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return RecipeStepData(
      id: serializer.fromJson<int>(json['id']),
      recipeId: serializer.fromJson<int>(json['recipeId']),
      stepOrder: serializer.fromJson<int>(json['stepOrder']),
      stepTitle: serializer.fromJson<String>(json['stepTitle']),
      stepDescription: serializer.fromJson<String>(json['stepDescription']),
      durationMinutes: serializer.fromJson<int?>(json['durationMinutes']),
      timerLabel: serializer.fromJson<String?>(json['timerLabel']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'recipeId': serializer.toJson<int>(recipeId),
      'stepOrder': serializer.toJson<int>(stepOrder),
      'stepTitle': serializer.toJson<String>(stepTitle),
      'stepDescription': serializer.toJson<String>(stepDescription),
      'durationMinutes': serializer.toJson<int?>(durationMinutes),
      'timerLabel': serializer.toJson<String?>(timerLabel),
      'createdAt': serializer.toJson<DateTime>(createdAt),
    };
  }

  RecipeStepData copyWith({
    int? id,
    int? recipeId,
    int? stepOrder,
    String? stepTitle,
    String? stepDescription,
    Value<int?> durationMinutes = const Value.absent(),
    Value<String?> timerLabel = const Value.absent(),
    DateTime? createdAt,
  }) => RecipeStepData(
    id: id ?? this.id,
    recipeId: recipeId ?? this.recipeId,
    stepOrder: stepOrder ?? this.stepOrder,
    stepTitle: stepTitle ?? this.stepTitle,
    stepDescription: stepDescription ?? this.stepDescription,
    durationMinutes: durationMinutes.present
        ? durationMinutes.value
        : this.durationMinutes,
    timerLabel: timerLabel.present ? timerLabel.value : this.timerLabel,
    createdAt: createdAt ?? this.createdAt,
  );
  RecipeStepData copyWithCompanion(RecipeStepsCompanion data) {
    return RecipeStepData(
      id: data.id.present ? data.id.value : this.id,
      recipeId: data.recipeId.present ? data.recipeId.value : this.recipeId,
      stepOrder: data.stepOrder.present ? data.stepOrder.value : this.stepOrder,
      stepTitle: data.stepTitle.present ? data.stepTitle.value : this.stepTitle,
      stepDescription: data.stepDescription.present
          ? data.stepDescription.value
          : this.stepDescription,
      durationMinutes: data.durationMinutes.present
          ? data.durationMinutes.value
          : this.durationMinutes,
      timerLabel: data.timerLabel.present
          ? data.timerLabel.value
          : this.timerLabel,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('RecipeStepData(')
          ..write('id: $id, ')
          ..write('recipeId: $recipeId, ')
          ..write('stepOrder: $stepOrder, ')
          ..write('stepTitle: $stepTitle, ')
          ..write('stepDescription: $stepDescription, ')
          ..write('durationMinutes: $durationMinutes, ')
          ..write('timerLabel: $timerLabel, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    recipeId,
    stepOrder,
    stepTitle,
    stepDescription,
    durationMinutes,
    timerLabel,
    createdAt,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is RecipeStepData &&
          other.id == this.id &&
          other.recipeId == this.recipeId &&
          other.stepOrder == this.stepOrder &&
          other.stepTitle == this.stepTitle &&
          other.stepDescription == this.stepDescription &&
          other.durationMinutes == this.durationMinutes &&
          other.timerLabel == this.timerLabel &&
          other.createdAt == this.createdAt);
}

class RecipeStepsCompanion extends UpdateCompanion<RecipeStepData> {
  final Value<int> id;
  final Value<int> recipeId;
  final Value<int> stepOrder;
  final Value<String> stepTitle;
  final Value<String> stepDescription;
  final Value<int?> durationMinutes;
  final Value<String?> timerLabel;
  final Value<DateTime> createdAt;
  const RecipeStepsCompanion({
    this.id = const Value.absent(),
    this.recipeId = const Value.absent(),
    this.stepOrder = const Value.absent(),
    this.stepTitle = const Value.absent(),
    this.stepDescription = const Value.absent(),
    this.durationMinutes = const Value.absent(),
    this.timerLabel = const Value.absent(),
    this.createdAt = const Value.absent(),
  });
  RecipeStepsCompanion.insert({
    this.id = const Value.absent(),
    required int recipeId,
    required int stepOrder,
    required String stepTitle,
    required String stepDescription,
    this.durationMinutes = const Value.absent(),
    this.timerLabel = const Value.absent(),
    this.createdAt = const Value.absent(),
  }) : recipeId = Value(recipeId),
       stepOrder = Value(stepOrder),
       stepTitle = Value(stepTitle),
       stepDescription = Value(stepDescription);
  static Insertable<RecipeStepData> custom({
    Expression<int>? id,
    Expression<int>? recipeId,
    Expression<int>? stepOrder,
    Expression<String>? stepTitle,
    Expression<String>? stepDescription,
    Expression<int>? durationMinutes,
    Expression<String>? timerLabel,
    Expression<DateTime>? createdAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (recipeId != null) 'recipe_id': recipeId,
      if (stepOrder != null) 'step_order': stepOrder,
      if (stepTitle != null) 'step_title': stepTitle,
      if (stepDescription != null) 'step_description': stepDescription,
      if (durationMinutes != null) 'duration_minutes': durationMinutes,
      if (timerLabel != null) 'timer_label': timerLabel,
      if (createdAt != null) 'created_at': createdAt,
    });
  }

  RecipeStepsCompanion copyWith({
    Value<int>? id,
    Value<int>? recipeId,
    Value<int>? stepOrder,
    Value<String>? stepTitle,
    Value<String>? stepDescription,
    Value<int?>? durationMinutes,
    Value<String?>? timerLabel,
    Value<DateTime>? createdAt,
  }) {
    return RecipeStepsCompanion(
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
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (recipeId.present) {
      map['recipe_id'] = Variable<int>(recipeId.value);
    }
    if (stepOrder.present) {
      map['step_order'] = Variable<int>(stepOrder.value);
    }
    if (stepTitle.present) {
      map['step_title'] = Variable<String>(stepTitle.value);
    }
    if (stepDescription.present) {
      map['step_description'] = Variable<String>(stepDescription.value);
    }
    if (durationMinutes.present) {
      map['duration_minutes'] = Variable<int>(durationMinutes.value);
    }
    if (timerLabel.present) {
      map['timer_label'] = Variable<String>(timerLabel.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('RecipeStepsCompanion(')
          ..write('id: $id, ')
          ..write('recipeId: $recipeId, ')
          ..write('stepOrder: $stepOrder, ')
          ..write('stepTitle: $stepTitle, ')
          ..write('stepDescription: $stepDescription, ')
          ..write('durationMinutes: $durationMinutes, ')
          ..write('timerLabel: $timerLabel, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }
}

class $RecipeIngredientsTable extends RecipeIngredients
    with TableInfo<$RecipeIngredientsTable, RecipeIngredientData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $RecipeIngredientsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _recipeIdMeta = const VerificationMeta(
    'recipeId',
  );
  @override
  late final GeneratedColumn<int> recipeId = GeneratedColumn<int>(
    'recipe_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES recipes (id) ON DELETE CASCADE',
    ),
  );
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
    'name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _amountMeta = const VerificationMeta('amount');
  @override
  late final GeneratedColumn<String> amount = GeneratedColumn<String>(
    'amount',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _unitMeta = const VerificationMeta('unit');
  @override
  late final GeneratedColumn<String> unit = GeneratedColumn<String>(
    'unit',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _orderMeta = const VerificationMeta('order');
  @override
  late final GeneratedColumn<int> order = GeneratedColumn<int>(
    'order',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _isOptionalMeta = const VerificationMeta(
    'isOptional',
  );
  @override
  late final GeneratedColumn<bool> isOptional = GeneratedColumn<bool>(
    'is_optional',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("is_optional" IN (0, 1))',
    ),
    defaultValue: const Constant(false),
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    defaultValue: currentDateAndTime,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    recipeId,
    name,
    amount,
    unit,
    order,
    isOptional,
    createdAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'recipe_ingredients';
  @override
  VerificationContext validateIntegrity(
    Insertable<RecipeIngredientData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('recipe_id')) {
      context.handle(
        _recipeIdMeta,
        recipeId.isAcceptableOrUnknown(data['recipe_id']!, _recipeIdMeta),
      );
    } else if (isInserting) {
      context.missing(_recipeIdMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('amount')) {
      context.handle(
        _amountMeta,
        amount.isAcceptableOrUnknown(data['amount']!, _amountMeta),
      );
    } else if (isInserting) {
      context.missing(_amountMeta);
    }
    if (data.containsKey('unit')) {
      context.handle(
        _unitMeta,
        unit.isAcceptableOrUnknown(data['unit']!, _unitMeta),
      );
    } else if (isInserting) {
      context.missing(_unitMeta);
    }
    if (data.containsKey('order')) {
      context.handle(
        _orderMeta,
        order.isAcceptableOrUnknown(data['order']!, _orderMeta),
      );
    }
    if (data.containsKey('is_optional')) {
      context.handle(
        _isOptionalMeta,
        isOptional.isAcceptableOrUnknown(data['is_optional']!, _isOptionalMeta),
      );
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  List<Set<GeneratedColumn>> get uniqueKeys => [
    {recipeId, order},
  ];
  @override
  RecipeIngredientData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return RecipeIngredientData(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      recipeId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}recipe_id'],
      )!,
      name: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name'],
      )!,
      amount: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}amount'],
      )!,
      unit: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}unit'],
      )!,
      order: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}order'],
      )!,
      isOptional: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}is_optional'],
      )!,
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
    );
  }

  @override
  $RecipeIngredientsTable createAlias(String alias) {
    return $RecipeIngredientsTable(attachedDatabase, alias);
  }
}

class RecipeIngredientData extends DataClass
    implements Insertable<RecipeIngredientData> {
  final int id;
  final int recipeId;
  final String name;
  final String amount;
  final String unit;
  final int order;
  final bool isOptional;
  final DateTime createdAt;
  const RecipeIngredientData({
    required this.id,
    required this.recipeId,
    required this.name,
    required this.amount,
    required this.unit,
    required this.order,
    required this.isOptional,
    required this.createdAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['recipe_id'] = Variable<int>(recipeId);
    map['name'] = Variable<String>(name);
    map['amount'] = Variable<String>(amount);
    map['unit'] = Variable<String>(unit);
    map['order'] = Variable<int>(order);
    map['is_optional'] = Variable<bool>(isOptional);
    map['created_at'] = Variable<DateTime>(createdAt);
    return map;
  }

  RecipeIngredientsCompanion toCompanion(bool nullToAbsent) {
    return RecipeIngredientsCompanion(
      id: Value(id),
      recipeId: Value(recipeId),
      name: Value(name),
      amount: Value(amount),
      unit: Value(unit),
      order: Value(order),
      isOptional: Value(isOptional),
      createdAt: Value(createdAt),
    );
  }

  factory RecipeIngredientData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return RecipeIngredientData(
      id: serializer.fromJson<int>(json['id']),
      recipeId: serializer.fromJson<int>(json['recipeId']),
      name: serializer.fromJson<String>(json['name']),
      amount: serializer.fromJson<String>(json['amount']),
      unit: serializer.fromJson<String>(json['unit']),
      order: serializer.fromJson<int>(json['order']),
      isOptional: serializer.fromJson<bool>(json['isOptional']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'recipeId': serializer.toJson<int>(recipeId),
      'name': serializer.toJson<String>(name),
      'amount': serializer.toJson<String>(amount),
      'unit': serializer.toJson<String>(unit),
      'order': serializer.toJson<int>(order),
      'isOptional': serializer.toJson<bool>(isOptional),
      'createdAt': serializer.toJson<DateTime>(createdAt),
    };
  }

  RecipeIngredientData copyWith({
    int? id,
    int? recipeId,
    String? name,
    String? amount,
    String? unit,
    int? order,
    bool? isOptional,
    DateTime? createdAt,
  }) => RecipeIngredientData(
    id: id ?? this.id,
    recipeId: recipeId ?? this.recipeId,
    name: name ?? this.name,
    amount: amount ?? this.amount,
    unit: unit ?? this.unit,
    order: order ?? this.order,
    isOptional: isOptional ?? this.isOptional,
    createdAt: createdAt ?? this.createdAt,
  );
  RecipeIngredientData copyWithCompanion(RecipeIngredientsCompanion data) {
    return RecipeIngredientData(
      id: data.id.present ? data.id.value : this.id,
      recipeId: data.recipeId.present ? data.recipeId.value : this.recipeId,
      name: data.name.present ? data.name.value : this.name,
      amount: data.amount.present ? data.amount.value : this.amount,
      unit: data.unit.present ? data.unit.value : this.unit,
      order: data.order.present ? data.order.value : this.order,
      isOptional: data.isOptional.present
          ? data.isOptional.value
          : this.isOptional,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('RecipeIngredientData(')
          ..write('id: $id, ')
          ..write('recipeId: $recipeId, ')
          ..write('name: $name, ')
          ..write('amount: $amount, ')
          ..write('unit: $unit, ')
          ..write('order: $order, ')
          ..write('isOptional: $isOptional, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    recipeId,
    name,
    amount,
    unit,
    order,
    isOptional,
    createdAt,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is RecipeIngredientData &&
          other.id == this.id &&
          other.recipeId == this.recipeId &&
          other.name == this.name &&
          other.amount == this.amount &&
          other.unit == this.unit &&
          other.order == this.order &&
          other.isOptional == this.isOptional &&
          other.createdAt == this.createdAt);
}

class RecipeIngredientsCompanion extends UpdateCompanion<RecipeIngredientData> {
  final Value<int> id;
  final Value<int> recipeId;
  final Value<String> name;
  final Value<String> amount;
  final Value<String> unit;
  final Value<int> order;
  final Value<bool> isOptional;
  final Value<DateTime> createdAt;
  const RecipeIngredientsCompanion({
    this.id = const Value.absent(),
    this.recipeId = const Value.absent(),
    this.name = const Value.absent(),
    this.amount = const Value.absent(),
    this.unit = const Value.absent(),
    this.order = const Value.absent(),
    this.isOptional = const Value.absent(),
    this.createdAt = const Value.absent(),
  });
  RecipeIngredientsCompanion.insert({
    this.id = const Value.absent(),
    required int recipeId,
    required String name,
    required String amount,
    required String unit,
    this.order = const Value.absent(),
    this.isOptional = const Value.absent(),
    this.createdAt = const Value.absent(),
  }) : recipeId = Value(recipeId),
       name = Value(name),
       amount = Value(amount),
       unit = Value(unit);
  static Insertable<RecipeIngredientData> custom({
    Expression<int>? id,
    Expression<int>? recipeId,
    Expression<String>? name,
    Expression<String>? amount,
    Expression<String>? unit,
    Expression<int>? order,
    Expression<bool>? isOptional,
    Expression<DateTime>? createdAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (recipeId != null) 'recipe_id': recipeId,
      if (name != null) 'name': name,
      if (amount != null) 'amount': amount,
      if (unit != null) 'unit': unit,
      if (order != null) 'order': order,
      if (isOptional != null) 'is_optional': isOptional,
      if (createdAt != null) 'created_at': createdAt,
    });
  }

  RecipeIngredientsCompanion copyWith({
    Value<int>? id,
    Value<int>? recipeId,
    Value<String>? name,
    Value<String>? amount,
    Value<String>? unit,
    Value<int>? order,
    Value<bool>? isOptional,
    Value<DateTime>? createdAt,
  }) {
    return RecipeIngredientsCompanion(
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

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (recipeId.present) {
      map['recipe_id'] = Variable<int>(recipeId.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (amount.present) {
      map['amount'] = Variable<String>(amount.value);
    }
    if (unit.present) {
      map['unit'] = Variable<String>(unit.value);
    }
    if (order.present) {
      map['order'] = Variable<int>(order.value);
    }
    if (isOptional.present) {
      map['is_optional'] = Variable<bool>(isOptional.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('RecipeIngredientsCompanion(')
          ..write('id: $id, ')
          ..write('recipeId: $recipeId, ')
          ..write('name: $name, ')
          ..write('amount: $amount, ')
          ..write('unit: $unit, ')
          ..write('order: $order, ')
          ..write('isOptional: $isOptional, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }
}

class $CookingHistoriesTable extends CookingHistories
    with TableInfo<$CookingHistoriesTable, CookingHistoryData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $CookingHistoriesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _recipeIdMeta = const VerificationMeta(
    'recipeId',
  );
  @override
  late final GeneratedColumn<int> recipeId = GeneratedColumn<int>(
    'recipe_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES recipes (id) ON DELETE CASCADE',
    ),
  );
  static const VerificationMeta _startedAtMeta = const VerificationMeta(
    'startedAt',
  );
  @override
  late final GeneratedColumn<DateTime> startedAt = GeneratedColumn<DateTime>(
    'started_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    defaultValue: currentDateAndTime,
  );
  static const VerificationMeta _completedAtMeta = const VerificationMeta(
    'completedAt',
  );
  @override
  late final GeneratedColumn<DateTime> completedAt = GeneratedColumn<DateTime>(
    'completed_at',
    aliasedName,
    true,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _statusMeta = const VerificationMeta('status');
  @override
  late final GeneratedColumn<String> status = GeneratedColumn<String>(
    'status',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant('in_progress'),
  );
  static const VerificationMeta _currentStepMeta = const VerificationMeta(
    'currentStep',
  );
  @override
  late final GeneratedColumn<int> currentStep = GeneratedColumn<int>(
    'current_step',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _notesMeta = const VerificationMeta('notes');
  @override
  late final GeneratedColumn<String> notes = GeneratedColumn<String>(
    'notes',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    recipeId,
    startedAt,
    completedAt,
    status,
    currentStep,
    notes,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'cooking_histories';
  @override
  VerificationContext validateIntegrity(
    Insertable<CookingHistoryData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('recipe_id')) {
      context.handle(
        _recipeIdMeta,
        recipeId.isAcceptableOrUnknown(data['recipe_id']!, _recipeIdMeta),
      );
    } else if (isInserting) {
      context.missing(_recipeIdMeta);
    }
    if (data.containsKey('started_at')) {
      context.handle(
        _startedAtMeta,
        startedAt.isAcceptableOrUnknown(data['started_at']!, _startedAtMeta),
      );
    }
    if (data.containsKey('completed_at')) {
      context.handle(
        _completedAtMeta,
        completedAt.isAcceptableOrUnknown(
          data['completed_at']!,
          _completedAtMeta,
        ),
      );
    }
    if (data.containsKey('status')) {
      context.handle(
        _statusMeta,
        status.isAcceptableOrUnknown(data['status']!, _statusMeta),
      );
    }
    if (data.containsKey('current_step')) {
      context.handle(
        _currentStepMeta,
        currentStep.isAcceptableOrUnknown(
          data['current_step']!,
          _currentStepMeta,
        ),
      );
    }
    if (data.containsKey('notes')) {
      context.handle(
        _notesMeta,
        notes.isAcceptableOrUnknown(data['notes']!, _notesMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  CookingHistoryData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return CookingHistoryData(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      recipeId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}recipe_id'],
      )!,
      startedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}started_at'],
      )!,
      completedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}completed_at'],
      ),
      status: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}status'],
      )!,
      currentStep: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}current_step'],
      )!,
      notes: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}notes'],
      ),
    );
  }

  @override
  $CookingHistoriesTable createAlias(String alias) {
    return $CookingHistoriesTable(attachedDatabase, alias);
  }
}

class CookingHistoryData extends DataClass
    implements Insertable<CookingHistoryData> {
  final int id;
  final int recipeId;
  final DateTime startedAt;
  final DateTime? completedAt;
  final String status;
  final int currentStep;
  final String? notes;
  const CookingHistoryData({
    required this.id,
    required this.recipeId,
    required this.startedAt,
    this.completedAt,
    required this.status,
    required this.currentStep,
    this.notes,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['recipe_id'] = Variable<int>(recipeId);
    map['started_at'] = Variable<DateTime>(startedAt);
    if (!nullToAbsent || completedAt != null) {
      map['completed_at'] = Variable<DateTime>(completedAt);
    }
    map['status'] = Variable<String>(status);
    map['current_step'] = Variable<int>(currentStep);
    if (!nullToAbsent || notes != null) {
      map['notes'] = Variable<String>(notes);
    }
    return map;
  }

  CookingHistoriesCompanion toCompanion(bool nullToAbsent) {
    return CookingHistoriesCompanion(
      id: Value(id),
      recipeId: Value(recipeId),
      startedAt: Value(startedAt),
      completedAt: completedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(completedAt),
      status: Value(status),
      currentStep: Value(currentStep),
      notes: notes == null && nullToAbsent
          ? const Value.absent()
          : Value(notes),
    );
  }

  factory CookingHistoryData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return CookingHistoryData(
      id: serializer.fromJson<int>(json['id']),
      recipeId: serializer.fromJson<int>(json['recipeId']),
      startedAt: serializer.fromJson<DateTime>(json['startedAt']),
      completedAt: serializer.fromJson<DateTime?>(json['completedAt']),
      status: serializer.fromJson<String>(json['status']),
      currentStep: serializer.fromJson<int>(json['currentStep']),
      notes: serializer.fromJson<String?>(json['notes']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'recipeId': serializer.toJson<int>(recipeId),
      'startedAt': serializer.toJson<DateTime>(startedAt),
      'completedAt': serializer.toJson<DateTime?>(completedAt),
      'status': serializer.toJson<String>(status),
      'currentStep': serializer.toJson<int>(currentStep),
      'notes': serializer.toJson<String?>(notes),
    };
  }

  CookingHistoryData copyWith({
    int? id,
    int? recipeId,
    DateTime? startedAt,
    Value<DateTime?> completedAt = const Value.absent(),
    String? status,
    int? currentStep,
    Value<String?> notes = const Value.absent(),
  }) => CookingHistoryData(
    id: id ?? this.id,
    recipeId: recipeId ?? this.recipeId,
    startedAt: startedAt ?? this.startedAt,
    completedAt: completedAt.present ? completedAt.value : this.completedAt,
    status: status ?? this.status,
    currentStep: currentStep ?? this.currentStep,
    notes: notes.present ? notes.value : this.notes,
  );
  CookingHistoryData copyWithCompanion(CookingHistoriesCompanion data) {
    return CookingHistoryData(
      id: data.id.present ? data.id.value : this.id,
      recipeId: data.recipeId.present ? data.recipeId.value : this.recipeId,
      startedAt: data.startedAt.present ? data.startedAt.value : this.startedAt,
      completedAt: data.completedAt.present
          ? data.completedAt.value
          : this.completedAt,
      status: data.status.present ? data.status.value : this.status,
      currentStep: data.currentStep.present
          ? data.currentStep.value
          : this.currentStep,
      notes: data.notes.present ? data.notes.value : this.notes,
    );
  }

  @override
  String toString() {
    return (StringBuffer('CookingHistoryData(')
          ..write('id: $id, ')
          ..write('recipeId: $recipeId, ')
          ..write('startedAt: $startedAt, ')
          ..write('completedAt: $completedAt, ')
          ..write('status: $status, ')
          ..write('currentStep: $currentStep, ')
          ..write('notes: $notes')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    recipeId,
    startedAt,
    completedAt,
    status,
    currentStep,
    notes,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is CookingHistoryData &&
          other.id == this.id &&
          other.recipeId == this.recipeId &&
          other.startedAt == this.startedAt &&
          other.completedAt == this.completedAt &&
          other.status == this.status &&
          other.currentStep == this.currentStep &&
          other.notes == this.notes);
}

class CookingHistoriesCompanion extends UpdateCompanion<CookingHistoryData> {
  final Value<int> id;
  final Value<int> recipeId;
  final Value<DateTime> startedAt;
  final Value<DateTime?> completedAt;
  final Value<String> status;
  final Value<int> currentStep;
  final Value<String?> notes;
  const CookingHistoriesCompanion({
    this.id = const Value.absent(),
    this.recipeId = const Value.absent(),
    this.startedAt = const Value.absent(),
    this.completedAt = const Value.absent(),
    this.status = const Value.absent(),
    this.currentStep = const Value.absent(),
    this.notes = const Value.absent(),
  });
  CookingHistoriesCompanion.insert({
    this.id = const Value.absent(),
    required int recipeId,
    this.startedAt = const Value.absent(),
    this.completedAt = const Value.absent(),
    this.status = const Value.absent(),
    this.currentStep = const Value.absent(),
    this.notes = const Value.absent(),
  }) : recipeId = Value(recipeId);
  static Insertable<CookingHistoryData> custom({
    Expression<int>? id,
    Expression<int>? recipeId,
    Expression<DateTime>? startedAt,
    Expression<DateTime>? completedAt,
    Expression<String>? status,
    Expression<int>? currentStep,
    Expression<String>? notes,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (recipeId != null) 'recipe_id': recipeId,
      if (startedAt != null) 'started_at': startedAt,
      if (completedAt != null) 'completed_at': completedAt,
      if (status != null) 'status': status,
      if (currentStep != null) 'current_step': currentStep,
      if (notes != null) 'notes': notes,
    });
  }

  CookingHistoriesCompanion copyWith({
    Value<int>? id,
    Value<int>? recipeId,
    Value<DateTime>? startedAt,
    Value<DateTime?>? completedAt,
    Value<String>? status,
    Value<int>? currentStep,
    Value<String?>? notes,
  }) {
    return CookingHistoriesCompanion(
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
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (recipeId.present) {
      map['recipe_id'] = Variable<int>(recipeId.value);
    }
    if (startedAt.present) {
      map['started_at'] = Variable<DateTime>(startedAt.value);
    }
    if (completedAt.present) {
      map['completed_at'] = Variable<DateTime>(completedAt.value);
    }
    if (status.present) {
      map['status'] = Variable<String>(status.value);
    }
    if (currentStep.present) {
      map['current_step'] = Variable<int>(currentStep.value);
    }
    if (notes.present) {
      map['notes'] = Variable<String>(notes.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('CookingHistoriesCompanion(')
          ..write('id: $id, ')
          ..write('recipeId: $recipeId, ')
          ..write('startedAt: $startedAt, ')
          ..write('completedAt: $completedAt, ')
          ..write('status: $status, ')
          ..write('currentStep: $currentStep, ')
          ..write('notes: $notes')
          ..write(')'))
        .toString();
  }
}

class $CookingStepLogsTable extends CookingStepLogs
    with TableInfo<$CookingStepLogsTable, CookingStepLogData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $CookingStepLogsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _cookingHistoryIdMeta = const VerificationMeta(
    'cookingHistoryId',
  );
  @override
  late final GeneratedColumn<int> cookingHistoryId = GeneratedColumn<int>(
    'cooking_history_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES cooking_histories (id) ON DELETE CASCADE',
    ),
  );
  static const VerificationMeta _recipeStepIdMeta = const VerificationMeta(
    'recipeStepId',
  );
  @override
  late final GeneratedColumn<int> recipeStepId = GeneratedColumn<int>(
    'recipe_step_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES recipe_steps (id) ON DELETE CASCADE',
    ),
  );
  static const VerificationMeta _startedAtMeta = const VerificationMeta(
    'startedAt',
  );
  @override
  late final GeneratedColumn<DateTime> startedAt = GeneratedColumn<DateTime>(
    'started_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    defaultValue: currentDateAndTime,
  );
  static const VerificationMeta _completedAtMeta = const VerificationMeta(
    'completedAt',
  );
  @override
  late final GeneratedColumn<DateTime> completedAt = GeneratedColumn<DateTime>(
    'completed_at',
    aliasedName,
    true,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _skippedMeta = const VerificationMeta(
    'skipped',
  );
  @override
  late final GeneratedColumn<bool> skipped = GeneratedColumn<bool>(
    'skipped',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("skipped" IN (0, 1))',
    ),
    defaultValue: const Constant(false),
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    cookingHistoryId,
    recipeStepId,
    startedAt,
    completedAt,
    skipped,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'cooking_step_logs';
  @override
  VerificationContext validateIntegrity(
    Insertable<CookingStepLogData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('cooking_history_id')) {
      context.handle(
        _cookingHistoryIdMeta,
        cookingHistoryId.isAcceptableOrUnknown(
          data['cooking_history_id']!,
          _cookingHistoryIdMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_cookingHistoryIdMeta);
    }
    if (data.containsKey('recipe_step_id')) {
      context.handle(
        _recipeStepIdMeta,
        recipeStepId.isAcceptableOrUnknown(
          data['recipe_step_id']!,
          _recipeStepIdMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_recipeStepIdMeta);
    }
    if (data.containsKey('started_at')) {
      context.handle(
        _startedAtMeta,
        startedAt.isAcceptableOrUnknown(data['started_at']!, _startedAtMeta),
      );
    }
    if (data.containsKey('completed_at')) {
      context.handle(
        _completedAtMeta,
        completedAt.isAcceptableOrUnknown(
          data['completed_at']!,
          _completedAtMeta,
        ),
      );
    }
    if (data.containsKey('skipped')) {
      context.handle(
        _skippedMeta,
        skipped.isAcceptableOrUnknown(data['skipped']!, _skippedMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  List<Set<GeneratedColumn>> get uniqueKeys => [
    {cookingHistoryId, recipeStepId},
  ];
  @override
  CookingStepLogData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return CookingStepLogData(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      cookingHistoryId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}cooking_history_id'],
      )!,
      recipeStepId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}recipe_step_id'],
      )!,
      startedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}started_at'],
      )!,
      completedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}completed_at'],
      ),
      skipped: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}skipped'],
      )!,
    );
  }

  @override
  $CookingStepLogsTable createAlias(String alias) {
    return $CookingStepLogsTable(attachedDatabase, alias);
  }
}

class CookingStepLogData extends DataClass
    implements Insertable<CookingStepLogData> {
  final int id;
  final int cookingHistoryId;
  final int recipeStepId;
  final DateTime startedAt;
  final DateTime? completedAt;
  final bool skipped;
  const CookingStepLogData({
    required this.id,
    required this.cookingHistoryId,
    required this.recipeStepId,
    required this.startedAt,
    this.completedAt,
    required this.skipped,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['cooking_history_id'] = Variable<int>(cookingHistoryId);
    map['recipe_step_id'] = Variable<int>(recipeStepId);
    map['started_at'] = Variable<DateTime>(startedAt);
    if (!nullToAbsent || completedAt != null) {
      map['completed_at'] = Variable<DateTime>(completedAt);
    }
    map['skipped'] = Variable<bool>(skipped);
    return map;
  }

  CookingStepLogsCompanion toCompanion(bool nullToAbsent) {
    return CookingStepLogsCompanion(
      id: Value(id),
      cookingHistoryId: Value(cookingHistoryId),
      recipeStepId: Value(recipeStepId),
      startedAt: Value(startedAt),
      completedAt: completedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(completedAt),
      skipped: Value(skipped),
    );
  }

  factory CookingStepLogData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return CookingStepLogData(
      id: serializer.fromJson<int>(json['id']),
      cookingHistoryId: serializer.fromJson<int>(json['cookingHistoryId']),
      recipeStepId: serializer.fromJson<int>(json['recipeStepId']),
      startedAt: serializer.fromJson<DateTime>(json['startedAt']),
      completedAt: serializer.fromJson<DateTime?>(json['completedAt']),
      skipped: serializer.fromJson<bool>(json['skipped']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'cookingHistoryId': serializer.toJson<int>(cookingHistoryId),
      'recipeStepId': serializer.toJson<int>(recipeStepId),
      'startedAt': serializer.toJson<DateTime>(startedAt),
      'completedAt': serializer.toJson<DateTime?>(completedAt),
      'skipped': serializer.toJson<bool>(skipped),
    };
  }

  CookingStepLogData copyWith({
    int? id,
    int? cookingHistoryId,
    int? recipeStepId,
    DateTime? startedAt,
    Value<DateTime?> completedAt = const Value.absent(),
    bool? skipped,
  }) => CookingStepLogData(
    id: id ?? this.id,
    cookingHistoryId: cookingHistoryId ?? this.cookingHistoryId,
    recipeStepId: recipeStepId ?? this.recipeStepId,
    startedAt: startedAt ?? this.startedAt,
    completedAt: completedAt.present ? completedAt.value : this.completedAt,
    skipped: skipped ?? this.skipped,
  );
  CookingStepLogData copyWithCompanion(CookingStepLogsCompanion data) {
    return CookingStepLogData(
      id: data.id.present ? data.id.value : this.id,
      cookingHistoryId: data.cookingHistoryId.present
          ? data.cookingHistoryId.value
          : this.cookingHistoryId,
      recipeStepId: data.recipeStepId.present
          ? data.recipeStepId.value
          : this.recipeStepId,
      startedAt: data.startedAt.present ? data.startedAt.value : this.startedAt,
      completedAt: data.completedAt.present
          ? data.completedAt.value
          : this.completedAt,
      skipped: data.skipped.present ? data.skipped.value : this.skipped,
    );
  }

  @override
  String toString() {
    return (StringBuffer('CookingStepLogData(')
          ..write('id: $id, ')
          ..write('cookingHistoryId: $cookingHistoryId, ')
          ..write('recipeStepId: $recipeStepId, ')
          ..write('startedAt: $startedAt, ')
          ..write('completedAt: $completedAt, ')
          ..write('skipped: $skipped')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    cookingHistoryId,
    recipeStepId,
    startedAt,
    completedAt,
    skipped,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is CookingStepLogData &&
          other.id == this.id &&
          other.cookingHistoryId == this.cookingHistoryId &&
          other.recipeStepId == this.recipeStepId &&
          other.startedAt == this.startedAt &&
          other.completedAt == this.completedAt &&
          other.skipped == this.skipped);
}

class CookingStepLogsCompanion extends UpdateCompanion<CookingStepLogData> {
  final Value<int> id;
  final Value<int> cookingHistoryId;
  final Value<int> recipeStepId;
  final Value<DateTime> startedAt;
  final Value<DateTime?> completedAt;
  final Value<bool> skipped;
  const CookingStepLogsCompanion({
    this.id = const Value.absent(),
    this.cookingHistoryId = const Value.absent(),
    this.recipeStepId = const Value.absent(),
    this.startedAt = const Value.absent(),
    this.completedAt = const Value.absent(),
    this.skipped = const Value.absent(),
  });
  CookingStepLogsCompanion.insert({
    this.id = const Value.absent(),
    required int cookingHistoryId,
    required int recipeStepId,
    this.startedAt = const Value.absent(),
    this.completedAt = const Value.absent(),
    this.skipped = const Value.absent(),
  }) : cookingHistoryId = Value(cookingHistoryId),
       recipeStepId = Value(recipeStepId);
  static Insertable<CookingStepLogData> custom({
    Expression<int>? id,
    Expression<int>? cookingHistoryId,
    Expression<int>? recipeStepId,
    Expression<DateTime>? startedAt,
    Expression<DateTime>? completedAt,
    Expression<bool>? skipped,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (cookingHistoryId != null) 'cooking_history_id': cookingHistoryId,
      if (recipeStepId != null) 'recipe_step_id': recipeStepId,
      if (startedAt != null) 'started_at': startedAt,
      if (completedAt != null) 'completed_at': completedAt,
      if (skipped != null) 'skipped': skipped,
    });
  }

  CookingStepLogsCompanion copyWith({
    Value<int>? id,
    Value<int>? cookingHistoryId,
    Value<int>? recipeStepId,
    Value<DateTime>? startedAt,
    Value<DateTime?>? completedAt,
    Value<bool>? skipped,
  }) {
    return CookingStepLogsCompanion(
      id: id ?? this.id,
      cookingHistoryId: cookingHistoryId ?? this.cookingHistoryId,
      recipeStepId: recipeStepId ?? this.recipeStepId,
      startedAt: startedAt ?? this.startedAt,
      completedAt: completedAt ?? this.completedAt,
      skipped: skipped ?? this.skipped,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (cookingHistoryId.present) {
      map['cooking_history_id'] = Variable<int>(cookingHistoryId.value);
    }
    if (recipeStepId.present) {
      map['recipe_step_id'] = Variable<int>(recipeStepId.value);
    }
    if (startedAt.present) {
      map['started_at'] = Variable<DateTime>(startedAt.value);
    }
    if (completedAt.present) {
      map['completed_at'] = Variable<DateTime>(completedAt.value);
    }
    if (skipped.present) {
      map['skipped'] = Variable<bool>(skipped.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('CookingStepLogsCompanion(')
          ..write('id: $id, ')
          ..write('cookingHistoryId: $cookingHistoryId, ')
          ..write('recipeStepId: $recipeStepId, ')
          ..write('startedAt: $startedAt, ')
          ..write('completedAt: $completedAt, ')
          ..write('skipped: $skipped')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $RecipesTable recipes = $RecipesTable(this);
  late final $RecipeStepsTable recipeSteps = $RecipeStepsTable(this);
  late final $RecipeIngredientsTable recipeIngredients =
      $RecipeIngredientsTable(this);
  late final $CookingHistoriesTable cookingHistories = $CookingHistoriesTable(
    this,
  );
  late final $CookingStepLogsTable cookingStepLogs = $CookingStepLogsTable(
    this,
  );
  late final RecipeDao recipeDao = RecipeDao(this as AppDatabase);
  late final RecipeStepDao recipeStepDao = RecipeStepDao(this as AppDatabase);
  late final RecipeIngredientDao recipeIngredientDao = RecipeIngredientDao(
    this as AppDatabase,
  );
  late final CookingHistoryDao cookingHistoryDao = CookingHistoryDao(
    this as AppDatabase,
  );
  late final CookingStepLogDao cookingStepLogDao = CookingStepLogDao(
    this as AppDatabase,
  );
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [
    recipes,
    recipeSteps,
    recipeIngredients,
    cookingHistories,
    cookingStepLogs,
  ];
  @override
  StreamQueryUpdateRules get streamUpdateRules => const StreamQueryUpdateRules([
    WritePropagation(
      on: TableUpdateQuery.onTableName(
        'recipes',
        limitUpdateKind: UpdateKind.delete,
      ),
      result: [TableUpdate('recipe_steps', kind: UpdateKind.delete)],
    ),
    WritePropagation(
      on: TableUpdateQuery.onTableName(
        'recipes',
        limitUpdateKind: UpdateKind.delete,
      ),
      result: [TableUpdate('recipe_ingredients', kind: UpdateKind.delete)],
    ),
    WritePropagation(
      on: TableUpdateQuery.onTableName(
        'recipes',
        limitUpdateKind: UpdateKind.delete,
      ),
      result: [TableUpdate('cooking_histories', kind: UpdateKind.delete)],
    ),
    WritePropagation(
      on: TableUpdateQuery.onTableName(
        'cooking_histories',
        limitUpdateKind: UpdateKind.delete,
      ),
      result: [TableUpdate('cooking_step_logs', kind: UpdateKind.delete)],
    ),
    WritePropagation(
      on: TableUpdateQuery.onTableName(
        'recipe_steps',
        limitUpdateKind: UpdateKind.delete,
      ),
      result: [TableUpdate('cooking_step_logs', kind: UpdateKind.delete)],
    ),
  ]);
}

typedef $$RecipesTableCreateCompanionBuilder =
    RecipesCompanion Function({
      Value<int> id,
      required String title,
      required String description,
      required String imgUrl,
      required String cookTime,
      required String category,
      required Difficulty difficultyLevel,
      required bool isFavorited,
    });
typedef $$RecipesTableUpdateCompanionBuilder =
    RecipesCompanion Function({
      Value<int> id,
      Value<String> title,
      Value<String> description,
      Value<String> imgUrl,
      Value<String> cookTime,
      Value<String> category,
      Value<Difficulty> difficultyLevel,
      Value<bool> isFavorited,
    });

final class $$RecipesTableReferences
    extends BaseReferences<_$AppDatabase, $RecipesTable, Recipe> {
  $$RecipesTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static MultiTypedResultKey<$RecipeStepsTable, List<RecipeStepData>>
  _recipeStepsRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.recipeSteps,
    aliasName: $_aliasNameGenerator(db.recipes.id, db.recipeSteps.recipeId),
  );

  $$RecipeStepsTableProcessedTableManager get recipeStepsRefs {
    final manager = $$RecipeStepsTableTableManager(
      $_db,
      $_db.recipeSteps,
    ).filter((f) => f.recipeId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(_recipeStepsRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<
    $RecipeIngredientsTable,
    List<RecipeIngredientData>
  >
  _recipeIngredientsRefsTable(_$AppDatabase db) =>
      MultiTypedResultKey.fromTable(
        db.recipeIngredients,
        aliasName: $_aliasNameGenerator(
          db.recipes.id,
          db.recipeIngredients.recipeId,
        ),
      );

  $$RecipeIngredientsTableProcessedTableManager get recipeIngredientsRefs {
    final manager = $$RecipeIngredientsTableTableManager(
      $_db,
      $_db.recipeIngredients,
    ).filter((f) => f.recipeId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(
      _recipeIngredientsRefsTable($_db),
    );
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<$CookingHistoriesTable, List<CookingHistoryData>>
  _cookingHistoriesRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.cookingHistories,
    aliasName: $_aliasNameGenerator(
      db.recipes.id,
      db.cookingHistories.recipeId,
    ),
  );

  $$CookingHistoriesTableProcessedTableManager get cookingHistoriesRefs {
    final manager = $$CookingHistoriesTableTableManager(
      $_db,
      $_db.cookingHistories,
    ).filter((f) => f.recipeId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(
      _cookingHistoriesRefsTable($_db),
    );
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$RecipesTableFilterComposer
    extends Composer<_$AppDatabase, $RecipesTable> {
  $$RecipesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get title => $composableBuilder(
    column: $table.title,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get imgUrl => $composableBuilder(
    column: $table.imgUrl,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get cookTime => $composableBuilder(
    column: $table.cookTime,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get category => $composableBuilder(
    column: $table.category,
    builder: (column) => ColumnFilters(column),
  );

  ColumnWithTypeConverterFilters<Difficulty, Difficulty, int>
  get difficultyLevel => $composableBuilder(
    column: $table.difficultyLevel,
    builder: (column) => ColumnWithTypeConverterFilters(column),
  );

  ColumnFilters<bool> get isFavorited => $composableBuilder(
    column: $table.isFavorited,
    builder: (column) => ColumnFilters(column),
  );

  Expression<bool> recipeStepsRefs(
    Expression<bool> Function($$RecipeStepsTableFilterComposer f) f,
  ) {
    final $$RecipeStepsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.recipeSteps,
      getReferencedColumn: (t) => t.recipeId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$RecipeStepsTableFilterComposer(
            $db: $db,
            $table: $db.recipeSteps,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<bool> recipeIngredientsRefs(
    Expression<bool> Function($$RecipeIngredientsTableFilterComposer f) f,
  ) {
    final $$RecipeIngredientsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.recipeIngredients,
      getReferencedColumn: (t) => t.recipeId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$RecipeIngredientsTableFilterComposer(
            $db: $db,
            $table: $db.recipeIngredients,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<bool> cookingHistoriesRefs(
    Expression<bool> Function($$CookingHistoriesTableFilterComposer f) f,
  ) {
    final $$CookingHistoriesTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.cookingHistories,
      getReferencedColumn: (t) => t.recipeId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$CookingHistoriesTableFilterComposer(
            $db: $db,
            $table: $db.cookingHistories,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$RecipesTableOrderingComposer
    extends Composer<_$AppDatabase, $RecipesTable> {
  $$RecipesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get title => $composableBuilder(
    column: $table.title,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get imgUrl => $composableBuilder(
    column: $table.imgUrl,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get cookTime => $composableBuilder(
    column: $table.cookTime,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get category => $composableBuilder(
    column: $table.category,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get difficultyLevel => $composableBuilder(
    column: $table.difficultyLevel,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get isFavorited => $composableBuilder(
    column: $table.isFavorited,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$RecipesTableAnnotationComposer
    extends Composer<_$AppDatabase, $RecipesTable> {
  $$RecipesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get title =>
      $composableBuilder(column: $table.title, builder: (column) => column);

  GeneratedColumn<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => column,
  );

  GeneratedColumn<String> get imgUrl =>
      $composableBuilder(column: $table.imgUrl, builder: (column) => column);

  GeneratedColumn<String> get cookTime =>
      $composableBuilder(column: $table.cookTime, builder: (column) => column);

  GeneratedColumn<String> get category =>
      $composableBuilder(column: $table.category, builder: (column) => column);

  GeneratedColumnWithTypeConverter<Difficulty, int> get difficultyLevel =>
      $composableBuilder(
        column: $table.difficultyLevel,
        builder: (column) => column,
      );

  GeneratedColumn<bool> get isFavorited => $composableBuilder(
    column: $table.isFavorited,
    builder: (column) => column,
  );

  Expression<T> recipeStepsRefs<T extends Object>(
    Expression<T> Function($$RecipeStepsTableAnnotationComposer a) f,
  ) {
    final $$RecipeStepsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.recipeSteps,
      getReferencedColumn: (t) => t.recipeId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$RecipeStepsTableAnnotationComposer(
            $db: $db,
            $table: $db.recipeSteps,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<T> recipeIngredientsRefs<T extends Object>(
    Expression<T> Function($$RecipeIngredientsTableAnnotationComposer a) f,
  ) {
    final $$RecipeIngredientsTableAnnotationComposer composer =
        $composerBuilder(
          composer: this,
          getCurrentColumn: (t) => t.id,
          referencedTable: $db.recipeIngredients,
          getReferencedColumn: (t) => t.recipeId,
          builder:
              (
                joinBuilder, {
                $addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer,
              }) => $$RecipeIngredientsTableAnnotationComposer(
                $db: $db,
                $table: $db.recipeIngredients,
                $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                joinBuilder: joinBuilder,
                $removeJoinBuilderFromRootComposer:
                    $removeJoinBuilderFromRootComposer,
              ),
        );
    return f(composer);
  }

  Expression<T> cookingHistoriesRefs<T extends Object>(
    Expression<T> Function($$CookingHistoriesTableAnnotationComposer a) f,
  ) {
    final $$CookingHistoriesTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.cookingHistories,
      getReferencedColumn: (t) => t.recipeId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$CookingHistoriesTableAnnotationComposer(
            $db: $db,
            $table: $db.cookingHistories,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$RecipesTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $RecipesTable,
          Recipe,
          $$RecipesTableFilterComposer,
          $$RecipesTableOrderingComposer,
          $$RecipesTableAnnotationComposer,
          $$RecipesTableCreateCompanionBuilder,
          $$RecipesTableUpdateCompanionBuilder,
          (Recipe, $$RecipesTableReferences),
          Recipe,
          PrefetchHooks Function({
            bool recipeStepsRefs,
            bool recipeIngredientsRefs,
            bool cookingHistoriesRefs,
          })
        > {
  $$RecipesTableTableManager(_$AppDatabase db, $RecipesTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$RecipesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$RecipesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$RecipesTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String> title = const Value.absent(),
                Value<String> description = const Value.absent(),
                Value<String> imgUrl = const Value.absent(),
                Value<String> cookTime = const Value.absent(),
                Value<String> category = const Value.absent(),
                Value<Difficulty> difficultyLevel = const Value.absent(),
                Value<bool> isFavorited = const Value.absent(),
              }) => RecipesCompanion(
                id: id,
                title: title,
                description: description,
                imgUrl: imgUrl,
                cookTime: cookTime,
                category: category,
                difficultyLevel: difficultyLevel,
                isFavorited: isFavorited,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required String title,
                required String description,
                required String imgUrl,
                required String cookTime,
                required String category,
                required Difficulty difficultyLevel,
                required bool isFavorited,
              }) => RecipesCompanion.insert(
                id: id,
                title: title,
                description: description,
                imgUrl: imgUrl,
                cookTime: cookTime,
                category: category,
                difficultyLevel: difficultyLevel,
                isFavorited: isFavorited,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$RecipesTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback:
              ({
                recipeStepsRefs = false,
                recipeIngredientsRefs = false,
                cookingHistoriesRefs = false,
              }) {
                return PrefetchHooks(
                  db: db,
                  explicitlyWatchedTables: [
                    if (recipeStepsRefs) db.recipeSteps,
                    if (recipeIngredientsRefs) db.recipeIngredients,
                    if (cookingHistoriesRefs) db.cookingHistories,
                  ],
                  addJoins: null,
                  getPrefetchedDataCallback: (items) async {
                    return [
                      if (recipeStepsRefs)
                        await $_getPrefetchedData<
                          Recipe,
                          $RecipesTable,
                          RecipeStepData
                        >(
                          currentTable: table,
                          referencedTable: $$RecipesTableReferences
                              ._recipeStepsRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$RecipesTableReferences(
                                db,
                                table,
                                p0,
                              ).recipeStepsRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.recipeId == item.id,
                              ),
                          typedResults: items,
                        ),
                      if (recipeIngredientsRefs)
                        await $_getPrefetchedData<
                          Recipe,
                          $RecipesTable,
                          RecipeIngredientData
                        >(
                          currentTable: table,
                          referencedTable: $$RecipesTableReferences
                              ._recipeIngredientsRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$RecipesTableReferences(
                                db,
                                table,
                                p0,
                              ).recipeIngredientsRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.recipeId == item.id,
                              ),
                          typedResults: items,
                        ),
                      if (cookingHistoriesRefs)
                        await $_getPrefetchedData<
                          Recipe,
                          $RecipesTable,
                          CookingHistoryData
                        >(
                          currentTable: table,
                          referencedTable: $$RecipesTableReferences
                              ._cookingHistoriesRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$RecipesTableReferences(
                                db,
                                table,
                                p0,
                              ).cookingHistoriesRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.recipeId == item.id,
                              ),
                          typedResults: items,
                        ),
                    ];
                  },
                );
              },
        ),
      );
}

typedef $$RecipesTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $RecipesTable,
      Recipe,
      $$RecipesTableFilterComposer,
      $$RecipesTableOrderingComposer,
      $$RecipesTableAnnotationComposer,
      $$RecipesTableCreateCompanionBuilder,
      $$RecipesTableUpdateCompanionBuilder,
      (Recipe, $$RecipesTableReferences),
      Recipe,
      PrefetchHooks Function({
        bool recipeStepsRefs,
        bool recipeIngredientsRefs,
        bool cookingHistoriesRefs,
      })
    >;
typedef $$RecipeStepsTableCreateCompanionBuilder =
    RecipeStepsCompanion Function({
      Value<int> id,
      required int recipeId,
      required int stepOrder,
      required String stepTitle,
      required String stepDescription,
      Value<int?> durationMinutes,
      Value<String?> timerLabel,
      Value<DateTime> createdAt,
    });
typedef $$RecipeStepsTableUpdateCompanionBuilder =
    RecipeStepsCompanion Function({
      Value<int> id,
      Value<int> recipeId,
      Value<int> stepOrder,
      Value<String> stepTitle,
      Value<String> stepDescription,
      Value<int?> durationMinutes,
      Value<String?> timerLabel,
      Value<DateTime> createdAt,
    });

final class $$RecipeStepsTableReferences
    extends BaseReferences<_$AppDatabase, $RecipeStepsTable, RecipeStepData> {
  $$RecipeStepsTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $RecipesTable _recipeIdTable(_$AppDatabase db) =>
      db.recipes.createAlias(
        $_aliasNameGenerator(db.recipeSteps.recipeId, db.recipes.id),
      );

  $$RecipesTableProcessedTableManager get recipeId {
    final $_column = $_itemColumn<int>('recipe_id')!;

    final manager = $$RecipesTableTableManager(
      $_db,
      $_db.recipes,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_recipeIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static MultiTypedResultKey<$CookingStepLogsTable, List<CookingStepLogData>>
  _cookingStepLogsRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.cookingStepLogs,
    aliasName: $_aliasNameGenerator(
      db.recipeSteps.id,
      db.cookingStepLogs.recipeStepId,
    ),
  );

  $$CookingStepLogsTableProcessedTableManager get cookingStepLogsRefs {
    final manager = $$CookingStepLogsTableTableManager(
      $_db,
      $_db.cookingStepLogs,
    ).filter((f) => f.recipeStepId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(
      _cookingStepLogsRefsTable($_db),
    );
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$RecipeStepsTableFilterComposer
    extends Composer<_$AppDatabase, $RecipeStepsTable> {
  $$RecipeStepsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get stepOrder => $composableBuilder(
    column: $table.stepOrder,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get stepTitle => $composableBuilder(
    column: $table.stepTitle,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get stepDescription => $composableBuilder(
    column: $table.stepDescription,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get durationMinutes => $composableBuilder(
    column: $table.durationMinutes,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get timerLabel => $composableBuilder(
    column: $table.timerLabel,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  $$RecipesTableFilterComposer get recipeId {
    final $$RecipesTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.recipeId,
      referencedTable: $db.recipes,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$RecipesTableFilterComposer(
            $db: $db,
            $table: $db.recipes,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  Expression<bool> cookingStepLogsRefs(
    Expression<bool> Function($$CookingStepLogsTableFilterComposer f) f,
  ) {
    final $$CookingStepLogsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.cookingStepLogs,
      getReferencedColumn: (t) => t.recipeStepId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$CookingStepLogsTableFilterComposer(
            $db: $db,
            $table: $db.cookingStepLogs,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$RecipeStepsTableOrderingComposer
    extends Composer<_$AppDatabase, $RecipeStepsTable> {
  $$RecipeStepsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get stepOrder => $composableBuilder(
    column: $table.stepOrder,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get stepTitle => $composableBuilder(
    column: $table.stepTitle,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get stepDescription => $composableBuilder(
    column: $table.stepDescription,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get durationMinutes => $composableBuilder(
    column: $table.durationMinutes,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get timerLabel => $composableBuilder(
    column: $table.timerLabel,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  $$RecipesTableOrderingComposer get recipeId {
    final $$RecipesTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.recipeId,
      referencedTable: $db.recipes,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$RecipesTableOrderingComposer(
            $db: $db,
            $table: $db.recipes,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$RecipeStepsTableAnnotationComposer
    extends Composer<_$AppDatabase, $RecipeStepsTable> {
  $$RecipeStepsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<int> get stepOrder =>
      $composableBuilder(column: $table.stepOrder, builder: (column) => column);

  GeneratedColumn<String> get stepTitle =>
      $composableBuilder(column: $table.stepTitle, builder: (column) => column);

  GeneratedColumn<String> get stepDescription => $composableBuilder(
    column: $table.stepDescription,
    builder: (column) => column,
  );

  GeneratedColumn<int> get durationMinutes => $composableBuilder(
    column: $table.durationMinutes,
    builder: (column) => column,
  );

  GeneratedColumn<String> get timerLabel => $composableBuilder(
    column: $table.timerLabel,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  $$RecipesTableAnnotationComposer get recipeId {
    final $$RecipesTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.recipeId,
      referencedTable: $db.recipes,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$RecipesTableAnnotationComposer(
            $db: $db,
            $table: $db.recipes,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  Expression<T> cookingStepLogsRefs<T extends Object>(
    Expression<T> Function($$CookingStepLogsTableAnnotationComposer a) f,
  ) {
    final $$CookingStepLogsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.cookingStepLogs,
      getReferencedColumn: (t) => t.recipeStepId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$CookingStepLogsTableAnnotationComposer(
            $db: $db,
            $table: $db.cookingStepLogs,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$RecipeStepsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $RecipeStepsTable,
          RecipeStepData,
          $$RecipeStepsTableFilterComposer,
          $$RecipeStepsTableOrderingComposer,
          $$RecipeStepsTableAnnotationComposer,
          $$RecipeStepsTableCreateCompanionBuilder,
          $$RecipeStepsTableUpdateCompanionBuilder,
          (RecipeStepData, $$RecipeStepsTableReferences),
          RecipeStepData,
          PrefetchHooks Function({bool recipeId, bool cookingStepLogsRefs})
        > {
  $$RecipeStepsTableTableManager(_$AppDatabase db, $RecipeStepsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$RecipeStepsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$RecipeStepsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$RecipeStepsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<int> recipeId = const Value.absent(),
                Value<int> stepOrder = const Value.absent(),
                Value<String> stepTitle = const Value.absent(),
                Value<String> stepDescription = const Value.absent(),
                Value<int?> durationMinutes = const Value.absent(),
                Value<String?> timerLabel = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
              }) => RecipeStepsCompanion(
                id: id,
                recipeId: recipeId,
                stepOrder: stepOrder,
                stepTitle: stepTitle,
                stepDescription: stepDescription,
                durationMinutes: durationMinutes,
                timerLabel: timerLabel,
                createdAt: createdAt,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required int recipeId,
                required int stepOrder,
                required String stepTitle,
                required String stepDescription,
                Value<int?> durationMinutes = const Value.absent(),
                Value<String?> timerLabel = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
              }) => RecipeStepsCompanion.insert(
                id: id,
                recipeId: recipeId,
                stepOrder: stepOrder,
                stepTitle: stepTitle,
                stepDescription: stepDescription,
                durationMinutes: durationMinutes,
                timerLabel: timerLabel,
                createdAt: createdAt,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$RecipeStepsTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback:
              ({recipeId = false, cookingStepLogsRefs = false}) {
                return PrefetchHooks(
                  db: db,
                  explicitlyWatchedTables: [
                    if (cookingStepLogsRefs) db.cookingStepLogs,
                  ],
                  addJoins:
                      <
                        T extends TableManagerState<
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic
                        >
                      >(state) {
                        if (recipeId) {
                          state =
                              state.withJoin(
                                    currentTable: table,
                                    currentColumn: table.recipeId,
                                    referencedTable:
                                        $$RecipeStepsTableReferences
                                            ._recipeIdTable(db),
                                    referencedColumn:
                                        $$RecipeStepsTableReferences
                                            ._recipeIdTable(db)
                                            .id,
                                  )
                                  as T;
                        }

                        return state;
                      },
                  getPrefetchedDataCallback: (items) async {
                    return [
                      if (cookingStepLogsRefs)
                        await $_getPrefetchedData<
                          RecipeStepData,
                          $RecipeStepsTable,
                          CookingStepLogData
                        >(
                          currentTable: table,
                          referencedTable: $$RecipeStepsTableReferences
                              ._cookingStepLogsRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$RecipeStepsTableReferences(
                                db,
                                table,
                                p0,
                              ).cookingStepLogsRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.recipeStepId == item.id,
                              ),
                          typedResults: items,
                        ),
                    ];
                  },
                );
              },
        ),
      );
}

typedef $$RecipeStepsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $RecipeStepsTable,
      RecipeStepData,
      $$RecipeStepsTableFilterComposer,
      $$RecipeStepsTableOrderingComposer,
      $$RecipeStepsTableAnnotationComposer,
      $$RecipeStepsTableCreateCompanionBuilder,
      $$RecipeStepsTableUpdateCompanionBuilder,
      (RecipeStepData, $$RecipeStepsTableReferences),
      RecipeStepData,
      PrefetchHooks Function({bool recipeId, bool cookingStepLogsRefs})
    >;
typedef $$RecipeIngredientsTableCreateCompanionBuilder =
    RecipeIngredientsCompanion Function({
      Value<int> id,
      required int recipeId,
      required String name,
      required String amount,
      required String unit,
      Value<int> order,
      Value<bool> isOptional,
      Value<DateTime> createdAt,
    });
typedef $$RecipeIngredientsTableUpdateCompanionBuilder =
    RecipeIngredientsCompanion Function({
      Value<int> id,
      Value<int> recipeId,
      Value<String> name,
      Value<String> amount,
      Value<String> unit,
      Value<int> order,
      Value<bool> isOptional,
      Value<DateTime> createdAt,
    });

final class $$RecipeIngredientsTableReferences
    extends
        BaseReferences<
          _$AppDatabase,
          $RecipeIngredientsTable,
          RecipeIngredientData
        > {
  $$RecipeIngredientsTableReferences(
    super.$_db,
    super.$_table,
    super.$_typedResult,
  );

  static $RecipesTable _recipeIdTable(_$AppDatabase db) =>
      db.recipes.createAlias(
        $_aliasNameGenerator(db.recipeIngredients.recipeId, db.recipes.id),
      );

  $$RecipesTableProcessedTableManager get recipeId {
    final $_column = $_itemColumn<int>('recipe_id')!;

    final manager = $$RecipesTableTableManager(
      $_db,
      $_db.recipes,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_recipeIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$RecipeIngredientsTableFilterComposer
    extends Composer<_$AppDatabase, $RecipeIngredientsTable> {
  $$RecipeIngredientsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get amount => $composableBuilder(
    column: $table.amount,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get unit => $composableBuilder(
    column: $table.unit,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get order => $composableBuilder(
    column: $table.order,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get isOptional => $composableBuilder(
    column: $table.isOptional,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  $$RecipesTableFilterComposer get recipeId {
    final $$RecipesTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.recipeId,
      referencedTable: $db.recipes,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$RecipesTableFilterComposer(
            $db: $db,
            $table: $db.recipes,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$RecipeIngredientsTableOrderingComposer
    extends Composer<_$AppDatabase, $RecipeIngredientsTable> {
  $$RecipeIngredientsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get amount => $composableBuilder(
    column: $table.amount,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get unit => $composableBuilder(
    column: $table.unit,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get order => $composableBuilder(
    column: $table.order,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get isOptional => $composableBuilder(
    column: $table.isOptional,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  $$RecipesTableOrderingComposer get recipeId {
    final $$RecipesTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.recipeId,
      referencedTable: $db.recipes,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$RecipesTableOrderingComposer(
            $db: $db,
            $table: $db.recipes,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$RecipeIngredientsTableAnnotationComposer
    extends Composer<_$AppDatabase, $RecipeIngredientsTable> {
  $$RecipeIngredientsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<String> get amount =>
      $composableBuilder(column: $table.amount, builder: (column) => column);

  GeneratedColumn<String> get unit =>
      $composableBuilder(column: $table.unit, builder: (column) => column);

  GeneratedColumn<int> get order =>
      $composableBuilder(column: $table.order, builder: (column) => column);

  GeneratedColumn<bool> get isOptional => $composableBuilder(
    column: $table.isOptional,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  $$RecipesTableAnnotationComposer get recipeId {
    final $$RecipesTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.recipeId,
      referencedTable: $db.recipes,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$RecipesTableAnnotationComposer(
            $db: $db,
            $table: $db.recipes,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$RecipeIngredientsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $RecipeIngredientsTable,
          RecipeIngredientData,
          $$RecipeIngredientsTableFilterComposer,
          $$RecipeIngredientsTableOrderingComposer,
          $$RecipeIngredientsTableAnnotationComposer,
          $$RecipeIngredientsTableCreateCompanionBuilder,
          $$RecipeIngredientsTableUpdateCompanionBuilder,
          (RecipeIngredientData, $$RecipeIngredientsTableReferences),
          RecipeIngredientData,
          PrefetchHooks Function({bool recipeId})
        > {
  $$RecipeIngredientsTableTableManager(
    _$AppDatabase db,
    $RecipeIngredientsTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$RecipeIngredientsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$RecipeIngredientsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$RecipeIngredientsTableAnnotationComposer(
                $db: db,
                $table: table,
              ),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<int> recipeId = const Value.absent(),
                Value<String> name = const Value.absent(),
                Value<String> amount = const Value.absent(),
                Value<String> unit = const Value.absent(),
                Value<int> order = const Value.absent(),
                Value<bool> isOptional = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
              }) => RecipeIngredientsCompanion(
                id: id,
                recipeId: recipeId,
                name: name,
                amount: amount,
                unit: unit,
                order: order,
                isOptional: isOptional,
                createdAt: createdAt,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required int recipeId,
                required String name,
                required String amount,
                required String unit,
                Value<int> order = const Value.absent(),
                Value<bool> isOptional = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
              }) => RecipeIngredientsCompanion.insert(
                id: id,
                recipeId: recipeId,
                name: name,
                amount: amount,
                unit: unit,
                order: order,
                isOptional: isOptional,
                createdAt: createdAt,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$RecipeIngredientsTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({recipeId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins:
                  <
                    T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic
                    >
                  >(state) {
                    if (recipeId) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.recipeId,
                                referencedTable:
                                    $$RecipeIngredientsTableReferences
                                        ._recipeIdTable(db),
                                referencedColumn:
                                    $$RecipeIngredientsTableReferences
                                        ._recipeIdTable(db)
                                        .id,
                              )
                              as T;
                    }

                    return state;
                  },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ),
      );
}

typedef $$RecipeIngredientsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $RecipeIngredientsTable,
      RecipeIngredientData,
      $$RecipeIngredientsTableFilterComposer,
      $$RecipeIngredientsTableOrderingComposer,
      $$RecipeIngredientsTableAnnotationComposer,
      $$RecipeIngredientsTableCreateCompanionBuilder,
      $$RecipeIngredientsTableUpdateCompanionBuilder,
      (RecipeIngredientData, $$RecipeIngredientsTableReferences),
      RecipeIngredientData,
      PrefetchHooks Function({bool recipeId})
    >;
typedef $$CookingHistoriesTableCreateCompanionBuilder =
    CookingHistoriesCompanion Function({
      Value<int> id,
      required int recipeId,
      Value<DateTime> startedAt,
      Value<DateTime?> completedAt,
      Value<String> status,
      Value<int> currentStep,
      Value<String?> notes,
    });
typedef $$CookingHistoriesTableUpdateCompanionBuilder =
    CookingHistoriesCompanion Function({
      Value<int> id,
      Value<int> recipeId,
      Value<DateTime> startedAt,
      Value<DateTime?> completedAt,
      Value<String> status,
      Value<int> currentStep,
      Value<String?> notes,
    });

final class $$CookingHistoriesTableReferences
    extends
        BaseReferences<
          _$AppDatabase,
          $CookingHistoriesTable,
          CookingHistoryData
        > {
  $$CookingHistoriesTableReferences(
    super.$_db,
    super.$_table,
    super.$_typedResult,
  );

  static $RecipesTable _recipeIdTable(_$AppDatabase db) =>
      db.recipes.createAlias(
        $_aliasNameGenerator(db.cookingHistories.recipeId, db.recipes.id),
      );

  $$RecipesTableProcessedTableManager get recipeId {
    final $_column = $_itemColumn<int>('recipe_id')!;

    final manager = $$RecipesTableTableManager(
      $_db,
      $_db.recipes,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_recipeIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static MultiTypedResultKey<$CookingStepLogsTable, List<CookingStepLogData>>
  _cookingStepLogsRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.cookingStepLogs,
    aliasName: $_aliasNameGenerator(
      db.cookingHistories.id,
      db.cookingStepLogs.cookingHistoryId,
    ),
  );

  $$CookingStepLogsTableProcessedTableManager get cookingStepLogsRefs {
    final manager = $$CookingStepLogsTableTableManager(
      $_db,
      $_db.cookingStepLogs,
    ).filter((f) => f.cookingHistoryId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(
      _cookingStepLogsRefsTable($_db),
    );
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$CookingHistoriesTableFilterComposer
    extends Composer<_$AppDatabase, $CookingHistoriesTable> {
  $$CookingHistoriesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get startedAt => $composableBuilder(
    column: $table.startedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get completedAt => $composableBuilder(
    column: $table.completedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get status => $composableBuilder(
    column: $table.status,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get currentStep => $composableBuilder(
    column: $table.currentStep,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get notes => $composableBuilder(
    column: $table.notes,
    builder: (column) => ColumnFilters(column),
  );

  $$RecipesTableFilterComposer get recipeId {
    final $$RecipesTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.recipeId,
      referencedTable: $db.recipes,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$RecipesTableFilterComposer(
            $db: $db,
            $table: $db.recipes,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  Expression<bool> cookingStepLogsRefs(
    Expression<bool> Function($$CookingStepLogsTableFilterComposer f) f,
  ) {
    final $$CookingStepLogsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.cookingStepLogs,
      getReferencedColumn: (t) => t.cookingHistoryId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$CookingStepLogsTableFilterComposer(
            $db: $db,
            $table: $db.cookingStepLogs,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$CookingHistoriesTableOrderingComposer
    extends Composer<_$AppDatabase, $CookingHistoriesTable> {
  $$CookingHistoriesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get startedAt => $composableBuilder(
    column: $table.startedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get completedAt => $composableBuilder(
    column: $table.completedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get status => $composableBuilder(
    column: $table.status,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get currentStep => $composableBuilder(
    column: $table.currentStep,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get notes => $composableBuilder(
    column: $table.notes,
    builder: (column) => ColumnOrderings(column),
  );

  $$RecipesTableOrderingComposer get recipeId {
    final $$RecipesTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.recipeId,
      referencedTable: $db.recipes,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$RecipesTableOrderingComposer(
            $db: $db,
            $table: $db.recipes,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$CookingHistoriesTableAnnotationComposer
    extends Composer<_$AppDatabase, $CookingHistoriesTable> {
  $$CookingHistoriesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<DateTime> get startedAt =>
      $composableBuilder(column: $table.startedAt, builder: (column) => column);

  GeneratedColumn<DateTime> get completedAt => $composableBuilder(
    column: $table.completedAt,
    builder: (column) => column,
  );

  GeneratedColumn<String> get status =>
      $composableBuilder(column: $table.status, builder: (column) => column);

  GeneratedColumn<int> get currentStep => $composableBuilder(
    column: $table.currentStep,
    builder: (column) => column,
  );

  GeneratedColumn<String> get notes =>
      $composableBuilder(column: $table.notes, builder: (column) => column);

  $$RecipesTableAnnotationComposer get recipeId {
    final $$RecipesTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.recipeId,
      referencedTable: $db.recipes,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$RecipesTableAnnotationComposer(
            $db: $db,
            $table: $db.recipes,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  Expression<T> cookingStepLogsRefs<T extends Object>(
    Expression<T> Function($$CookingStepLogsTableAnnotationComposer a) f,
  ) {
    final $$CookingStepLogsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.cookingStepLogs,
      getReferencedColumn: (t) => t.cookingHistoryId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$CookingStepLogsTableAnnotationComposer(
            $db: $db,
            $table: $db.cookingStepLogs,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$CookingHistoriesTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $CookingHistoriesTable,
          CookingHistoryData,
          $$CookingHistoriesTableFilterComposer,
          $$CookingHistoriesTableOrderingComposer,
          $$CookingHistoriesTableAnnotationComposer,
          $$CookingHistoriesTableCreateCompanionBuilder,
          $$CookingHistoriesTableUpdateCompanionBuilder,
          (CookingHistoryData, $$CookingHistoriesTableReferences),
          CookingHistoryData,
          PrefetchHooks Function({bool recipeId, bool cookingStepLogsRefs})
        > {
  $$CookingHistoriesTableTableManager(
    _$AppDatabase db,
    $CookingHistoriesTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$CookingHistoriesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$CookingHistoriesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$CookingHistoriesTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<int> recipeId = const Value.absent(),
                Value<DateTime> startedAt = const Value.absent(),
                Value<DateTime?> completedAt = const Value.absent(),
                Value<String> status = const Value.absent(),
                Value<int> currentStep = const Value.absent(),
                Value<String?> notes = const Value.absent(),
              }) => CookingHistoriesCompanion(
                id: id,
                recipeId: recipeId,
                startedAt: startedAt,
                completedAt: completedAt,
                status: status,
                currentStep: currentStep,
                notes: notes,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required int recipeId,
                Value<DateTime> startedAt = const Value.absent(),
                Value<DateTime?> completedAt = const Value.absent(),
                Value<String> status = const Value.absent(),
                Value<int> currentStep = const Value.absent(),
                Value<String?> notes = const Value.absent(),
              }) => CookingHistoriesCompanion.insert(
                id: id,
                recipeId: recipeId,
                startedAt: startedAt,
                completedAt: completedAt,
                status: status,
                currentStep: currentStep,
                notes: notes,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$CookingHistoriesTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback:
              ({recipeId = false, cookingStepLogsRefs = false}) {
                return PrefetchHooks(
                  db: db,
                  explicitlyWatchedTables: [
                    if (cookingStepLogsRefs) db.cookingStepLogs,
                  ],
                  addJoins:
                      <
                        T extends TableManagerState<
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic
                        >
                      >(state) {
                        if (recipeId) {
                          state =
                              state.withJoin(
                                    currentTable: table,
                                    currentColumn: table.recipeId,
                                    referencedTable:
                                        $$CookingHistoriesTableReferences
                                            ._recipeIdTable(db),
                                    referencedColumn:
                                        $$CookingHistoriesTableReferences
                                            ._recipeIdTable(db)
                                            .id,
                                  )
                                  as T;
                        }

                        return state;
                      },
                  getPrefetchedDataCallback: (items) async {
                    return [
                      if (cookingStepLogsRefs)
                        await $_getPrefetchedData<
                          CookingHistoryData,
                          $CookingHistoriesTable,
                          CookingStepLogData
                        >(
                          currentTable: table,
                          referencedTable: $$CookingHistoriesTableReferences
                              ._cookingStepLogsRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$CookingHistoriesTableReferences(
                                db,
                                table,
                                p0,
                              ).cookingStepLogsRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.cookingHistoryId == item.id,
                              ),
                          typedResults: items,
                        ),
                    ];
                  },
                );
              },
        ),
      );
}

typedef $$CookingHistoriesTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $CookingHistoriesTable,
      CookingHistoryData,
      $$CookingHistoriesTableFilterComposer,
      $$CookingHistoriesTableOrderingComposer,
      $$CookingHistoriesTableAnnotationComposer,
      $$CookingHistoriesTableCreateCompanionBuilder,
      $$CookingHistoriesTableUpdateCompanionBuilder,
      (CookingHistoryData, $$CookingHistoriesTableReferences),
      CookingHistoryData,
      PrefetchHooks Function({bool recipeId, bool cookingStepLogsRefs})
    >;
typedef $$CookingStepLogsTableCreateCompanionBuilder =
    CookingStepLogsCompanion Function({
      Value<int> id,
      required int cookingHistoryId,
      required int recipeStepId,
      Value<DateTime> startedAt,
      Value<DateTime?> completedAt,
      Value<bool> skipped,
    });
typedef $$CookingStepLogsTableUpdateCompanionBuilder =
    CookingStepLogsCompanion Function({
      Value<int> id,
      Value<int> cookingHistoryId,
      Value<int> recipeStepId,
      Value<DateTime> startedAt,
      Value<DateTime?> completedAt,
      Value<bool> skipped,
    });

final class $$CookingStepLogsTableReferences
    extends
        BaseReferences<
          _$AppDatabase,
          $CookingStepLogsTable,
          CookingStepLogData
        > {
  $$CookingStepLogsTableReferences(
    super.$_db,
    super.$_table,
    super.$_typedResult,
  );

  static $CookingHistoriesTable _cookingHistoryIdTable(_$AppDatabase db) =>
      db.cookingHistories.createAlias(
        $_aliasNameGenerator(
          db.cookingStepLogs.cookingHistoryId,
          db.cookingHistories.id,
        ),
      );

  $$CookingHistoriesTableProcessedTableManager get cookingHistoryId {
    final $_column = $_itemColumn<int>('cooking_history_id')!;

    final manager = $$CookingHistoriesTableTableManager(
      $_db,
      $_db.cookingHistories,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_cookingHistoryIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static $RecipeStepsTable _recipeStepIdTable(_$AppDatabase db) =>
      db.recipeSteps.createAlias(
        $_aliasNameGenerator(
          db.cookingStepLogs.recipeStepId,
          db.recipeSteps.id,
        ),
      );

  $$RecipeStepsTableProcessedTableManager get recipeStepId {
    final $_column = $_itemColumn<int>('recipe_step_id')!;

    final manager = $$RecipeStepsTableTableManager(
      $_db,
      $_db.recipeSteps,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_recipeStepIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$CookingStepLogsTableFilterComposer
    extends Composer<_$AppDatabase, $CookingStepLogsTable> {
  $$CookingStepLogsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get startedAt => $composableBuilder(
    column: $table.startedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get completedAt => $composableBuilder(
    column: $table.completedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get skipped => $composableBuilder(
    column: $table.skipped,
    builder: (column) => ColumnFilters(column),
  );

  $$CookingHistoriesTableFilterComposer get cookingHistoryId {
    final $$CookingHistoriesTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.cookingHistoryId,
      referencedTable: $db.cookingHistories,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$CookingHistoriesTableFilterComposer(
            $db: $db,
            $table: $db.cookingHistories,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$RecipeStepsTableFilterComposer get recipeStepId {
    final $$RecipeStepsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.recipeStepId,
      referencedTable: $db.recipeSteps,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$RecipeStepsTableFilterComposer(
            $db: $db,
            $table: $db.recipeSteps,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$CookingStepLogsTableOrderingComposer
    extends Composer<_$AppDatabase, $CookingStepLogsTable> {
  $$CookingStepLogsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get startedAt => $composableBuilder(
    column: $table.startedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get completedAt => $composableBuilder(
    column: $table.completedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get skipped => $composableBuilder(
    column: $table.skipped,
    builder: (column) => ColumnOrderings(column),
  );

  $$CookingHistoriesTableOrderingComposer get cookingHistoryId {
    final $$CookingHistoriesTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.cookingHistoryId,
      referencedTable: $db.cookingHistories,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$CookingHistoriesTableOrderingComposer(
            $db: $db,
            $table: $db.cookingHistories,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$RecipeStepsTableOrderingComposer get recipeStepId {
    final $$RecipeStepsTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.recipeStepId,
      referencedTable: $db.recipeSteps,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$RecipeStepsTableOrderingComposer(
            $db: $db,
            $table: $db.recipeSteps,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$CookingStepLogsTableAnnotationComposer
    extends Composer<_$AppDatabase, $CookingStepLogsTable> {
  $$CookingStepLogsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<DateTime> get startedAt =>
      $composableBuilder(column: $table.startedAt, builder: (column) => column);

  GeneratedColumn<DateTime> get completedAt => $composableBuilder(
    column: $table.completedAt,
    builder: (column) => column,
  );

  GeneratedColumn<bool> get skipped =>
      $composableBuilder(column: $table.skipped, builder: (column) => column);

  $$CookingHistoriesTableAnnotationComposer get cookingHistoryId {
    final $$CookingHistoriesTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.cookingHistoryId,
      referencedTable: $db.cookingHistories,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$CookingHistoriesTableAnnotationComposer(
            $db: $db,
            $table: $db.cookingHistories,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$RecipeStepsTableAnnotationComposer get recipeStepId {
    final $$RecipeStepsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.recipeStepId,
      referencedTable: $db.recipeSteps,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$RecipeStepsTableAnnotationComposer(
            $db: $db,
            $table: $db.recipeSteps,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$CookingStepLogsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $CookingStepLogsTable,
          CookingStepLogData,
          $$CookingStepLogsTableFilterComposer,
          $$CookingStepLogsTableOrderingComposer,
          $$CookingStepLogsTableAnnotationComposer,
          $$CookingStepLogsTableCreateCompanionBuilder,
          $$CookingStepLogsTableUpdateCompanionBuilder,
          (CookingStepLogData, $$CookingStepLogsTableReferences),
          CookingStepLogData,
          PrefetchHooks Function({bool cookingHistoryId, bool recipeStepId})
        > {
  $$CookingStepLogsTableTableManager(
    _$AppDatabase db,
    $CookingStepLogsTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$CookingStepLogsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$CookingStepLogsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$CookingStepLogsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<int> cookingHistoryId = const Value.absent(),
                Value<int> recipeStepId = const Value.absent(),
                Value<DateTime> startedAt = const Value.absent(),
                Value<DateTime?> completedAt = const Value.absent(),
                Value<bool> skipped = const Value.absent(),
              }) => CookingStepLogsCompanion(
                id: id,
                cookingHistoryId: cookingHistoryId,
                recipeStepId: recipeStepId,
                startedAt: startedAt,
                completedAt: completedAt,
                skipped: skipped,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required int cookingHistoryId,
                required int recipeStepId,
                Value<DateTime> startedAt = const Value.absent(),
                Value<DateTime?> completedAt = const Value.absent(),
                Value<bool> skipped = const Value.absent(),
              }) => CookingStepLogsCompanion.insert(
                id: id,
                cookingHistoryId: cookingHistoryId,
                recipeStepId: recipeStepId,
                startedAt: startedAt,
                completedAt: completedAt,
                skipped: skipped,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$CookingStepLogsTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback:
              ({cookingHistoryId = false, recipeStepId = false}) {
                return PrefetchHooks(
                  db: db,
                  explicitlyWatchedTables: [],
                  addJoins:
                      <
                        T extends TableManagerState<
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic
                        >
                      >(state) {
                        if (cookingHistoryId) {
                          state =
                              state.withJoin(
                                    currentTable: table,
                                    currentColumn: table.cookingHistoryId,
                                    referencedTable:
                                        $$CookingStepLogsTableReferences
                                            ._cookingHistoryIdTable(db),
                                    referencedColumn:
                                        $$CookingStepLogsTableReferences
                                            ._cookingHistoryIdTable(db)
                                            .id,
                                  )
                                  as T;
                        }
                        if (recipeStepId) {
                          state =
                              state.withJoin(
                                    currentTable: table,
                                    currentColumn: table.recipeStepId,
                                    referencedTable:
                                        $$CookingStepLogsTableReferences
                                            ._recipeStepIdTable(db),
                                    referencedColumn:
                                        $$CookingStepLogsTableReferences
                                            ._recipeStepIdTable(db)
                                            .id,
                                  )
                                  as T;
                        }

                        return state;
                      },
                  getPrefetchedDataCallback: (items) async {
                    return [];
                  },
                );
              },
        ),
      );
}

typedef $$CookingStepLogsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $CookingStepLogsTable,
      CookingStepLogData,
      $$CookingStepLogsTableFilterComposer,
      $$CookingStepLogsTableOrderingComposer,
      $$CookingStepLogsTableAnnotationComposer,
      $$CookingStepLogsTableCreateCompanionBuilder,
      $$CookingStepLogsTableUpdateCompanionBuilder,
      (CookingStepLogData, $$CookingStepLogsTableReferences),
      CookingStepLogData,
      PrefetchHooks Function({bool cookingHistoryId, bool recipeStepId})
    >;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$RecipesTableTableManager get recipes =>
      $$RecipesTableTableManager(_db, _db.recipes);
  $$RecipeStepsTableTableManager get recipeSteps =>
      $$RecipeStepsTableTableManager(_db, _db.recipeSteps);
  $$RecipeIngredientsTableTableManager get recipeIngredients =>
      $$RecipeIngredientsTableTableManager(_db, _db.recipeIngredients);
  $$CookingHistoriesTableTableManager get cookingHistories =>
      $$CookingHistoriesTableTableManager(_db, _db.cookingHistories);
  $$CookingStepLogsTableTableManager get cookingStepLogs =>
      $$CookingStepLogsTableTableManager(_db, _db.cookingStepLogs);
}
