import '../models/recent_work_item_model.dart';


class RecentWorksRepository {
  static List<RecentWorkModelItem> data = [
    RecentWorkModelItem(
      id: "ratify_id",
      title: "RatifyID",
      imagePath: "content/ratifyid_bg.jpeg",
      shortDescription: "Role: Lead Mobile App Developer"
          "\nPlatform: iOS & Android"
          "\nFocus: Develop an app in full compliance with all governmental regulations and requirements."
          "\n\nAn identity verification app accredited by Australian government authorities. As the lead mobile developer, I worked on this project for over two years, contributing to both the mobile front end and its integration into a broader multi-platform infrastructure. Key features include NFC-based passport chip reading, encrypted document storage, OCR, advanced image processing, and liveness detection.",
      description: "Role: Lead Mobile App Developer"
          "\nPlatform: iOS & Android"
          "\nFocus: Develop an app in full compliance with all governmental regulations and requirements."
          "\n\nRatifyId is a mobile application officially accredited by Australian government authorities for the verification and secure storage of user identities. I served as the lead developer for the mobile platform, which has been my primary focus over the past two years."
          "\n\nThis project extends beyond a standalone application; it is part of a broader infrastructure comprising multiple integrated platforms. However, the mobile application serves as the system’s front end, representing the primary point of interaction for end users."
          "\n\nThroughout the development process, we implemented a wide range of advanced technologies essential for identity verification. These include data extraction from passport chips via NFC, the creation of encrypted databases for secure document storage, optical character recognition (OCR), complex image processing, and—perhaps most notably—liveness detection to ensure user authenticity.",
      companyName: "Makesure",
      lightColorHex: "b7e2f5",
      darkColorHex: "0097DB",
      googlePlayLink: "https://play.google.com/store/apps/details?id=com.makesure.ratifyid",
      appStoreLink: "https://apps.apple.com/au/app/trusted-digital-id-ratifyid/id1666944696",
      webLink: "https://www.ratifyid.com/",
      extraItemsList: [
        ExtraItem(
          title: "NFC Passport reader",
          description: "This feature allows users to scan their biometric passport using their smartphone’s NFC capability. By simply holding the passport near the phone, the app securely reads key identity information such as full name, date of birth, passport number, and the photo directly from the chip embedded in the document."
              "\nThe process is fast, secure, and eliminates the need for manual data entry or photo uploads. It enhances the user experience during identity verification by ensuring accuracy, reducing errors, and providing a trusted way to confirm a person's identity using official government-issued documents.",
          videoId: "qzBLKJ7ve_o",
        ),
        ExtraItem(
          title: "Liveness Detection",
          description: "The liveness detection system is engineered to prevent identity spoofing attempts using static images, pre-recorded videos, deepfakes, or physical masks. The implementation combines multiple techniques: convolutional neural networks (CNNs) for facial and object detection, classical image processing algorithms (e.g., edge detection, histogram analysis) to assess depth and contours, and color reflection analysis to identify unnatural surface textures indicative of non-human materials. Temporal patterns and micro-expressions are also evaluated to distinguish live subjects from forgeries. All captured biometric data is encrypted both in transit and at rest, ensuring compliance with security and privacy standards. This component involved complex algorithm design and tuning, making it one of the most technically demanding yet rewarding parts of the project.",
          videoId: "4HXgJsRpvWY",
        ),
        ExtraItem(
          title: "Accessibility",
          description: "Another key requirement for the application was full compliance with accessibility standards. This meant that every screen or interface state had to clearly communicate its context and purpose, enabling users with visual impairments to navigate the app effectively primarily through audio feedback."
              "Additionally, all text elements, buttons, and UI components had to be highly adaptable. For example, if a user increased the text size to 200% in their device’s accessibility settings, the layout had to adjust accordingly to maintain readability and usability across the entire app.",
          imagePath: "content/ratifyid_accessibility.png"
        ),
        ExtraItem(
          title: "Requests",
          description: "Within the app, users can receive and respond to requests from various businesses, enabling secure and seamless connections. Business representatives typically employees can customize their requests, which may include identity verification through a liveness check or the submission of specific documents, either selected at their discretion or predefined by the business. Once a user accepts a request via RatifyID, a secure connection is established between the user and the requesting business.",
          videoId: "wA525M3pcv4"
        ),
        ExtraItem(
          title: "Identity Proofing Level (IP Level)",
          description: "Identity Proofing Level indicates the strength and reliability of a digital identity used to access online services. RatifyID supports three primary levels: IP1, IP2, and IP3. To advance to a higher IP level, users are required to either upload specific types of documents or successfully complete a liveness check.",
          videoId: "5iBdt5hzNPY",
        ),
      ],
    ),
    RecentWorkModelItem(
      id: "ratify_me",
      title: "RatifyMe",
      imagePath: "content/test-rme.png",
      shortDescription: "Role: Project Manager - Mobile Platform Migration"
          "\nPlatform: iOS & Android (Flutter)"
          "\nFocus: React Native to Flutter Migration"
          "\n\nAt RatifyMe, I led the migration of the mobile application from React Native to Flutter. RatifyMe is a sophisticated business organization platform with two user types: clients and individuals. Clients can request specific actions from individuals, such as completing tests, uploading documents, or scheduling meetings. Individuals receive and fulfill these requests. They have a simpler user role focused on task completion and document submission.",
      description: "Role: Project Manager - Mobile Platform Migration"
          "\nPlatform: iOS & Android (Flutter)"
          "\nFocus: React Native to Flutter Migration"
          "\n\nAt RatifyMe, I led the migration of the mobile application from React Native to Flutter. RatifyMe is a sophisticated business organization platform with two user types: clients and individuals. Clients can request specific actions from individuals, such as completing tests, uploading documents, or scheduling meetings. Individuals receive and fulfill these requests. They have a simpler user role focused on task completion and document submission."
          "\n\nUnlike its counterpart, RatifyID, RatifyMe does not include identity verification features. As a result, it cannot confirm whether uploaded documents belong to the individual. Functionally, it serves more as a secure document wallet with added business workflow capabilities."
          "\nThe mobile app includes only the individual-side functionality, effectively providing users with a streamlined interface for managing and submitting documents.",
      companyName: "Makesure",
      lightColorHex: "a6edbb",
      darkColorHex: "19ba4a",
      appStoreLink: "https://apps.apple.com/ro/app/ratify-compliance-wallet/id1514562109",
      googlePlayLink: "https://play.google.com/store/apps/details?id=com.makesure.ratify",
      webLink: "https://www.ratifyme.com/",
      extraItemsList: [
        ExtraItem(
          title: "Profile",
          description: "Developed a robust user profile management system featuring advanced editing capabilities, custom privacy settings, and avatar customization. Additionally, implemented a secure electronic signature solution supporting multiple signing methods (hand-drawn, typed, uploaded) with encrypted storage and audit trails for compliance.",
          imagePath: "content/ratifyme_profile.jpg",
        ),
        ExtraItem(
          title: "Documents",
          description: "Developed an in-app digital wallet capable of securely storing and managing user identity documents, including government IDs, licenses, and certificates. Implemented encryption, biometric authentication, and role-based sharing controls to ensure privacy and compliance with industry security standards.",
          imagePath: "content/ratifyme_documents.jpg",
        ),
        ExtraItem(
          title: "Document preview",
          description: "Designed an intuitive document interface allowing users to open, edit, and preview content without leaving the app. Integrated real-time preview, quick navigation, and inline editing for a smooth, user-friendly experience.",
          imagePath: "content/ratifyme_preview_documents.jpg",
        ),
        ExtraItem(
          title: "Components",
          description: "The system includes distinct modules tailored to different types of client requests. Each module is designed to address specific requirements: some requests may involve uploading supporting documents, others require completing an interactive quiz, while certain processes demand an electronic signature. This modular approach ensures flexibility, scalability, and a streamlined user experience, allowing each request type to follow its own optimized workflow.",
          imagePath: "content/ratifyme_components.jpg",
        ),
      ],
    ),
    RecentWorkModelItem(
      id: "idc",
      title: "Interracial Dating Central",
      imagePath: "content/test-idc.png",
      shortDescription: "Role: Mobile App developer"
          "\nPlatform: iOS & Android (Flutter)"
          "\nFocus: Integrated web functionality into the mobile app."
          "\n\nInterracial Dating Central (IDC) is a Tinder-style dating platform designed for individuals seeking partners of a different race. This was my first project of significant complexity, incorporating numerous features and technologies that were new to me."
          "\n\nThe mobile app required a well-structured architecture and...",
      description: "Role: Mobile App developer"
          "\nPlatform: iOS & Android (Flutter)"
          "\nFocus: Integrated web functionality into the mobile app."
          "\n\nInterracial Dating Central (IDC) is a Tinder-style dating platform designed for individuals seeking partners of a different race. This was my first project of significant complexity, incorporating numerous features and technologies that were new to me."
          "\n\nThe mobile app required a well-structured architecture and rigorous, ongoing testing across both iOS and Android to minimize bugs and ensure stability, critical due to the existing user base of over one million on the web platform. Even minor issues could risk user attrition."
          "\n\nUnfortunately, despite reaching the final development stages, the project was indefinitely paused and is currently not available on the App Store or Google Play.",
      companyName: "Chellaul Corporation",
      lightColorHex: "E884DB",
      darkColorHex: "653DF5",
      webLink: "https://www.interracialdatingcentral.com/",
      extraItemsList: [
        ExtraItem(
          title: "In App Purchases",
          description: "Designed and implemented a multi-tier subscription payment system, including a sandbox for transaction testing on Google Play and App Store.",
          imagePath: "content/idc_in_app_purchase.jpg",
        ),
        ExtraItem(
          title: "Flirt system",
          description: "The “Flirt” system functioned as follows: when a user sent a flirt to another user, the recipient received a notification. If they responded with a flirt in return, a match was created, allowing both users to start a conversation. However, users without a premium account could not see who had sent them a flirt, maintaining a layer of anonymity until a mutual interest was established.",
          videoId: "xQdpQQXvp8Y"
        ),
        ExtraItem(
          title: "Filtering System",
          description: "Built an advanced filtering system for partner search, supporting even the most detailed criteria, and implemented templates for fast, repeatable searches.",
          imagePath: "content/idc_filtering_system.jpg",
        ),
      ],
    ),
  ];
}