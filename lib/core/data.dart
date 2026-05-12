class PersonalInfo {
  static const String name = 'ARDRITH S PRAMOD';
  static const String role = 'Flutter Developer';
  static const String email = 'ardrith@gmail.com';
  static const String phone = '+91 9447178089';
  static const String location = 'Kozhikode, Kerala, India';
  static const String linkedin = 'linkedin.com/in/ardrith-s-pramod';
  
  static const String summary = '''
Flutter Developer with 2+ years of experience building scalable cross-platform applications across mobile, web, and desktop using a single Dart codebase. Specialized in POS systems, ERP/dashboard applications, payment gateway integration (Razorpay, Stripe), and thermal printing solutions (Bluetooth/Network ESC/POS).

Experienced in the Firebase ecosystem (FCM, Analytics, Auth), real-time systems (SignalR/WebSocket), GPS tracking, and multi-role architectures with role-based access control. Proficient in implementing clean architecture, state management (Riverpod, GetX, Provider), and REST API-driven applications.

Skilled in CI/CD automation, performance optimization, and end-to-end deployment to Google Play Store and Apple App Store. Delivered and maintained production-grade applications supporting 100+ active users across enterprise, restaurant, e-commerce, HR, and business operations domains.
''';
}

class SkillCategory {
  final String title;
  final List<String> skills;
  const SkillCategory({required this.title, required this.skills});
}

class SkillsData {
  static const List<SkillCategory> categories = [
    SkillCategory(
      title: 'Mobile & Cross-Platform',
      skills: ['Flutter', 'Dart (Android, iOS, Web, Windows)'],
    ),
    SkillCategory(
      title: 'Architecture & State Management',
      skills: ['Riverpod', 'GetX', 'Provider', 'Clean Architecture', 'BLoC'],
    ),
    SkillCategory(
      title: 'Backend & APIs',
      skills: ['REST APIs', 'Firebase (Auth, FCM, Analytics)'],
    ),
    SkillCategory(
      title: 'Payments & Integrations',
      skills: ['Razorpay', 'Stripe', 'Google Maps API', 'Thermal Printer Integration'],
    ),
    SkillCategory(
      title: 'DevOps & Release Management',
      skills: ['Git', 'GitHub Actions (CI/CD)', 'Shorebird (Code Push / OTA Updates)', 'Versioning Strategy', 'Play Store & App Store Deployment'],
    ),
    SkillCategory(
      title: 'Frontend (Web)',
      skills: ['HTML5', 'CSS3', 'Node.js', 'React'],
    ),
    SkillCategory(
      title: 'Testing & Monitoring',
      skills: ['Unit Testing', 'Crash Reporting', 'Performance Optimization'],
    ),
  ];
}

class Experience {
  final String role;
  final String company;
  final String location;
  final String duration;
  final List<String> responsibilities;

  const Experience({
    required this.role,
    required this.company,
    required this.location,
    required this.duration,
    required this.responsibilities,
  });
}

class ExperienceData {
  static const List<Experience> history = [
    Experience(
      role: 'Flutter Developer',
      company: 'Glowsis Technology Pvt Ltd',
      location: 'Kozhikode, Kerala, India',
      duration: 'December 2024 – Present',
      responsibilities: [
        'Architected and delivered scalable Flutter applications across Android, iOS, Web, and Windows desktop from a unified Dart codebase, supporting 100+ active users.',
        'Designed responsive UI layouts and adaptive components to ensure a consistent user experience across mobile, web, and desktop environments.',
        'Integrated Razorpay and Stripe payment gateways with secure checkout flows and PCI-compliant transaction handling.',
        'Implemented Firebase Cloud Messaging (FCM) for real-time push notifications across platforms, improving engagement and retention.',
        'Integrated Google Maps API for live tracking, interactive markers, and location-based services.',
        'Streamlined CI/CD workflows using GitHub Actions, improving release stability and reducing deployment turnaround time.',
        'Developed and customized ERP solutions to enhance business operations, improving data management processes by 15%.',
        'Worked in Agile teams, actively contributing to sprint planning, retrospectives, and daily scrums.',
      ],
    ),
    Experience(
      role: 'Flutter Developer Intern',
      company: 'Doctosmart Pvt Ltd',
      location: 'Calicut, Kerala, India',
      duration: 'November 2023 – December 2023',
      responsibilities: [
        'Developed and maintained production-grade cross-platform Flutter applications for Android and iOS.',
        'Integrated REST APIs and third-party SDKs, ensuring stable data synchronization and optimized app performance.',
        'Implemented structured state management (GetX, Provider) to enhance maintainability and scalable navigation flows.',
        'Built reusable UI components and internal libraries to accelerate team development cycles.',
        'Contributed to healthcare applications designed for hospitals, clinics, and individual practitioners.',
      ],
    ),
  ];
}

class Project {
  final String title;
  final String description;
  final List<String> points;

  const Project({
    required this.title,
    required this.description,
    required this.points,
  });
}

