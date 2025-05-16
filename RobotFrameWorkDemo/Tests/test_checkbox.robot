*** Settings ***
Documentation     To validate the checkBox
Library    SeleniumLibrary
Test Teardown     Close Browser Session

*** Variables ***
${url}    https://demo.automationtesting.in/Register.html

*** Test Cases ***
Select an option of checkbox
    Open the Browser with URL
    verify page contains a checkbox
    select the checkbox options Cricket and Hockey
    Unselect the checkbox option Hockey
    Verify Checkbox option cricket is selected
    Verify Checkbox option Hockey is selected

*** Keywords ***            
Open the browser with URL
    Open Browser     browser=firefox
    Go To    ${url}
    Maximize Browser Window
    Set Selenium Implicit Wait    10

verify page contains a checkbox
    Page Should Contain Checkbox    id:checkbox1
    Page Should Not Contain Checkbox    name:radiooptions

select the checkbox options Cricket and Hockey
    Select Checkbox    id:checkbox1
    Select Checkbox    id:checkbox3

Unselect the checkbox option Hockey
    Unselect Checkbox    id:checkbox3

Verify Checkbox option cricket is selected
    Checkbox Should Be Selected    id:checkbox1

Verify Checkbox option Hockey is selected
    Checkbox Should Not Be Selected    id:checkbox3

Close Browser Session
    Close Browser