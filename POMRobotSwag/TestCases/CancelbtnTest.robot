*** Settings ***
Documentation    Tests to Validate the Checkout cancel button
Library    SeleniumLibrary
Test Setup    Open the browser with URL
Test Teardown    Close the browser Session
Resource    ../Resources/GenericResources.robot
Resource   ../Resources/LoginResources.robot
Resource    ../Resources/CancelbtnResources.robot

*** Variables ***
${username}    standard_user
${password}    secret_sauce


*** Test Cases ***
Add the product to the cart and go to checkout and verify the cancel button

    LoginResources.Fill the login form    ${username}    ${password}
    CancelbtnResources.click the add to cart for a product
    CancelbtnResources.click the shopping cart link
    CancelbtnResources.click the checkout button
    CancelbtnResources.provide the firstname
    CancelbtnResources.provide the lastname
    CancelbtnResources.provide the zipcode
    CancelbtnResources.click the continue btn
    CancelbtnResources.click the cancel btn
    CancelbtnResources.verify the page is the home page




