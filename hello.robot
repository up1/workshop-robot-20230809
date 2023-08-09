*** Settings ***
Library    SeleniumLibrary

*** Test Cases ***
ค้นหาคำว่า robot เจอ ด้วย browser chrome
    ผู้ใช้งานไปยังหน้าค้นหาด้วย url google.com
    ค้นหาข้อมูลด้วยคำว่า robot
    จะพบข้อมูลและแสดงผลการค้นหาได้อย่างถูกต้อง

*** Keywords ***
จะพบข้อมูลและแสดงผลการค้นหาได้อย่างถูกต้อง
    ${result}=  Get Text  id:result-stats
    Log To Console    ${result}

ค้นหาข้อมูลด้วยคำว่า robot
    Input Text   name:q    robot
    Press Keys   name:q    RETURN

ผู้ใช้งานไปยังหน้าค้นหาด้วย url google.com
    Open Browser    https://www.google.com    gc   
    ...    options=add_experimental_option("detach", True)
    Maximize Browser Window
    # Set Window Size   420   521
    Wait Until Element Is Enabled   name:q
    Element Should Be Visible   name:q