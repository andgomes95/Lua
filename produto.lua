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

-- Metodos da Classe
function Produto:alterarProduto(codigo,nome,valor)
    self:setCodigo(codigo)
    self:setNome(nome)
    self:setValor(valor)
end

function Produto:verProduto()
    return self:getCodigo(),self:getNome(),self:getValor()
end
-- Destrutor Produto
function Produto:destroiProduto()
    self = {}
end

-- Get e Set
function Produto:getValor()
    return self.valor
end

function Produto:setValor(valor)
    self.valor = valor
end

function Produto:getNome()
    return self.nome
end

function Produto:setNome(nome)
    self.nome = nome
end

function Produto:getCodigo()
    return self.codigo
end

function Produto:setCodigo(codigo)
    self.codigo = codigo
end