bmiTeller :: (RealFloat a) => a -> String  
bmiTeller bmi  
    | bmi <= 18.5 = "0"  
    | bmi <= 25.0 = "1"  
    | bmi <= 30.0 = "2"  
    | otherwise   = "?"  