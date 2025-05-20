*** Settings ***
Documentation    All the Page objects and Keywords of filter
Library    SeleniumLibrary
Library    Collections

*** Variables ***
${pricelist}    //div[@class='inventory_item_price']
${filter}    //div[@class='right_component']

*** Keywords ***
get the products price list before using filter
    ${elements}=    Get WebElements    ${pricelist}
    FOR    ${element}    IN    @{elements}
        Log To Console   ${element.text}
    END

click the filter option and select the price low to high
    Click Element    ${filter}
    Select From List By Value    css:.product_sort_container    lohi 

now get the products according to the selected filter option
    @{expectedlist}=    Create List    $7.99    $9.99    $15.99    $15.99    $29.99    $49.99
    ${elements}=    Get WebElements    ${pricelist}
    @{actualList}=    Create List
    FOR    ${element}    IN    @{elements}
        Log To Console   ${element.text}
        Append To List    ${actualList}     ${element.text}
    END
    Lists Should Be Equal    ${actualList}    ${expectedlist}   
    