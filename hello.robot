*** Settings ***
Library    SeleniumLibrary
Library    String

*** Test Cases ***
ค้นหาคำว่า robot เจอ ด้วย browser chrome
    ผู้ใช้งานไปยังหน้าค้นหาด้วย url google.com
    ค้นหาข้อมูลด้วยคำว่า robot
    จะพบข้อมูลและแสดงผลการค้นหาได้อย่างถูกต้อง

*** Keywords ***
จะพบข้อมูลและแสดงผลการค้นหาได้อย่างถูกต้อง
    Wait Until Element Contains   id:result-stats   ผลการค้นหาประมาณ
    Wait Until Element Contains   id:result-stats   รายการ
    Wait Until Element Contains   id:result-stats   (
    Wait Until Element Contains   id:result-stats   )
    ${result}=  Get Text  id:result-stats
    Log To Console    ${result}
    @{words}=    Split String    ${result}    ${SPACE}
    Log To Console    ${words[0]}
    Log To Console    ${words[1]}
    Log To Console    ${words[2]}
    Log To Console    ${words[3]}
    Log To Console    ${words[4]}
    Should Be Equal   ผลการค้นหาประมาณ   ${words[0]}
    Should Be Equal   รายการ   ${words[2]}
    Should Start With   ${words[3]}   (
    Should End With   ${words[4]}   )

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