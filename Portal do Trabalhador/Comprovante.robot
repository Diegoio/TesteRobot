*** Settings ***
Library        SeleniumLibrary

*** Variables ***

${URL}                          https://web.pontocertificado.com.br
${BROWSER}                      chrome
${input_CPF}                    xpath=//input[@id="CPF"]
${input_Senha}                  xpath=//input[@id="Senha"]
${BTN_ENTRAR}                   xpath=//button[@class="btn btn-info btn-lg btn-block text-uppercase btn-rounded"]
${BTN_COMPROVANTE}              xpath=//a[@id='idComprovante']/i
${BTN_SelecionaDataInicio}      xpath=//input[@id='inicioBusca']
${BTN_SelecionaDataFim}         xpath=//input[@id='fimBusca'] 
${BTN_GerarRelatorio}           xpath=//button[@type='submit']
${BTN_GERAR}                    xpath=//a[@type='button']


*** Keywords ***
Acessar a pagina portal do trabalhador
    
    Open Browser                            url=${URL}      browser=${BROWSER}

Preencher campos
    
    Input Text                              ${input_CPF}        28428241210                


    Input Text                              ${input_Senha}      123456     

Clicar em Entrar

    Click Element                           ${BTN_ENTRAR}

Clicar em Comprovante de Ponto

    Click Element                           ${BTN_COMPROVANTE} 
    Input Text                              ${BTN_SelecionaDataInicio}        01-02-2023
    Input Text                              ${BTN_SelecionaDataFim}           15-02-2023
    Sleep                                   5s
Clicar em Gerar Relatório

    Click Element                           ${BTN_GerarRelatorio}
    Sleep                                   5s

Baixar Relatório

    Click Element                           ${BTN_GERAR} 
    Sleep                                   5s
Fechar o browser
    Close Browser

*** Test Cases ***
Abrir Site
    Acessar a pagina portal do trabalhador
    Preencher campos
    Clicar em Entrar
    Clicar em Comprovante de Ponto
    Clicar em Gerar Relatório
    Baixar Relatório
    Fechar o browser