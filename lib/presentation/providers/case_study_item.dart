import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:presentation_portfolio/data/models/case_study_item_model.dart';


class CaseStudyItem extends StateNotifier<Map<String, CaseStudyModelItem>> {
  CaseStudyItem() : super({});

  void save(CaseStudyModelItem item) {
    state = {...state, item.id: item};
  }

  CaseStudyModelItem? getById(String id) => state[id];
}

final caseStudyItemProvider = StateNotifierProvider<CaseStudyItem, Map<String, CaseStudyModelItem>>(
    (ref) => CaseStudyItem(),
);