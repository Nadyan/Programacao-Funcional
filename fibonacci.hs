{-
	Fibonacci em Haskell
	Nadyan Suriel Pscheidt
-}


-- FORMA INEFICIENTE
fib 0 = 0
fib 1 = 1
fib n = fib(n-2) + fib(n-1)

fibs = map fib [0..]

-- execução:
-- > take 30 fibs



-- FORMA EFICIENTE
zip [] _ = []
zip _ [] = []
zip (x:xs) (y:yx) = (x,y):zip xs ys --tupla com:
				    --primeiro elem da primeira lista
				    --segundo elem da segunda lista

zipwith _[]_ = []
zipwith __[] = []
zipwith f(x:xs)(y:ys) = f x y : zipwith f xs ys

-- execução:
-- > zipwith (+) [1,2,3] [1,2,3]

fibs' = 0:(1:zipwith (+) fibs' (tail fibs'))  --tail retorna a cauda da lista

-- execução:
-- > take 30 fibs'











