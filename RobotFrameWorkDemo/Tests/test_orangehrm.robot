*** Settings ***
Documentation     To validate the login form
Library    SeleniumLibrary
Library    Collections
Test Teardown     Close Browser Session

*** Variables ***
${valid_username}    Admin
${valid_password}    admin123
${url}    https://opensource-demo.orangehrmlive.com/web/index.php/auth/login
&{visibleElements}    Forget your password?=xpath://p[@class="oxd-text oxd-text--p orangehrm-login-forgot-header"]

*** Test Cases ***
Validate Elements on Login Page
    Open the Browser with URL
    Verify Element on Login Page

Validate Successfull Login
    Open the Browser with URL
    Fill the login form
    verify Dashboard page opens
    verify items in Dashboard page

*** Keywords ***            
Open the browser with URL
    Open Browser     browser=firefox
    Go To    ${url}
    Maximize Browser Window
    Set Selenium Implicit Wait    10

Verify Element on Login Page
    Element Should Be Visible    ${visibleElements}[Forget your password?]

Fill the login form
    Input Text    css:input[name=username]    ${valid_username}
    Input Password    css:input[name=password]    ${valid_password}
    Click Button    class:orangehrm-login-button

verify Dashboard page opens
    Element Text Should Be    css:.oxd-topbar-header-breadcrumb-module    Dashboard

verify items in Dashboard page
    Sleep     2
    @{expectedlist}=    Create List    Admin     PIM    Leave    Time    Recruitment    My Info     Performance    Dashboard    Directory    Maintenance    Claim    Buzz
    ${elements}=    Get WebElements    xpath://span[@class='oxd-text oxd-text--span oxd-main-menu-item--name']
    @{actualList}=    Create List
    FOR    ${element}    IN    @{elements}
        LOG    ${element.text}
        Append To List    ${actualList}     ${element.text}
    END
    Lists Should Be Equal    ${expectedlist}    ${actualList}
    

Close Browser Session
    Close Browser