import 'package:presentation_portfolio/data/models/case_study_item_model.dart';

class CaseStudyItemsRepository {
  static List<CaseStudyItemModel> data = const [
    CaseStudyItemModel(
      key: "liveness",
      title: "Liveness detection",
      shortDescription: "The liveness detection system is engineered to prevent identity spoofing attempts using static images, pre-recorded videos, deepfakes, or physical masks. The implementation combines multiple techniques...",
      imgLabelPath: "liveness_label.jpg",
      imgDescriptionPath: "test_image.jpg",
      videoPath: "4HXgJsRpvWY",
      longDescription: "The liveness detection system is engineered to prevent identity spoofing attempts using static images, pre-recorded videos, deepfakes, or physical masks. The implementation combines multiple techniques: convolutional neural networks (CNNs) for facial and object detection, classical image processing algorithms (e.g., edge detection, histogram analysis) to assess depth and contours, and color reflection analysis to identify unnatural surface textures indicative of non-human materials. Temporal patterns and micro-expressions are also evaluated to distinguish live subjects from forgeries. All captured biometric data is encrypted both in transit and at rest, ensuring compliance with security and privacy standards. This component involved complex algorithm design and tuning, making it one of the most technically demanding yet rewarding parts of the project."
    ),
    CaseStudyItemModel(
      key: "nfc_document_reader",
      title: "NFC passport reader",
      shortDescription: "This feature allows users to scan their biometric passport using their smartphone’s NFC capability. By simply holding the passport near the phone, the app securely reads key identity information such as...",
      imgLabelPath: "nfc_scan_label.jpg",
      imgDescriptionPath: "test_image.jpg",
      videoPath: "TDgwYVOKXgs",
      longDescription: "This feature allows users to scan their biometric passport using their smartphone’s NFC capability. By simply holding the passport near the phone, the app securely reads key identity information such as full name, date of birth, passport number, and the photo directly from the chip embedded in the document."
          "\nThe process is fast, secure, and eliminates the need for manual data entry or photo uploads. It enhances the user experience during identity verification by ensuring accuracy, reducing errors, and providing a trusted way to confirm a person's identity using official government-issued documents."
    ),
    CaseStudyItemModel(
      key: "disciplify",
      title: "Disciplify",
      shortDescription: "Platform: Android (Kotlin, Jetpack Compose)"
          "\nDisciplify is a personal project developed independently to deepen my expertise in Kotlin and explore modern technologies for backend development. The project served as both a practical learning experience...",
      imgLabelPath: "disciplify.png",
      imgDescriptionPath: "disciplify.png",
      longDescription: "Platform: Android (Kotlin, Jetpack Compose)"
          "\nApk build: https://drive.google.com/file/d/1OzYFsVxE8ZJ7fpcMSgs7Is1UpHDg-PSj/view?usp=sharing"
          "\nDisciplify is a personal project developed independently to deepen my expertise in Kotlin and explore modern technologies for backend development. The project served as both a practical learning experience and an opportunity to design and implement a complete mobile application and supporting server infrastructure from the ground up."
          "\n\nThe application is a flexible time-tracking tool that helps users understand how they spend their time and identify opportunities to improve their daily productivity. Rather than requiring users to log every hour of the day, Disciplify focuses on tracking meaningful activities that contribute to personal habits and long-term self-improvement."
          "\n\nUsers can create custom activity categories, each belonging to one of three predefined classifications: productive, neutral, or unproductive. This simple categorization enables the application to provide clear insights into how time is distributed across different types of activities, helping users recognize patterns and make more informed decisions about their daily routines."
          "\n\nBy combining a clean, intuitive user experience with a flexible tracking model, Disciplify offers an effective way to monitor personal habits while demonstrating modern mobile development practices and backend architecture implemented entirely as a solo project."
    ),
    CaseStudyItemModel(
      key: "text_recognition",
      title: "Real time text recognition",
      shortDescription: "This project was an attempt to build a library using ML Kit to scan Australian identity documents directly on the local device, without relying on external services.The main challenge was...",
      imgLabelPath: "text_recognition_label.jpg",
      imgDescriptionPath: "text_recognition_label.jpg",
      longDescription: "This project was an attempt to build a library using ML Kit to scan Australian identity documents directly on the local device, without relying on external services.\n\nThe main challenge was data filtering: each scan can generate hundreds or even thousands of character groups. While document formats are standardized, the actual data varies significantly—for example, one person may have a single name, while another may have three or four. To address this, we implemented a probability-based validation function that analyzes multiple scan attempts and selects the most frequently occurring variant as the most likely correct result."
    ),
    CaseStudyItemModel(
      key: "led_matrix_backpack",
      title: "Custom wifi led matrix backpack",
      shortDescription: "This is a mini project where I built a 16×16 LED matrix with individually controlled LEDs. The primary goal was to mount the matrix on a backpack and control it through a mobile app capable...",
      imgLabelPath: "led_matrix_schema.jpg",
      imgDescriptionPath: "test_image.jpg",
      longDescription: "This is a mini project where I built a 16×16 LED matrix with individually controlled LEDs. The primary goal was to mount the matrix on a backpack and control it through a mobile app capable of displaying various images and animations in 16-bit format.\n\nFor the controller, I used a Wemos Mini D1, chosen for its compact size, sufficient memory, and built-in Wi-Fi module, which enables control via a local Wi-Fi network. To stabilize the signal, I included a 220-ohm resistor and a 470µF capacitor, while brightness detection was handled with a photoresistor. Power can be supplied by any 5V source with an output of 3–5A; in my case, I used a standard power bank. Initially, I experimented with adding a speaker, but it was later removed during development.\n\nThe LED matrix supports several features, including freehand drawing, image uploading, text display, animated effects using GIFs, and even small games such as Snake, Tetris, and Runner.",
      videoPath: "Ww2GTVFeY4k"
    ),
    CaseStudyItemModel(
      key: "math_mini_game",
      title: "Kotlin math mini game",
      shortDescription: "Platform Android (Kotlin)"
          "\nA mini-project built in Kotlin to practice OOP principles and explore Android-specific tools such as fragments, view binding, and Jetpack Navigation.The app is a simple math puzzle game with multiple...",
      imgLabelPath: "kotlin_mini_math_game_label.png",
      imgDescriptionPath: "kotlin_math_mini_game_description.png",
      longDescription: "A mini-project built in Kotlin to practice OOP principles and explore Android-specific tools such as fragments, view binding, and Jetpack Navigation.\n\nThe app is a simple math puzzle game with multiple difficulty levels. Players must pick one of six randomly generated digits to complete the target sum. Difficulty settings control the time limit, required correct answers, and sum complexity.\n\nTo ensure fair play, the game also tracks the accuracy ratio (correct vs. incorrect answers), preventing users from progressing by repeatedly selecting the same option."
    ),
  ];
}