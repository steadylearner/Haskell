plus :: Int -> Int -> Int
plus = (+)

doublePlus :: Int -> Int -> Int -> Int
doublePlus a b c = a + b + c

main :: IO ()
main = do
    let usePlus = plus 1 2
    putStrLn $ "1 + 2 = " ++ show usePlus

    let useDoublePlus = doublePlus 1 2 3
    putStrLn $ "1 + 2 + 3 = " ++ show useDoublePlus