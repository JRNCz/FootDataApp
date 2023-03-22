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


# If the app doesn't run 

- It's most likely because the API key is expired. Each user can get his own in https://www.football-data.org/, with a maximum of 100 requests per minute (March 2023) 
- Requires SDK version >=2.19.4 <3.0.0,

