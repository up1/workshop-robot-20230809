*** Settings ***
Library    String
Resource   common.resource
Suite Setup   ผู้ใช้งานไปยังหน้าค้นหาด้วย url google.com
Test Teardown   กลับไปยังหน้าแรกของ google.com
Test Template   Seaech success template
*** Test Cases ***
Case 01   robot
Case 02   swpark
Case 03   hello

*** Keywords ***
Seaech success template
    [Arguments]  ${keyword}
    ค้นหาข้อมูลด้วยคำว่า ${keyword}
    จะพบข้อมูลและแสดงผลการค้นหาได้อย่างถูกต้อง

กลับไปยังหน้าแรกของ google.com
    Go To    https://www.google.com

ค้นหาข้อมูลด้วยคำว่า ${keyword}
    Input Text   name:q    ${keyword}
    Press Keys   name:q    RETURN

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

ผู้ใช้งานไปยังหน้าค้นหาด้วย url google.com
    # Try to open in browser   https://www.google.com  gc
    ทำการเปิด url="https://www.google.com" ใน browser "chrome"
    # Set Window Size   420   521
    Wait Until Element Is Enabled   name:q
    Element Should Be Visible   name:q
