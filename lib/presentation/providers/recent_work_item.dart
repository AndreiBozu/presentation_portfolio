import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:presentation_portfolio/data/models/recent_work_item_model.dart';


class RecentWorkItem extends StateNotifier<Map<String, RecentWorkItemModel>> {
  RecentWorkItem() : super({});

  void save(RecentWorkItemModel item) {
    state = {...state, item.key: item};
  }

  RecentWorkItemModel? getById(String id) => state[id];
}

final recentWorkItemProvider = StateNotifierProvider<RecentWorkItem, Map<String, RecentWorkItemModel>>(
      (ref) => RecentWorkItem(),
);