*** Settings ***
Resource   ../main.robot

*** Variables ***
${URL}                    http://localhost:3000/
${CAMPO_NOME}             id:form-nome
${CAMPO_CARGO}            id:form-cargo
${CAMPO_IMAGEM}           id:form-imagem
${CAMPO_TIME}             class:lista-suspensa
${BOTAO_CARD}             id:form-botao
@{Selecionar_times}
...    //option[contains(.,'Programação')]
...    //option[contains(.,'Front-End')]
...    //option[contains(.,'Data Science')]
...    //option[contains(.,'Devops')] 
...    //option[contains(.,'UX e Design')]
...    //option[contains(.,'Mobile')]
...    //option[contains(.,'Inovação e Gestão')]
${CARD}                   class:colaboradores


*** Keywords ***
Dado que eu preencha os campos do formulario
    ${Nome}                FakerLibrary.First Name
    Input Text    ${CAMPO_NOME}    ${Nome} 
    ${Cargo}            FakerLibrary.Job
    Input Text    ${CAMPO_CARGO}        ${Cargo}
    ${Imagem}           FakerLibrary.Image Url     width=100    height=10
    Input Text          ${CAMPO_IMAGEM}     ${Imagem}
    Click Element    ${CAMPO_TIME}
    Click Element    ${Selecionar_times}[0] 
    Sleep    4s

E clique no botão criar card
    Click Element    ${BOTAO_CARD} 
    Sleep    8s

Então identificar card dentro do time esperado
    Scroll Element Into View    ${CARD}
    Element Should Be Visible    ${CARD}

Então identificar 3 card no time esperado 
    FOR    ${i}    IN RANGE    1   3                  
       Dado que eu preencha os campos do formulario 
       E clique no botão criar card
    END
    Sleep    5s


Então criar e identificar um card em cada time disponivel
    FOR    ${index}    ${TIME}    IN ENUMERATE    @{Selecionar_times}
        Dado que eu preencha os campos do formulario
        Click Element    ${TIME}
        E clique no botão criar card
        
    END

    Sleep    10s


Dado que eu clique no botão "Criar Card"
    Click Element    ${BOTAO_CARD}

Então sistema deve apresentar mensagem de campo obrigatório
    Element Should Be Visible    id:form-nome-erro
    Element Should Be Visible    id:form-cargo-erro
    Element Should Be Visible    id:form-times-erro