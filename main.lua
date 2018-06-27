require "cliente"
require "produto"
require "venda"
require "itemvenda"

-- Trabalho de CLP
-- UFSJ
-- Andre, Carlos, Joao
--lista os produtos
function lista_produtos (produtos)
    for pos,item in ipairs(produtos)
        do
            codigo,nome,valor=item:verProduto()
            print("Cod:",codigo,"Nome:",nome,"Valor:",valor)
        end
end
-- lista os itens
function lista_itens (itens)
    for pos,item in ipairs(itens)
        do
            nome,valor,qtd=item:getItens()
            print("Nome:",nome,"Valor:",valor,"Quantidade",qtd)
        end
end

-- ver os clientes cadastrados
function lista_clientes (clientes)
    if(num_clientes<1)
        then
            print("Lista Vazia, Nenhum cliente foi cadastrado.")
            return nill
        end
    print("Número de clientes cadastrados:",num_clientes)
    for i=0,num_clientes-1,1
        do
            --pega o retorno múltiplo de dados
            nome,endereco,rg,data=clientes[i]:verCliente()
            print("Cod Cliente:",i,"Nome",nome,"Endereço",endereco,"RG",rg,"Data",data)
        end
end

-- ver o carrinho_final

function VerCarrinho(carrinho_final)
    print("---Resumo Compra --")
    for pos,item in ipairs(carrinho_final)
        do
            codigo,nome,valor=item:verProduto()
            print("Cod:",codigo,"Nome:",nome,"Valor:",valor)
        end
end

function adicionarCliente(clientes,num_clientes)
    local cliente=Cliente:new(nill, nill)
    clientes[num_clientes]=cliente
    print("Cadastrando Cliente")
    print("Nome:")
    local nome=io.read()
    print("Endereco:")
    local endereco = io.read()
    print("RG:")
    local rg=io.read()
    print("Data de Nascimento:")
    local nascimento= io.read()
    -- Cadastra um cliente
    cliente:alteraCliente(nome,endereco,rg,nascimento)
    num_clientes=num_clientes+1
    return clientes,num_clientes
end

--lista dos clientes
clientes={}
--lista dos produtos
produtos={}
--numero de clientes cadastrados
num_clientes=0
qtd_itens=1
num_venda=0

---

--cadastra uma serie de produtos
for i=0,5,1
    do
        produto=Produto:new(nill,nill)
        produtos[i]=produto
        produto:cadastraProduto(i+001,"Produto "..(i),25.00+i)
    end

flag=1
while(flag)
do
    -- Menu de interacação
    print("Escolha uma Opção")
    print("0- Para encerrar\n1- Cadastrar Cliente\n2- Ver Clientes Cadastrados\n3- Listar Produtos Disponíveis\n4- Iniciar Venda\n")
    opcao=io.read()
    print("opcao",opcao)

    -- lista os produtos disponíveis
    if opcao == "1" then
        clientes,num_clientes = adicionarCliente(clientes,num_clientes)
    end
    -- cadastra um cliente --
    if opcao == "2" then
        print("--Clientes--")
        print(lista_clientes(clientes))
        print("-------------")
    end
    -- Lista os clientes cadastrados
    if opcao == "3" then
        print(lista_produtos(produtos))
    end

    -- Inicia uma nova venda
    if opcao == "4" then
        print("--Nova Compra---")
        -- cria a instancia de uma nova venda
        novacompra=Venda:new(nill,nill)

        carrinho_final={}

        print("Adicione Produtos no Carrinho")
        --carrinho de produtos --
        while(1)
        do
            --cria um novo item para ser adicionado no carrinho.
            item=ItemVenda:new(nill,nill)

            print("Digite Codigo Produto e -1 para fechar")
            cod_produto=io.read()
            --adiciona o produto no Carrinho
            cod_produto=tonumber(cod_produto)
            if(cod_produto == -1)
            then
                print("Carrinho Fechado")
                break
            end
            --produtos[cod_produto]:getProduto()
            if pcall(produtos[cod_produto]:getValor()) then
                item:adicionarItem(produtos[cod_produto],produtos[cod_produto]:getValor(),1)
            else
                print("error")
            end
            -- contador de itens no carrinho
            carrinho_final[qtd_itens]=item
            print(carrinho_final[qtd_itens]:getValor(),qtd_itens)
            qtd_itens=qtd_itens+1
        end
        --
        while(1)
        do
            print("Digite:\n1 para Ver o carrinho\n2 para Associar o carrinho a um cliente\n3 para encerrar")
            opcao_venda= io.read()

            --opcoes interna do Carrinho
            if opcao_venda == "1" then
                --ver o carrinho_final
                --VerCarrinho(carrinho_final)
                print("--Valor Final--")
                print(novacompra:total(carrinho_final,qtd_itens))

            end

            if opcao_venda == "2" then
                --associa o carrinho a um determinado cliente
                -- function Venda:novaVenda(numero,cliente,data,itens)
                lista_clientes(clientes)
                print("Digite o Código Cliente:")
                cod_cliente=io.read()
                cod_cliente=tonumber(cod_cliente)
                comprador= clientes[cod_cliente]
                -- associa o comprador a venda.
                novacompra:novaVenda(num_venda,comprador,1,carrinho_final)
            end
            if opcao_venda == "3" then
                -- realiza o calculo do valor total --
                novacompra:total(carrinho_final,qtd_itens)
                --comprovante--
                print("--Comprovante de Compra--")
                nome,total=novacompra:getVenda()
                print("Nome Cliente",nome:getNome())
                print("--Items--")
                lista_itens(carrinho_final)
                print("-----------------")
                print("Total ---","R$"..total)
                break

            end
        end
    end



    if opcao == "0" then
        print("Encerrado")
        break
    end
end
