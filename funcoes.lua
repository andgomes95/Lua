#!/usr/local/bin/lua

-- funcao, verifica se um numero é par.
function epar(num1)
    resto=num1%2;
    if(resto==0)
        then
            return "sim";
        else
            return "não";
        end
end
--chamada de funcao, verifica se o número é par
print("é par",epar(5))
