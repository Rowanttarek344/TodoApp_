# Todo App

This Flutter-based Todo Application provides users with a comprehensive task management system, allowing them to add, edit, delete, and mark tasks as completed. With intuitive functionality and a clean user interface, this app aims to streamline the process of organizing daily tasks efficiently.

## Features

- *Add Task*: Enables users to add new tasks to their todo list, including a title, description, and due date.
- *Edit Task*: Provides the ability to edit existing tasks, allowing users to modify task details as needed.
- *Delete Task*: Allows users to delete unwanted tasks from their todo list, decluttering their task management interface.
- *Mark Task as Completed*: Enables users to mark tasks as completed, providing a visual indication of task status and progress.

## Technologies Used

- *Flutter*: Google's UI toolkit for building natively compiled applications for mobile, web, and desktop from a single codebase.
- *Firebase*: Utilizes Firebase for data storage, enabling offline functionality while maintaining synchronization with the cloud.
- *Provider Package*: Implements state management for efficient data flow and UI updates.
- *DateTime Picker*: Incorporates a DateTime picker widget for selecting task due dates.

## Installation

1. Clone the repository:


git clone https://github.com/Rowanttarek344/TodoApp_.git


2. Navigate to the project directory:


cd TodoApp_


3. Install dependencies:


flutter pub get


4. Set up Firebase:

   - Create a new Firebase project on the [Firebase Console](https://console.firebase.google.com/).
   - Add a new Android/iOS app to your Firebase project.
   - Follow the instructions to add the necessary Firebase configuration files to your Flutter project.
   - Enable Firebase Firestore in your Firebase project.
   - Ensure Firestore rules are set up to allow read and write access.

5. Run the app:


flutter run


## Usage

1. Launch the app on your device or emulator.
2. Tap on the "+" button to add a new task.
3. Fill in the task details, including title, description, and due date.
4. Tap on an existing task to edit or delete it.
5. Use the checkbox to mark a task as completed.
6. Organize your tasks efficiently and stay on top of your daily responsibilities.

## Contributing

Contributions are welcome! Please feel free to open issues or submit pull requests.

1. Fork the repository.
2. Create your feature branch (git checkout -b feature/YourFeature).
3. Commit your changes (git commit -am 'Add some feature').
4. Push to the branch (git push origin feature/YourFeature).
5. Open a pull request.

## License

This project is licensed under the [MIT License](LICENSE).
