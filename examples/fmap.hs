-- You should know those to use it.
-- https://hackage.haskell.org/package/optparse-applicative

-- (<$>) :: Functor f => (a->b) -> f a -> f b

-- (<$>), which lifts a single-argument function into a Functor `fmap`
-- (<*>), which chains a multi-argument function through an Applicative 
-- (=<<), which binds a function that enters a Monad onto an existing computation 

-- https://www.snoyman.com/blog/2017/01/functors-applicatives-and-monads
-- Notice the distinction between <$> and <*>. The former uses a function which is not wrapped in a functor, 
-- while the latter applies a function which is wrapped up.

main :: IO ()
main = do 
    print $ (*2) <$> Just 5
    print $ fmap (* 2) (Just 5)