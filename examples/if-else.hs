import Control.Monad (when)

main :: IO ()
main = do
    if even 7
        then putStrLn "7 is even."
        else putStrLn "7 is odd."

    when (8 `mod` 4 == 0) (putStrLn "8 is divisible by 4.")

    let num = 9
    putStrLn $
        if num < 0
            then show num ++ " is negative."
            else if num < 10
                then show num ++ " has 1 digit."
                else show num ++ " has more than 1 digit."