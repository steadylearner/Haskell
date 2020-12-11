import Control.Concurrent (forkIO)
import Control.Exception (handle, SomeException)
import Control.Monad (forever)
import qualified Data.ByteString.Lazy as L
import System.Console.Haskeline (runInputT, defaultSettings, getInputLine)

-- Provided by the 'zlib' package on http://hackage.haskell.org/
import Codec.Compression.GZip (compress)

-- :t handle
-- handle :: Exception e => (e -> IO a) -> IO a -> IO a
-- https://hackage.haskell.org/package/base-4.14.0.0/docs/Control-Exception.html#g:6
-- https://hackage.haskell.org/package/base-4.14.0.0/docs/Control-Exception.html#g:1

main :: IO ()
main = do
  maybeLine <- runInputT defaultSettings $ getInputLine "Enter a file to compress\n"
  case maybeLine of
    Nothing -> return () -- user entered EOF
    Just "" -> return () -- treat no filename as "want to quit"
    Just filename -> do
        handle (print :: SomeException -> IO ()) $ do
            content <- L.readFile filename
            forkIO (compressFile filename content)

            print "Do something else here" -- You will see this before compressed file shown at your file system.
            
            main -- recursion (repeat)
            where compressFile path = L.writeFile (path ++ ".gz") . compress      


    