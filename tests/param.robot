*** Settings ***
Library                  SeleniumLibrary
Test Teardown            Close Browser
Test Template            Validate Unsucessful login

*** Variables ***
${Error_alert_Login}     css=.alert-danger
#robot -d Results Tests/crm.robot

*** Test Cases ***          username                password
Invalid Username            ewjbdob                 learning
Invalid Password            rahulshettyacademy      nwjnnrjdw
Special Charecters          $#!@^%&&$               &^#%&^#%&

*** Keywords ***
Validate Unsucessful login
    [Arguments]             ${username}     ${password}
    Open the web browser
    Enter credentials       ${username}     ${password}
    Wait until Error messege is displayed
    Verify if error message is correct





Open the web browser
    Open Browser    https://rahulshettyacademy.com/loginpagePractise/       chrome

Enter credentials
    [arguments]     ${username}      ${password}

    Input Text                       id=username    ${username}
    Input Password                   id=password    ${password}
    Select From List By Value        xpath=//select            teach
    Click Element                    signInBtn

Wait until Error messege is displayed
    Wait Until Element Is Visible       ${Error_alert_Login}

Verify if error message is correct
#    ${result} =      Get Text     ${Error_alert_Login}
#    Should Be Equal As Strings    ${result}    Incorrect username/password.
    Element Text Should Be    ${Error_alert_Login}    Incorrect username/password.

