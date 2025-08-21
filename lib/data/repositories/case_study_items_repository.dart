import 'package:presentation_portfolio/data/models/case_study_item_model.dart';

class RecentWorkItemsRepository {
  static List<CaseStudyItemModel> data = const [
    CaseStudyItemModel(
      key: "liveness",
      title: "Liveness detection",
      shortDescription: "The liveness detection system is engineered to prevent identity spoofing attempts using static images, pre-recorded videos, deepfakes, or physical masks. The implementation combines multiple techniques...",
      imgLabelPath: "liveness_label.png",
      imgDescriptionPath: "test_image.jpg",
      videoPath: "4HXgJsRpvWY",
      longDescription: "The liveness detection system is engineered to prevent identity spoofing attempts using static images, pre-recorded videos, deepfakes, or physical masks. The implementation combines multiple techniques: convolutional neural networks (CNNs) for facial and object detection, classical image processing algorithms (e.g., edge detection, histogram analysis) to assess depth and contours, and color reflection analysis to identify unnatural surface textures indicative of non-human materials. Temporal patterns and micro-expressions are also evaluated to distinguish live subjects from forgeries. All captured biometric data is encrypted both in transit and at rest, ensuring compliance with security and privacy standards. This component involved complex algorithm design and tuning, making it one of the most technically demanding yet rewarding parts of the project."
    ),
    CaseStudyItemModel(
      key: "nfc_document_reader",
      title: "NFC passport reader",
      shortDescription: "This feature allows users to scan their biometric passport using their smartphone’s NFC capability. By simply holding the passport near the phone, the app securely reads key identity information such as...",
      imgLabelPath: "nfc_scan_label.png",
      imgDescriptionPath: "test_image.jpg",
      videoPath: "TDgwYVOKXgs",
      longDescription: "This feature allows users to scan their biometric passport using their smartphone’s NFC capability. By simply holding the passport near the phone, the app securely reads key identity information such as full name, date of birth, passport number, and the photo directly from the chip embedded in the document."
          "\nThe process is fast, secure, and eliminates the need for manual data entry or photo uploads. It enhances the user experience during identity verification by ensuring accuracy, reducing errors, and providing a trusted way to confirm a person's identity using official government-issued documents."
    ),
    CaseStudyItemModel(
      key: "text_recognition",
      title: "Real time text recognition",
      shortDescription: "This project was an attempt to build a library using ML Kit to scan Australian identity documents directly on the local device, without relying on external services.The main challenge was...",
      imgLabelPath: "text_recognition_label.png",
      imgDescriptionPath: "text_recognition_label.png",
      longDescription: "This project was an attempt to build a library using ML Kit to scan Australian identity documents directly on the local device, without relying on external services.\n\nThe main challenge was data filtering: each scan can generate hundreds or even thousands of character groups. While document formats are standardized, the actual data varies significantly—for example, one person may have a single name, while another may have three or four. To address this, we implemented a probability-based validation function that analyzes multiple scan attempts and selects the most frequently occurring variant as the most likely correct result."
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