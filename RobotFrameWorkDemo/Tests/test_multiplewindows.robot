*** Settings ***
Documentation     To validate the MultipleWindows
Library           SeleniumLibrary
Test Teardown     Close Browser

*** Variables ***
${mainPageText}    //h1[text()='Automation Demo Site ']

*** Test Cases ***
Handle Multiple Windows
    Open the browser with URL
    Select the button to switch to child window
    verify the child window is opened
    verify the user is switched back to parent window
    verify the user is switched back to child window

*** Keywords ***
Open the browser with URL
    Create Webdriver    Chrome
    Go To    https://demo.automationtesting.in/Windows.html
    Maximize Browser Window
    Set Selenium Implicit Wait    5

Select the button to switch to child window
    ${parentwindow} =    Get Window Handles
    Click Element    xpath://div[@class='tabpane pullleft']/ul/li[2]/a
    Click Button    css:.btn-primary
    ${windows} =    Get Window Handles
    ${count} =    Get Length    ${windows}
    Sleep    5
    FOR    ${window}    IN    @{windows}
        Log To Console   ${window}
    END
    Log To Console   ${count}
    Sleep    5

verify the child window is opened
    Switch Window    NEW

verify the user is switched back to parent window
    Switch Window    MAIN
    Element Text Should Be    ${mainPageText}    Automation Demo Site

verify the user is switched back to child window
    Switch Window    title=Selenium
    Sleep    5
