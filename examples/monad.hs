-- import Text.Read (readMaybe)

-- displayAge :: Show a => Maybe a -> IO ()
-- displayAge maybeAge =
--   case maybeAge of
--     Nothing -> putStrLn "You provided invalid input"
--     Just age -> putStrLn $ "In that year, you will be: " ++ show age

-- yearDiff :: Num a => a -> a -> a
-- yearDiff futureYear birthYear = futureYear - birthYear

-- -- >>= or =<< or <- in Do is unwrap

-- main :: IO ()
-- main = do
--   putStrLn "Please enter your birth year"
--   birthYearString <- getLine
--   putStrLn "Please enter some year in the future"
--   futureYearString <- getLine
--   let maybeAge = do
--         futureYear <- readMaybe futureYearString
--         birthYear <- readMaybe birthYearString
--         return $
--           if futureYear < birthYear
--             then yearDiff birthYear futureYear
--             else yearDiff futureYear birthYear
--   displayAge maybeAge
