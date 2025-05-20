*** Settings ***
Documentation    All the Page objects and Keywords of AddtoCart page
Library    SeleniumLibrary

*** Variables ***
${addtocart}    id:add-to-cart-sauce-labs-backpack
${shoppingCart}    xpath://a[@data-test='shopping-cart-link']
${productsaucelabs}    id:item_4_title_link
${remove}    id:remove-sauce-labs-backpack

*** Keywords ***
get the text of the product to add to cart
    ${product_text}=    Get Text    ${productsaucelabs}
    Log To Console    ${product_text}

click the Add to cart button
    Click Button    ${addtocart}

click the Shopping cart button
    Click Element    ${shoppingCart}

check the same product is added in the shopping cart
    Element Text Should Be    ${productsaucelabs}    Sauce Labs Backpack
    
click the remove button in the shopping cart
    Click Button    ${remove}

now check the product is removed successfully
    Element Should Not Be Visible    ${productsaucelabs}





