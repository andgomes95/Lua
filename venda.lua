--Classe Venda realizando uma herança com Totalizavel
require "totalizavel"
-- Meta class
function table.clone(org)
  return {table.unpack(org)}
end
Venda=Totalizavel:new()

-- Metodo para criar a classe
function Venda:new (o,nome)
    o = o or Totalizavel:new(o,nome)
    --tabela
    setmetatable(o, self)
    self.__index = self
    self.numero=0
    self.data=nill
    self.cliente=nill
    self.itens={}
    self.calculado=0
    return o
end

-- cria uma nova venda --
function Venda:novaVenda(numero,cliente,data,itens)
    self.numero=numero
    self.cliente=cliente
    self.data=data
    self.itens.clone(itens)
end

-- --Realiza o calculo do total das vendas--
function Venda:total(itens,numero_itens)
    print(self.calculado)
if(self.calculado == 0)
    then
         for i=1,numero_itens-1,1
            do
                if(itens[1]:getValor() ~= nil)
                    then
                        valor=tonumber(itens[i]:getValor())
                        self.valor_total=self.valor_total+valor
                        self.calculado=1
                    end
            end
    else
         return self.valor_total
    end
return self.valor_total
end

function Venda:getVenda()
  return self.cliente,self.valor_total
end
