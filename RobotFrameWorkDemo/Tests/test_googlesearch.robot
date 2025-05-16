*** Settings ***
Library    SeleniumLibrary

*** Test Cases ***
Open browser and search
    Open Browser    url=https://www.google.com/   browser=chrome
    # ${chrome_options}=    Evaluate    sys.modules['selenium.webdriver'].ChromeOptions()    sys
    # Call Method    ${chrome_options}    add_argument    --user-data-dir\=C:\\Users\\public\\AppData\\Local\\Google\\Chrome\\User Data
    # Call Method    ${chrome_options}    add_argument    --profile-directory\=Default
    # Open Browser    https://www.google.com    chrome    options=${chrome_options}
    Maximize Browser Window
    Set Browser Implicit Wait    5
    Input Text    id:APjFqb    selenium
    Click Button    xpath:(//input[@name='btnK'])[1]
    Element Should Contain    class=VuuXrf    Selenium
    Close Browser