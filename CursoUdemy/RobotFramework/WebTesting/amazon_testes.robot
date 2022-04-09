*** Settings ***
Documentation  Essa suíte testa o site da Amazon.com.br
Resource       amazon_resources.robot
Test Setup     Abrir o navegador
# Test Teardown  Fechar o navegador


*** Test Cases ***

Caso de Teste 01 - Pesquisa de um Produto
    [Documentation]   Esse teste verifica a busca de um produto
    [Tags]            busca_produtos  lista_busca
    Acessar a home page do site Amazon.com.br
    Digitar o nome de produto "kindle 10 geração" no campo de pesquisa
    Clicar no botão de pesquisa
    Verificar o resultado da pesquisa se está listando o produto "kindle 10 geração"
    Adicionar produto no carrinho
