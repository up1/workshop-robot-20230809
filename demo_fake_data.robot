*** Settings ***
Library    FakerLibrary

*** Test Cases ***
Try to generate credit card number
    FOR    ${index}    IN RANGE    10
        ${result}=  Credit Card Number
        ${firstname}=  First Name
        ${lastname}=  Last Name
        Log To Console    ${firstname} ${lastname},${result}
    END
    