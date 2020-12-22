capital :: String -> String
capital "" = "Empty string"
capital all@(x : xs) = "The first letter of " ++ all ++ " is " ++ [x]