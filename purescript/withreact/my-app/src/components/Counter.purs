module MyApp.Components.Counter where

import Prelude

import Data.Interpolate (i)
import Data.Tuple.Nested ((/\))
import Effect.Unsafe (unsafePerformEffect)
import React.Basic.DOM (button, div_, p_, text)
import React.Basic.Events (handler_)
import React.Basic.Hooks (Component, JSX, component, useState')
import React.Basic.Hooks as Hooks

type Props = { label :: String }

jsCounter :: Props -> JSX
jsCounter = unsafePerformEffect makeCounter

makeCounter :: Component Props
makeCounter = component "Counter" \props -> Hooks.do
  count /\ setCount <- useState' 0

  pure do
    div_
      [ p_ [ text $ i "You clicked " count " times" ]
      , button
          { onClick: handler_ $ setCount (count + 1)
          , children: [ text props.label ]
          }
      ]