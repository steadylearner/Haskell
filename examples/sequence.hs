main :: IO ()
main = do 
    results <- reverse <$> sequence [getLine, getLine, getLine]
    print results