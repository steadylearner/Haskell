{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE ExtendedDefaultRules #-}

module Main (main) where

import Database.MongoDB    (Action, Document, Document, Value, access,
                            close, connect, delete, deleteMany, exclude, find, findOne,
                            fetch, save, merge,
                            host, insert, insertMany, master, project, rest,
                            select, sort, (=:))

import Data.Bson (Field)

import Control.Monad.Trans (liftIO) -- What liftIO do here?

import Web.Browser (openBrowser)

-- $docker exec -it mongodb bash
-- $use production

main :: IO ()
main = do
    pipe <- connect (host "127.0.0.1")
    e <- access pipe master "production" run
    close pipe
    print e

-- TODO

-- 1. Complete updateOrder and separate api.
-- 2. Organize the file and include code for CLI.
-- 3. Use the stage mongodb uri and redirect to the website after update.

run :: Action IO ()
run = do
    clearOrders
    -- let target = "http://haskell.org/"
    
    -- insertOrders
    insertOrder ["email" =: "test", "notimportant" =: "notimportant"]

    -- result <- openBrowser target
    -- if result
    --     then print ("Could open " ++ target)
    --     else print ("Couldn't open " ++ target)
    
    removeOrdersByEmail "email" -- Make email part to a variable.
    listOrders >>= printDocs "List of orders" -- Only show limited number of items optionally.
    
    findOrdersByEmail "test" >>= printDocs "Every orders with email 'test'"
    
    findOrderByEmail "test" >>= printDoc

    -- Extract only field that I want.
    projectOrderByEmail "test" >>= cloneOrder

    listOrders >>= printDocs "List of orders"

-- This works.
-- insertOrders :: Action IO [Value]
-- insertOrders = insertMany "orders" [
--     ["email" =: "test"],
--     ["email" =: "email"]]

clearOrders :: Action IO ()
clearOrders = do
    delete (select [] "orders")
    
-- This works.
insertOrder :: [Field] -> Action IO Value
insertOrder = insert "orders"

-- This works.
removeOrdersByEmail :: String -> Action IO ()
removeOrdersByEmail email = delete (select ["email" =: email] "orders")

-- This works.
listOrders :: Action IO [Document]
listOrders = rest =<< find (select [] "orders")

-- This works.
findOrdersByEmail :: String -> Action IO [Document]
findOrdersByEmail email = rest =<< find (select ["email" =: email] "orders")

-- This works.
findOrderByEmail :: String -> Action IO (Maybe Document)
findOrderByEmail email = findOne (select ["email" =: email] "orders")

-- https://github.com/selectel/mongoDB-haskell/blob/master/doc/tutorial.md#projecting
projectOrderByEmail :: String -> Action IO (Maybe Document)
projectOrderByEmail email = findOne (select ["email" =: email] "orders") {project = ["email" =: 1, "_id" =: 0]}

-- Before I use this, I need to find how to select one order from it.
-- copyOrder:t

-- This works.
printDocs :: String -> [Document] -> Action IO ()
printDocs title docs = liftIO $ putStrLn title >> mapM_ (print . exclude ["_id"]) docs

printDoc :: Maybe Document -> Action IO ()
printDoc (Just order) = liftIO $ print order
printDoc Nothing = liftIO $ print "Nothing"

-- What I really want to make is this.
-- Use it with project.
-- https://github.com/selectel/mongoDB-haskell/blob/master/doc/tutorial.md#projecting
cloneOrder :: Maybe Document -> Action IO Value
cloneOrder (Just order) = insert "orders" (order <> ["notimportant" =: ""])
cloneOrder Nothing = insert "orders" [] -- Shouldn't do Nothing, learn more and edit it.

-- updatOrder 
-- https://github.com/selectel/mongoDB-haskell/blob/master/doc/tutorial.md#updating
-- updateOrderByEmail :: String -> [Field] -> Action IO (Maybe Document)
updateOrderByEmail :: String -> [Field] -> Action IO ()
updateOrderByEmail email document = fetch (select ["email" =: email] "orders") >>= save "orders" . merge document