class ProjectsData {
  static const List<Project> list = [
    Project(
      title: 'Glowsis Restaurant',
      description: 'Restaurant Waiter and Admin Ordering Platform',
      points: [
        'Developed a feature-based cross-platform Flutter POS application using Riverpod state management, supporting user, admin, kitchen, and delivery roles.',
        'Implemented a real-time order management system using SignalR (WebSocket) for live order tracking, kitchen updates, and instant synchronization.',
        'Integrated RESTful APIs for menu management, order processing, payment handling, and role-based access control.',
        'Designed modular clean architecture (data, domain, presentation) to ensure scalability, maintainability, and efficient state handling.',
        'Built a dynamic menu and cart system with real-time item updates, multi-UOM support, tax/discount calculations, and an optimized checkout workflow.',
        'Implemented thermal printer integration (Bluetooth/USB/Network) for KOT (Kitchen Order Ticket) and invoice printing.',
        'Integrated Firebase Analytics and Cloud Messaging (FCM) for user engagement tracking, push notifications, and order alerts.',
        'Developed a role-based permission system enabling controlled access for ordering, payments, kitchen operations, and reporting modules.',
        'Added multi-language support (English/Arabic) with RTL layout and a responsive UI for mobile and tablet devices.',
        'Optimized performance with real-time connectivity handling, session management, and deep linking, improving order processing efficiency.',
        'Managed end-to-end deployment to the Google Play Store and Apple App Store, including build configuration, signing, and release management.',
      ],
    ),
    Project(
      title: 'Van-Sales Application',
      description: 'Mobile Sales and Distribution Management System',
      points: [
        'Designed and developed an offline-first Flutter application for field sales operations with real-time inventory tracking and seamless ERP synchronization.',
        'Implemented a local database (SQLite with Floor) and incremental sync strategy to ensure uninterrupted functionality in low-connectivity environments.',
        'Integrated RESTful APIs for dynamic data handling, including invoicing, receipts, inventory transfers, and customer management.',
        'Developed thermal printer integration for on-site invoice and receipt generation via Bluetooth.',
        'Built advanced modules including sales invoicing, payment collection, stock management, reporting, and customer ledger tracking.',
        'Implemented barcode scanning for fast product lookup and multi-UOM support for flexible sales operations.',
        'Utilized GetX/Provider state management for reactive UI, modular architecture, and efficient state handling.',
        'Integrated GPS location tracking and route management for field employee monitoring and visit tracking.',
        'Added Firebase/Sentry crash reporting and analytics to monitor performance, user behavior, and reduce application crashes.',
        'Contributed to CI/CD pipelines using Git for automated builds and deployments to the Google Play Store and Apple App Store.',
      ],
    ),
    Project(
      title: 'Glowsis Dashboard',
      description: 'Business Management Application',
      points: [
        'Built a Flutter application following the Provider pattern, featuring employee check-in/out, leave management, attendance tracking, and role-based access control.',
        'Implemented a lead creation and tracking module, enabling salespersons to manage prospects, update lead status, and monitor conversion progress in real time.',
        'Integrated REST APIs and Firebase for real-time data synchronization, secure authentication, and analytics tracking.',
        'Optimized performance and incorporated crash reporting to ensure stable operation across iOS and Android.',
        'Implemented employee attendance (check-in/out), a service catalog, billing, invoice generation, and thermal receipt printing via POS hardware integration.',
        'Developed a multi-dashboard system with role-based access (Sales, HRM, Accounts, Manager), dynamically rendering UI components based on user permissions.',
        'Integrated Firebase Cloud Messaging (FCM) for push notifications, including approval requests, alerts, and real-time updates.',
        'Implemented real-time GPS tracking and route management for field employees, including background location updates and activity monitoring.',
        'Built financial analytics dashboards with charts (FL Chart, Syncfusion) for KPIs such as sales performance, profit ratios, and receivables/payables tracking.',
        'Designed and implemented multi-company and multi-branch support with session management and dynamic data switching.',
        'Developed PDF generation and Bluetooth thermal printing features for invoices, reports, and receipts using ESC/POS protocols.',
        'Implemented paginated API data loading and caching strategies to improve performance and handle large datasets efficiently.',
        'Implemented CI/CD pipelines and automated build processes using Codemagic and Git-based workflows, improving deployment efficiency and reducing manual release errors.',
      ],
    ),
    Project(
      title: 'Service Provider Management Application',
      description: '',
      points: [
        'Developed a scalable Flutter-based application supporting both customer and employee workflows for service booking and management.',
        'Implemented role-based modules including a customer app, employee interface, and admin dashboard for seamless service lifecycle handling.',
        'Designed and integrated a service booking system with real-time availability, scheduling, and status tracking (requested, assigned, in-progress, completed).',
        'Integrated RESTful APIs for dynamic data handling, enabling real-time synchronization of bookings, user data, and service updates.',
        'Utilized Firebase services for authentication, push notifications, and analytics to monitor user engagement and operational metrics.',
        'Built features for employee task assignment, performance tracking, and service history management to improve workforce efficiency.',
        'Developed an admin dashboard with insights including service revenue, booking trends, employee performance, and daily/monthly reports.',
        'Implemented secure payment integration and order tracking for an enhanced customer experience.',
        'Ensured high performance and responsiveness across Android and iOS devices, including tablets, with optimized state management and API handling.',
        'Integrated error handling and crash reporting to maintain stability in high-traffic usage scenarios.',
      ],
    ),
  ];
}

class Education {
  final String degree;
  final String institution;
  final String location;
  final String duration;

  const Education({
    required this.degree,
    required this.institution,
    required this.location,
    required this.duration,
  });
}

class EducationData {
  static const List<Education> history = [
    Education(
      degree: 'Master of Computer Application (MCA)',
      institution: 'APJ Abdul Kalam Technological University',
      location: 'Kerala, India',
      duration: 'Nov 2021 – April 2023',
    ),
    Education(
      degree: 'Bachelor of Computer Application (BCA)',
      institution: 'Bangalore University',
      location: 'Karnataka, India',
      duration: 'July 2017 – May 2020',
    ),
  ];

  static const List<String> certifications = [
    'Flutter Developer Certification – Doctosmart Pvt Ltd — Calicut',
    '2-Day AI Mastermind Workshop – Outskill',
  ];
}
