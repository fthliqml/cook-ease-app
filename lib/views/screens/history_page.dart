import 'package:flutter/material.dart';
import 'package:cook_ease_app/views/widgets/app_layout.dart';
import 'package:cook_ease_app/viewmodels/history_view_model.dart';
import 'package:cook_ease_app/data/local/drift/db_provider.dart';
import 'package:cook_ease_app/repository/recipe_repository.dart';
import 'package:cook_ease_app/core/models/cooking_history.dart';
import 'package:cook_ease_app/config/themes/app_colors.dart';
import 'package:cook_ease_app/config/themes/app_text_styles.dart';
import 'package:go_router/go_router.dart';

class HistoryPage extends StatefulWidget {
  const HistoryPage({super.key});

  @override
  State<HistoryPage> createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage> {
  late final HistoryViewModel vm;

  @override
  void initState() {
    super.initState();
    final db = DBProvider().database;
    final repo = RecipeRepository(db);
    vm = HistoryViewModel(db, repo);
    vm.addListener(_onVmChanged);
    vm.init();
  }

  void _onVmChanged() => setState(() {});

  @override
  void dispose() {
    vm.removeListener(_onVmChanged);
    super.dispose();
  }

  String _formatDateTime(DateTime dateTime) {
    final months = [
      'Jan',
      'Feb',
      'Mar',
      'Apr',
      'May',
      'Jun',
      'Jul',
      'Aug',
      'Sep',
      'Oct',
      'Nov',
      'Dec',
    ];
    final month = months[dateTime.month - 1];
    final day = dateTime.day;
    final year = dateTime.year;
    final hour = dateTime.hour > 12
        ? dateTime.hour - 12
        : (dateTime.hour == 0 ? 12 : dateTime.hour);
    final minute = dateTime.minute.toString().padLeft(2, '0');
    final period = dateTime.hour >= 12 ? 'PM' : 'AM';

    return '$month $day, $year • $hour:$minute $period';
  }

  @override
  Widget build(BuildContext context) {
    return AppLayout(
      title: 'Cooking History',
      body: Container(
        color: AppColors.background,
        child: vm.isLoading
            ? _buildLoadingState()
            : vm.historyList.isEmpty
            ? _buildEmptyState()
            : _buildHistoryContent(),
      ),
    );
  }

  Widget _buildLoadingState() {
    return const Center(child: CircularProgressIndicator());
  }

  Widget _buildEmptyState() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 120,
            height: 120,
            decoration: BoxDecoration(
              color: AppColors.primary.withValues(alpha: 0.1),
              shape: BoxShape.circle,
            ),
            child: Icon(
              Icons.history_rounded,
              size: 60,
              color: AppColors.primary,
            ),
          ),
          const SizedBox(height: 24),
          Text(
            'No cooking history yet',
            style: AppTextStyles.h2.copyWith(color: AppColors.textPrimary),
          ),
          const SizedBox(height: 8),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40),
            child: Text(
              'Start cooking recipes and your history will appear here!',
              textAlign: TextAlign.center,
              style: AppTextStyles.bodyMedium.copyWith(
                color: AppColors.textSecondary,
                height: 1.5,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildHistoryContent() {
    return CustomScrollView(
      slivers: [
        // Statistics Cards
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Row(
              children: [
                Expanded(
                  child: _buildStatCard(
                    'Completed',
                    vm.completedCount,
                    Icons.check_circle_rounded,
                    AppColors.primary,
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: _buildStatCard(
                    'In Progress',
                    vm.inProgressCount,
                    Icons.pending_rounded,
                    AppColors.secondary,
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: _buildStatCard(
                    'Total',
                    vm.totalSessions,
                    Icons.restaurant_rounded,
                    AppColors.textSecondary,
                  ),
                ),
              ],
            ),
          ),
        ),

        // Filter Chips
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: _buildFilterChips(),
          ),
        ),

        const SliverToBoxAdapter(child: SizedBox(height: 16)),

        // History List
        SliverPadding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          sliver: SliverList(
            delegate: SliverChildBuilderDelegate((context, index) {
              final item = vm.filteredHistory[index];
              return _buildHistoryCard(item);
            }, childCount: vm.filteredHistory.length),
          ),
        ),

        const SliverToBoxAdapter(child: SizedBox(height: 20)),
      ],
    );
  }

  Widget _buildStatCard(String label, int value, IconData icon, Color color) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(16),
        boxShadow: AppColors.softShadow,
      ),
      child: Column(
        children: [
          Icon(icon, color: color, size: 28),
          const SizedBox(height: 8),
          Text('$value', style: AppTextStyles.h2.copyWith(color: color)),
          const SizedBox(height: 4),
          Text(
            label,
            style: AppTextStyles.labelSmall.copyWith(
              color: AppColors.textSecondary,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  Widget _buildFilterChips() {
    final filters = [
      (null, 'All', Icons.all_inclusive_rounded),
      (CookingStatus.completed, 'Completed', Icons.check_circle_rounded),
      (CookingStatus.inProgress, 'In Progress', Icons.pending_rounded),
      (CookingStatus.abandoned, 'Abandoned', Icons.cancel_rounded),
    ];

    return SizedBox(
      height: 40,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: filters.length,
        itemBuilder: (context, index) {
          final filter = filters[index];
          final isSelected = vm.filterStatus == filter.$1;
          return Padding(
            padding: EdgeInsets.only(
              right: index == filters.length - 1 ? 0 : 8,
            ),
            child: FilterChip(
              label: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(filter.$3, size: 16),
                  const SizedBox(width: 6),
                  Text(filter.$2),
                ],
              ),
              selected: isSelected,
              onSelected: (_) => vm.filterByStatus(filter.$1),
              labelStyle: AppTextStyles.labelMedium.copyWith(
                color: isSelected ? Colors.white : AppColors.primary,
              ),
              backgroundColor: AppColors.surface,
              selectedColor: AppColors.primary,
              shape: StadiumBorder(
                side: BorderSide(
                  color: isSelected
                      ? AppColors.primary
                      : AppColors.primary.withValues(alpha: 0.3),
                  width: 1.5,
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildHistoryCard(CookingHistoryWithRecipe item) {
    final history = item.history;
    final recipe = item.recipe;

    Color statusColor;
    IconData statusIcon;
    String statusText;

    switch (history.status) {
      case CookingStatus.completed:
        statusColor = AppColors.primary;
        statusIcon = Icons.check_circle_rounded;
        statusText = 'Completed';
        break;
      case CookingStatus.inProgress:
        statusColor = AppColors.secondary;
        statusIcon = Icons.pending_rounded;
        statusText = 'In Progress';
        break;
      case CookingStatus.abandoned:
        statusColor = AppColors.textTertiary;
        statusIcon = Icons.cancel_rounded;
        statusText = 'Abandoned';
        break;
    }

    final startedText = _formatDateTime(history.startedAt);
    final completedText = history.completedAt != null
        ? _formatDateTime(history.completedAt!)
        : null;

    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(20),
        boxShadow: AppColors.cardShadowStyle,
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: () => context.push('/recipes/${recipe.id}'),
          borderRadius: BorderRadius.circular(20),
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              children: [
                // Recipe Image
                ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Container(
                    width: 80,
                    height: 80,
                    color: AppColors.surfaceVariant,
                    child: recipe.imgUrl.isNotEmpty
                        ? Image.asset(
                            recipe.imgUrl,
                            fit: BoxFit.cover,
                            errorBuilder: (context, error, stackTrace) {
                              return Icon(
                                Icons.restaurant_menu,
                                color: AppColors.textTertiary,
                                size: 32,
                              );
                            },
                          )
                        : Icon(
                            Icons.restaurant_menu,
                            color: AppColors.textTertiary,
                            size: 32,
                          ),
                  ),
                ),
                const SizedBox(width: 16),

                // Content
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Recipe Title
                      Text(
                        recipe.title,
                        style: AppTextStyles.h4,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      const SizedBox(height: 6),

                      // Status Badge
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 10,
                          vertical: 4,
                        ),
                        decoration: BoxDecoration(
                          color: statusColor.withValues(alpha: 0.15),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(statusIcon, size: 14, color: statusColor),
                            const SizedBox(width: 4),
                            Text(
                              statusText,
                              style: AppTextStyles.labelSmall.copyWith(
                                color: statusColor,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 8),

                      // Date Info
                      Text(
                        'Started: $startedText',
                        style: AppTextStyles.labelSmall.copyWith(
                          color: AppColors.textSecondary,
                        ),
                      ),
                      if (completedText != null) ...[
                        const SizedBox(height: 2),
                        Text(
                          'Finished: $completedText',
                          style: AppTextStyles.labelSmall.copyWith(
                            color: AppColors.textSecondary,
                          ),
                        ),
                      ],

                      // Current Step (if in progress)
                      if (history.status == CookingStatus.inProgress) ...[
                        const SizedBox(height: 6),
                        Text(
                          'Step ${history.currentStep}',
                          style: AppTextStyles.labelMedium.copyWith(
                            color: AppColors.secondary,
                          ),
                        ),
                      ],
                    ],
                  ),
                ),

                // Delete Button
                IconButton(
                  icon: Icon(
                    Icons.delete_outline_rounded,
                    color: AppColors.textTertiary,
                  ),
                  onPressed: () => _showDeleteConfirmation(history.id),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _showDeleteConfirmation(int historyId) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Delete History'),
        content: const Text(
          'Are you sure you want to delete this cooking session?',
        ),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () {
              vm.deleteHistory(historyId);
              Navigator.pop(context);
            },
            style: TextButton.styleFrom(foregroundColor: Colors.red),
            child: const Text('Delete'),
          ),
        ],
      ),
    );
  }
}
