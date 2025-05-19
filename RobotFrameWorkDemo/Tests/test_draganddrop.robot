*** Settings ***
Documentation     To validate the Drag and drop
Library           SeleniumLibrary
Test Teardown     Close Browser

*** Variables ***
${browser_name}    chrome

*** Test Cases ***
Verify that user can drag and drop elements
    Open the browser with URL
    Verify element Text before drag
    Drag the element and drop
    verify element text after drag

*** Keywords ***
Open the browser with URL
    Create Webdriver    ${browser_name}
    Go To    https://demoqa.com/droppable
    Maximize Browser Window
    Set Selenium Implicit Wait    5

Verify element Text before drag
    Element Text Should Be    id:droppable    Drop here    timeouts=5

Drag the element and drop
    Drag And Drop    id:draggable    id:droppable

verify element text after drag
    Element Text Should Be    id:droppable    Dropped!    timeout=5