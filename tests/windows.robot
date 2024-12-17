*** Settings ***
Documentation            This is some basic info about the suite
Library                  SeleniumLibrary
Library                  Collections
Library                     String
Test Setup               Open the web browser
Test Teardown            Close Browser
Resource                 ../resources/resource.robot


*** Test Cases ***
Validate Child Window Funcionality
    Select Link of Child Window
    Verify if user is switched to Child Window
    Grab Email in child window
    Switch to Parent Window and enter Email

*** Keywords ***

Select Link of Child Window
    Click Element    xpath=//a[@href='https://rahulshettyacademy.com/documents-request']
    Switch Window    NEW
Verify if user is switched to Child Window
    Wait Until Element Is Visible    ${nav_bar}
    Page Should Contain Element      ${nav_bar}
Grab Email in child window
#    ${email}=   Get Text    ${email_loc}
#    Element Text Should Be    ${email_loc}     mentor@rahulshettyacademy.com
     ${text}=   Get Text    xpath=//p[@class='im-para red']
     ${word}=   Split String ${text}   at
     ${sec}=    Get From List    ${word}    1
     ${words}=  Split String    ${sec}
     ${email}=  Get From List    ${word}    0


Switch to Parent Window and enter Email
    Switch Window       Main
    Input Text                       id=username    ${email}