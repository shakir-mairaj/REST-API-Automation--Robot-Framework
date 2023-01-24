*** Settings ***
Library    XML
Library    os
Library    Collections

*** Test Cases ***
TC1:
    ${xml_obj}=    parse xml    C:/employees.xml

#Validations to check single element value
#Approach1:
    ${emp_firstname}=    get element text    ${xml_obj}    .//employee[1]/firstName
    log to console    ${emp_firstname}
    should be equal    ${emp_firstname}    Leonardo

#Approach2:
    ${emp_firstname}=    get element    ${xml_obj}    .//employee[1]/firstName
    log to console    ${emp_firstname.text}
    should be equal    ${emp_firstname.text}    Leonardo

#Approach3:
    element text should be    ${xml_obj}    Leonardo    .//employee[1]/firstName

#Validations to check count of elements
    ${count}=    get element count    ${xml_obj}    .//employee
    should be equal as integers    ${count}    3

# To check attribute presence
    element attribute should be    ${xml_obj}    id    ab2    .//employee[2]
    element attribute should be    ${xml_obj}    id    xz3    .//employee[3]

# to get value of child elements
    ${child_elements}=    get child elements    ${xml_obj}    .//employee[1]
    should not be empty    ${child_elements}
    ${first_name}=    get element text    ${child_elements[0]}
    ${last_name}=    get element text    ${child_elements[1]}

    log to console    ${first_name}
    log to console    ${last_name}

    should be equal as strings    ${first_name}    Leonardo
    should be equal as strings    ${last_name}    DiCaprio

