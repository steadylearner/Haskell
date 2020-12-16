-- $spago run (Console)
-- $spago bundle-app (Web)
-- $spago build (Node)

module Main where

import Prelude

import Euler (answer)
import Effect.Console (log)

main = do
  log ("The answer is " <> show answer)