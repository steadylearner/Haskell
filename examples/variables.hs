main :: IO ()
main = do 
    let a = "start"
    putStrLn a

    let b = 1
    let c = 2
    print b >> print c

    let d = True
    print d

    -- What is wrong here?
    let e = undefined :: Int
    print e

    let f = "short"
    putStrLn f