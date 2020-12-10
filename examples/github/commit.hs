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

{-# OPTIONS_GHC -Wall #-}

import System.Process
import Data.List
import Control.Monad.Cont

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
                withBreak $ \break ->
                    forM_ [1..] $ \_ -> do
                        message <- promptLine "What do you want then?\n"
                        if message == ""
                            then p "Your message is empty."
                            else
                                callCommand $ commit ++ " '" ++ message ++ "'"
                                break () 
        else 
            callCommand $ commit ++ defaultMessage

    callCommand "git push -u origin main -f"

    where
    withBreak = (`runContT` return) . callCC
    p = liftIO . putStrLn


