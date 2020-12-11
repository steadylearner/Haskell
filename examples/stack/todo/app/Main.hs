module Main where

-- Move this to src Lib.hs

import Crud (prompt)

-- 

main :: IO ()
main = do
    putStrLn "Commands:"
    putStrLn "+ <String> - Add a TODO entry"
    putStrLn "- <Int>    - Delete the numbered entry"
    putStrLn "q          - Quit"
    prompt []


