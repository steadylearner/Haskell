-- https://github.com/pcapriotti/optparse-applicative
-- https://www.fpcomplete.com/haskell/library/optparse-applicative/

-- $stack run create cli
-- "Created the thing named cli"

{-#LANGUAGE ScopedTypeVariables#-}

import Data.Semigroup ((<>))
import Options.Applicative

data Opts = Opts
    { optGlobalFlag :: !Bool
    , optCommand :: !Command
    }

data Command
    = Create String
    | Delete

-- I already have Rust version for the conditions below.
-- If I have sufficient time, I will implement this and write a blog for this.

-- -- 1. Make handlers for them.
-- -- get
-- -- post
-- -- put
-- -- delete
-- -- _

-- -- 2. Include web request to https://jsonplaceholder.typicode.com inside them.

main :: IO ()
main = do
    (opts :: Opts) <- execParser optsParser
    case optCommand opts of
        Create name -> putStrLn ("Created the thing named " ++ name)
        Delete -> putStrLn "Deleted the thing!"
    putStrLn ("global flag: " ++ show (optGlobalFlag opts))
    where
    optsParser :: ParserInfo Opts
    optsParser =
        info
            (helper <*> versionOption <*> programOptions)
            (fullDesc <> progDesc "optparse subcommands example" <>
             header
                 "optparse-sub-example - a small example program for optparse-applicative with subcommands")
    versionOption :: Parser (a -> a)
    versionOption = infoOption "0.0" (long "version" <> help "Show version")
    programOptions :: Parser Opts
    programOptions =
        Opts <$> switch (long "global-flag" <> help "Set a global flag") <*>
        hsubparser (createCommand <> deleteCommand)
    createCommand :: Mod CommandFields Command
    createCommand =
        command
            "create"
            (info createOptions (progDesc "Create a thing"))
    createOptions :: Parser Command
    createOptions =
        Create <$>
        strArgument (metavar "NAME" <> help "Name of the thing to create")
    deleteCommand :: Mod CommandFields Command
    deleteCommand =
        command
            "delete"
            (info (pure Delete) (progDesc "Delete the thing"))

-- -- {-# LANGUAGE OverloadedStrings #-}

-- module Main (main) where

-- import Control.Monad.IO.Class
-- import Data.Aeson
-- -- import Network.HTTP.Req

-- -- https://www.reddit.com/r/haskell/comments/6wjf81/couldnt_match_type_char_with_text/
-- import Data.Text (pack)

-- import Text.Toml

-- -- main :: IO ()
-- -- main = do
--   -- Include this later?
--   -- txt <- readFile "./cli.toml"
--   -- let r = parseTomlDoc "" (pack txt)
--   -- print r
