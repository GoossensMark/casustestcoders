*** Settings ***
Library         DataDriver    file=default_builds.csv
Test Template   Verify Build
Resource    ../../libraries/ApiBuilds.resource


*** Test Cases ***
Verify Build  ${build_type}   ${weapon}    ${upgradedWeapon}    ${armor}    ${upgradedArmor}    ${strength}    ${agility}    ${wisdom}    ${magic}


*** Keywords ***
Verify Build
    [Arguments]
    ...    ${build_type}
    ...    ${weapon}
    ...    ${upgradedWeapon}
    ...    ${armor}
    ...    ${upgradedArmor}
    ...    ${strength}
    ...    ${agility}
    ...    ${wisdom}
    ...    ${magic}

    ${response}=    GET an build    ${build_type}
    ${build_attributes}=    Set Variable    ${response}[body][${build_type}]

    Should Be Equal As Strings     ${build_attributes}[weapon]          ${weapon}
    Should Be Equal As Strings     ${build_attributes}[upgradedWeapon]  ${upgradedWeapon}
    Should Be Equal As Strings     ${build_attributes}[armor]           ${armor}
    Should Be Equal As Strings     ${build_attributes}[upgradedArmor]   ${upgradedArmor}
    Should Be Equal As Integers    ${build_attributes}[strength]        ${strength}
    Should Be Equal As Integers    ${build_attributes}[agility]         ${agility}
    Should Be Equal As Integers    ${build_attributes}[wisdom]          ${wisdom}
    Should Be Equal As Integers    ${build_attributes}[magic]           ${magic}