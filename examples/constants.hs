s :: String
s = "constant"

main :: IO ()
main = do
    putStrLn s

    let n = 1000000
    let d = 3e20 / n

    print d
    print $ sin n