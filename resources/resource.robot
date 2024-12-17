*** Settings ***
Documentation            This is some basic info about the suite
Library                  SeleniumLibrary

*** Variables ***
${username}                     rahulshettyacademy
${invalid_password}             jbsifjwbfjw
${valid_password}               learning
${Error_alert_Login}            css=.alert-danger
${element_row}                  xpath=//div[@class='row']
${card_titles}                  xpath=//h4[@class='card-title']
${email_loc}                    xpath=//p[@class='im-para red']/strong/a
${nav_bar}                      xpath=//div[@class='navbar-collapse collapse clearfix']
${email}
${pname}                        Blackberry
*** Keywords ***
Open the web browser
    Open Browser    https://rahulshettyacademy.com/loginpagePractise/       chrome
    Maximize Browser Window
