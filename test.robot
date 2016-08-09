*** Settings ***
Library  Selenium2Library

*** Variables ***
${stranka} =  https://morho.develop.maurit.sk/
${prehliadac} =  chrome

*** Test Cases ***
Otvorit prehliadac
    Otvorit prehliadac

*** Keywords ***
Otvorit prehliadac
    Open browser  ${stranka}  ${prehliadac}
    Maximize Browser Window
    page should contain image  //img[@src='/images/morho_logo.gif']