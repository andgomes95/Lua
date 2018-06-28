require "pessoa"

--Classe pessoa

-- Meta class
Cliente=Pessoa:new()

-- Construtor
function Cliente:new (o,nome)
    o = o or Pessoa:new(o,nome)
    --tabela
    setmetatable(o, self)
    self.__index = self
    self.rg=nill 
    self.data_nascimento=nill
    return o
end
-- Metodos da Classe
function Cliente:alteraCliente(nome,endereco,rg,data_nascimento)
    self:setNome(nome)
    self:setEndereco(endereco)
    self:setRg(rg)
    self:setDataNascimento(data_nascimento)
end

function Cliente:verCliente()
    return self.nome,self.endereco,self.rg,self.data_nascimento
end

-- Destrutor
function Cliente:destroiCliente()
    self = {}
end
-- Get e Set
function Cliente:setRg(rg)
    self.rg = rg
end

function Cliente:getRg(rg)
    return self.rg
end

function Cliente:setDataNascimento(data_nascimento)
    self.data_nascimento = data_nascimento
end

function Cliente:getDataNascimento(data_nascimento)
    return self.data_nascimento
end
