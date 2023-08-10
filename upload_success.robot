*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${upload_form}    //*[@id="ng-app"]/body/div/div[2]/div[1]/input[2]

*** Test Cases ***
Success with upload 3 files
    ไปยังหน้า upload file
    ทำการเลือก 3 file ที่จะ upload
    ทำการ upload file ที่หนึ่ง และ ตรวจสอบผล
    ทำการ upload file ที่สอง และ ตรวจสอบผล
    ทำการ upload file ที่สาม และ ตรวจสอบผล
    ตรวจสอบผลการ upload เมื่อครบทั้ง 3 file

*** Keywords ***
ทำการเลือก 3 file ที่จะ upload
    Choose File	    xpath:${upload_form}	    
    ...    ${CURDIR}/files/1.txt
    Choose File	    xpath:${upload_form}
    ...    ${CURDIR}/files/2.txt
    Choose File	    xpath:${upload_form}
    ...    ${CURDIR}/files/3.txt
    # Check stage ของ first page !!!

ไปยังหน้า upload file
    Open Browser    http://nervgh.github.io/pages/angular-file-upload/examples/simple/
    ...    chrome
    ...    options=add_experimental_option("detach", True)
    Maximize Browser Window
    # Check stage ของ first page !!!
