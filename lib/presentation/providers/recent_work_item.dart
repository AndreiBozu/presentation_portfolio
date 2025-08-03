import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:presentation_portfolio/data/models/recent_work_item_model.dart';


class RecentWorkItem extends StateNotifier<Map<String, RecentWorkModelItem>> {
  RecentWorkItem() : super({});

  void save(RecentWorkModelItem item) {
    state = {...state, item.id: item};
  }

  RecentWorkModelItem? getById(String id) => state[id];
}

final recentWorkItemProvider = StateNotifierProvider<RecentWorkItem, Map<String, RecentWorkModelItem>>(
    (ref) => RecentWorkItem(),
);