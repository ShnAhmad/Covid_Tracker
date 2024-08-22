
# Flutter COVID-19 Tracker App


A Flutter application that provides up-to-date COVID-19 statistics globally and for individual countries. This app displays a splash screen, world statistics, country-specific data, and allows users to search and view detailed COVID-19 information for each country.


## Features

- World Statistics: Global COVID-19 data presented with a pie chart and detailed statistics.
- Country List: Searchable list of countries with COVID-19 data.
- Country Details: Detailed COVID-19 statistics for each selected country.


## Technical Highlights
- Built with Flutter for cross-platform compatibility
- Utilizes StatefulWidget for dynamic content management
- Implements custom animations for a polished user experience
- Uses Flutter's built-in theming for consistent styling
## Screenshots

- Splash screen
  
![c4](https://github.com/user-attachments/assets/f45ddd0e-e586-4736-bf72-7766718a43ca)

- States screen

![c1](https://github.com/user-attachments/assets/c82e79ae-c1fa-4052-b629-0f6f2c8c69a0)

- Countries list screen

![c2](https://github.com/user-attachments/assets/af89992d-05e2-400b-ac91-0ba51bf8bfa3)

- Details screen

![c3](https://github.com/user-attachments/assets/fb17f94f-eca5-4be4-939a-3ae02870bd05)




## Tech Stack


**Client:** Flutter, dart


## Usage
- Splash Screen: The app will start with a splash screen showing a rotating virus image.
-  World Statistics: After the splash screen, you’ll be taken to the world statistics screen showing global COVID-19 data.
- Country List: Navigate to the country list screen to search and view COVID-19 statistics by country.
- Country Details: Tap on a country in the list to see detailed COVID-19 statistics.

  ## API Reference

#### World Statistics:

```http
  https://disease.sh/v3/covid-19/all
```

#### Countries List:

```http
  https://disease.sh/v3/covid-19/countries
```

## Installation

- Clone the repository:

```bash
  git clone https://github.com/ShnAhmad/Covid_Tracker
```
- Navigate to the project directory:

```bash
  cd Covid_Tracker
``` 
- Install dependencies:

```bash
flutter pub get
``` 
- Run the app:

```bash
flutter run
``` 
## Contributing
We welcome contributions to improve Quiz App! Here's how you can contribute:

- Fork the repository.

- Create a new branch:

```bash
git checkout -b feature/your-feature-name
```
- Make your changes.

- Commit your changes:
```bash
git commit -m 'Add some feature'
```
- Push to the branch:
```bash
git push origin feature/your-feature-name
```
- Create a Pull Request.


## License

[MIT](https://choosealicense.com/licenses/mit/)


## Support

If you have any questions, eel free to reach out to me at shanahmad.dev@gmail.com.

