-- import Control.Monad

-- main = replicateM_ 10 $ print "It will be repeated 10 times."

repeatIt 0 _ = return ()
repeatIt n action =
 do
  action
  repeatIt (n-1) action

main = repeatIt 10 (putStrLn "It will be repeated 10 times.")

-- putStr $ concat ["fuck" ++ "\n" | i <- [1, 2..10]]