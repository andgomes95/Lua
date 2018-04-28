--Orientacao em objeto lua

-- Meta class
Pessoa= {}

-- Metodo para criar a classe
function Pessoa:new (o,nome)
    o = o or {}
    --tabela
    setmetatable(o, self)
    self.__index = self
    self.nome=nome
    self.endereco=endereco
    return o
end

-- metodos da classe
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
-- --criando a pessoa
-- pessoa=Pessoa:new(nill,nill)
-- --definindo o nome
-- pessoa:setNome("Fernanda")
-- --definindo a idade
-- pessoa:setEndereco("casa")
-- -- exibindo os dados
-- print("Nome:",pessoa:getNome(),"Endereco:",pessoa:getEndereco())
