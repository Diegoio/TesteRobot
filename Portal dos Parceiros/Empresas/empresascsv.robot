*** Settings ***
Library        SeleniumLibrary

*** Variables ***

${URL}                                  https://parceiro.pontocertificado.com.br/
${BROWSER}                              chrome
${BTN_ACESSAR}                          xpath=//a[@href='/Admin']
${input_email}                          xpath=//input[@id='Email']
${input_password}                       xpath=//input[@id='Senha']
${BTN_ENTRAR}                           xpath=//button[@type='submit']
${EMPRESAS}                             xpath=//span[@class='hide-menu'][contains(.,'Empresas')]
${input_pesquisar}                      xpath=//input[contains(@type,'search')]
${CSV}                                  xpath=//*[@id="lista_wrapper"]/div[1]/button[2]

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

Clicar em Empresas

    Click Element                               ${EMPRESAS}

Pesquisar Empresa
    Sleep    10
    Input Text                                   ${input_pesquisar}                testeparceiros

Baixar CSV

    Click Element                               ${CSV}

*** Test Cases ***
Abrir Site
    Acessar a pagina Portal dos Parceiros
    Clicar em Acessar
    Clicar em Entrar
    Preencher campos
    Clicar em Entrar
    Clicar em Empresas
    Pesquisar Empresa
    Baixar CSV