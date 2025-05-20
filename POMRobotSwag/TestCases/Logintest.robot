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
Validate Login with    ${username}    ${password}

*** Keywords ***
Validate Login Scenarios
    [Arguments]    ${username}    ${password} 
    LoginResources.Fill the login form    ${username}    ${password}
    
    IF    '${username}' == 'standard_user' or '${username}'=='performance_glitch_user' or '${username}'=='error_user' or '${username}'=='visual_user'
        LoginResources.Verify the product title
    ELSE IF    '${username}' == 'locked_out_user'
        LoginResources.Verify the error message is displayed for lockedoutuser
    ELSE IF    '${username}' == 'problem_user'
        LoginResources.Verify the error message is displayed for wrong Credentials
    ELSE IF    '${password}' == 'emptyusername'
        LoginResources.verify the error message is displayed for empty username
    ELSE IF    '${username}' == 'emptypassword'
        LoginResources.Verify the error message is displayed for empty password
    END