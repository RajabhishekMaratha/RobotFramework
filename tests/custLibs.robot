*** Settings ***
Documentation            This is some basic info about the suite
Library                  SeleniumLibrary
Library                  Collections
Library                  ../CustomLibararies/Shop.py

Test Setup               Open the web browser
Test Teardown            Close Browser
Resource                 ../resources/resource.robot

*** Variables ***
@{ListofProducts}           Blackberry      Nokia Edge
#robot -d Results Tests/crm.robot
*** Test Cases ***
#Validate the user
#    Enter credentials   ${username}     ${invalid_password}
#    Wait until Element is displayed     ${Error_alert_Login}
#    Verify if error message is correct

Verify the cards are displayed
    Enter credentials   ${username}     ${valid_password}
    Wait until Element is displayed     ${element_row}
    Verify Card Titles
    Add Items To Cart And Checkout    @{ListofProducts}

    #Select The Card     Blackberry

#Select The Form and Navigate to Child Window
#    Fill Login Details and Select the User      ${username}     ${valid_password}

*** Keywords ***


Wait until Element is displayed
    [Arguments]      ${element}
    Wait Until Element Is Visible       ${element}

Verify if error message is correct
#    ${result} =      Get Text     ${Error_alert_Login}
#    Should Be Equal As Strings    ${result}    Incorrect username/password.
    Element Text Should Be    ${Error_alert_Login}    Incorrect username/password.

Enter credentials
    [arguments]     ${username}      ${password}

    Input Text                       id=username    ${username}
    Input Password                   id=password    ${password}
    Select From List By Value        xpath=//select            teach
    Click Element                    signInBtn

Wait for product page to load
    Wait Until Page Contains    Shop Name

Verify Card Titles
    @{expected_list}=   Create List     iphone X     Samsung Note 8      Nokia Edge      Blackberry
    ${elements}=     Get WebElements    ${card_titles}
    @{actual_list}=     Create List

    FOR    ${element}    IN    @{elements}
        Log    ${element.text}
        Append To List    ${actual_list}    ${element.text}
    END

    Lists Should Be Equal    ${expected_list}     ${actual_list}

Select The Card
    [Arguments]     ${pName}
    ${elements}=     Get WebElements    ${card_titles}
    @{actual_list}=     Create List
    ${i}=   Set Variable    1
    FOR    ${element}    IN    @{elements}
            Exit For Loop If     '${pName}' == '${element.text}'
                    ${i}=   Evaluate  ${i}+1

    END
    Click Button    (//button[@class='btn btn-info'])[${i}]

Fill Login Details and Select the User
    [arguments]     ${username}      ${password}

    Input Text                       id=username    ${username}
    Input Password                   id=password    ${password}
    Click Element                    //input[@value='user']
    Wait Until Element Is Visible    id=okayBtn
    Click Button                     id=okayBtn
    Select From List By Value        xpath=//select            teach
    Select Checkbox                  terms
    Checkbox Should Be Selected      terms
    Click Element                    signInBtn
