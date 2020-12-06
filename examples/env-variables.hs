import System.Environment

main :: IO ()
main = do
    setEnv "First" "1"
    putStr "First:" >> (putStrLn =<< getEnv "First")

    putStr "BAR:" >> (print =<< lookupEnv "BAR")

    -- mapM_ putStrLn =<< map fst `fmap` getEnvironment
