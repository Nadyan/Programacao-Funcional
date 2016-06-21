{-
	Monadas de Entrada e Saída em Haskell
	Nadyan Suriel Pscheidt
-}



-- Exemplinho, pergunta o nome e imprime "Ola nome":

ola = do putStr "Qual o seu nome?"   -- o comando 'do' é açúcar sintatico
	 nome <- getLine
	 putStr ("Ola" ++ nome)


-- sem o açúcar sintatico fica assim:

ola' = putStr "Qual o seu nome?" >> getLine >>= (\nome -> putStr ("Ola" ++ nome))

----------------------------------------------------------------------------------

{-
class Monad
   (>>=) :: m a -> (a -> m b) -> m b
   (>>) :: m a -> m b -> m b
   return :: a -> m a
-}

----------------------------------------------------------------------------------

-- Exemplinho fatorial:

fat 0 = 1
fat n = n * fat(n-1)

main = do putStr "Digite n: "				-- class Read
	  n <- getLine			       --    	--	read :: String -> a  -- pega string e converte pra int
	  putStr( show( fat( read n )) )       	-- clss Show
					       					--	show :: a -> String  -- pega int e converte pra string


----------------------------------------------------------------------------------

-- Exemplinho que pede o nome do arquivo e abre ele:

main2 = do putStr "Arquivo: "
	   arq <- getLine
	   txt <- readFile arq
	   putStr txt

----------------------------------------------------------------------------------
