{-# OPTIONS_GHC -Wall #-}
-- When you run, $stack runghc ghc-wall.hs command,
-- that should show "Non-exhaustive patterns in case"
data MySum = Foo | Bar | Baz

main :: IO()
main =
    case Baz of
        Foo -> putStrLn "Foo"
        Bar -> putStrLn "Bar"