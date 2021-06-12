module Lib
  ( prompt,
    editIndex,
  )
where

import Data.List

-- import Data.Char (digitToInt)

putTodo :: (Int, String) -> IO ()
putTodo (n, todo) = putStrLn (show n ++ ": " ++ todo)

prompt :: [String] -> IO ()
prompt todos = do
  putStrLn ""
  putStrLn "Test todo with Haskell. You can use +(create), -(delete), s(show), e(dit), l(ist), r(everse), c(lear), q(uit) commands."
  command <- getLine
  if "e" `isPrefixOf` command
    then do
      print "What is the new todo for that?"
      newTodo <- getLine
      editTodo command todos newTodo
    else interpret command todos

-- https://stackoverflow.com/questions/1817865/haskell-and-differences#:~:text=The%20%3A%20operator%20is%20known%20as,same%20as%20y%3Ax%3A%5B%5D%20.
interpret :: String -> [String] -> IO ()
interpret ('+' : ' ' : todo) todos = prompt (todo : todos) -- append todo to the empty or previous todo list [] here.
interpret ('-' : ' ' : num) todos =
  case deleteOne (read num) todos of
    Nothing -> do
      putStrLn "No TODO entry matches the given number"
      prompt todos
    Just todos' -> prompt todos'
interpret ('s' : ' ' : num) todos =
  case showOne (read num) todos of
    Nothing -> do
      putStrLn "No TODO entry matches the given number"
      prompt todos
    Just todo -> do
      print $ num ++ ". " ++ todo
      prompt todos
interpret "l" todos = do
  let numberOfTodos = length todos
  putStrLn ""
  print $ show numberOfTodos ++ " in total"

  mapM_ putTodo (zip [0 ..] todos)
  prompt todos
interpret "r" todos = do
  let numberOfTodos = length todos
  putStrLn ""
  print $ show numberOfTodos ++ " in total"

  let reversedTodos = reverseTodos todos

  mapM_ putTodo (zip [0 ..] reversedTodos)
  prompt todos
interpret "c" todos = do
  print "Clear todo list."

  prompt []
interpret "q" todos = return ()
interpret command todos = do
  putStrLn ("Invalid command: `" ++ command ++ "`")
  prompt todos

-- Move the functions below to another file.

deleteOne :: Int -> [a] -> Maybe [a]
deleteOne 0 (_ : as) = Just as
deleteOne n (a : as) = do
  as' <- deleteOne (n - 1) as
  return (a : as')
deleteOne _ [] = Nothing

showOne :: Int -> [a] -> Maybe a
showOne n todos =
  if (n < 0) || (n > length todos)
    then Nothing
    else Just (todos !! n) -- Index is not checked here? Why?

editIndex :: Int -> a -> [a] -> [a]
editIndex i x xs = take i xs ++ [x] ++ drop (i + 1) xs

editTodo :: String -> [String] -> String -> IO ()
editTodo ('e' : ' ' : num) todos newTodo =
  case editOne (read num) todos newTodo of
    Nothing -> do
      putStrLn "No TODO entry matches the given number"
      prompt todos
    Just todo -> do
      putStrLn ""

      print $ "Old todo is " ++ todo
      print $ "New todo is " ++ newTodo
      -- let index = head (map digitToInt num)
      -- let index = read num::Int
      -- print index

      let newTodos = editIndex (read num :: Int) newTodo todos -- Couldn't match expected type ‘Int’ with actual type ‘[Char]
      let numberOfTodos = length newTodos
      putStrLn ""
      print $ show numberOfTodos ++ " in total"
      mapM_ putTodo (zip [0 ..] newTodos)

      prompt newTodos

editOne :: Int -> [a] -> String -> Maybe a
editOne n todos newTodo =
  if (n < 0) || (n > length todos)
    then Nothing
    else do
      Just (todos !! n) -- Index is not checked here? Why?

reverseTodos :: [a] -> [a]
reverseTodos xs = go xs []
  where
    go :: [a] -> [a] -> [a]
    go [] ys = ys
    go (x : xs) ys = go xs (x : ys)