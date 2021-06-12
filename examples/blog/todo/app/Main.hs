-- https://www.fpcomplete.com/haskell/tutorial/stack-script/
-- #!/usr/local/bin/env stack
-- stack --resolver lts-12.21 script

module Main where

import Configuration.Dotenv (defaultConfig, loadFile)
import Lib (prompt)
import System.Environment (lookupEnv)
import Web.Browser (openBrowser)

-- $stack run

-- $stack build

-- $stack install

-- $stack install --local-bin-path <dir>

-- $stack install --local-bin-path .

-- $./text-exe

-- $stack Main.hs

-- $chmod +x Main.hs

-- $./Main.hs

-- Should include .env and open browser.

main :: IO ()
main = do
  loadFile defaultConfig
  website <- lookupEnv "WEBSITE"

  case website of
    Nothing -> error "You should set WEBSITE at .env file."
    Just s -> do
      result <- openBrowser s
      if result
        then print ("Could open " ++ s)
        else print ("Couldn't open " ++ s)

      putStrLn "Commands:"
      putStrLn "+ <String> - Add a TODO entry"
      putStrLn "- <Int>    - Delete the numbered entry"
      putStrLn "s <Int>    - Show the numbered entry"
      putStrLn "e <Int>    - Edit te numbered entry"
      putStrLn "l          - List todo"
      putStrLn "r          - Reverse todo"
      putStrLn "c          - Clear todo"
      putStrLn "q          - Quit"
      prompt [] -- Start with the empty todo list.

-- putStrLn "Commands:"
-- putStrLn "+ <String> - Add a TODO entry"
-- putStrLn "- <Int>    - Delete the numbered entry"
-- putStrLn "s <Int>    - Show the numbered entry"
-- putStrLn "e <Int>    - Edit te numbered entry"
-- putStrLn "l          - List todo"
-- putStrLn "r          - Reverse todo"
-- putStrLn "c          - Clear todo"
-- putStrLn "q          - Quit"
-- prompt [] -- Start with the empty todo list.