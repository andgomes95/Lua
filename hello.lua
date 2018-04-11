#!/usr/local/bin/lua

-- Hello Word

print("Estou vivo....\n")

-- Declaracao de variáveis
-- Por padrão as varáveis são globais
--global
a = 5
b = "O resultado é:"
--local
local d = 12

-- exibicao e operacao matemática simples
print(b,a+d)

--Estrutura de repeticao


-- conta de 0 a 10
-- O mesmo também pode ficar na mesma linha
-- for inicio,final,passo
for i = 0,10,1
do 
    print(i)
end

print("While")
--While
while(a<10) do print(a) a=a+1 end

print("repeat Until")
-- repeat until
local i
i=0
repeat
    print("Oi sou o número",i)
    --realiza a soma
    i=i+1
-- repete ate i for maior que 2
until(i>2)

--Estrutura condicional
a = 5
b = 6
if(a<b)
then
    print("A é maior que B",a,b)
end

-- Utilizando condicional
if(a>b)
then
    print("A maior que B")
else
    print("A é menor que B")
end
