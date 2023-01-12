Feature: Login
Como um cliente
Quero poder acessar minha conta e me manter logado
Para que eu possa ver e responder enquetes de forma rápida

Cenário: Credenciais Válidas
Dado que o cliente informou credenciais válidas
Quando Solicitar para fazer login
Então o sistema de enviar o usuário para a tela de pesquisas
E manter o usuário conectado

Cenário: Credendiais Inválidas
Dado que o cliente informou credenciais inválidas
Quando soliciar para fazer login
Então o sistema deve retornar uma mensagem de error