{-# OPTIONS_GHC -Wall #-}

import Control.Monad.Cont
-- import Control.Monad (when)

main :: IO ()

main = do
    let oneToTen = [1..10]
    let twoToTwenty = [x * 2 | x <- oneToTen ]

    forM_ twoToTwenty $ \f -> do
        print f
