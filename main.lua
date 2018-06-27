require "cliente"
require "produto"
require "venda"
require "itemvenda"

-- Trabalho de CLP
-- UFSJ
-- Andre, Carlos, Joao

-- ver os clientes cadastrados
function lista_clientes (clientes)
    if(#clientes<1)
        then
            print("Lista Vazia, Nenhum cliente foi cadastrado.")
            return nill
        end
    print("Número de clientes cadastrados:",#clientes)
    for i=1,#clientes,1
        do
            --pega o retorno múltiplo de dados
            nome,endereco,rg,data=clientes[i]:verCliente()
            print("Cod Cliente:",i,"Nome",nome,"Endereço",endereco,"RG",rg,"Data",data)
        end
end

-- Verificação, utilizada no tratamento de exceções
-- verifica o codigo do produto
function verifica_cod_produto(produtos,codigo)

  return produtos[codigo]:getValor()
end
-- verifica o código do cliente
function verifica_cod_cliente(clientes,codigo)
  return clientes[codigo]:verCliente()
end

-- funcao para adicionar um cliente
function adicionarCliente(clientes)
    local cliente=Cliente:new(nill, nill)
    clientes[#clientes+1]=cliente
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
    return clientes
end

-- Altera os dados de um cliente
function alterarCliente(clientes)
    print("Digite o nome do cliente")
    local cliente=io.read()
     for i=0,#clientes do
        if clientes[i]:getNome() == cliente then
            print("Nome:")
            local nome=io.read()
            print("Endereco:")
            local endereco = io.read()
            print("RG:")
            local rg=io.read()
            print("Data de Nascimento:")
            local nascimento= io.read()
            -- Cadastra um cliente
            clientes[i]:alteraCliente(nome,endereco,rg,nascimento)
            return clientes
        end
    end
    print ("Cliente não existente")
    return clientes
end

--Apaga um cliente da tabela de clientes.
function removeCliente(clientes)
    print("Digite o nome do cliente")
    local cliente=io.read()
    for i=0,#clientes do
        if clientes[i]:getNome() == cliente then
            clientes[i]:destroiCliente()
            table.remove(clientes,i)
        end
    end
    return clientes,num_clientes
end

--lista os produtos
function lista_produtos (produtos)
    for pos,item in ipairs(produtos)
        do
            codigo,nome,valor=item:verProduto()
            print("Cod:",pos,"Nome:",nome,"Valor:",valor)
        end
end

-- adiciona produtos na tabela de produtos.
function adicionarProduto(produtos)
    local indice =  #produtos+1
    local produto = Produto:new(nill,nill)
    produtos[indice] = produto
    print("Digite o nome do produto")
    local nome=io.read()
    print("Digite o valor do produto")
    local valor = io.read()
    produto:alterarProduto(001+indice,nome,valor)
    return produtos
end

function alterarProduto(produtos)
    print("Digite o nome do produto")
    local produto=io.read()
     for i=0,#produtos do
        if produtos[i]:getNome() == produto then
            print("Nome:")
            local nome=io.read()
            print("Valor:")
            local valor = io.read()
            -- Cadastra um cliente
            produtos[i]:alterarProduto(produtos[i]:getCodigo(),nome,valor)
            return produtos
        end
    end
    print ("Produto não existente")
    return produtos
end

function removeProduto(produtos)
    print("Digite o nome do cliente")
    local produto=io.read()
    for i=0,#produtos do
        if produtos[i]:getNome() == produto then
            produtos[i]:destroiProduto()
            table.remove(produtos,i)
        end
    end
    return produtos
end

-- lista os itens
function lista_itens (itens)
    for pos,item in ipairs(itens)
        do
            nome,valor,qtd=item:getItens()
            print("Nome:",nome,"Valor:",valor,"Quantidade",qtd)
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


--lista dos clientes
clientes={}
--lista dos produtos
produtos={}

qtd_itens=1
num_venda=0

---

--cadastra uma serie de produtos
for i=0,5,1
    do
        produto=Produto:new(nill,nill)
        produtos[i]=produto
        produto:alterarProduto(i+001,"Produto "..(i),25.00+i)
    end

flag=1
while(flag)
do
    -- Menu de interacação
    print("Escolha uma Opção")
    print("0- Para encerrar\n1- Cadastrar Cliente\n2- Ver Clientes Cadastrados\n3- Alterar Cliente\n4- Remover Clientes\n5- Adicionar Produto\n6- Listar Produtos Disponíveis\n7- Alterar Produtos\n8- Remove Produto\n9- Iniciar Venda\n")
    opcao=io.read()
    print("opcao",opcao)

    -- cadastrar clientes
    if opcao == "1" then
        clientes,num_clientes = adicionarCliente(clientes,num_clientes)
    -- listar clientes
    elseif opcao == "2" then
        print("--Clientes--")
        print(lista_clientes(clientes))
        print("-------------")
    -- alterar clientes
    elseif opcao == "3" then
        clientes =  alterarCliente(clientes)
    -- Remove Cliente
    elseif opcao == "4" then
        clientes,num_clientes =  removeCliente(clientes,num_clientes)

    -- listar produtos
    elseif opcao == "5" then
        produtos = adicionarProduto(produtos)

    elseif opcao == "6" then
        lista_produtos(produtos)

    elseif opcao == "7" then
        produtos = alterarProduto(produtos)
    elseif opcao == "8" then
        produtos = removeProduto(produtos)
    -- Inicia uma nova venda
    elseif opcao == "9" then
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

            -- realiza o tratamento de exceção.
            if pcall(verifica_cod_produto,produtos,cod_produto) then
                item:adicionarItem(produtos[cod_produto],produtos[cod_produto]:getValor(),1)
                -- contador de itens no carrinho
                carrinho_final[qtd_itens]=item
                print(carrinho_final[qtd_itens]:getValor(),qtd_itens)
                qtd_itens=qtd_itens+1
            else
                print("Código do produto Inválido.\nDigite um novo código menor ou igual á:",#produtos)
            end
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

                -- realiza o tratamento da execeção do código cliente
                if(pcall(verifica_cod_cliente,clientes,cod_cliente)) then
                  comprador= clientes[cod_cliente]
                  -- associa o comprador a venda.
                  novacompra:novaVenda(num_venda,comprador,1,carrinho_final)
                else
                  print("Código de Cliente Inválido.")
                  break
                end


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
                print("-----------------\n")
                break

            end
        end



    elseif opcao == "0" then
        print("Encerrado")
        break
    else
        print ("Opção Invalida")
    end
end
