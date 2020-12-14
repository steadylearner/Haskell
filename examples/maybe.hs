testMaybe :: Int -> Int -> Maybe Int
testMaybe x y 
    | result > 0 && result <= 10 = Just result
    | otherwise = Nothing
    where result = x + y

main :: IO ()
main = do
    print $ show (testMaybe 10 10)
    print $ show (testMaybe 1 1)

    let justTwo = testMaybe 1 1
    case justTwo of
        Just n -> print n
        Nothing -> print "Nothing"

