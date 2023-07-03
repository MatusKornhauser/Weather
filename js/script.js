let infoBox = document.querySelector("#info");
let weatherBox = document.querySelector("#weather");
const button = document.querySelector("#btn");
infoBox.style.visibility = "hidden"
weatherBox.style.visibility = "hidden"
let gps = document.querySelector("#location");
let country = document.querySelector("#country");
let capital = document.querySelector("#capital");
let city = document.querySelector("#city");
let sky = document.querySelector("#sky");
let temperature = document.querySelector("#temp");
let wind = document.querySelector("#wind");
var places = [];

city.style.visibility = "hidden"

function initMap() {
    // search box

    const input = document.getElementById("pac-input");
    const searchBox = new google.maps.places.SearchBox(input);

    searchBox.addListener("places_changed", () => {
        places = searchBox.getPlaces();
    })
}

window.initMap = initMap;

button.addEventListener('click', () => {

    // C
    places.forEach((place) => {
        // B
        city.innerHTML = place.address_components[0].long_name
        weatherBox.style.visibility = "visible"
        const apiKey = ''  //api key

        let size = place.address_components.length
        var countryName = 0

        if (!hasNumber(place.address_components[size - 1].long_name)) {
            countryName = place.address_components[size - 1].long_name
        } else {
            countryName = place.address_components[size - 2].long_name
        }

        var lat = place.geometry.location.lat()
        var long = place.geometry.location.lng()

        fetch('https://api.openweathermap.org/data/2.5/weather?lat=' + lat + '&lon=' + long + '&appid=' + apiKey)
            .then(res => res.json())
            .then(data => {
                sky.innerHTML = data['weather'][0]['description']
                temperature.innerHTML = convertTemp(data['main']['temp']) + ' °C'
                wind.innerHTML = data['wind']['speed'] + ' km/h'
            })

        infoBox.style.visibility = "visible"
        gps.innerHTML = place.geometry.location;
        country.innerHTML = countryName

        var shortCut = 0
        if (!hasNumber(place.address_components[size - 1].short_name)) {
            shortCut = place.address_components[size - 1].short_name
        } else {
            shortCut = place.address_components[size - 2].short_name
        }

        fetch('https://restcountries.com/v2/alpha/' + shortCut)
            .then(response => response.json())
            .then(data => {
                capital.innerHTML = data['capital']
            });

        var today = new Date();
        var dd = today.getDate();
        var mm = today.getMonth() + 1;
        var yyyy = today.getFullYear();

        if (dd < 10) {
            dd = "0" + dd
        }

        if (mm < 10) {
            mm = "0" + mm
        }

        var currentDate = yyyy + "-" + mm + "-" + dd + " " + today.getHours() + ":" + today.getMinutes() + ":" + today.getSeconds();

        fetch("api.php", {
            method: "POST",
            body: JSON.stringify({
                "country": countryName,
                "code": shortCut,
                "city": place.address_components[0].long_name,
                "locality": place.geometry.location.toString(),
                "time": currentDate
            })
        }).then(response => response.json()).then(result => JSON.stringify(result, undefined, 4));
    });
})

function convertTemp(value) {
    return (value - 273).toFixed(2)
}

function hasNumber(myString) {
    return /\d/.test(myString);
}
