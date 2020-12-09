#!/usr/bin/env stack
{- stack
-}

-- Compare it with commit.py

-- To use this file directly
-- $chmod +x commit.hs
-- Then, $./commit.hs

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


