import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../../core/utils/logger.dart';
import '../../data/datasource/firebase_cart_service.dart';
import '../../data/model/cart_purchase_model/cart_purchase_model.dart';

part 'purchase_history_cubit.freezed.dart';

@freezed
class PurchaseHistoryState with _$PurchaseHistoryState {
  const factory PurchaseHistoryState.initial() = _Initial;
  const factory PurchaseHistoryState.loading() = _Loading;
  const factory PurchaseHistoryState.success(List<PurchaseModel> purchases) = _Success;
  const factory PurchaseHistoryState.error(String message) = _Error;
}

class PurchaseHistoryCubit extends Cubit<PurchaseHistoryState> {
  final FirebaseCartService _firebaseService;
  final Box<PurchaseModel> _historyBox = Hive.box<PurchaseModel>('history_box');

  // Подписка на Auth, чтобы история сама знала, когда пора обновляться
  StreamSubscription<User?>? _authSubscription;

  PurchaseHistoryCubit(this._firebaseService) : super(const PurchaseHistoryState.initial()) {
    _initAuthListener();
  }

  void _initAuthListener() {
    _authSubscription = FirebaseAuth.instance.authStateChanges().listen((user) {
      if (user != null) {
        logger.i("HistoryCubit: Пользователь найден. Загрузка истории...");
        loadHistory();
      } else {
        logger.w("HistoryCubit: Пользователь вышел. Очистка истории...");
        _clearLocalHistory();
      }
    });
  }

  @override
  Future<void> close() {
    _authSubscription?.cancel();
    return super.close();
  }

  Future<void> loadHistory() async {
    // 1. Показываем локальный кэш, если он есть
    final localHistory = _historyBox.values.toList().reversed.toList();
    if (localHistory.isNotEmpty) {
      emit(PurchaseHistoryState.success(localHistory));
    } else {
      emit(const PurchaseHistoryState.loading());
    }

    try {
      // 2. Получаем данные из Firebase
      final remoteHistory = await _firebaseService.getPurchaseHistory();

      // 3. Синхронизируем локальный кэш
      if (remoteHistory.isNotEmpty) {
        await _historyBox.clear();
        await _historyBox.addAll(remoteHistory);
        // Сортируем (свежие сверху) для UI
        emit(PurchaseHistoryState.success(remoteHistory.reversed.toList()));
        logger.i("HistoryCubit: История успешно обновлена из облака");
      } else if (localHistory.isEmpty) {
        emit(const PurchaseHistoryState.success([]));
      }
    } catch (e, stack) {
      logger.e("HistoryCubit: Ошибка загрузки", error: e, stackTrace: stack);
      if (localHistory.isEmpty) {
        emit(const PurchaseHistoryState.error("Не удалось загрузить историю заказов"));
      }
    }
  }

  Future<void> _clearLocalHistory() async {
    await _historyBox.clear();
    emit(const PurchaseHistoryState.success([]));
  }
}