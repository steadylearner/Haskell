module Crud
    ( prompt
    ) where

putTodo :: (Int, String) -> IO ()
putTodo (n, todo) = putStrLn (show n ++ ": " ++ todo)

prompt :: [String] -> IO ()
prompt todos = do
    -- print todos -- List of todo input by a user.
    putStrLn ""
    putStrLn "Test todo with Haskell. You can use +, -, s(show), l(ist), q(uit). commands."
    -- mapM_ putTodo (zip [0..] todos)
    command <- getLine
    interpret command todos

-- Include update todo.
interpret :: String -> [String] -> IO ()

interpret ('+':' ':todo) todos = prompt (todo:todos) -- append todo to the empty or previous todo list [] here.

interpret ('-':' ':num ) todos =
    case delete (read num) todos of
        Nothing -> do
            putStrLn "No TODO entry matches the given number"
            prompt todos
        Just todos' -> prompt todos'

interpret ('s':' ':num ) todos =
    case showOne (read num) todos of
        Nothing -> do
            putStrLn "No TODO entry matches the given number"
            prompt todos
        Just todo -> do
            print $ num ++ ". " ++ todo 
            prompt todos

interpret  "l"           todos = do
    let numberOfTodos = length todos
    putStrLn ""
    print $ show numberOfTodos ++ " todo in total"

    mapM_ putTodo (zip [0..] todos)
    prompt todos
            
interpret  "q"           todos = return ()

interpret  command       todos = do
    putStrLn ("Invalid command: `" ++ command ++ "`")
    prompt todos

delete :: Int -> [a] -> Maybe [a]
delete 0 (_:as) = Just as
delete n (a:as) = do
    as' <- delete (n - 1) as
    return (a:as')
delete _  []    = Nothing

showOne :: Int -> [a] -> Maybe a
showOne n todos = do 
    if n > length todos
        then Nothing
        else Just (todos !! n)