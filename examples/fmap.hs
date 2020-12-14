-- You should know those to use it.
-- https://hackage.haskell.org/package/optparse-applicative

-- (<$>) :: Functor f => (a->b) -> f a -> f b

-- (<$>), which lifts a single-argument function into a Functor `fmap`
-- (<*>), which chains a multi-argument function through an Applicative 
-- (=<<), which binds a function that enters a Monad onto an existing computation 

main = print $ (*2) <$> [1..5]  