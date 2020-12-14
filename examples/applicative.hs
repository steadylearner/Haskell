-- <*>
-- https://hackage.haskell.org/package/optparse-applicative
-- http://learnyouahaskell.com/functors-applicative-functors-and-monoids#applicative-functors

main = do 
    -- print $ ((+) <$> Just 1) <*> Just 2
    print $ pure (+) <*> Just 1 <*> Just 1