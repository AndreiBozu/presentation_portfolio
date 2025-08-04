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
      description: "RatifyId is a mobile application officially accredited by Australian government authorities for the verification and secure storage of user identities. I served as the lead developer for the mobile platform, which has been my primary focus over the past two years."
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
          title: "Liveness check",
          description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam ultrices urna nisi, et semper lacus tincidunt nec. Nunc et ornare magna. Proin at mauris nec magna feugiat pharetra at ac eros. Etiam ultrices urna nisi, et semper lacus tincidunt nec.",
          videoId: "H1tmzvmxJnw",
        ),
        ExtraItem(
          title: "NFC reader",
          description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam ultrices urna nisi, et semper lacus tincidunt nec. Nunc et ornare magna. Proin at mauris nec magna feugiat pharetra at ac eros. Etiam ultrices urna nisi, et semper lacus tincidunt nec.",
          imagePath: "content/test_img.png",
        ),
        ExtraItem(
          title: "NFC reader",
          description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam ultrices urna nisi, et semper lacus tincidunt nec. Nunc et ornare magna. Proin at mauris nec magna feugiat pharetra at ac eros. Etiam ultrices urna nisi, et semper lacus tincidunt nec.",
          imagePath: "content/test_img.png",
        )
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
          title: "Transferring from React native to flutter",
          description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam ultrices urna nisi, et semper lacus tincidunt nec. Nunc et ornare magna. Proin at mauris nec magna feugiat pharetra at ac eros. Etiam ultrices urna nisi, et semper lacus tincidunt nec.",
          imagePath: "content/test_img.png",
        ),
        ExtraItem(
          title: "Deep linking",
          description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam ultrices urna nisi, et semper lacus tincidunt nec. Nunc et ornare magna. Proin at mauris nec magna feugiat pharetra at ac eros. Etiam ultrices urna nisi, et semper lacus tincidunt nec.",
          videoId: "PrqYohBV58o"
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