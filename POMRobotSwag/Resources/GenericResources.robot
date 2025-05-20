*** Settings ***
Documentation    A resource file with reusable keywords and variables
Library    SeleniumLibrary

*** Variables ***
${url}    https://www.saucedemo.com/v1/index.html
${browser_name}    Chrome

*** Keywords ***
Open the browser with URL
    Create Webdriver    ${browser_name}
    Go To    ${url}
    Maximize Browser Window
    Set Selenium Implicit Wait    5

Close the browser Session
    Close Browser
