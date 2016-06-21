{-
	Exercícios Haskell
	Nadyan Suriel Pscheidt
-}


-- Declare uma lista infinita de 1's

	listaInfinitaDeUm = 1:listaInfinitaDeUm

	take 100 listaInfinitaDeUm    -- pega 100 um's


-- Declare uma função que receba como parâmetro um valor A e retorne uma lista infinita: [a, a+1, a+2, a+3, ...]

	listaIncremento a = a:listaIncremento (a+1)


-- Declare uma função que receba como parâmetros valores A e B e retorne uma lista infinita [a, a+b, a+2*b, a+3*b, ...]

	listaEstranha a b = a:listaEstranha (a+b) b


-- Retorne uma lista com o codigo asc da lista ['A','B','C','D']
	
	map fromEnum "ABCD"


-- Dado uma letra, retorne a lista do alfabeto a partir dela

	listaIncremento a = a : listaIncremento (toEnum (fromEnum (a+1) ) )



-- Gerar lista de numeros pares

	[x*2 | x <- [1.. ]]

	-- ou
	
	[x | x <- [1.. ], x `mod` 2 == 0]


-- Retorna [(1, A), (1, B), (1, C), (2, A), (2, B), (2, C), (3, A) ...] 

	[(x,y) | x<-[1..7], y<- "ABC"]
