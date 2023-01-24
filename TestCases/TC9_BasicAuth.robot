# 3 Authentication types:
Basic Authentication
Bearer Token Authentication
API Key Authentication

*** Settings ***
Library               RequestsLibrary
Library               Collections

*** Variables ***
${base_url}     https://postman-echo.com

*** Test Cases ***
BasicAuthverify

    ${auth}=  create list    postman     password
    create session    mysession    ${base_url}    auth=${auth}
    ${response}=    get on session    mysession    /basic-auth

    Log To Console    ${response.status_code}
    Log To Console    ${response.content}
    should be equal as strings    ${response.status_code}    200