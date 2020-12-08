import Control.Exception
import Data.Int
import Foreign.Marshal.Array
import System.IO

main = do
--   let file = "test.txt"
--   let text = "hello\nhaskell\n"
--   writeFile file text

  bracket
    (openBinaryFile "test.txt" WriteMode)
    (\handle -> hClose handle)
    $ \handle -> do
      let d2 = [115, 111, 109, 101, 10] :: [Int8]
      p <- newArray d2
      hPutBuf handle p (length d2)
      putStrLn $ "wrote " ++ show (length d2) ++ " bytes"

      hPutStr handle "writes\n"
      putStrLn "wrote 7 bytes"

      hSetBuffering handle (BlockBuffering Nothing) -- default
      hPutStr handle "buffered\n"
      putStrLn "wrote 9 bytes"
      hFlush handle