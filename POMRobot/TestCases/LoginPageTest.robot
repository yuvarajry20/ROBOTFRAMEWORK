*** Settings ***
Documentation    Tests to Login to Login Page
Library    SeleniumLibrary
Test Setup    Open the browser with URL
Test Teardown    Close the browser Session
Resource    ../Resources/GenericResources.robot
Resource   ../Resources/LoginResources.robot
Resource    ../Resources/DashBoardResources.robot

*** Test Cases ***
Validate Unsuccessful Login using invalid credentials

    LoginResources.Fill the login form    ${valid_username}    ${invalid_password}
    LoginResources.Verify the error message is correct

Validate Unsuccessful Login for blank username

    LoginResources.Fill the login form    ${blank_username}    ${valid_password}
    LoginResources.Verify the error message is displayed for username

Validate Unsuccessful Login for blank password

    LoginResources.Fill the login form    ${valid_username}    ${blank_password}
    LoginResources.Verify the error message is displayed for password

Validate successful Login

    LoginResources.Fill the login form    ${valid_username}    ${valid_password}
    DashBoardResources.verify Dashboard page opens




