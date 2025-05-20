*** Settings ***
Documentation    Tests to Validate the AddtoCart remove button
Library    SeleniumLibrary
Test Setup    Open the browser with URL
Test Teardown    Close the browser Session
Resource    ../Resources/GenericResources.robot
Resource   ../Resources/LoginResources.robot
Resource    ../Resources/RemoveAddtoCartResources.robot

*** Variables ***
${username}    standard_user
${password}    secret_sauce


*** Test Cases ***
Add the product to the cart and remove the product 

    LoginResources.Fill the login form    ${username}    ${password}
    RemoveAddtoCartResources.get the text of the product to add to cart    
    RemoveAddtoCartResources.click the Add to cart button
    RemoveAddtoCartResources.click the Shopping cart button
    RemoveAddtoCartResources.check the same product is added in the shopping cart
    RemoveAddtoCartResources.click the remove button in the shopping cart
    RemoveAddtoCartResources.now check the product is removed successfully




