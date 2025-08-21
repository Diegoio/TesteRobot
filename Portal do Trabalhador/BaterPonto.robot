*** Settings ***
Library        SeleniumLibrary

*** Variables ***

${URL}                          https://web.pontocertificado.com.br
${BROWSER}                      chrome
${input_CPF}                    id=CPF
${input_Senha}                  xpath=//input[@id="Senha"]
${BTN_ENTRAR}                   xpath=//button[@class="btn btn-info btn-lg btn-block text-uppercase btn-rounded"]
${BTN_BATER_PONTO}              xpath=//a[@id="btnBaterPonto"]
${BTN_CONFIRMAR_PONTO}          xpath=//a[@id='btnBaterPontoConfirmar']
${BTN_ATIVIDADE}                xpath=//button[@id='7575']
${BTN_AVANÇAR}                  xpath=//button[@id='AtividadeSelecionada']
${BTN_FECHAR}                   xpath=//button[@id="btnBaterPontoConfirmar"]


*** Keywords ***
Acessar a pagina portal do trabalhador

    Open Browser                            url=${URL}      browser=${BROWSER}
Preencher campos
    
    Input Text                              ${input_CPF}        28428241210               


    Input Text                              ${input_Senha}      123456    

Clicar em Entrar

    Click Element                           ${BTN_ENTRAR}
    Sleep                                   5s
Clicar em Registrar Ponto

    Click Element                           ${BTN_BATER_PONTO} 

    Wait Until Page Contains Element        ${BTN_CONFIRMAR_PONTO}

Clicar em Confirmar
    
    Click Element                           ${BTN_CONFIRMAR_PONTO}

Seleciona a Atividade
    Sleep    5
    Click Element                           ${BTN_ATIVIDADE}
    
Atividade Selecionada  
    Click Element                           ${BTN_AVANÇAR}        

Fechar o browser
    Close Browser

*** Test Cases ***
Abrir Site
    Acessar a pagina portal do trabalhador
    Preencher campos
    Clicar em Entrar
    Clicar em Registrar Ponto
    Clicar em Confirmar
    Seleciona a Atividade
    Atividade Selecionada
    Fechar o browser