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
    self.idade=idade
    return o
end

-- metodos da classe
function Pessoa:getNome ()
    return self.nome
end

function Pessoa:getIdade()
    return self.idade
end

function Pessoa:setNome(nome)
    self.nome=nome
end

function Pessoa:setIdade(idade)
    self.idade=idade
end
--criando a pessoa
pessoa=Pessoa:new(nill,nill)
--definindo o nome
pessoa:setNome("Fernanda")
--definindo a idade
pessoa:setIdade(25)
-- exibindo os dados
print("Nome:",pessoa:getNome(),"Idade:",pessoa:getIdade())
