main :: IO ()
main = print $ filter (== 1) [1, 2]

-- main = do
--   line <- fmap reverse getLine
--   putStrLn $ "You said " ++ line ++ " backwards!"
--   putStrLn $ "Yes, you really said" ++ line ++ " backwards!"