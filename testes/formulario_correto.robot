*** Settings ***
Resource       ../resource/main.robot
Test Setup     Dado que eu acesse o Organo 
Test Teardown  Fechar o navegador


*** Test Cases ***
Verificar se ao preencher os campos do formulario corretamente os dados sao inseridos na lista e se um novo card é criado em novo card esperado
    Dado que eu preencha os campos do formulario
    E clique no botão criar card 
    Então identificar card dentro do time esperado
    

Verificar se é possivel criar mais de um card e se preenchermos os campos corretamente 
    Dado que eu preencha os campos do formulario
    E clique no botão criar card 
    Então identificar 3 card no time esperado 

Verificar se é possivel criar um card para cada time disponivel se preenchermos os campos corretamente
    Dado que eu preencha os campos do formulario
    Então criar e identificar um card em cada time disponivel

