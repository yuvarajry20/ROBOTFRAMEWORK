*** Settings ***
Documentation    Tests to login to login Page
Library    SeleniumLibrary
Resource    resources.robot

*** Variables ***
${login_error_Message}    css:.oxd-alert-content--error
${Dashboard_Text}    css:.oxd-topbar-header-breadcrumb-module

*** Test Cases ***
Validate Unsuccessfull Login
    [Tags]    Smoke    Regression
    Open the Browser with URL
    Fill the login form    ${invalid_password}    ${invalid_password}
    verify error message on login page
    Close Browser Session

Validate Successfull Login
    [Tags]    UIT
    Open the browser with URL
    Fill the login form    ${valid_username}    ${valid_password}
    Verify Dashboard page opens
    Close Browser Session

*** Keywords ***
Fill the login form
    [Arguments]    ${username}    ${password}
    Input Text    css:input[name=username]    ${username}
    Input Password    css:input[name=password]    ${password}
    Click Button    class:orangehrm-login-button

verify error message on login page
    Element Text Should Be    ${login_error_Message}    Invalid credentials

Verify Dashboard page opens
    Element Text Should Be    ${Dashboard_Text}    Dashboard

Close Browser Session
    Close Browser
    