*** Settings ***
Documentation    Tests to Login to Login Page
Library    SeleniumLibrary
Test Setup    Open the browser with URL
Test Teardown    Close the browser Session
Resource    ../Resources/GenericResources.robot
Resource    ../Resources/LoginResources.robot
Library    DataDriver    file=../Resources/TestDataLogin.xlsx    sheet_name=Sheet1
Test Template    Validate Login Scenarios

*** Variables ***
${username}
${password}
${expected_result}

*** Test Cases ***
Validate Login with    ${username}    ${password}    ${expected_result}

*** Keywords ***
Validate Login Scenarios
    [Arguments]    ${username}    ${password}    ${expected_result}
    LoginResources.Fill the login form    ${username}    ${password}
    
    IF    '${expected_result}' == 'success'
        LoginResources.Verify the product title
    ELSE IF    '${expected_result}' == 'locked_out'
        LoginResources.Verify the error message is displayed for lockedoutuser
    ELSE IF    '${expected_result}' == 'wrong'
        LoginResources.Verify the error message is displayed for wrong Credentials
    END