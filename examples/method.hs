data Rect = Rect Int Int

area :: Rect -> Int
area (Rect w h) = w * h

perimeter :: Rect -> Int
perimeter (Rect w h) = 2 * w + 2 * h

main :: IO ()
main = do
    let r = Rect 10 11
    putStrLn $ "area: " ++ show (area r)
    putStrLn $ "perimeter: " ++ show (perimeter r)