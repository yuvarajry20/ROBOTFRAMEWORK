*** Settings ***
Documentation    Generic resources for the project
Library    SeleniumLibrary
Test Template     Validate unsucessful login 

*** Variables ***
${login_error_message}    css:.oxd-alert-content--error

*** Test Cases ***             username          password
Invalid Username               abc               admin123
Invalid password               Admin             abc
Special characters             @#$               %$^&
Invalid username and Password  abc               abc123

*** Keywords ***
Validate unsucessful login 
    [Arguments]    ${username1}    ${password1}
    Open the browser with URL
    Fill the login Form    ${username1}    ${password1}
    Verify the error message is correct
    Close Browser Session

Open the browser with URL
    Create Webdriver    Chrome
    Go To    https://opensource-demo.orangehrmlive.com/web/index.php/auth/login
    Maximize Browser Window
    Set Selenium Implicit Wait    5

Fill the login Form
    [Arguments]    ${username}    ${password}
    Input Text    css:input[name=username]    ${username}
    Input Password    css:input[name=password]    ${password}
    Click Button    class:orangehrm-login-button

Verify the error message is correct
    Element Text Should Be    ${login_error_message}    Invalid credentials

Close Browser Session
    Close Browser

    
