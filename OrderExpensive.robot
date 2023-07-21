*** Settings ***
Library    SeleniumLibrary

Test Setup  Open browser    ${url}    ${browser}
#Test Teardown    close all browsers

*** Variables ***
${browser}  Chrome
${URL}   https://drinkcentrum.sk/

*** Test Cases ***
Order rum bottles
    Open page
    Navigate to rum section
    Order most expensive items    2

*** Keywords ***
Open page
    maximize browser window
    click element   //span[contains(@class,'button reject-all')]
    click element   //button[contains(@class,'swal-button--confirm')]

Navigate to rum section
    click element   //a[contains(.,'Rumovinky')]
    Select From List By Value    //select[@class='text-input']    cenu-zostupne
    click element    //div[@id='filter-content']//a[contains(.,'Skladom')]
    wait until element is enabled    //a[@id='main-filter-button']
    click element    //a[@id='main-filter-button']

Order most expensive items
    [Arguments]   ${nitems}
    [Documentation]    Order number of items starting from the lowest. NOTE: Doesn't take number of items on the page into consideration.
        : FOR    ${i}    IN RANGE    ${nitems}
        \   click element    //ul[@id='index-items']/li[(${nitems}-${i})]
        \   click element    //input[@data-action='buy']
        \   Execute Javascript    window.scrollTo(0, 0)
        \   click element    //div[contains(@class,'go_back')]
        \   wait until element is enabled  //div[contains(@class,'go_back')]
        \   click element    //div[contains(@class,'go_back')]




