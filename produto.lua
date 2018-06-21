--Classe produto

-- Meta class
Produto={}

-- Metodo para criar a classe
function Produto:new (o,codigo,nome,valor)
    o = o or {}
    --tabela
    setmetatable(o, self)
    self.__index = self
    self.codigo=nill
    self.nome=nill
    self.valor=nill
    return o
end

-- Realiza o cadastramento de um produto, faz a função dos setters
function Produto:cadastraProduto(codigo,nome,valor)
    self.codigo=codigo
    self.nome=nome
    self.valor=valor
end
-- Retorna os dados do produto de maneira coletiva.
function Produto:verProduto()
    return self.codigo,self.nome,self.valor
end

-- Get dos dados
function Produto:getValor()
    return self.valor
end

function Produto:getNome()
    return self.nome
end

function Produto:getCodigo()
    return self.codigo
end

function Produto:getProduto(codigo)
    if codigo == self.codigo then
        return Produto:verProduto()
    end
end
