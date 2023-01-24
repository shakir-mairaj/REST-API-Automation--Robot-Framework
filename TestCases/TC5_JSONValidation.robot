*** Settings ***
Library    JSONLibrary
Library    os
Library    Collections
Library    RequestsLibrary

*** Variables ***
${base_url}=    https://restcountries.com

*** Test Cases ***
ValidatingcomplexJSON(Get_countryinfo)
    create session    mysession    ${base_url}
    ${response}=    get on session    mysession    /v3.1/name/peru

    ${json_obj}=    to json    ${response.content}     #converting response content in json format

   #Data Validations
    ${country_name}=    get value from json    ${json_obj}    $[0].name.common
    log to console    ${country_name[0]}
    should be equal    ${country_name[0]}    Peru

    # Single and multiple data validation in an array
    ${borders}=    get value from json    ${json_obj}    $[0].borders[2]
    log to console    ${borders[0]}
    should be equal    ${borders[0]}    CHL

    ${allborders}=    get value from json    ${json_obj}    $[0].borders
    log to console    ${allborders[0]}
    should contain any    ${allborders[0]}    BOL    BRA    CHL





