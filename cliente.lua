require "pessoa"

--Classe pessoa

-- Meta class
Cliente=Pessoa:new()

-- Metodo para criar a classe
function Cliente:new (o,nome)
    o = o or Pessoa:new(o,nome)
    --tabela
    setmetatable(o, self)
    self.__index = self
    self.rg=nill
    self.data_nascimento=nill
    return o
end

function Cliente:cadastrarCliente(nome,endereco,rg,data_nascimento)
    self.nome=nome
    self.endereco=endereco
    self.rg=rg
    self.data_nascimento=data_nascimento
end

function Cliente:verCliente()
    return self.nome,self.endereco,self.rg,self.data_nascimento
end


-- -- chamada da função
-- cliente= Cliente:new(nill,nill)
-- cliente:setNome("casa")
-- cliente:setEndereco("Barao")
-- --
-- -- -- exibindo os dados
-- print("Nome:",pessoa:getNome(),"Endereco:",pessoa:getEndereco())
