import Data.List

main :: IO ()
main = do
    let ints = [7, 6, 5]
    putStrLn $ "Ints: " ++ show (sort ints)

    let s = ints == sort ints
    putStrLn $ "Sorted: " ++ show s

    if ints == sort ints
        then print "Sorted"
        else print "Not Sorted"