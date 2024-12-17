*** Settings ***
Documentation            This is some basic info about the suite
Library                  SeleniumLibrary
Library                  Collections
Test Setup               Open the web browser
Test Teardown            Close Browser
Resource                 ../resources/resource.robot
Resource                 ../PO/landingPage.robot
Resource                 ../PO/shopPage.robot
Resource                 ../PO/checkoutPage.robot

*** Variables ***

#robot -d Results Tests/crm.robot
*** Test Cases ***
#Validate the user
#    landingPage.Enter credentials   ${username}     ${invalid_password}
#    landingPage.Wait until Element is displayed     ${Error_alert_Login}
#    landingPage.Verify if error message is correct

#Verify the cards are displayed
#    landingPage.Enter credentials   ${username}     ${valid_password}
#    shopPage.Wait until Element is displayed     ${element_row}
#    shopPage.Verify Card Titles
#    shopPage.Select The Card     ${pname}

End to End Testing
    landingPage.Enter credentials   ${username}     ${valid_password}
    shopPage.Wait until Element is displayed     ${element_row}
    shopPage.Verify Card Titles
    shopPage.Select The Card     ${pname}
    checkoutPage.Select the Product
    checkoutPage.Checkout

#Verify Items in Checkout Page and checkout
#    checkoutPage.Go to Cart Page
#Select The Form and Navigate to Child Window
#    shopPage.Fill Login Details and Select the User      ${username}     ${valid_password}
*** Keywords ***


