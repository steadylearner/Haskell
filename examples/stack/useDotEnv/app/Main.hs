-- https://hackage.haskell.org/package/dotenv

import System.Environment
import Configuration.Dotenv (loadFile, defaultConfig)

main :: IO ()
main = do
    loadFile defaultConfig
    api <- lookupEnv "API"
    case api of 
        Nothing -> error "no api"
        Just s -> do
            print s 
