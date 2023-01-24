*** Settings ***
Library    RequestsLibrary
Library    Collections

*** Variables ***
${base_url} =    https://thetestingworldapi.com/api

*** Test Cases ***
PostRequestTest
    create session    mysession    ${base_url}
    ${body} =    create dictionary     first_name= shakir1122    middle_name= mairaj3222    last_name= mufti4333   date_of_birth= 1992
    ${header} =    create dictionary    Content-Type=application/json
    ${response} =    post request    mysession    /studentsDetails    data=${body}    headers=${header}

    log to console    ${response}
    log to console    ${response.content}
    log to console    ${response.status_code}

    #Validations

    ${status_code}=    convert to string    ${response.status_code}
    should be equal    ${status_code}    201

#    ${response_content}=    convert to string    ${response.content}
#    should contain    ${response_content}    OPERATION_SUCCESS
#    should contain    ${response_content}    Operation completed successfully





