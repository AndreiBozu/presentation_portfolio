import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:presentation_portfolio/data/models/case_study_item_model.dart';


class CaseStudyItem extends StateNotifier<Map<String, CaseStudyItemModel>> {
  CaseStudyItem() : super({});

  void save(CaseStudyItemModel item) {
    state = {...state, item.key: item};
  }

  CaseStudyItemModel? getById(String id) => state[id];
}

final caseStudyItemProvider = StateNotifierProvider<CaseStudyItem, Map<String, CaseStudyItemModel>>(
      (ref) => CaseStudyItem(),
);