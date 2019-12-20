*** Settings ***
Resource  ../resources/android.robot

Test Setup  Abrir app
Test Teardown  Fechar app

*** Test Cases ***
Cenario: Ver saldo
    Dado que estou na tela principal
    Quando clico em mostrar saldo
    Entao devo ver meu saldo na tela

