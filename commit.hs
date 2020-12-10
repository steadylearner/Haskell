#!/usr/bin/env stack
{- stack
  script
  --resolver lts-16.24
-}

-- Compare it with commit.py

-- To use this file directly
-- $chmod +x commit.hs
-- Then, $./commit.hs

-- Refer to them
-- https://www.fpcomplete.com/haskell/tutorial/stack-script/
-- http://hackage.haskell.org/package/process-1.6.10.0/docs/System-Process.html
-- https://www.steadylearner.com/blog/read/How-to-automatically-commit-files-to-GitHub-with-Python

{-# OPTIONS_GHC -Wall #-}

import System.Process
import Data.List

promptLine :: String -> IO String
promptLine prompt = do
    putStr prompt
    getLine

main :: IO ()
main = do
    let start = "git add ." 
    callCommand start

    let commit = "git commit -m"
    let defaultMessage = " 'Edit README.md'"

    response <- promptLine "Do you want to use the default message for this commit?([y]/n)\n"

    if "n" `isPrefixOf` response
        then 
            do
                message <- promptLine "What do you want then?\n"
                if message == ""
                    -- Improve this with recursion
                    -- https://stackoverflow.com/questions/16004365/simple-haskell-loop
                    then callCommand $ commit ++ defaultMessage
                    else callCommand $ commit ++ " '" ++ message ++ "'"
        else 
            callCommand $ commit ++ defaultMessage

    callCommand "git push -u origin main -f"


