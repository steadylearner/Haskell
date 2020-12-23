-- <*>
-- https://hackage.haskell.org/package/optparse-applicative
-- http://learnyouahaskell.com/functors-applicative-functors-and-monoids#applicative-functors

main = do 
    print $ Just (* 3) <*> Just 3
    -- <*> is left associative.
    -- (++) <$> Just "johntra" <*> Just "volta" 


-- stack --resolver lts-7.14 --install-ghc runghc
-- import Text.Read (readMaybe)

-- displayAge maybeAge =
--     case maybeAge of
--         Nothing -> putStrLn "You provided invalid input"
--         Just age -> putStrLn $ "In that year, you will be: " ++ show age

-- yearDiff futureYear birthYear = futureYear - birthYear

-- main = do
--     putStrLn "Please enter your birth year"
--     birthYearString <- getLine
--     putStrLn "Please enter some year in the future"
--     futureYearString <- getLine
--     let maybeAge =
--             fmap yearDiff (readMaybe futureYearString)
--                 <*> readMaybe birthYearString
--     displayAge maybeAge