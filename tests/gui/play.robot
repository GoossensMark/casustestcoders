*** Settings ***
Resource            ../../libraries/gui/play.resource
Resource            ../../libraries/helpers/files.resource

Suite Teardown      Clear realtime test data
Test Setup          Open play page
Test Teardown       Close Browser


*** Test Cases ***
Create an new character build
    ${build_type}=    Evaluate    random.choice($valid_builds)    modules=random
    Select build type    ${build_type}
    ${char_name}=    FakerLibrary.First Name
    Enter character name    ${char_name}
    Start new build    character_name=${char_name}    build_type=${build_type}
    Select clicker 5 times
    Type in text field    Lorem Ipsum
    Upload file
    Set slider    100
    Verify highest level reached
    Take Screenshot

login TC
    ${mail_adress}=    FakerLibrary.Ascii Email
    Open login dialog
    Enter login credentials    ${mail_adress}    testpassword
    Submit login form
