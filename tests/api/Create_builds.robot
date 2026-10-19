*** Settings ***
Library         DataDriver    file=create_builds.csv
Test Template   Create Build
Resource    ../../libraries/api/ApiBuilds.resource


*** Test Cases ***
Create Build  ${build_name}   ${strength}    ${agility}    ${wisdom}    ${magic}    ${name_exists}    ${expected_status}


*** Keywords ***
Create Build
    [Arguments]
    ...    ${build_name}
    ...    ${strength}
    ...    ${agility}
    ...    ${wisdom}
    ...    ${magic}
    ...    ${name_exists}
    ...    ${expected_status}
    IF    $name_exists == 'true'
        ${name}=    Set Variable    ${build_name}
    ELSE
        ${unique_id}=    Evaluate    str(uuid.uuid4())    modules=uuid
        ${name}=    Catenate    SEPARATOR=-    ${build_name}    ${unique_id}
    END
    Post an build
    ...    ${name}
    ...    strength=${strength}
    ...    agility=${agility}
    ...    wisdom=${wisdom}
    ...    magic=${magic}
    ...    expected_status=${expected_status}