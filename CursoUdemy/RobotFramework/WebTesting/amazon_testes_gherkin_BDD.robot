*** Settings ***
Documentation  Essa suíte testa o site da Amazon.com.br
Resource       amazon_resources.robot
Test Setup     Abrir o navegador
# Test Teardown  Fechar o navegador


*** Test Cases ***

Caso de Teste 01 - Pesquisa de um Produto
    [Documentation]   Esse teste verifica a busca de um produto
    [Tags]            busca_produtos  lista_busca
    Dado que estou na home page da Amazon.com.br
    Quando pesquisar pelo produto "kindle 10 geração"
    Então o título da página deve ficar "Amazon.com.br : kindle 10 geração"
    E um produto da linha "kindle 10 geração" deve ser mostrado na página
    E o produto deve ser adicionado ao carrinho

