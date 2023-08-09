*** Settings ***
Library    SeleniumLibrary

*** Test Cases ***
ค้นหาคำว่า robot เจอ ด้วย browser chrome
    ผู้ใช้งานไปยังหน้าค้นหาด้วย url google.com
    ค้นหาข้อมูลด้วยคำว่า robot
    จะพบข้อมูลและแสดงผลการค้นหาได้อย่างถูกต้อง

*** Keywords ***
ผู้ใช้งานไปยังหน้าค้นหาด้วย url google.com
    Open Browser    https://www.google.com    gc   
    ...    options=add_experimental_option("detach", True)