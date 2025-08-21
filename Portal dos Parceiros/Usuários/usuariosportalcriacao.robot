*** Settings ***
Library        SeleniumLibrary

*** Variables ***

${URL}                                  https://parceiro.pontocertificado.com.br/
${BROWSER}                              chrome
${BTN_ACESSAR}                          xpath=//a[@href='/Admin']
${input_email}                          xpath=//input[@id='Email']
${input_password}                       xpath=//input[@id='Senha']
${BTN_ENTRAR}                           xpath=//button[@type='submit']
${USUARIOS}                             xpath=//*[@id="sidebarnav"]/li[10]/a
${USU_PORTAL}                           xpath=//*[@id="sidebarnav"]/li[10]/ul/li[1]/a
${NOVO_USUARIO}                         xpath=//*[@id="main-wrapper"]/div/div/div[1]/div[2]/div/a/i
${NOME}                                 xpath=//*[@id="Nome"]
${EMAIL}                                xpath=//*[@id="Email"]
${SENHA}                                xpath=//*[@id="Senha"]
${CONFIRMA_SENHA}                       xpath=//*[@id="ConfirmeSenha"]
${ATIVO}                                xpath=//*[@id="main-wrapper"]/div/div/div[2]/div/div/form/div[1]/div[5]/label/span
${PARCEIRO}                             xpath=//*[@id="ParceiroId"]/option[2]
${EMPRESA}                              xpath=//*[@id="main-wrapper"]/div/div/div[2]/div/div/form/div[1]/div[8]/div/div[1]/label
${FINANCEIRO}                           xpath=//*[@id="main-wrapper"]/div/div/div[2]/div/div/form/div[1]/div[8]/div/div[2]/label
${JURIDICO}                             xpath=//*[@id="main-wrapper"]/div/div/div[2]/div/div/form/div[1]/div[8]/div/div[3]/label
${MARKETING}                            xpath=//*[@id="main-wrapper"]/div/div/div[2]/div/div/form/div[1]/div[8]/div/div[4]/label
${PARCEIROS}                            xpath=//*[@id="main-wrapper"]/div/div/div[2]/div/div/form/div[1]/div[8]/div/div[5]/label
${RELATORIO}                            xpath=//*[@id="main-wrapper"]/div/div/div[2]/div/div/form/div[1]/div[8]/div/div[6]/label
${SENHAADM}                             xpath=//*[@id="main-wrapper"]/div/div/div[2]/div/div/form/div[1]/div[8]/div/div[7]/label
${TECNICO}                              xpath=//*[@id="main-wrapper"]/div/div/div[2]/div/div/form/div[1]/div[8]/div/div[8]/label
${USUARIO}                              xpath=//*[@id="main-wrapper"]/div/div/div[2]/div/div/form/div[1]/div[8]/div/div[9]/label
${USUARIOSAPI}                          xpath=//*[@id="main-wrapper"]/div/div/div[2]/div/div/form/div[1]/div[8]/div/div[10]/label
${SALVAR}                               xpath=//*[@id="main-wrapper"]/div/div/div[2]/div/div/form/div[2]/div/button

*** Keywords ***
Acessar a pagina Portal dos Parceiros

    Open Browser                                url=${URL}      browser=${BROWSER}
    Maximize Browser Window

Clicar em Acessar

    Click Element                               ${BTN_ACESSAR}      

Preencher campos

    Input Text                                  ${input_email}      roberto.ohama@woopi.com.br              

    Input Text                                  ${input_password}   ijpt12y7 

Clicar em Entrar

    Click Element                               ${BTN_ENTRAR}

Clicar em Usuarios 

    Click Element                               ${USUARIOS}

Clicar em Usuarios Portal
    
    Scroll Element Into View                    ${USU_PORTAL}
    Click Element                               ${USU_PORTAL}

Clicar em Novo Usuario 

    Click Element                               ${NOVO_USUARIO}

Inserir Nome

    Input Text                                  ${NOME}                            testrobot

Inserir EMAIL

    Input Text                                  ${EMAIL}                           testerobot@test.com

Inserir Senha

    Input Text                                  ${SENHA}                            123456 
    
Confirma Senha

    Input Text                                  ${CONFIRMA_SENHA}                   123456 

Ativo 

    Click Element                               ${ATIVO}

Seleciona o Parceiro 

    Click Element                               ${PARCEIRO}

Segurança

    Click Element                               ${EMPRESA}                              
    Click Element                               ${FINANCEIRO}
    Click Element                               ${JURIDICO}
    Click Element                               ${MARKETING} 
    Click Element                               ${PARCEIROS}
    Click Element                               ${RELATORIO}
    Click Element                               ${SENHAADM}
    Click Element                               ${TECNICO}                              
    Click Element                               ${USUARIO}
    Click Element                               ${USUARIOSAPI}        

SALVAR

    Click Element                               ${SALVAR}

*** Test Cases ***
Abrir Site
    Acessar a pagina Portal dos Parceiros
    Clicar em Acessar
    Clicar em Entrar
    Preencher campos
    Clicar em Entrar
    Clicar em Usuarios
    Clicar em Usuarios Portal
    Clicar em Novo Usuario
    Inserir Nome
    Inserir EMAIL
    Inserir Senha
    Confirma Senha
    Ativo
    Seleciona o Parceiro
    Segurança
    SALVAR