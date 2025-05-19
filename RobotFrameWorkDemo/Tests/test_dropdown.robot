*** Settings ***
Documentation     To validate the Dropdown
Library           SeleniumLibrary
Test Teardown     Close Browser

*** Test Cases ***
Select Options in Dropdown
    Open the browser with URL
    Select the dropdown options APIs by Value
    Select the dropdown options Microsoft Excel by index
    Select the dropdown options CSS by label

*** Keywords ***
Open the browser with URL
    Create Webdriver    Chrome
    Go To    https://demo.automationtesting.in/Register.html
    Maximize Browser Window
    Set Selenium Implicit Wait    5

Select the dropdown options APIs by Value
    Select From List By Value    id:Skills    APIs

Select the dropdown options Microsoft Excel by index
    Select From List By Index    id:Skills    43

Select the dropdown options CSS by label
    Select From List By Label    id:Skills    CSS