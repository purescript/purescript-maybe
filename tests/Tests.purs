module Main where

import Data.Maybe
import Debug.Trace
import Control.Monad.Eff
import Test.QuickCheck
import Test.QuickCheck.Functions
import Test.QuickCheck.Classes

main = do

  trace "test equality"
  check $ \n -> Just n == Just n

  trace "test inequality"
  check $ \n -> not $ Just n == Just (n + 1)

  trace "maybe should transform a value wrapped in a Just"
  check $ \n -> maybe 0 negate (Just n) == -n

  trace "maybe should return the default value when applied to Nothing"
  check $ \n -> maybe n id Nothing == n

  trace "isJust should return the appropriate value"
  check1 $ isJust (Just {}) == true
  check1 $ isJust Nothing == false

  trace "isNothing should return the appropriate value"
  check1 $ isNothing Nothing == true
  check1 $ isNothing (Just {}) == false

  trace "test functor laws"
  checkFunctor dummy

  trace "test applicative laws"
  checkApplicative dummy dummy dummy

  trace "test monad laws"
  checkMonad dummy
  
check :: (Number -> Boolean) -> QC
check = quickCheck

check1 :: Boolean -> QC
check1 = quickCheck' 1

dummy = Just 0

instance arbAToMaybeB :: (Arb (a -> b)) => Arb (a -> Maybe b) where
  arb = do
    f <- arb
    return $ \x -> Just (f x)

instance showAToMaybeB :: (Arb (a -> b)) => Show (a -> Maybe b) where
  show _ = "<a -> Maybe b>"
