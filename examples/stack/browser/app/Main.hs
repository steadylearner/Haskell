module Main where

import Web.Browser (openBrowser)

main :: IO ()
main = do
    let target = "http://haskell.org/"
    result <- openBrowser target
    if result
        then print ("Could open " ++ target)
        else print ("Couldn't open " ++ target)
