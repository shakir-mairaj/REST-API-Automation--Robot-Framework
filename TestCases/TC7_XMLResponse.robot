*** Settings ***
Library    XML
Library    os
Library    Collections
Library    RequestsLibrary

*** Variables ***
${base_url}=    http://thomas-bayer.com

*** Test Cases ***
TestingXMLResponse
    create session    mysession    ${base_url}
    ${response}=    get on session    mysession    /sqlrest/CUSTOMER/15
    ${xml_string}=    convert to string    ${response.content}
    ${xml_obj}=    parse xml    ${xml_string}

    ${cus_firstname}=    get element text    ${xml_obj}    .//FIRSTNAME
    log to console    ${cus_firstname}

    #Check Single Element value
    element text should be   ${xml_obj}    15    .//ID

    #Check Multiple element values
    ${child_elements}=    get child elements    ${xml_obj}

    ${id}=    get element text    ${child_elements[0]}
    ${f_name}=    get element text    ${child_elements[1]}
    ${l_name}=    get element text    ${child_elements[2]}
    ${street}=    get element text    ${child_elements[3]}
    ${city}=    get element text    ${child_elements[4]}

    should be equal    ${id}    15
    should be equal    ${f_name}    Bill
    should be equal    ${l_name}    Clancy
    should be equal    ${street}    319 Upland Pl.
    should be equal    ${city}    Seattle


