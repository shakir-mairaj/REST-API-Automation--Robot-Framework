*** Settings ***
Library    RequestsLibrary
Library    Collections
Library    OperatingSystem

*** Variables ***
${base_url}=    https://certtransaction.elementexpress.com
${bearertoken}=  "Bearer  E4F284BFADA11D01A52508ED7B92FFD7EE0905659F5DED06A4B73FC7739B48A287648801"

*** Test Cases ***
BearerAuthTest
    create session    mysession    ${base_url}

    ${headers}=    create dictionary    Authorization=${bearertoken}    Content-Type=text/xml
    ${req_body}=    get file    C:/books.txt
    ${response}=    post request    mysession  /    data=${req_body}    headers=${headers}
    log to console    ${response.content}
    log to console    ${response.status_code}