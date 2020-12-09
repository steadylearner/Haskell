#!/usr/bin/env stack

-- Compare it with commit.py

-- To use this file directly
-- $chmod +x commit.hs
-- Then, $./commit.hs

-- Refer to these
--  https://www.fpcomplete.com/haskell/tutorial/stack-script/
-- http://hackage.haskell.org/package/process-1.6.10.0/docs/System-Process.html

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
                    then callCommand $ commit ++ defaultMessage
                    else callCommand $ commit ++ message
        else 
            callCommand $ commit ++ defaultMessage


