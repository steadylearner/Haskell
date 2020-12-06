main :: IO ()
main = do 
    putStrLn $ "Haskell " ++ "Language"
    putStrLn $ "1 + 1 = " ++ show (1 + 1)
    putStrLn $ "7.0 / 3.0 = " ++ show (7.0 / 3.0)

    print $ True && False
    print $ True || False
    print $ not True