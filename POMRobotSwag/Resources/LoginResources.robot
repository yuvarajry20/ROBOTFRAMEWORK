*** Settings ***
Documentation    All the Page objects and Keywords of logging page
Library    SeleniumLibrary

*** Variables ***
${products_title}    xpath://span[text()='Products']
${error_msg}    xpath://h3[@data-test='error']

*** Keywords ***
Fill the login form
    [Arguments]    ${username}    ${password}
    Input Text    id:user-name    ${username}
    Input Password    id:password    ${password}
    Click Button    id:login-button

Verify the error message is displayed for lockedoutuser
    Element Text Should Be    ${error_msg}    Epic sadface: Sorry, this user has been locked out.

Verify the error message is displayed for wrong Credentials
    Element Text Should Be    ${error_msg}    Epic sadface: Username and password do not match any user in this service

Verify the error message is displayed for empty password
    Element Text Should Be    ${error_msg}    Epic sadface: Password is required

verify the error message is displayed for empty username
    Element Text Should Be    ${error_msg}    Epic sadface: Username is required

Verify the product title 
    Element Text Should Be    ${products_title}    Products

