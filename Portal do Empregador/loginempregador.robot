*** Settings ***
Library        SeleniumLibrary

*** Variables ***

${URL}                              https://www.pontocertificado.com.br
${BROWSER}                          chrome
${BTN_ACESSAR}                      css=li > .btn
${BTN_ENTRAR}                       css=.col-sm-6:nth-child(2) .btn
${input_email}                      xpath=//input[@id='Email']
${input_password}                   xpath=//input[@id='Senha']

*** Keywords ***
Acessar a pagina pontocertificado
    Open Browser                    url=${URL}      browser=${BROWSER}
    Maximize Browser Window

Clicar em Acessar

    Click Element                   ${BTN_ACESSAR}


Clicar em Entrar
   
    Click Element                   ${BTN_ENTRAR} 

Preencher campos
    Input Text                      ${input_email}      ROBERTO.TESTEPROD@PCS.COM               

    Input Text                      ${input_password}   123              

Fechar o browser
    Close Browser

*** Test Cases ***
Abrir Site
    Acessar a pagina pontocertificado
    Clicar em Acessar
    Clicar em Entrar
    Preencher campos
    Fechar o browser
   