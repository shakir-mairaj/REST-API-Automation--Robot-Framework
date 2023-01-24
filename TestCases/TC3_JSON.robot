*** Settings ***
Library    JSONLibrary
Library    os
Library    Collections

*** Test Cases ***
Testcase1:
    ${json_obj}=    load json from file    C:/jsondata.json
    ${name_val}=    get value from json    ${json_obj}    $.Name
    log to console    ${name_val[0]}
    should be equal    ${name_val[0]}    John

    ${street_address}=    get value from json    ${json_obj}    $.Address.streetname
    log to console    ${street_address[0]}
    should be equal    ${street_address[0]}    xyz

    ${city_name}=    get value from json    ${json_obj}    $.city[1]
    log to console    ${city_name[0]}
    should be equal   ${city_name[0]}    bangalore