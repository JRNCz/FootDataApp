# FootData
Project based in Flutter, using footballdata.org's public API. The app allows the user to see **information about the champions, Portuguese, French, Spanish, Italian, German, and English leagues, their clubs, and players.** The data displayed is directly given by a public API so it might not be 100% reliable at some point in time since it is very dynamic.

# Preview of the app:
https://user-images.githubusercontent.com/83510823/226892233-076995f2-f9a4-4590-b8ba-658cf6c8499e.mp4

# Tecnhinal description and problems addressed:

### Home, clubs, and league endpoints

- ListView format using Cards widgets in each menu.
- SVG files wouldn't work using NetworkImage, therefore, the SvgPicture library was pivotal.
- Information on the display within the Listview was sent by argument.

### Loading Screen 

- Nested JSON decoding and data storage using several classes in data/service.dart
- League, Competition, Player, and Club classes
- Async function to getData(), the loading screen ends and pushes the home screen after the function is done.
- HTTP Requests (with a special header) 

# Future Work and conclusions

The application doesn't represent the full potential of the API since it still has a lot of information that could be stored and shown to the end-user as matches
 or information about which competitions a certain team attends.


# To run the app

 

This app requires SDK version >=2.19.4 <3.0.0 to run this version of the project. The user can either:

- The user must change pubspec.yaml's SDK version to an older version (e.g 2.19.3) under "enviorement:" in case the pub get doesn't work.
- In the terminal , upgrade flutter by writing "**flutter upgrade**" and afterwards get the depedencies by "**flutter pub get**"

To run the app one must enter in the terminal: **flutter run**

The default API key might be expired in case the data was not processed. Each user can get his own in https://www.football-data.org/, with a maximum of 100 requests per minute (March 2023)
