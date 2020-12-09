import System.Process
import Data.List

promptLine :: String -> IO String
promptLine prompt = do
    putStr prompt
    getLine

main = do
    let start = "git add ." 
    callCommand start

    let commit = "git commit -m"
    let deafultMessage = " Edit README.md"

    response <- promptLine "Do you want to use the default message for this commit?([y]/n)\n"

    if "n" `isPrefixOf` response
        then 
            do
                response <- promptLine "What do you want then?\n"
                callCommand $ commit ++ response
        else 
            callCommand response


