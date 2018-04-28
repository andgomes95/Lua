--Classe Total

-- Meta class
Totalizavel={}

-- Metodo para criar a classe
function Totalizavel:new (o,nome)
    o = o or {}
    --tabela
    setmetatable(o, self)
    self.__index = self
    self.valor_total=0
    return o
end

--Total -- deve ser abstrato--
-- function Totalizavel:total(itens)
-- end
