*** Settings ***
Library    RequestsLibrary
Library    Collections

*** Variables ***

${base_url}=    https://jsonplaceholder.typicode.com

*** Test Cases ***
ValidatingHeaders
    create session    mysession    ${base_url}
    ${response}=    get on session    mysession    /comments
    log to console    ${response.headers}

    ${contenttypevalue}=    get from dictionary    ${response.headers}    Content-Type
    should be equal    ${contenttypevalue}    application/json; charset=utf-8

Validatingcookies
    create session    mysession    ${base_url}
    ${response}=    get on session    mysession    /comments
    log to console    ${response.cookies}
