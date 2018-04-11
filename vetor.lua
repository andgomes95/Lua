#!/usr/local/bin/lua

function exibe(vetor)
print("Exibindo dados vetor")
--for usando um iterador
for pos,item in ipairs(vetor)
    do
        print("Posicão:",pos,"Item:",item)
    end
end
--inicializando o vetor
vetor={}

--inicio,final,passo
for i=0,2,1
do
    print("Posicao",i,vetor[i])
end

--preenchendo o vetor
for i=0,2,1
do
    vetor[i]=i*2
end

exibe(vetor)
