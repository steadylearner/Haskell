#!/usr/bin/env stack
{- stack
  script
  --resolver lts-16.24
-}

-- Compare it with commit.py

-- You can use it with two ways.

-- 1. Script
-- To use this file directly
-- $chmod +x commit.hs
-- Then, $./commit.hs
-- ($stack runghc -- HelloWorld.hs)

-- 2. Binary
-- $stack ghc -- commit.hs

-- Refer to them
-- https://www.fpcomplete.com/haskell/tutorial/stack-script/
-- http://hackage.haskell.org/package/process-1.6.10.0/docs/System-Process.html
-- https://www.steadylearner.com/blog/read/How-to-automatically-commit-files-to-GitHub-with-Python
-- https://wiki.haskell.org/Introduction_to_Haskell_IO/Actions#:~:text=Actions%20are%20values%20in%20the,every%20action%20has%20a%20type.

{-# OPTIONS_GHC -Wall #-}

import System.Process
-- import System.Process ( callCommand )
import Data.List
import System.Exit -- https://stackoverflow.com/questions/44604701/haskell-exit-a-program-with-a-specified-error-code

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

    useDefaultMessage <- promptLine "Do you want to use the default message for this commit?([y]/n)\n"

    if "n" `isPrefixOf` useDefaultMessage
        then 
            do
                commitMessage <- promptLine "What do you want then?\n"
                if commitMessage == ""
                    -- Improve this with recursion?
                    -- https://stackoverflow.com/questions/16004365/simple-haskell-loop
                    then do
                        secondCommitMessage <- promptLine "Your message was empty. What do you really want?\n"
                        if secondCommitMessage == ""
                            then die (show "Your message was empty again. Close the programm.")
                            else callCommand $ commit ++ " '" ++ secondCommitMessage ++ "'"
                    else callCommand $ commit ++ " '" ++ commitMessage ++ "'"
        else 
            callCommand $ commit ++ defaultMessage

    callCommand "git push -u origin main -f"


