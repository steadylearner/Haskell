import System.Environment

main :: IO ()
main = do
    args <- getArgs
    -- Handle not enough args here?
    let arg = args !! 2

    print args
    putStrLn arg

    progName <- getProgName
    putStrLn progName