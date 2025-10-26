*** Settings ***
Library        SeleniumLibrary

*** Variables ***

${URL}                          https://web.pontocertificado.com.br
${BROWSER}                      chrome
${input_CPF}                    id=CPF
${input_Senha}                  id=Senha
${BTN_ENTRAR}                   xpath=//button[@class="btn btn-info btn-lg btn-block text-uppercase btn-rounded"]
${BTN_CartaodePonto}            xpath=//a[@id='idRelatorio']/i
${BTN_CartaodePontoCSV}         xpath=//input[@id='tipoGeracao1']
${BTN_SelecionaDataInicio}      xpath=//input[@id='inicioBusca']
${BTN_SelecionaDataFim}         xpath=//input[@id='fimBusca']
${BTN_GERAR}                    xpath=//button[@type='submit']
${BTN_BAIXAR}                   xpath=//a[contains(text(),'Baixar arquivo')]
                 


*** Keywords ***
Acessar a pagina portal do trabalhador
    
    Open Browser                            url=${URL}      browser=${BROWSER}

Preencher campos
    
    Input Text                              ${input_CPF}        28428241210               


    Input Text                              ${input_Senha}      123456     

Clicar em Entrar

    Click Element                           ${BTN_ENTRAR}

Clicar em Cartão de Ponto CSV

    Click Element                           ${BTN_CartaodePonto} 
    Click Element                           ${BTN_CartaodePontoCSV}
    Input Text                              ${BTN_SelecionaDataInicio}        10-10-2023
    Input Text                              ${BTN_SelecionaDataFim}           20-10-2023
    Sleep                                   5s
Clicar em Gerar Relatório

    Click Element                           ${BTN_GERAR}
    Sleep                                   5s

Baixar Arquivo

    Click Element                           ${BTN_BAIXAR}
    Sleep                                   5s

Fechar o browser
    Close Browser

*** Test Cases ***
Abrir Site
    Acessar a pagina portal do trabalhador
    Preencher campos
    Clicar em Entrar
    Clicar em Cartão de Ponto CSV
    Clicar em Gerar Relatório
    Baixar Arquivo
    Fechar o browser