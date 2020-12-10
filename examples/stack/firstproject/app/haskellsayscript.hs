-- https://www.fpcomplete.com/haskell/tutorial/stack-script/

#!/usr/bin/env stack
{- stack
  script
  --resolver lts-16.24
  --package haskell-say
  --package titlecase
-}

-- $chmod +x haskellsayscript.hs

module HaskellSayScript where

import HaskellSay (haskellSay)
import Data.Text.Titlecase (titlecase)

main :: IO ()
main =
  haskellSay $ titlecase "Run a Haskell script"

-- Install and use packages as a binary.
-- $stack install titlecase
-- $titlecase steadylearner

-- Find the deatils with this.
-- $stack path --help