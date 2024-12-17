*** Settings ***
Documentation       All the page objects and keywords of landing page
Library             SeleniumLibrary
Resource            ../resources/resource.robot


*** Keywords ***

Wait until Element is displayed
    [Arguments]      ${element}
    Wait Until Element Is Visible       ${element}

Enter credentials
    [arguments]     ${username}      ${password}

    Input Text                       id=username    ${username}
    Input Password                   id=password    ${password}
    Select From List By Value        xpath=//select            teach
    Click Element                    signInBtn

Verify if error message is correct
#    ${result} =      Get Text     ${Error_alert_Login}
#    Should Be Equal As Strings    ${result}    Incorrect username/password.
    Element Text Should Be    ${Error_alert_Login}    Incorrect username/password.