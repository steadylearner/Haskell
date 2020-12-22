largestDivisible :: (Integral a) => a
largestDivisible = head (filter (\x -> x `mod` 3829 == 0) [100000, 99999 ..])