import Control.Exception 

import Lib (editIndex)

main :: IO ()
main = do
    putStrLn "Test:"
    let index = 1
    let new_todo = "two"
    let todos = ["Write", "a", "blog", "post"]
    let new_todos = ["Write", "two", "blog", "post"]

    let result = editIndex index new_todo todos == new_todos
    
    -- assert :: Bool -> a -> a
    putStrLn $ assert result "editIndex worked." 