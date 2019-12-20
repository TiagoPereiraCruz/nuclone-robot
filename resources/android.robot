*** Settings ***
Library  AppiumLibrary
Library  String

*** Variables ***
${REMOTE_URL}   http://localhost:4723/wd/hub
${APP}          ${CURDIR}/app/nubank.apk

*** Keywords ***
#### Setup e Teardown
Abrir app
    Open Application  ${REMOTE_URL}  platformName=Android  deviceName=Google Pixel 3  udid=192.168.56.101:5555  app=${APP}  automationName=uiautomator2  autoGrantPermissions=true

Fechar app
    Capture Page Screenshot
    Close Application

#### Steps
Dado que estou na tela principal
    Wait Until Page Contains Element  accessibility_id=card-hero  10

Quando clico em mostrar saldo
    Click Element  accessibility_id=show-balance

Entao devo ver meu saldo na tela
    Element Text Should Be  accessibility_id=user-balance  R$ 5.500,00

Acesso a tela de transferencia
    Swipe By Percent  95  85  55  85  1000
    Click Text  Transferir
    Wait Until Page Contains  Transferir para um novo contato  10

Filtro o favorecido "${nome}"
    Input Text  xpath=//android.widget.EditText[contains(@text, 'Buscar Contato')]  ${nome}

Deve retornar somente "${qtd}" registro
    ${contacts}  Get Matching Xpath Count  xpath=//android.widget.ScrollView[@content-desc="contacts"]/android.view.ViewGroup/android.view.ViewGroup
    Log To Console  ${contacts}
    Should Be Equal  ${qtd}  ${contacts}