*** Settings ***
Library    FakerLibrary

*** Test Cases ***
Try to generate credit card number
    FOR    ${index}    IN RANGE    10
        ${result}=  Credit Card Number
        ${lastname}=  Last Name
        Log To Console    ${lastname},${result}
    END
    