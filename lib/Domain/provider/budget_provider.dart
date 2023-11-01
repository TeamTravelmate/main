import 'dart:async';
import 'package:main/Domain/models/budget.dart';
import 'package:main/Domain/models/expense_model.dart';
import 'package:main/Domain/provider/user_auth_provider.dart';
import 'package:main/Domain/services/budget_service.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'budget_provider.g.dart';

@Riverpod(keepAlive: true)
class BudgetNotifier extends _$BudgetNotifier{
  @override
  Future<Budget> build(tripId) {
    final token = ref.watch(userAuthNotifierProvider);
    final service = BudgetService();
    return token.when(data: (token) {
      return service.getBudget(tripId, token);
    }, error: (error, stackTrac) {
      return Future.error(
        Exception('Please login to view your budget'),
      );
    }, loading: () {
      Completer<Budget> completer = Completer<Budget>();
      return completer.future;
    });
  }

  Future<void> updateBudget(Budget updatedBudget)async {
    final token = ref.watch(userAuthNotifierProvider);
    final service = BudgetService();
    token.when(
      data: (token) async {
        state = const AsyncValue.loading();
        //response is a message saying successful
        await service.updateBudget(updatedBudget.toJson(), token);
        ref.invalidateSelf();
        await future;
      },
      loading: () {
        state = const AsyncValue.loading();
      },
      error: (error, stackTrace) {
        throw Exception('Please login to update your budget');
      },
    );
  }

  Future<void> createBudget(Expense expense, tripId) async {
    final token = ref.watch(userAuthNotifierProvider);
    final service = BudgetService();
    token.when(
      data: (token) async {
        state = const AsyncValue.loading();
        state = await AsyncValue.guard(() async {
          return service.createBudget({
            "tripId": tripId,
            "expenses": [expense]
          }, token);
        });
      },
      loading: () {
        state = const AsyncValue.loading();
      },
      error: (error, stackTrace) {
        throw Exception('Please login to create a budget');
      },
    );
  }
}