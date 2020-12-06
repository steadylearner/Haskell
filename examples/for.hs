import Control.Monad.Cont

main :: IO ()
main = do
    forM_ [1..3] $ \f -> do
        print f

    forM_ [7..9] $ \s -> do
        print s

    withBreak $ \break ->
        forM_ [1..] $ \_ -> do
            p "break"
            break ()

    where
    withBreak = (`runContT` return) . callCC
    p = liftIO . putStrLn

    