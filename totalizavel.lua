--Classe Total

Totalizavel={}

-- Construtor
function Totalizavel:new (o,nome)
    o = o or {}
    setmetatable(o, self)
    self.__index = self
    self:setValorTotal(0)
    return o
end
function Totalizavel:total()
	return self:getValorTotal()
end

-- Get e Set
function Totalizavel:getValorTotal()
	return self.valor_total
end

function Totalizavel:setValorTotal(valor_total)
	self.valor_total = valor_total
end