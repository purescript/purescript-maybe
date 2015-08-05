module Data.Maybe.Unsafe where

import Prelude

import Data.Maybe

-- | A partial function that extracts the value from the `Just` data
-- | constructor. Passing `Nothing` to `fromJust` will throw an error at
-- | runtime.
fromJust :: forall a. Maybe a -> a
fromJust (Just x) = x
fromJust Nothing = unsafeThrow "Data.Maybe.Unsafe.fromJust called on Nothing"

foreign import unsafeThrow :: forall a. String -> a
