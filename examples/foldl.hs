sum' :: (Num a) => [a] -> a  
sum' = foldl (+) 0

proudct' :: (Foldable t, Num a) => t a -> a
proudct' = foldl (*) 1