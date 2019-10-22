if_else(Q,V,F):- Q,!,V.
if_else(Q,V,F):- F.


:- dynamic produto/3.
produto(Nome,Desc,Quant).

adicionarProduto(produto(N,D,Q)):- assertz(produto(N,D,Q)).
adicionarProduto:-
    write("Digite o nome do produto: "), read(Nome),
    write("Digite a descricao: "), read(Desc),
    write("E sua quantidade: "), read(Quant),

    if_else((Quant=<0),((write("Quantidade invalida"),nl,write("Quantidade certa: "),read(Q),assertz(produto(Nome,Desc,Q)))),
             (write("Falso"),assertz(produto(Nome,Desc,Quant)))).

removerProduto(produto(N,D,Q)):- retract(produto(N,D,Q)).
%removerProduto:- write("Digite o nome do produto: "), read(Nome),retract(produto(Nome,_,_)).

listaProdutos:- listing(produto).
menu:-
    write("[1] Adicionar Produto"),nl,
    write("[2] Remover Produto"),nl,
    write("[3] Listar Produto"),nl,
    write("[4] Cadastrar funcionario"),nl,
    write("[5] Listar funcionario"),nl,
    write("[6] Remover funcionario"),nl,
    read(Opc), if_else((Opc=1),adicionarProduto,
                       (if_else((Opc=2),(write("Digite o nome: "),read(Nome),write("Digite a descricao: "), read(Desc),write("Digite a quantidade: "),read(Quant),removerProduto(produto(Nome,Desc,Quant))),
                                ( write(""))))).


login:-
    write("Digite o user: "), read(User),
    write("Digite senha: "), read(Senha),
    if_else(((User=isco),(Senha=1234)),menu,write("Dados errados")).






























