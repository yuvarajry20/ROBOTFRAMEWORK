*** Settings ***
Documentation    Tests to Validate the filter button
Library    SeleniumLibrary
Test Setup    Open the browser with URL
Test Teardown    Close the browser Session
Resource    ../Resources/GenericResources.robot
Resource   ../Resources/LoginResources.robot
Resource    ../Resources/FilterResources.robot

*** Variables ***
${username}    standard_user
${password}    secret_sauce


*** Test Cases ***
Add the product to the cart and remove the product 

    LoginResources.Fill the login form    ${username}    ${password}
    FilterResources.get the products price list before using filter
    FilterResources.click the filter option and select the price low to high
    FilterResources.now get the products according to the selected filter option




