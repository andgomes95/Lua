--Classe Venda realizando uma herança com Totalizavel
require "totalizavel"

-- Meta class
Venda=Totalizavel:new()
-- clona uma tabela
function table.clone(org)
  return {table.unpack(org)}
end

-- Metodo para criar a classe
function Venda:new (o,nome)
    o = o or Totalizavel:new(o,nome)
    --tabela
    setmetatable(o, self)
    self.__index = self
    self:setNumero(0)
    self:setData(nill)
    self:setCliente(nill)
    self.itens = {}
    return o
end

-- cria uma nova venda --
function Venda:alteraVenda(numero,cliente,data,itens)
    self:setNumero(numero)
    self:setCliente(cliente)
    self:setData(data)
    self.itens=table.clone(itens)
end

function Venda:verVenda()
    return self:getNumero(),self:getData(),self:getCliente(),self:getItens()
end

function Venda:destroiVenda()
    self = {}
end
-- --Realiza o calculo do total das vendas--
function Venda:total()
    for i=1,#self:getItens(),1
        do
            local valor=self:getItens()[i]:total()
            self:setValorTotal(self:getValorTotal()+valor)
        end
    return self:getValorTotal()
end

function Venda:getVenda()
  return self:getCliente(),self:getValorTotal()
end

-- Get e Set
function Venda:getNumero()
    return self.numero
end

function Venda:setNumero(numero)
    self.numero = numero
end

function Venda:getData()
    return self.data
end

function Venda:setData(data)
    self.data = data
end

function Venda:getCliente()
    return self.cliente
end

function Venda:setCliente(cliente)
    self.cliente = cliente
end

function Venda:getItens()
    return self.itens
end

function Venda:setItens(itens)
    self.itens[#itens+1] = itens
end