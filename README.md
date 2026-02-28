# antripe

## Setup steps

# Clone the repository

      git clone https://github.com/tarafat/Antripe.git
      cd Antripe

# Install dependencies

      flutter pub get

## Flutter version

Flutter 3.38.5
Dart 3.10.4

## How to run the app

    flutter run

## Assumptions

1 Internet Connection
The app requires an active internet connection to fetch and manage contacts.
If there is no internet connection:
The user will be informed with an appropriate message.
Network-dependent actions will be restricted until connection is restored.

2 No Contact Available After Search
If no contacts are found:
A clear empty-state message will be shown (e.g., “No contacts found”).
The user will be given an option to add a new contact directly from the empty state.

3 Contact Management Flow
Users can search contacts.
If a contact does not exist:
The system assumes the user may want to create a new contact.
A quick navigation option to the “Add Contact” screen will be available.

## Used Libraries

dio ^5.9.0
A powerful HTTP client for Dart.
Why used:
Handle REST API calls
Request/response interceptors
Global error handling
Timeout configuration
Better than default http for scalable apps

get_it ^8.2.0
A lightweight service locator for dependency injection.
Why used:
Manage app-level dependencies
Decouple business logic from UI
Easily access services (e.g., API service, repository)
Improves testability and architecture cleanliness

flutter_screenutil ^5.9.3
A responsive UI utility package.
Why used:
Make UI responsive across different screen sizes
Adaptive width, height, and font scaling
Maintain consistent design across devices

internet_connection_checker ^3.0.1
Checks real-time internet connectivity status.
Why used:
Detect online/offline state
Inform user when there is no internet
Prevent unnecessary API calls when offline
Improve user experience with proper network handling

riverpod_annotation ^3.0.3
Used for code generation with Riverpod.
Why used:
Clean and scalable state management
Reduces boilerplate using @riverpod
Compile-time safety
Better performance and testability
Structured architecture for large applications
"# Antripe"
