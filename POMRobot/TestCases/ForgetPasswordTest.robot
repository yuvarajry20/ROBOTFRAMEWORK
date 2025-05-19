*** Settings ***
Documentation    Tests to validate Forgot Your Password Page functionality
Library    SeleniumLibrary
Test Setup    Open the browser with URL
Test Teardown    Close the browser Session
Resource    ../Resources/GenericResources.robot
Resource   ../Resources/LoginResources.robot
Resource    ../Resources/ForgetPasswordResources.robot

*** Test Cases ***
Validate Reset Password Functionality

    LoginResources.Go to Forgot Your Password Page
    ForgetPasswordResources.Verify Forgot your password page opens
    ForgetPasswordResources.Fill the forgot Password Page
    ForgetPasswordResources.Verify the message

Validate Cancel Functionality

    LoginResources.Go to Forgot Your Password Page
    ForgetPasswordResources.Verify Forgot your password page opens
    ForgetPasswordResources.cancel the reset password
    ForgetPasswordResources.Verify that login page is displayed






