*** Settings ***
Resource    ../../libraries/ApiBuilds.resource

*** Test Cases ***
Verify thief build exists
    GET an build   thief    200

Verify invalid build gets 404
    GET an build   cleric    404

Create a new build
    Post an build   cleric    strength=1    agility=2    wisdom=3    magic=4    expected_status=201

Create a new invalid build
    Post an build   cleric    strength=10    agility=11    wisdom=3    magic=4    expected_status=400

Create an new build verify its created
    Post an build   cleric    strength=1    agility=2    wisdom=3    magic=4    expected_status=201
    GET an build   cleric    404