*** Settings ***
Documentation     To validate the radio button
Library    SeleniumLibrary
Test Teardown     Close Browser Session

*** Variables ***
${url}    https://demo.automationtesting.in/Register.html

*** Test Cases ***
Select an option of Radio Button
    Open the Browser with URL
    select impressive option from 3 radio buttons
    verify that the radio button is selected

*** Keywords ***            
Open the browser with URL
    Open Browser     browser=firefox
    Go To    ${url}
    Maximize Browser Window
    Set Selenium Implicit Wait    10

select impressive option from 3 radio buttons
    Page Should Contain Radio Button    name:radiooptions
    Page Should Not Contain Radio Button    id:checkbox1
    Select Radio Button    name:radiooptions    Male

verify that the radio button is selected
    Radio Button Should Be Set To    radiooptions    Male

Close Browser Session
    Close Browser