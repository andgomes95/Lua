--Orientacao em objeto lua

-- Meta class
Pessoa= {}

-- Construtor
function Pessoa:new (o,nome)
    o = o or {}
    setmetatable(o, self)
    self.__index = self
    self.nome= nill
    self.endereco= nill
    return o
end

-- Get e Set
function Pessoa:getNome ()
    return self.nome
end

function Pessoa:getEndereco()
    return self.endereco
end

function Pessoa:setNome(nome)
    self.nome=nome
end

function Pessoa:setEndereco(endereco)
    self.endereco=endereco
end