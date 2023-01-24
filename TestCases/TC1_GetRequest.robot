*** Settings ***
Library    RequestsLibrary
Library    Collections

*** Variables ***
${base_url}    https://thetestingworldapi.com
${label}    studentsDetails

*** Test Cases ***
Get_Books_Request
    create session    mysession    ${base_url}
    ${response} =    get on session    mysession    /api/${label}
#    log to console    ${response.status_code}
#    log to console    ${response.content}
#    log to console    ${response.headers}

#Validations
    ${status_code} =    convert to string    ${response.status_code}
    should be equal    ${status_code}    200

    ${body} =    convert to string    ${response.content}
    should contain    ${body}    Sush

    ${connection_value} =    get from dictionary    ${response.headers}    Content-Type
    should be equal    ${connection_value}    application/json; charset=utf-8
