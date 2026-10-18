*** Settings ***
Variables    ../environment.py
Resource    ../../libraries/api/ApiBuilds.resource
Library    Browser
Library    FakerLibrary

*** Keywords ***
Open play page
    [Arguments]    ${browser}=chromium
    New Browser    ${browser}    headless=False
    # New Browser    ${browser}
    New Page    ${play_url}
    Wait For Elements State    data-testid=character-name-input    visible    timeout=10s

Select build type
    [Arguments]    ${build_type}=None
    Set Test Variable    ${build_type}
    Click    data-testid=character-build-select
    Click    role=option[name="${build_type}" i]

Enter character name
    [Arguments]   ${character_name}=None
    Fill Text    data-testid=character-name-input    ${character_name}
    ${displayed_name}=    Get Text    data-testid=character-name

Start new build
    [Arguments]    ${character_name}=None    ${build_type}=None
    Click    data-testid=character-start-button
    Wait For Elements State    data-testid=adventure-container    visible    timeout=10s
    Get Text    data-testid=adventure-container    contains    Adventure time
    ${description}=    Get Text    data-testid=character-description
    Should Contain    ${description}    ${build_type}

Open login dialog
    Click    data-testid=login-button
    Wait For Elements State    data-testid=login-dialog    visible    timeout=10s

Enter login credentials
    [Arguments]    ${email}    ${password}
    Fill Text    data-testid=login-email-input    ${email}
    Fill Text    data-testid=login-password-input    ${password}

Submit login form
    Click    data-testid=login-submit-button
    Wait For Elements State    data-testid=logout-button    visible    timeout=10s


Select clicker 
    ${clicker_text}=    Get Text    data-testid=clicker-button
    ${clicks_before}=    Evaluate    int($clicker_text.split()[2])
    ${expected_clicks}=    Evaluate    $clicks_before - 1
    Click    data-testid=clicker-button
    ${updated_text}=    Get Text    data-testid=clicker-button
    Should Be Equal    ${updated_text}    Click me ${expected_clicks} times

Select clicker 5 times
    FOR    ${index}    IN RANGE    5
        Select clicker 
    END
    Wait For Elements State    xpath=//button[@data-testid='clicker-button']/../span[@data-task='clicker']    visible    timeout=10s
    Get Text    data-testid=toast-container    contains    +1 Level

Type in text field
    [Arguments]    ${text}
    Fill Text    data-testid=typer-input    ${text}
    Wait For Elements State    xpath=//input[@data-testid='typer-input']/../span[@data-task='typer']
    Get Text    data-testid=toast-container    contains    +1 Level

Upload file
    ${file_path}=    Get an cat picture
    ${promise}=    Promise To Upload File    ${file_path}
    Click          data-testid=uploader-input
    ${upload_result}=    Wait For    ${promise}
    Wait For Elements State    xpath=//input[@data-testid='uploader-input']/../span[@data-task='uploader']
    Get Text    data-testid=toast-container    contains    +1 Level

Set slider
    [Arguments]    ${value}    
    Fill Text    data-testid=slider-input    ${value}
    Wait For Elements State    xpath=//span[@data-testid='slider-input']/../span[@data-task='slider']

Verify highest level reached
     Wait For Elements State    data-testid=max-level-message    visible    timeout=10s
    