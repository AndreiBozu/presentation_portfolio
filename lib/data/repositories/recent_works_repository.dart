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
          videoId: "TDgwYVOKXgs",
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
      id: "social_bite",
      title: "SocialBite.",
      imagePath: "content/social_bite_bg.jpg",
      shortDescription: "Role: Mobile App Developer"
          "\nPlatform: iOS & Android (Flutter)"
          "\n\nSocialBite is a mobile application designed to bring people together through real-life social experiences, including dinners, coffee meetups, drinks, board game nights, sports activities, and other community events. The platform focuses on helping users build meaningful connections by participating in carefully organized group activities."
          "\n\nThroughout the development of SocialBite, particular emphasis was placed on delivering an intuitive and responsive...",
      description: "Role: Mobile App Developer"
          "\nPlatform: iOS & Android"
          "\n\nSocialBite is a mobile application designed to bring people together through real-life social experiences, including dinners, coffee meetups, drinks, board game nights, sports activities, and other community events. The platform focuses on helping users build meaningful connections by participating in carefully organized group activities."
          "\n\nThroughout the development of SocialBite, particular emphasis was placed on delivering an intuitive and responsive user experience. The interface incorporates subtle animations for interactive elements, while every significant user action is accompanied by immediate visual feedback, creating a smooth and engaging interaction flow."
          "\n\nThe application was designed with flexibility and performance as core principles. User interface components adapt dynamically to different content and configurations, while data retrieved from the backend is intelligently cached to reduce loading times and provide a fast, responsive experience. In addition, the application supports dynamic language and theme switching, allowing users to personalize the interface without restarting the application."
          "\n\nBy combining a modern, user-centered design with optimized performance and flexible architecture, SocialBite delivers a seamless platform for discovering events, meeting new people, and fostering genuine social connections.",
      companyName: "NextLogic",
      lightColorHex: "FFF9F3",
      darkColorHex: "842973",
      googlePlayLink: "https://play.google.com/store/apps/details?id=com.nextlogic.social_bite",
      appStoreLink: "https://apps.apple.com/ro/app/socialbite/id6754761075",
      webLink: "https://socialbiteapp.com/",
      extraItemsList: [
        ExtraItem(
          title: "Authorization",
          description: "The app's authorization system is designed to provide a simple, secure, and user-friendly onboarding experience. Instead of relying on the traditional email and password registration process, users authenticate using their phone number. A one-time verification code is sent via SMS, allowing users to securely sign in without creating or remembering a password."
              "\n\nIn addition to phone number authentication, the app also supports sign-in with Google and Apple, giving users multiple secure authentication options."
              "\n\nAs part of the registration process, users complete a short personality assessment. The results of this assessment are used to help match users with the most suitable groups, improving the quality of recommendations and fostering more meaningful social connections.",
          imagePath: "content/sb_auth.png",
        ),
        ExtraItem(
          title: "Event Management",
          description: "The app provides a comprehensive event management system designed to facilitate the organization of social experiences such as dinner gatherings, coffee meetups, brunches, sports activities, and other group events."
              "\n\nThe event lifecycle begins with the creation and publication of an event through the administrative platform. Once published, users can browse available events and submit reservation requests to participate."
              "\n\nApproximately 48 hours before the scheduled start time, the system automatically groups registered participants based on predefined matching criteria. Alternatively, administrators have the option to create or modify these groups manually when needed."
              "\n\nAfter the participant groups have been finalized, the event organizer assigns each group to a selected venue through the administration platform. Once all event details, including participant groups and venue assignments, have been confirmed, the system automatically notifies all participants. The notification contains the complete event information, including the assigned venue, date and time, and any additional details required for attendance."
              "\n\nThis workflow streamlines the organization process while ensuring that participants receive timely updates and accurate event information.",
          videoId: "KwlFpyhNcFg",
        ),
        ExtraItem(
            title: "Rating System",
            description: "The app incorporates a comprehensive rating system that evaluates both events and user interactions. The collected ratings are used to continuously improve the participant matching process, enabling the platform to create more compatible groups for future events."
                "\n\nFollowing each event, participants can rate one another based on their experience. When two users mutually award each other a rating of four or five stars, the system automatically establishes a connection between them. Once connected, users gain access to additional interaction features within the app, allowing them to communicate and stay in touch beyond the event."
                "\n\nIn addition to individual interaction ratings, every user maintains an overall reputation score calculated from feedback received across all attended events. This cumulative rating reflects the user's participation quality and overall experience within the community."
                "\n\nUsers who consistently maintain a high overall rating become eligible for exclusive membership levels, granting them access to premium groups and invitation-only events. This reputation-based progression encourages positive interactions while rewarding engaged and highly rated members with unique social opportunities.",
            imagePath: "content/sb_rate_system.png"
        ),
        ExtraItem(
            title: "Connection System and Deep Link Integration",
            description: "The app features a lightweight connection system designed to encourage communication between users without requiring a built-in messaging platform. Rather than developing and maintaining an in-app chat system, the app leverages existing communication channels that users already rely on daily."
                "\n\nDuring the initial onboarding process, users are invited to add their preferred contact methods, such as WhatsApp, Instagram, Messenger, email, or other supported platforms. If a phone number is associated with the user's account, it can be used to simplify the setup process and enable additional contact options, including phone calls and text messages."
                "\n\nOnce two users establish a mutual connection through the app's rating and matching system, they gain access to each other's preferred communication methods. Users can then choose how they would like to initiate contact directly from the app."
                "\n\nThe system utilises deep links to seamlessly launch the selected communication platform. For example, choosing WhatsApp opens a conversation with the connected user directly in the WhatsApp app, while selecting Instagram, Messenger, email, or another supported service launches the corresponding app or communication interface."
                "\n\nThis approach significantly reduces development complexity while providing a familiar and intuitive user experience. Since users naturally transition to their preferred messaging platforms after establishing a connection, the app avoids duplicating functionality that is already available in widely adopted communication services, allowing development efforts to focus on the platform's core social and matchmaking features.",
            imagePath: "content/sb_connections.png"
        ),
        ExtraItem(
          title: "Payment System",
          description: "The application uses a flexible ticket and subscription-based payment system designed to accommodate events with varying costs and access requirements."
              "\n\nPayments are handled through digital “tickets” and multiple types of monthly passes. This structure allows event organizers to define how users can access specific events depending on pricing and participation rules. For each event, the organizer has full control over the entry conditions and can decide whether participation requires a specific ticket value, a particular type of pass, or whether access should be granted free of charge."
              "\n\nThis model ensures maximum flexibility, making it possible to support both paid and free events within the same system while adapting to different event formats and pricing strategies."
              "\n\nFrom a technical perspective, all payments are processed using standard in-app purchase mechanisms provided by Google Play and the Apple App Store, ensuring secure and compliant transactions across both platforms.",
          imagePath: "content/sb_payment.png",
        ),
      ],
    ),
    RecentWorkModelItem(
      id: "ratify_me",
      title: "RatifyMe",
      imagePath: "content/test-rme.jpg",
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
      imagePath: "content/test-idc.jpg",
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
    RecentWorkModelItem(
      id: "study_link",
      title: "StudyLink",
      imagePath: "content/study_link_quiz_completion.png",
      description: "Platform: Web (React, NodeJS, GraphQL)"
          "\nFocus: Creating an educational platform with a strong focus on flexibility and adaptability."
          "\n\nStudyLink is an educational platform I developed, inspired by the Moodle model. The frontend was built with React, while the backend was implemented in native Node.js using GraphQL and MongoDB."
          "\n\nThe platform is designed around two user roles: students and teachers. Teachers can create courses and enroll students, with a high degree of flexibility in course design. They decide how many levels a course will contain, how those levels are presented, and can also create tests between levels. The testing system is highly adaptable, supporting multiple-choice questions, single-answer questions, and open-text responses."
          "\n\nStudents can access the courses they are enrolled in, track their progress, complete tests, and view their average results for each course.",
      shortDescription: "Platform: Web (React, NodeJS, GraphQL)"
          "\nFocus: Creating an educational platform with a strong focus on flexibility and adaptability."
          "\n\nStudyLink is an educational platform I developed, inspired by the Moodle model. The frontend was built with React, while the backend was implemented in native Node.js using GraphQL and MongoDB."
          "\n\nThe platform is designed around two user roles: students and teachers. Teachers can...",
      companyName: "Own project",
      lightColorHex: "cd3434",
      darkColorHex: "1321a8",
      isWeb: true,
      gitHubLink: "https://github.com/AndreiBozu/study-link_front-end",
      extraItemsList: [
        ExtraItem(
          title: "Creating the course",
          description: "",
          imagePath: "content/study_link_create_course.png"
        ),
        ExtraItem(
          title: "Creating the quiz",
          description: "",
          imagePath: "content/study_link_create_quiz.png"
        ),
        ExtraItem(
          title: "Completing a quiz as a student",
          description: "",
          imagePath: "content/study_link_quiz_completion.png"
        ),
        ExtraItem(
          title: "Courses list",
          description: "",
          imagePath: "content/study_link_courses_list.png"
        ),
        ExtraItem(
          title: "The Course details",
          description: "",
          imagePath: "content/study_link_course_details.png"
        ),
        ExtraItem(
          title: "The test results",
          description: "",
          imagePath: "content/study_link_results.png"
        ),
        ExtraItem(
          title: "Sign up",
          description: "",
          imagePath: "content/study_link_signup.png"
        ),
        ExtraItem(
          title: "Login",
          description: "",
          imagePath: "content/study_link_login.png"
        )
      ]
    )
  ];
}