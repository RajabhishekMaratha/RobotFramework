*** Settings ***
Library                  SeleniumLibrary
Test Teardown            Close Browser

*** Variables ***
${Error_alert_Login}     css=.alert-danger
#robot -d Results Tests/crm.robot
*** Test Cases ***
Validate the user
    Open the web browser
    Enter invalid credentials
    Wait until Error messege is displayed
    Verify if error message is correct




*** Keywords ***
Open the web browser
    Open Browser    https://rahulshettyacademy.com/loginpagePractise/       chrome

Enter invalid credentials
    Input Text                   id=username    rahulshettyacademy
    Input Password               id=password    learning1
    Select From List By Value        xpath=//select            teach
    Click Element                signInBtn

Wait until Error messege is displayed
    Wait Until Element Is Visible       ${Error_alert_Login}

Verify if error message is correct
#    ${result} =      Get Text     ${Error_alert_Login}
#    Should Be Equal As Strings    ${result}    Incorrect username/password.
    Element Text Should Be    ${Error_alert_Login}    Incorrect username/password.

