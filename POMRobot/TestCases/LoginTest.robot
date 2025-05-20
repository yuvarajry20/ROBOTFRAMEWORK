*** Settings ***
Documentation    To validate the login form
Library    SeleniumLibrary
Library    DataDriver    file=../Resources/LoginData.csv    encoding=utf_8    dialect=unix
Test Template    validate Unsuccessful Login

*** Variables ***

${browser}    Chrome
${login_btn}    css:.orangehrm-login-button
${login_error_message}    css:.oxd-alert-content--error
${username}    abc
${password}    123


*** Test Cases ***
Login to form using    ${username}    ${password}

*** Keywords ***

Validate Unsuccessful Login
    [Arguments]    ${username}    ${password}
    Open the browser with URL
    Fill the login Form    ${username}    ${password}
    Verify the error message is correct

Open the browser with URL
    Create Webdriver    ${browser}
    Go To    https://opensource-demo.orangehrmlive.com/web/index.php/auth/login
    Maximize Browser Window
    Set Selenium Implicit Wait    5

Fill the login Form
    [Arguments]    ${username}    ${password}
    Input Text    css:input[name=username]    ${username}
    Input Password    css:input[name=password]    ${password}
    Click Button    ${login_btn}

Verify the error message is correct
    Element Text Should Be    ${login_error_message}    Invalid credentials