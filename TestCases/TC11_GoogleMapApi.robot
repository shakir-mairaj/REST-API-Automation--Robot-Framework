#https://developers.google.com/maps/documentation
#Key Generation:
#1. Create a project in Google Developer COnsole
#2. Create API key for that project
#3. Enable Places API
#4. Use the API key here in the request
https://maps.googleapis.com/maps/api/place/nearbysearch/json?
    #location=-33.8670522,151.1957362
    #&radius=500
    #&types=food
    #&name=harbour
    #&key=YOUR_API_KEY
# Billing needs to be enabled in Google Cloud to use Google Maps API

*** Settings ***
Library    RequestsLibrary
Library    Collections

*** Variables ***
${base_url}=    https://maps.googleapis.com
${req_url}=    /maps/api/place/nearbysearch/json?

*** Test Cases ***
GoogleMapAPITest
    create session    mysession    ${base_url}
    ${params}    create dictionary    location=-33.8670522,151.1957362    radius=500    types=food    name=harbour    key=YOUR_API_KEY
    ${response}=    get on session    mysession    ${base_url}    params=${params}

    log to console    ${response.status_code}
    log to console    ${response.content}
