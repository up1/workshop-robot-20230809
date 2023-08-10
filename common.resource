*** Settings ***
Library  SeleniumLibrary

*** Keywords ***
ทำการเปิด url="${target_url}" ใน browser "${browser_type}"
    Open Browser    ${target_url}    ${browser_type} 
    ...  remote_url=http://178.128.214.165:4444/wd/hub
    Maximize Browser Window
Try to open in browser
    [Arguments]  ${target_url}  ${browser_type}
    Open Browser    ${target_url}    ${browser_type} 
    ...  remote_url=http://178.128.214.165:4444/wd/hub
    Maximize Browser Window