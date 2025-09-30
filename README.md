## Flutter News App
A Flutter News Application built with MVVM (Model–View–ViewModel) architecture, the Repository Pattern, and Riverpod for state management.

✨ Features
Home Page → Displays the latest top news fetched from NewsAPI.org.
Category Page → Browse news by category (Technology, Entertainment, Sports, Health, Business, etc.).
Smooth UI/UX → Gesture-based interactions, elegant animations, and responsive design.
Cross-Platform → Optimized for both Android and iOS.

🏗 Architecture
The project follows MVVM with Repository Pattern for a clean and scalable codebase:
Repository Layer → Handles data access and abstracts API integration.
ViewModel (with Riverpod) → Manages state, business logic, and communicates between Repository and UI.
View → Purely responsible for rendering UI and reacting to state changes.
Using Riverpod ensures:
Simple and robust state management
Dependency injection made easy
Better testability and scalability

⚙️ Tech Stack
Flutter → Cross-platform framework
Riverpod → State management & dependency injection
Dio/HTTP → Networking (API integration with NewsAPI)
MVVM + Repository Pattern → Architecture


 ## Todos
- [x] News Home page
- [x] Video News page
- [x] Select news category page
- [x] Profile page
- [x] Animations
- [x] Beautiful UI with Dual themes ie. Light Theme and Dark Theme
- [x] Fetch news from api
- [x] Parse complicated JSON.
- [x] Bloc pattern
- [x] Display news detail
- [ ] Display full news detail

## Screenshots

Dark theme               |  Light Theme               | Dark theme               |  Light Theme
:-------------------------:|:-------------------------:|:-------------------------:|:-------------------------
![](https://github.com/TheAlphamerc/flutter_news_app/blob/master/screenshots/dark_1.jpg?raw=true)|![](https://github.com/TheAlphamerc/flutter_news_app/blob/master/screenshots/light_1.jpg?raw=true)|![](https://github.com/TheAlphamerc/flutter_news_app/blob/master/screenshots/dark_2.jpg?raw=true)|![](https://github.com/TheAlphamerc/flutter_news_app/blob/master/screenshots/light_2.jpg?raw=true)
![](https://github.com/TheAlphamerc/flutter_news_app/blob/master/screenshots/dark_category.jpg?raw=true)|![](https://github.com/TheAlphamerc/flutter_news_app/blob/master/screenshots/light_category.jpg?raw=true)|![](https://github.com/TheAlphamerc/flutter_news_app/blob/master/screenshots/dark_profile.jpg?raw=true)|![](https://github.com/TheAlphamerc/flutter_news_app/blob/master/screenshots/light_profile.jpg?raw=true)
![](https://github.com/TheAlphamerc/flutter_news_app/blob/master/screenshots/dark_3.jpg?raw=true)|![](https://github.com/TheAlphamerc/flutter_news_app/blob/master/screenshots/light_3.jpg?raw=true)|![](https://github.com/TheAlphamerc/flutter_news_app/blob/master/screenshots/dark_4.jpg?raw=true)|![](https://github.com/TheAlphamerc/flutter_news_app/blob/master/screenshots/light_4.jpg?raw=true)
![](https://github.com/TheAlphamerc/flutter_news_app/blob/master/screenshots/dark_5.jpg?raw=true)|![](https://github.com/TheAlphamerc/flutter_news_app/blob/master/screenshots/light_5.jpg?raw=true)|![](https://github.com/TheAlphamerc/flutter_news_app/blob/master/screenshots/dark_6.jpg?raw=true)|![](https://github.com/TheAlphamerc/flutter_news_app/blob/master/screenshots/light_6.jpg?raw=true)

## News API Credit
https://newsapi.org/

## Getting Started
> Before you build this App from source code, please get an ApiKey from [newsapi.org](https://newsapi.org)
and add your ApiKey in [secure_data.env](https://github.com/TheAlphamerc/flutter_news_app/blob/aad3f409e6f0ba7aeb7e5a823a942c697341c134/lib/src/helpers/constants.dart#L2). 

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://flutter.dev/docs/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://flutter.dev/docs/cookbook)

For help getting started with Flutter, view our
[online documentation](https://flutter.dev/docs), which offers tutorials,
samples, guidance on mobile development, and a full API reference.




