# Clima

Climate show app for Location

## How to proceed

* add geolocator to deps, including ios/android-stuff
* use low accurracy
* master the async/await [challenge](https://github.com/londonappbrewery/Clima-Flutter-Location-Refactor-Challenge) with the Location class
* api-key: appid=41424e6874a9bdc5039cc4c3cc6f0beb
* url: <https://api.openweathermap.org/data/2.5/weather?lat=$latitude&lon=longitude&units=metric&appid=41424e6874a9bdc5039cc4c3cc6f0beb>
* you need the temperature, the condition and the city name
* everything about that weather goes into the NetworkHelper class
* this is used in the location screen

## Architecture

### Frontend

Starting point is the loading screen with a fidget spinner (no funny shunny thing). As soon as the data for the local position has been loaded, the location screen opens. By clicking on the City Icon, the City Screen opens with the textfield for the city input.

### Backend

Their are two kinds of requests:

* get Weather by geographical Location (with Location as param)
* get Weather by City Name (with String as param)

The answer are of the same kind: WeatherData
