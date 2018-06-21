
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
    self.produto= nill
    self.valor= nill
    self.quantidade=nill
    return o
end
 -- adiciona um novo item --
function ItemVenda:adicionarItem(produto,quantidade)
    self.produto=produto
    self.valor=produto.valor
    self.quantidade=quantidade
end
-- retorna
function ItemVenda:getItem()
    return self.produto:getNome()
end

function ItemVenda:getItens()
    return self.produto:getNome(),self.valor,self.quantidade
end

function ItemVenda:getValor()
    return self.valor
end
