*** Settings ***
Resource    ../../libraries/gui/play.resource
Resource    ../../libraries/helpers/files.resource
Suite Teardown    Clear realtime test data 
Test setup    Open play page
Test Teardown    Close Browser

*** Test Cases ***
Start game with a random character
    ${build_type}=    Evaluate    random.choice($valid_builds)    modules=random
    Select build type    ${build_type}    
    ${char_name}=    FakerLibrary.First Name
    Enter character name    ${char_name}
    Start new build    character_name=${char_name}    build_type=${build_type}

login TC
    ${mail_adress}=    FakerLibrary.Ascii Email
    Open login dialog
    Enter login credentials    ${mail_adress}    testpassword
    Submit login form


Start game with a random character_2
    ${build_type}=    Evaluate    random.choice($valid_builds)    modules=random
    Select build type    ${build_type}    
    ${char_name}=    FakerLibrary.First Name
    Enter character name    ${char_name}
    Start new build    character_name=${char_name}    build_type=${build_type}
    Select clicker
