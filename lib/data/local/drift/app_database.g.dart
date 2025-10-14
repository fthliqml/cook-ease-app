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

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $RecipesTable recipes = $RecipesTable(this);
  late final RecipeDao recipeDao = RecipeDao(this as AppDatabase);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [recipes];
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
          (Recipe, BaseReferences<_$AppDatabase, $RecipesTable, Recipe>),
          Recipe,
          PrefetchHooks Function()
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
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
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
      (Recipe, BaseReferences<_$AppDatabase, $RecipesTable, Recipe>),
      Recipe,
      PrefetchHooks Function()
    >;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$RecipesTableTableManager get recipes =>
      $$RecipesTableTableManager(_db, _db.recipes);
}
