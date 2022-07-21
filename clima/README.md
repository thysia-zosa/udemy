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
