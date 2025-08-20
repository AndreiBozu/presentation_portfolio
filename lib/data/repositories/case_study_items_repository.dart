import 'package:presentation_portfolio/data/models/case_study_item_model.dart';

class RecentWorkItemsRepository {
  static List<CaseStudyItemModel> data = const [
    CaseStudyItemModel(
      key: "liveness",
      title: "Liveness detection",
      shortDescription: "Labore et dolore magna aliqua. sed do eiusmod tempor incididunt ut labore et dolore magna.",
      imgLabelPath: "test_image.jpg",
      imgDescriptionPath: "test_image.jpg",
      longDescription: "This is long description Labore et dolore magna aliqua. sed do eiusmod tempor incididunt ut labore et dolore magna."
    ),
    CaseStudyItemModel(
      key: "nfc_document_reader",
      title: "NFC passport reader",
      shortDescription: "Labore et dolore magna aliqua. sed do eiusmod tempor incididunt ut labore et dolore magna.",
      imgLabelPath: "test_image.jpg",
      imgDescriptionPath: "test_image.jpg",
      longDescription: "This is long description Labore et dolore magna aliqua. sed do eiusmod tempor incididunt ut labore et dolore magna."
    ),
    CaseStudyItemModel(
      key: "text_recognition",
      title: "Real time text recognition",
      shortDescription: "Labore et dolore magna aliqua. sed do eiusmod tempor incididunt ut labore et dolore magna.",
      imgLabelPath: "test_image.jpg",
      imgDescriptionPath: "test_image.jpg",
      longDescription: "This is long description Labore et dolore magna aliqua. sed do eiusmod tempor incididunt ut labore et dolore magna."
    ),
    CaseStudyItemModel(
      key: "work 1",
      title: "Work 1",
      shortDescription: "Labore et dolore magna aliqua. sed do eiusmod tempor incididunt ut labore et dolore magna.",
      imgLabelPath: "test_image.jpg",
      imgDescriptionPath: "test_image.jpg",
      longDescription: "This is long description Labore et dolore magna aliqua. sed do eiusmod tempor incididunt ut labore et dolore magna."
    ),
    CaseStudyItemModel(
      key: "math_mini_game",
      title: "Kotlin math mini game",
      shortDescription: "A mini-project built in Kotlin to practice OOP principles and explore Android-specific tools such as fragments, view binding, and Jetpack Navigation.The app is a simple math puzzle game with multiple...",
      imgLabelPath: "kotlin_mini_math_game_label.png",
      imgDescriptionPath: "kotlin_math_mini_game_description.png",
      longDescription: "A mini-project built in Kotlin to practice OOP principles and explore Android-specific tools such as fragments, view binding, and Jetpack Navigation.\n\nThe app is a simple math puzzle game with multiple difficulty levels. Players must pick one of six randomly generated digits to complete the target sum. Difficulty settings control the time limit, required correct answers, and sum complexity.\n\nTo ensure fair play, the game also tracks the accuracy ratio (correct vs. incorrect answers), preventing users from progressing by repeatedly selecting the same option."
    ),
  ];
}