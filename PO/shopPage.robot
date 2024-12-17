*** Settings ***
Documentation       All the page objects and keywords of landing page
Library             SeleniumLibrary
Library             Collections
Resource            ../resources/resource.robot


*** Keywords ***

Wait until Element is displayed
    [Arguments]      ${element}
    Wait Until Element Is Visible       ${element}

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
