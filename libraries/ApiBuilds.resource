*** Settings ***
Variables      environment.py
Library        REST    ssl_verify=False
Library        Collections


*** Variables ***
@{VALID_BUILDS}
...    thief
...    knight
...    mage
...    brigadier

*** Keywords ***
GET an build
    [Arguments]    ${build_type}=${EMPTY}    ${expected_status}=200
    ${resp}=    GET     ${build_url}?build=${build_type}                      # this creates a new instance
    Should Be Equal As Integers  ${resp}[status]    ${expected_status}
    RETURN   ${resp} 

Build Type Should Be Valid
    [Arguments]    ${build_type}

    Should Contain
    ...    ${VALID_BUILDS}
    ...    ${build_type}

Get an valid build
    [Arguments]    ${valid_build_type}
    ${resp}=    GET an build    ${valid_build_type}
    RETURN    ${resp}
    
Post an build
    [Arguments]    ${name}=${EMPTY}    ${strength}=${EMPTY}    
    ...    ${agility}=${EMPTY}    ${wisdom}=${EMPTY}    ${magic}=${EMPTY}    ${expected_status}=200
    ${body}=    Evaluate
    ...    {"build": {"name": "${name}", "strength": ${strength}, "agility": ${agility}, "wisdom": ${wisdom}, "magic": ${magic}}}
    
    ${resp}=    POST     ${build_url}    body=${body}             # this creates a new instance
    Should Be Equal As Integers  ${resp}[status]    ${expected_status}
    RETURN   ${resp} 
