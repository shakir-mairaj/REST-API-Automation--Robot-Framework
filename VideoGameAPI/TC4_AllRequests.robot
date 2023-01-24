*** Settings ***
Library    RequestsLibrary
Library    Collection

*** Variables ***
${base_url}=    http://localhost:8080

*** Test Cases ***
TC1:Get(Return All video games)
    create session    mysession    ${base_url}
    ${response}=    get on session    mysession    /app/videogames
    log to console    ${response.status_code}
    log to console    ${response.content}

    #Validation
    ${status_code} =    convert to string    ${response.status_code}
    should be equal    ${status_code}    200

TC2:POST(Add new video game)
    create session    mysession    ${base_url}
    ${body}=    create dictionary     id=1500    name=smd    releaseDate=2023-01-21T17:36:37.130Z    reviewScore=3    category=string    rating=string
    ${header}=  create dictionary    Content-Type=application/json
    ${response}=    post request    mysession    /app/videogames    data=${body}    headers=${header}

    log to console    ${response.status_code}
    log to console    ${response.content}

    #Validations
    ${status_code}=    convert to string    ${response.status_code}
    should be equal    ${status_code}    200
    ${res_body}=    convert to string    ${response.content}
    should contain    ${res_body}    Record Added Successfully

TC3:GET(Return by ID)
    create session    mysession    ${base_url}
    ${response}=    get on session    mysession    /app/videogames/1500
    log to console    ${response.content}
    log to console    ${response.status_code}

    #Validations
    ${status_code}=    convert to string    ${response.status_code}
    should be equal    ${status_code}    200
    ${res_body}=    convert to string    ${response.content}
    should contain    ${res_body}    smd

TC4:PUT(Update the request details)
    create session    mysession    ${base_url}
    ${body}=    create dictionary     id=1500    name=das    releaseDate=2023-01-21T17:36:37.130Z    reviewScore=3    category=string    rating=string
    ${header}=  create dictionary    Content-Type=application/json
    ${response}=    put request    mysession    /app/videogames/1500    data=${body}    headers=${header}

    log to console    ${response.status_code}
    log to console    ${response.content}

    #Validations
    ${status_code}=    convert to string    ${response.status_code}
    should be equal    ${status_code}    200
    ${res_body}=    convert to string    ${response.content}
    should contain    ${res_body}    das

TC5:Delete(Delete by ID)
    create session    mysession    ${base_url}
    ${response}=    delete request    mysession    /app/videogames/1500

    #Validations
    ${status_code}=    convert to string    ${response.status_code}
    should be equal    ${status_code}    200

    ${res_body}=    convert to string    ${response.content}
    should contain    ${res_body}    Record Deleted Successfully