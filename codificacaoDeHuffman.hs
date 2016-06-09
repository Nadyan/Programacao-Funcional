import Data.Char
import Data.List
import qualified Data.Binary.Get as G
import System.IO
import System.IO.Error
import qualified Data.Binary.Put as P
import qualified Data.ByteString.Lazy as L
import qualified Data.ByteString.Internal as I

data Huffman = Folha Char Int 
				| No Int Huffman Huffman 
				deriving (Show)
    
		

--freq :: String -> [Huffman]
--
freq [] = []
freq (x:xs) = Folha x (freqChar x (x:xs)) : freq(remove x xs)
    where
		remove _ [] = [] -- caso base: se receber lista vazia
		remove c (x:xs) = if (c == x) then remove c xs -- se encontrou remove,
									  else x:remove c xs -- se nao envia o prox char
		freqChar c [] = 0 -- caso base: se receber lista vazia
		freqChar c (x:xs) = if (c == x) then 1 + freqChar c xs -- se encontrou mais um igual soma 1
										else freqChar c xs -- se nao manda o novo diferente pra freqChar


-----------------------------------------------------------------------------------------------------------
-- funćao que especifica o tipo de ordenacao
compara x y	| a > b     = GT
			| a == b    = EQ
			| otherwise = LT
    where 
    	a = pegarFreq x
    	b = pegarFreq y
		
pegarFreq (Folha _ a) = a
pegarFreq (No a _ _)  = a

frequencia xs = sortBy compara (freq xs) -- ordenar a lista


-----------------------------------------------------------------------------------------------------------
--construirArv :: [Huffman] -> Huffman
--constroi a arvore a partir da funcao frequencia, que é o freq ordenado
construirArv [one] = [one] -- para quando tiver apenas uma arvore
construirArv (x:y:xs) = construirArv ((No (a + b) menor maior) : xs)
	where
		a = pegarFreq x 	-- se for folha, a frequencia é a segunda posicao
		b = pegarFreq y		-- se for no, a frequencia é a primeira posicao
		menor = if a <= b then x else y -- pega menor frequencia
		maior = if a > b then x else y -- pega maior frequencia


-----------------------------------------------------------------------------------------------------------
--codHuffman :: Huffman -> [(Char, String)]
--
codHuffman (Folha c frequencia) = [(c, "")] -- caso base: pára quando chegar na folha que é o caractere c
codHuffman (No _ a b) = (concatena (codHuffman a) "0") ++ (concatena (codHuffman b) "1")
	where 
		concatena [] _ = []
		concatena (x:xs) e = (fst x, e ++ snd x) : concatena xs e


--compactar :: String -> Huffman -> String
--
compactar [] codigo = []
compactar (x:xs) codigo = (procura x codigo) ++ (compactar xs codigo)
	where
		procura c (x:xs) = if fst x == c then snd x else procura c xs




-- FUNCOES DE TESTE:

-- testar a funcao construirArvore que retorna a arvore
construirArvore xs = head (construirArv(frequencia xs))
-- testar a função compactar que retorna o codigo huffman da string
comp t =  compactar t (codHuffman(construirArvore(t)))



-------------------------------------------------------------------------------------------------------------
--descompactar :: Huffman -> String -> Huffman -> String
--
descompactar (No frequencia a b) (x:[]) _ = if x == '1' then [getChar b] else [getChar a]
	where
		getChar (Folha c _) = c

descompactar (Folha c _) (x:[]) _ = c:[]
descompactar (No frequencia a b) (x:xs) arvore = if x == '0' then descompactar a xs arvore
															 else descompactar b xs arvore
descompactar (Folha c _) (x:xs) arvore = c : descompactar arvore (x:xs) arvore


--freqLista [] = []
--freqLista (x:xs) = (x,length (filter (==x) xs) + 1) : freqLista (filter (/= x) xs)

{-
putListaFreq [] = P.flush
putListaFreq ((c,f) : xs) = do
    P.putWord8 (I.c2w c)
    P.putWord32be (toEnum f)
    putListaFreq xs
-}

--putCompacto :) implementar






-- operaćoes com arquivo:

{-
putAll txt = do
	P.putWord32be (toEnum (length (freq txt)))
    P.putWord32be (toEnum (length (comp txt)))
	--putListaFreq txt
    --putCompacto txt
-}


escrita = do
   txt <- readFile "texto.txt"
   let xs = comp txt
		where 
			comp t = compactar t (codHuffman(construirArvore(t)))
   let bs = P.runPut(P.putWord32be (toEnum (length (xs))))  -- let bs = P.runPut(putAll xs)
   L.writeFile "compactado.bin" bs


















