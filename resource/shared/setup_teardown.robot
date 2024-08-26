*** Settings ***
Resource    ../main.robot

*** Variables ***
${URL}                    http://localhost:3000/

*** Keywords ***
Dado que eu acesse o Organo 
    Open Browser     url=${URL}        browser=Chrome
    Maximize Browser Window

Fechar o navegador 
    Close Browser