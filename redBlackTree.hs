{-
	Arvore Red-Black em Haskell
	Nadyan Suriel Pscheidt
-}

-- Dado da cor do nó
data Cor	=	V 
			| 	P 
			deriving show

-- Dado da árvore, nó ou folha
data Arvore a = No a Cor (Arvore a) (Arvore a) 
				| Folha deriving show


-- Inserção
Ins’ e Folha = No e V Folha Folha
Ins’ e a@(No a1 e esq dir)
    | e < a1 = rot (No a1 c  (ins’ e esq) dir)
    | e > a1 = rot (No a1 c esq (ins’ e dir))
    | otherwise = a

ins e a = No e1 P esq dir
    where (No e1 c esq dir) = ins’ e a


-- Rotações:
rot (No x P (No x1 V a (No x2 V b c)) d) = No x2 V (No x1 P a b) (No x3 P c d)

rot (No x P (No x2 V (No x3 V a b) c) d) = No x2 V (No x1 P a b) (No x3 P c d)

rot (No x P a (No x2 V b (No x3 V c d))) = No x2 V (No x1 P a b) (No x3 P c d)

rot (No x P a (No x2 V (No x3 b c) d)) = No x2 V (No x1 P a b) (No x3 P c d)

rot a = a 		-- se for outro caso