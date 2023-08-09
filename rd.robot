*** Settings ***
Library   SeleniumLibrary

*** Test Cases ***
Flow UI ไปยังหน้า login
    เข้าหน้าแรกของระบบยื่นภาษี
    ทำการดูรายละเอียดของการประกาศ
    ทำการปิดหน้าการประกาศ
    # ไปยังหน้า login เพื่อเข้าระบบยื่นภาษี

*** Keywords ***
ทำการดูรายละเอียดของการประกาศ
    Wait Until Element Is Visible   id:announceModal
    Click Element    xpath://*[@id="announceModal"]/div/div/div[2]/div/div[2]/span/a

    Switch Window	NEW
    Wait Until Element Contains   xpath://div[6]/div[1]/div/h5
    ...    E-Payment

ทำการปิดหน้าการประกาศ
    Switch Window	MAIN
    Click Element   xpath://*[@id="announceModal"]/div/div/div[1]/button
    
เข้าหน้าแรกของระบบยื่นภาษี
    Open Browser    https://efiling.rd.go.th/rd-cms/    gc   
    ...    options=add_experimental_option("detach", True)
    Maximize Browser Window