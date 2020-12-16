module MyApp.Components.Counter.Interop where

import Prelude

import Data.Maybe (fromMaybe)
import Data.Nullable (Nullable, toMaybe)
import Effect.Unsafe (unsafePerformEffect)
import MyApp.Components.Counter (Props, makeCounter)
import React.Basic (JSX)

type JSProps = { label :: Nullable String }

jsPropsToProps :: JSProps -> Props
jsPropsToProps { label } = { label: fromMaybe "Click away!" $ toMaybe label }

jsCounter :: JSProps -> JSX
jsCounter = unsafePerformEffect makeCounter <<< jsPropsToProps