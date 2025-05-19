*** Settings ***
Documentation     To validate the Alert
Library           SeleniumLibrary
Test Teardown     Close Browser

*** Variables ***
${okOption}    //button[@class='btn btn-danger']

*** Test Cases ***
Handle Alerts
    Open the browser with URL
    Select the alert with Ok button
    verify text on Alert box
    select the alert with OK and cancel button
    select the alert with text box


*** Keywords ***
Open the browser with URL
    Create Webdriver    Chrome
    Go To    https://demo.automationtesting.in/Alerts.html
    Maximize Browser Window
    Set Selenium Implicit Wait    15

Select the alert with Ok button
    Click Element    ${okOption}

verify text on Alert box
    Alert Should Be Present    I am an alert box!    ACCEPT

select the alert with OK and cancel button
    Click Element    xpath://a[text()='Alert with OK & Cancel ']
    Click Button    xpath://button[text()='click the button to display a confirm box ']
    Handle Alert    action=DISMISS

select the alert with text box
    Click Element    xpath://a[text()='Alert with Textbox ']
    Click Button    xpath://button[text()='click the button to demonstrate the prompt box ']
    Input Text Into Alert    Hai 
    # ${message}=    Handle Alert
    # Log To Console    ${message}
    # Handle Alert
    Page Should Contain    Hello Hai How are you today
    # Handle Alert

