import Data.List
import Data.Char

numLines = zip [1,2..]

allNumWords [] = []
allNumWords ((i,l) : xs) = map (\w -> (i,w)) (words l) ++ allNumWords xs          -- i = numero Linha 
										-- l = linha
-- OU										
-- allNumWords ((i,l) : xs) = zip (repeat i) (words l) ++ allNumWords xs	


sortLs = sortBy cmpWord
	where cmpWord (_,w)(_,w') = compare (map toUpper w) (map toUpper w')	-- compare é uma função ja implementada	
	

amalgamate [] = []								-- @ faz com que x e xs fiquem em xxs (junta a lista toda em xxs)
amalgamate xxs@(x:xs) = (map fst (takeWhile eqw xxs), snd x) : amalgamate (dropWhile eqw xs)
	where eqw (_,w') = map toUpper w' == map toUpper (snd x) 


-- AQUI VAI CHAMAR AS FUNÇÕES:

-- makeIndex txt = amalgamate( sortLs( allNumWords( numLines( lines( txt ) ) ) )
-- OU
makeIndex = amalgamate.sortLs.allNumWords.numLines.lines            


{-
	- Função que separa o texto em linhas: lines

		lines "linha1\nlinha2"



	- Função que separa o texto em palavras: words

		words "palavra1 palavra2"


	- Atribuir um numero a cada linha

		numLines = zip [1,2..] (lines "linha1\nlinha2")
-}                                              
				     	