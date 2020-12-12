-- $stack test
-- Use quickcheck later?

import Crud (editIndex)

import Control.Exception
import Data.List

main :: IO ()
main = do
    let todos = ["Read", "Haskell", "test"]
    let newTodo = "Write"
    let newTodos = editIndex 0 newTodo todos

    assert (head newTodos == newTodo) (print $ intercalate " " newTodos)
    

    
    -- print $ assert (newList == ["Haskell", "learner"]) True

-- -- Make a test for this.
-- editIndex :: Int -> a -> [a] -> [a]    
-- editIndex i x xs = take i xs ++ [x] ++ drop (i+1) xs
