# Cook Ease App - Database Schema Documentation

## Overview

Aplikasi Cook Ease menggunakan **Drift** (SQLite) untuk database lokal dengan 4 tabel utama yang saling berelasi.

## Database Schema (ERD)

```
┌──────────────────┐
│     RECIPES      │
├──────────────────┤
│ • id (PK)        │◄─────┐
│ • title          │      │
│ • description    │      │
│ • image_url      │      │
│ • category       │      │
│ • cook_time      │      │
│ • servings       │      │
│ • difficulty     │      │
│ • is_favorited   │      │
│ • favorited_at   │      │
│ • created_at     │      │
│ • updated_at     │      │
└──────────────────┘      │
         │                │
         │ 1:N            │
         ▼                │
┌──────────────────┐      │
│  RECIPE_STEPS    │      │
├──────────────────┤      │
│ • id (PK)        │      │
│ • recipe_id (FK) │──────┘
│ • step_order     │
│ • step_title     │
│ • step_desc      │◄─────┐
│ • duration_min   │      │
│ • timer_label    │      │
│ • created_at     │      │
└──────────────────┘      │
                          │
┌──────────────────┐      │
│ COOKING_HISTORY  │      │
├──────────────────┤      │
│ • id (PK)        │      │
│ • recipe_id (FK) │      │
│ • started_at     │      │
│ • completed_at   │      │
│ • status         │      │
│ • current_step   │      │
│ • notes          │      │
└──────────────────┘      │
         │                │
         │ 1:N            │
         ▼                │
┌──────────────────┐      │
│COOKING_STEP_LOGS │      │
├──────────────────┤      │
│ • id (PK)        │      │
│ • history_id(FK) │      │
│ • step_id (FK)   │──────┘
│ • started_at     │
│ • completed_at   │
│ • skipped        │
└──────────────────┘
```

## Tabel Details

### 1. RECIPES

**Purpose**: Menyimpan data resep makanan

**Columns**:

- `id` (INTEGER, PK): ID unik resep
- `title` (TEXT): Nama resep
- `description` (TEXT): Deskripsi resep
- `img_url` (TEXT): Path gambar resep
- `category` (TEXT): Kategori (Breakfast, Lunch, Dinner, Snack)
- `cook_time` (TEXT): Waktu memasak (e.g., "30 menit")
- `servings` (TEXT): Jumlah porsi
- `difficulty` (TEXT): Easy, Medium, Hard
- `is_favorited` (BOOLEAN): Status favorit
- `favorited_at` (DATETIME): Waktu di-favorit
- `created_at` (DATETIME): Waktu dibuat
- `updated_at` (DATETIME): Waktu terakhir diupdate

**Indexes**: -

---

### 2. RECIPE_STEPS

**Purpose**: Menyimpan langkah-langkah memasak untuk setiap resep

**Columns**:

- `id` (INTEGER, PK): ID unik step
- `recipe_id` (INTEGER, FK): Reference ke `recipes.id`
- `step_order` (INTEGER): Urutan step (1, 2, 3, ...)
- `step_title` (TEXT): Judul step
- `step_description` (TEXT): Deskripsi detail step
- `duration_minutes` (INTEGER, nullable): Durasi step dalam menit
- `timer_label` (TEXT, nullable): Label untuk timer (e.g., "Tumis bawang")
- `created_at` (DATETIME): Waktu dibuat

**Indexes & Constraints**:

- Foreign Key: `recipe_id` → `recipes.id` (CASCADE DELETE)
- Unique: `(recipe_id, step_order)` - Setiap resep punya step_order yang unik

**Cascade Behavior**:

- Jika resep dihapus, semua steps-nya ikut terhapus

---

### 3. COOKING_HISTORIES

**Purpose**: Menyimpan riwayat sesi memasak (history tracking)

**Columns**:

- `id` (INTEGER, PK): ID unik history
- `recipe_id` (INTEGER, FK): Reference ke `recipes.id`
- `started_at` (DATETIME): Waktu mulai masak
- `completed_at` (DATETIME, nullable): Waktu selesai masak
- `status` (TEXT): Status sesi
  - `'in_progress'` - Sedang memasak
  - `'completed'` - Selesai
  - `'abandoned'` - Dibatalkan
- `current_step` (INTEGER): Step ke berapa sekarang (default 0)
- `notes` (TEXT, nullable): Catatan user

**Indexes & Constraints**:

- Foreign Key: `recipe_id` → `recipes.id` (CASCADE DELETE)

**Cascade Behavior**:

- Jika resep dihapus, semua history-nya ikut terhapus

---

