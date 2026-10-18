*** Settings ***
Library    OperatingSystem

*** Keywords ***
Clear realtime test data
    ${realtime_dir}=    Join Path    ${CURDIR}    ..    ..    testdata    realtime
    Create Directory    ${realtime_dir}
    ${files}=    List Files In Directory    ${realtime_dir}    absolute=True
    FOR    ${file}    IN    @{files}
        Remove File    ${file}
    END
