
# DiyetApps

**DiyetApps** is a mobile application designed to assist users in managing and monitoring their calorie intake. Developed to support weight loss and healthy eating habits, DiyetApps allows users to set and achieve their dietary goals through intuitive tracking and data visualization.

## Overview

As a calorie tracking application, DiyetApps empowers users to:
- Accurately log and monitor their daily calorie intake.
- Establish and maintain weight loss goals.
- Make informed dietary choices to achieve a balanced and healthier lifestyle.

By focusing on user-friendliness and reliability, DiyetApps serves as a practical companion for anyone looking to adopt and sustain a healthier eating regimen.

## Table of Contents
1. [Features](#features)
2. [Installation](#installation)
3. [Environment Configuration](#environment-configuration)
4. [Usage](#usage)
5. [Technology Stack](#technology-stack)
6. [License](#license)

## Features

- **Calorie Tracking**: Log meals and monitor daily caloric intake with an easy-to-use interface.
- **Goal Setting**: Define weight loss objectives and track progress.
- **Data Storage**: Securely saves user data locally on the device for offline access.
- **Intuitive Design**: User-centric interface optimized for accessibility and simplicity.

## Installation

### Prerequisites

To run DiyetApps locally, ensure you have the following:
- **Flutter SDK** (>=3.3.1 <4.0.0)
- **Android Studio** or **Xcode** for iOS if testing on an emulator
- Compatible mobile device or emulator for testing

### Step-by-Step Installation

1. **Clone the Repository**:
   ```bash
   git clone https://github.com/abcdenis18/diyetapps.git
   cd diyetapps
   ```

2. **Install Required Dependencies**:
   Execute the following command to install all necessary packages:
   ```bash
   flutter pub get
   ```

3. **Run the Application**:
   Start the application on a connected device or emulator with:
   ```bash
   flutter run
   ```

## Environment Configuration

DiyetApps utilizes environment variables for secure storage of API keys. Configure the environment by following these steps:

1. **Create a `.env` file**:
   In the root directory of your project, create a `.env` file to store environment-specific variables.

2. **Add API Keys and Variables**:
   Populate the `.env` file with relevant keys:
   ```plaintext
   OPENAI_API_KEY=your_openai_api_key
   ```

3. **Ensure Security**:
   To prevent accidental exposure, ensure that `.env` is listed in `.gitignore`.

## Usage

With the application installed and configured, use the following guide to get started:

1. **Launch the App**: Use `flutter run` to open DiyetApps on your device.
2. **Log Meals and Calories**: Enter each meal’s details and associated calorie count.
3. **Monitor Progress**: Track daily calorie intake against your personal weight loss goals.
4. **Adjust Goals as Needed**: Update your target to reflect changes in dietary plans or health objectives.

## Technology Stack

The DiyetApps project is built using the following libraries and frameworks:

- **Flutter**: Core framework for cross-platform mobile development.
- **Camera**: Access to device camera for additional features (if applicable).
- **Dart OpenAI**: API integration for machine learning and AI-driven features.
- **Dio**: Robust HTTP client for API calls.
- **GetX**: Simplified state management and navigation.
- **Path Provider**: Local data storage path access.
- **Permission Handler**: Permission control for accessing device resources.

## License

This project is licensed under the MIT License. For more information, please refer to the [LICENSE](LICENSE) file.

---

DiyetApps provides users with a practical approach to tracking their dietary habits and supporting their health journey through consistent, data-driven choices. By streamlining calorie monitoring and goal setting, DiyetApps contributes to a more balanced and informed lifestyle.

For any inquiries or contributions, please feel free to open an issue or submit a pull request.
