module Main where

import Crud (prompt)

main :: IO ()
main = do
    putStrLn "Commands:"
    putStrLn "+ <String> - Add a TODO entry"
    putStrLn "- <Int>    - Delete the numbered entry"
    putStrLn "s <Int>    - Show the numbered entry"
    putStrLn "e <Int>    - Edit te numbered entry"
    putStrLn "l          - List todo"
    putStrLn "q          - Quit"
    prompt []


