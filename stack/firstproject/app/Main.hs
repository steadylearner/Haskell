-- https://schooloffp.co/2020/12/05/whirlwind-tour-of-stack-for-beginners.html
-- stack run

-- module Main where

-- import Lib (someFunc)

-- main :: IO ()
-- main = someFunc

{-# LANGUAGE OverloadedStrings #-}

module Main where

import Text.Emoji
import HaskellSay (haskellSay)
import Data.Text hiding (map)

import EmojiQuotes

-- -- attempting to use a hidden module
-- import QuotesStore

main = do
     putStrLn ("Type in a number between 0 and " ++ show (numberOfQuotes - 1))
     
     index <- getLine
     case selectQuote (read index :: Int) of
       Just s -> putStrLn s
       _      -> putStrLn ("No quote found at index " ++ show index)