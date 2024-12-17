*** Settings ***
Documentation       All the page objects and keywords of landing page
Library             SeleniumLibrary
Resource            ../resources/resource.robot

*** Variables ***
${cartButton}          //a[@class='nav-link btn btn-primary']
${checkoutButton}      //button[@class='btn btn-success']
${elemText}            //h4/a[@href='#']
${countryText}         //input[@id='country']
${submit}              //input[@type='submit']
${success}             //strong

*** Keywords ***

Select the Product
    Click Element                       ${cartButton}
    Wait Until Element Is Visible       ${checkoutButton}
    Element Text Should Be              ${elemText}    ${pname}
    Click Button                        ${checkoutButton}


Checkout
    Input Text                      xpath=${countryText}   India
    Click Element                   ${submit}
    Page Should Contain Element     ${success}
    