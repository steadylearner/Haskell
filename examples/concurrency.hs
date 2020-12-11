-- http://book.realworldhaskell.org/read/concurrent-and-multicore-programming.html

-- ghci> :m +Control.Concurrent
-- ghci> :t forkIO
-- forkIO :: IO () -> IO ThreadId
-- ghci> :m +System.Directory
-- ghci> forkIO (writeFile "test" "test") >> doesFileExist "test"
-- False

-- a >> b can be read like "do a then do b , and return the result of b "

import Control.Concurrent
import System.Directory

main :: IO ()
main = do 
    forkIO (writeFile "test" "test") 
    file <- doesFileExist "test" 
    print file
