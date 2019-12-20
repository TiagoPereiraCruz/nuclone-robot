*** Settings ***
Resource  ../resources/android.robot

Test Setup  Abrir app
Test Teardown  Fechar app

*** Test Cases ***
Cenario: Escolher favorecido
    Dado que estou na tela principal
    Acesso a tela de transferencia
    Filtro o favorecido "Tony Stark"
    Deve retornar somente "1" registro
    
    