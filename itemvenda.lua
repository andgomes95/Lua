
--Classe ItemVenda realizando uma herança com Totalizavel
require "totalizavel"
-- Meta class
ItemVenda=Totalizavel:new()

-- Metodo para criar a classe
function ItemVenda:new (o,nome)
    o = o or Totalizavel:new(o,nome)
    --tabela
    setmetatable(o, self)
    self.__index = self
    self.produto = nill
    self.valor = nill
    self.quantidade = nill
    return o
end
 -- adiciona um novo item --
function ItemVenda:alteraItem(produto,quantidade)
    self:setProduto(produto)
    self:setValor(produto:getValor())
    self:setQuantidade(quantidade)
end

function ItemVenda:verItens()
    return self:getProduto():getNome(),self:getValor(),self:getQuantidade()
end

function ItemVenda:destroiItem()
    self = {}
end

function ItemVenda:getItem()
    return self:getProduto():getNome()
end

function ItemVenda:total()
    self:setValorTotal(self:getQuantidade()*self:getValor())
    return self:getValorTotal()
end

--get e set
function ItemVenda:getProduto()
    return self.produto
end

function ItemVenda:setProduto(produto)
    self.produto = produto
end

function ItemVenda:getValor()
    return self.valor
end

function ItemVenda:setValor(valor)
    self.valor = valor
end

function ItemVenda:getQuantidade()
    return self.quantidade
end

function ItemVenda:setQuantidade(quantidade)
    self.quantidade = quantidade
end
