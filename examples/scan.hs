main :: IO ()
main = print $ scanl (+) 0 [1, -1, 1, -1, 1]