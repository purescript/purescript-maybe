module Test.Main where

import Prelude
import Control.Lazy as Z
import Control.Monad.Eff (Eff)
import Control.Monad.Eff.Console (CONSOLE, logShow)
import Data.Maybe (Maybe(..))

diverge :: forall a. a -> a
diverge = Z.fix id

{-
explosiveMaybe :: Maybe Unit
explosiveMaybe = Just diverge <*> Just unit
-}

deferredMaybeExplosion :: Maybe Unit
deferredMaybeExplosion = Z.defer \_ -> Just diverge <*> Just unit

main :: Eff (console :: CONSOLE) Unit
main = logShow deferredMaybeExplosion
