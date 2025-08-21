*** Settings ***
Library        SeleniumLibrary

*** Variables ***

${URL}                          https://pilotoweb.pontocertificado.com.br/
${BROWSER}                      chrome
${input_CPF}                    xpath=//input[@id="CPF"]
${input_Senha}                  xpath=//input[@id="Senha"]
${BTN_ENTRAR}                   xpath=//button[@class="btn btn-info btn-lg btn-block text-uppercase btn-rounded"]
${BTN_CONFIRMAR}                xpath=//button[@type="submit"]
${BTN_BATER PONTO}              xpath=//a[@id="btnBaterPonto"]
${BTN_CONFIRMAR PONTO}          xpath=//a[@id='btnBaterPontoConfirmar']
${BTN_ATIVIDADE}                xpath=//button[@id="4807"]
${BTN_AVANÇAR}                  xpath=//button[@id="AtividadeSelecionada"]
${BTN_FECHAR}                   xpath=//button[@id="btnBaterPontoConfirmar"]


*** Keywords ***
Acessar a pagina portal do trabalhador
    
    Open Browser                            url=${URL}      browser=${BROWSER}
    
Preencher campos
    
    Input Text                              ${input_CPF}        66497817034               


    Input Text                              ${input_Senha}      66497    

Clicar em Entrar

    Click Element                           ${BTN_ENTRAR}

Clicar em Confirmar1
    
    Click Element                           ${BTN_CONFIRMAR}

Clicar em Registrar Ponto

    Click Element                           ${BTN_BATER PONTO} 

    Wait Until Page Contains Element        ${BTN_CONFIRMAR PONTO}

Clicar em Confirmar
    
    Click Element                           ${BTN_CONFIRMAR PONTO}

Seleciona a Atividade
    Wait Until Page Contains Element        ${BTN_ATIVIDADE}   
    Click Element                           ${BTN_ATIVIDADE}
    
Atividade Selecionada  
    Wait Until Page Contains Element        ${BTN_AVANÇAR}
    Click Element                           ${BTN_AVANÇAR}        

Fechar o browser
    Close Browser

*** Test Cases ***
Abrir Site
    Acessar a pagina portal do trabalhador
    Preencher campos
    Clicar em Entrar
    Clicar em Confirmar1
    Clicar em Registrar Ponto
    Clicar em Confirmar
    Seleciona a Atividade
    Atividade Selecionada
    Fechar o browser