promptLine :: String -> IO String
promptLine prompt = do
    putStr prompt -- IO
    getLine -- String

main :: IO ()
main = do
    response <- promptLine "What do you want to learn?\n"
    if response == "code"
        then putStrLn "Make something relevant to your life with it."
        else putStrLn ("I don't have nothing to say for " ++ response)