### 4. COOKING_STEP_LOGS

**Purpose**: Melacak step mana yang sudah dikerjakan dalam satu sesi memasak

**Columns**:

- `id` (INTEGER, PK): ID unik log
- `cooking_history_id` (INTEGER, FK): Reference ke `cooking_histories.id`
- `recipe_step_id` (INTEGER, FK): Reference ke `recipe_steps.id`
- `started_at` (DATETIME): Waktu mulai step ini
- `completed_at` (DATETIME, nullable): Waktu selesai step ini
- `skipped` (BOOLEAN): Apakah step ini di-skip (default false)

**Indexes & Constraints**:

- Foreign Key: `cooking_history_id` → `cooking_histories.id` (CASCADE DELETE)
- Foreign Key: `recipe_step_id` → `recipe_steps.id` (CASCADE DELETE)
- Unique: `(cooking_history_id, recipe_step_id)` - Setiap step hanya dicatat 1x per sesi

**Cascade Behavior**:

- Jika cooking history dihapus, semua logs-nya ikut terhapus
- Jika recipe step dihapus, logs terkait ikut terhapus

---

## Usage Examples

### Insert Recipe with Steps

```dart
// 1. Insert Recipe
final recipeId = await recipeDao.insert(recipe);

// 2. Insert Steps
final steps = [
  RecipeStepModel(id: 0, recipeId: recipeId, stepOrder: 1, ...),
  RecipeStepModel(id: 0, recipeId: recipeId, stepOrder: 2, ...),
];
await recipeStepDao.insertSteps(steps);
```

### Start Cooking Session

```dart
// 1. Start new cooking session
final historyId = await cookingHistoryDao.insertHistory(
  CookingHistoryModel(
    recipeId: recipeId,
    status: CookingStatus.inProgress,
  )
);

// 2. Log first step
await cookingStepLogDao.insertLog(
  CookingStepLogModel(
    cookingHistoryId: historyId,
    recipeStepId: firstStepId,
  )
);

// 3. Mark step as completed
await cookingStepLogDao.markStepAsCompleted(logId);

// 4. Complete cooking
await cookingHistoryDao.completeHistory(historyId);
```

### Get Cooking History

```dart
// Get all history
final allHistory = await cookingHistoryDao.getAllHistory();

// Get in-progress cooking
final inProgress = await cookingHistoryDao.getInProgressCooking();

// Watch history real-time
cookingHistoryDao.watchAllHistory().listen((histories) {
  // Update UI
});
```

---

## Migration Strategy

**Current Version**: 2

**Version 1 → 2**:

- Added `recipe_steps` table
- Added `cooking_histories` table
- Added `cooking_step_logs` table

Migration otomatis dihandle oleh Drift dengan `MigrationStrategy` di `app_database.dart`.

---

## File Structure

```
lib/
├── core/
│   └── models/
│       ├── recipes.dart                  ✅ (sudah ada)
│       ├── recipe_step.dart              ✅ (baru)
│       ├── cooking_history.dart          ✅ (baru)
│       └── cooking_step_log.dart         ✅ (baru)
│
├── data/
│   └── local/
│       ├── drift/
│       │   ├── app_database.dart         ✅ (updated)
│       │   ├── db_provider.dart          ✅ (sudah ada)
│       │   └── tables/
│       │       ├── recipes.dart          ✅ (sudah ada)
│       │       ├── recipe_steps.dart     ✅ (baru)
│       │       ├── cooking_histories.dart ✅ (baru)
│       │       └── cooking_step_logs.dart ✅ (baru)
│       │
│       └── dao/
│           ├── recipe_dao.dart           ✅ (sudah ada)
│           ├── recipe_step_dao.dart      ✅ (baru)
│           ├── cooking_history_dao.dart  ✅ (baru)
│           └── cooking_step_log_dao.dart ✅ (baru)
```

---

## Notes

1. **Cascade Delete**: Semua foreign key menggunakan `CASCADE DELETE` untuk menjaga integritas data
2. **Unique Constraints**: Mencegah duplikasi data (e.g., step_order yang sama per resep)
3. **Real-time Updates**: Semua DAO support `watch()` streams untuk reactive UI
4. **Nullable Fields**: Field optional seperti `timer_label`, `notes`, `completed_at` marked as nullable
5. **Status Enum**: `CookingStatus` enum untuk type-safe status values

---

## Testing

Untuk test database:

```bash
# Generate code
dart run build_runner build --delete-conflicting-outputs

# Run tests
flutter test
```

---

**Generated**: 2025-01-13  
**Database Version**: 2  
**Drift Version**: ^2.28.2
