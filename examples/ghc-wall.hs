{-# OPTIONS_GHC -Wall #-}
-- When you run, $stack runghc ghc-wall.hs command,
-- that should show "Non-exhaustive patterns in case"
data Options = First| Second | Third

main :: IO()
main =
    case Third of
        First -> putStrLn "First"
        Second -> putStrLn "Second"