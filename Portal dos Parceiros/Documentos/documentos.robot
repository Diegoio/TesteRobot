*** Settings ***
Library        SeleniumLibrary

*** Variables ***

${URL}                                  https://newmobile.pontocertificado.com.br/
${BROWSER}                              chrome
${BTN_ACESSAR}                          xpath=//a[@href='/Admin']
${input_email}                          xpath=//input[@id='Email']
${input_password}                       xpath=//input[@id='Senha']
${BTN_ENTRAR}                           xpath=//button[@type='submit']
${DOCUMENTOS}                           xpath=//*[@id="sidebarnav"]/li[5]/a/span
${RELEASES}                             xpath=//*[@id="main-wrapper"]/div/div/div[2]/div[1]/a/div/div[2]/h1


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

Clicar em Documentos

    Click Element                               ${DOCUMENTOS}
    Sleep    5

Clicar em Releases   

    Click Element                                ${RELEASES}

*** Test Cases ***
Abrir Site
    Acessar a pagina Portal dos Parceiros
    Clicar em Acessar
    Clicar em Entrar
    Preencher campos
    Clicar em Entrar
    Clicar em Documentos
    Clicar em Releases