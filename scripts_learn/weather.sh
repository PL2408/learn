#!/bin/bash

# API key from OpenWeatherMap
api_key="your_api_key_here"

# City and country code (e.g. "New York,US")
city="New York,US"

# URL to query
url="http://api.openweathermap.org/data/2.5/weather?q=$city&appid=$api_key&units=metric"

# Make the API request and store the JSON response in a variable
response=$(curl --silent $url)

# Extract the desired information from the JSON response
description=$(echo $response | jq -r '.weather[0].description')
temp=$(echo $response | jq -r '.main.temp')
humidity=$(echo $response | jq -r '.main.humidity')
wind_speed=$(echo $response | jq -r '.wind.speed')

# Print the weather information
echo "Weather in $city:"
echo "Description: $description"
echo "Temperature: $temp °C"
echo "Humidity: $humidity %"
echo "Wind speed: $wind_speed m/s"

