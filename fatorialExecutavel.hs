{-
	Fatorial em Haskell
	Nadyan Suriel Pscheidt
-}

-- para compilar um programa precisamos de uma função main
-- gerar um executavel que pede um numero e calcula o fatorial

import System.Environment 		--para usar getArgs


fat 0 = 1
fat n = n * fat(n-1)


main = do args <- getArgs
	  let n = read(head args)  	--head pega o primeiro elemento da lista
	  putStr( show( fat n )++"\n")



{- 
	no linux, vai no diretorio que ta o .hs:
	
	Para compilar,
	ghc fatExecutavel.hs

	Para executar o fat de 5,
	.\fatExecutavel 5
-}
