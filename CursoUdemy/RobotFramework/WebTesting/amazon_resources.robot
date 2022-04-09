*** Settings ***
Library  SeleniumLibrary


*** Variables ***
${URL}                       http://www.amazon.com.br
${MENU_MUSICA}               //a[@href='/music/unlimited?ref_=nav_cs_music'][contains(.,'Música')]
${PESQUISA}                  //input[contains(@type,'text')]
${SUBMIT}                    //input[contains(@type,'submit')]
${PRODUTO}                   //img[@data-image-index='2']
${CARRINHO}                  //a[contains(@class,'a-button-text')]
${CLOSE}                     //input[contains(@aria-labelledby,'a-autoid-3-announce')]


*** Keywords ***
Abrir o navegador
    Open Browser    browser=chrome
    Maximize Browser Window

Fechar o navegador
    Capture Page Screenshot
    Close Browser

Acessar a home page do site Amazon.com.br
    Go To                            url=${URL}
    Wait Until Element Is Visible    locator=${MENU_MUSICA}

Verificar se o título da página fica "${TITULO}"
    Title Should Be    title=${TITULO}

Digitar o nome de produto "kindle 10 geração" no campo de pesquisa
    Click Element    locator=${PESQUISA}
    Input Text    locator=${PESQUISA}    text=kindle 10 geração

Clicar no botão de pesquisa
    Click Button    locator=${SUBMIT}

Verificar o resultado da pesquisa se está listando o produto "kindle 10 geração"
    Wait Until Element Is Visible    locator=${PRODUTO}

Adicionar produto no carrinho
    Click Image    locator=${PRODUTO}
    Click Button   locator=add-to-cart-button
    Click Element  locator=${CLOSE}
    Click Element  locator=${CARRINHO}

#Gherkin Steps
Dado que estou na home page da Amazon.com.br
    Acessar a home page do site Amazon.com.br

Quando pesquisar pelo produto "kindle 10 geração"
    Digitar o nome de produto "kindle 10 geração" no campo de pesquisa
    Clicar no botão de pesquisa

Então o título da página deve ficar "Amazon.com.br : kindle 10 geração"
    Verificar se o título da página fica "Amazon.com.br : kindle 10 geração"

E um produto da linha "kindle 10 geração" deve ser mostrado na página
    Verificar o resultado da pesquisa se está listando o produto "kindle 10 geração"

E o produto deve ser adicionado ao carrinho 
    Adicionar produto no carrinho




    









    