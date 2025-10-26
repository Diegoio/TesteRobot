*** Settings ***
Library        SeleniumLibrary

*** Variables ***

${URL}                          https://web.pontocertificado.com.br
${BROWSER}                      chrome
${input_CPF}                    id=CPF
${input_Senha}                  id=Senha
${BTN_ENTRAR}                   xpath=//button[@class="btn btn-info btn-lg btn-block text-uppercase btn-rounded"]
${BTN_BATER_PONTO}              id=btnBaterPonto
${BTN_CONFIRMAR_PONTO}          id=btnBaterPontoConfirmar
${BTN_ATIVIDADE}                id=7575
${BTN_AVANÇAR}                  id=AtividadeSelecionada



*** Keywords ***
Acessar a pagina portal do trabalhador

    Open Browser                            url=${URL}      browser=${BROWSER}
    Maximize Browser Window
Preencher campos
    
    Input Text                              ${input_CPF}        28428241210               


    Input Text                              ${input_Senha}      123456    

Clicar em Entrar

    Click Element                           ${BTN_ENTRAR}
    Sleep                                   2s
Clicar em Registrar Ponto

    Click Element                           ${BTN_BATER_PONTO} 

    Wait Until Page Contains Element        ${BTN_CONFIRMAR_PONTO}

Clicar em Confirmar
    
    Click Element                           ${BTN_CONFIRMAR_PONTO}
    Sleep    2s
Seleciona a Atividade
    
    Click Element                           ${BTN_ATIVIDADE}
    Sleep    5s

Clicar em Avançar   

    Click Element                           ${BTN_AVANÇAR}        
    Sleep    2s
#Fechar o browser

    Close Browser

*** Test Cases ***
Abrir Site
    Acessar a pagina portal do trabalhador
    Preencher campos
    Clicar em Entrar
    Clicar em Registrar Ponto
    Clicar em Confirmar
    Seleciona a Atividade
    Clicar em Avançar
    #Fechar o browser