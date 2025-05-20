*** Settings ***
Documentation    All the Page objects and Keywords of Validate Cancel button
Library    SeleniumLibrary

*** Variables ***
${addtocart}    id:add-to-cart-sauce-labs-backpack
${shoppingCart}    xpath://a[@data-test='shopping-cart-link']
${checkout}    id:checkout
${firstname}    id:first-name
${lastname}    id:last-name
${Zipcode}    id:postal-code
${continue}    id:continue
${cancel}    id:cancel

*** Keywords ***
click the add to cart for a product
    Click Button    ${addtocart}

click the shopping cart link
    Click Element    ${shoppingCart}

click the checkout button
    Click Button    ${checkout}

provide the firstname
    Input Text    ${firstname}    Yuvaraj

provide the lastname
    Input Text    ${lastname}    raj

provide the zipcode
    Input Text    ${Zipcode}    636305

click the continue btn
    Click Button    ${continue}

click the cancel btn
    Click Button    ${cancel}

verify the page is the home page
    Page Should Contain    Products
     
    

