*** Settings ***
Variables       ../environment.py
Library         REST    ssl_verify=False
Library         Collections
Library         RequestsLibrary    WITH NAME    CatRequests
Library         OperatingSystem


*** Keywords ***
GET an build
    [Arguments]    ${build_type}=${EMPTY}    ${expected_status}=200
    ${resp}=    REST.GET    ${build_url}?build=${{$build_type.lower()}}    # this creates a new instance
    Should Be Equal As Integers    ${resp}[status]    ${expected_status}
    RETURN    ${resp}

Build Type Should Be Valid
    [Arguments]    ${build_type}
    Should Contain
    ...    environment.valid_builds
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

    ${resp}=    REST.POST    ${build_url}    body=${body}    # this creates a new instance
    Should Be Equal As Integers    ${resp}[status]    ${expected_status}
    RETURN    ${resp}

Get an cat picture
    [Arguments]    ${expected_status}=200
    Should Not Be Empty    ${cat_key}    msg=Set the CAT_API_KEY environment variable to use the cat API.
    ${headers}=    Create Dictionary    x-api-key=${cat_key}
    CatRequests.Create Session    cat_api    ${cat_url}    headers=${headers}
    ${api_response}=    CatRequests.GET On Session    cat_api    ${EMPTY}
    Should Be Equal As Integers    ${api_response.status_code}    ${expected_status}
    ${image_url}=    Set Variable    ${api_response.json()}[0][url]
    CatRequests.Create Session    cat_image    ${image_url}
    ${image_response}=    CatRequests.GET On Session    cat_image    ${EMPTY}
    ${filename}=    Evaluate    urllib.parse.urlparse($image_url).path.rsplit("/", 1)[-1]    modules=urllib.parse
    ${image_path}=    Join Path    ${CURDIR}    ..    ..    testdata    realtime    ${filename}
    Create Binary File    ${image_path}    ${image_response.content}
    CatRequests.Delete All Sessions
    RETURN    ${image_path}
