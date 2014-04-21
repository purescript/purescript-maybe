module Main where

import Data.Maybe
import Debug.Trace
import Control.Monad.Eff
import Test.QuickCheck
import Test.QuickCheck.Functions
import Test.QuickCheck.Classes

type Ty = Maybe Number

main = do

  let ty = Just 0

  trace "test equality"
  check1 $ \n -> Just n == Just n
  assert $ Nothing == Nothing :: Ty

  trace "test inequality"
  check1 $ \n -> Just n  /= Nothing
  check1 $ \n -> Nothing /= Just n
  check1 $ \n -> Just n  /= Just (n + 1)
  
  trace "test order"
  check2 $ \x y -> compare (Just x) (Just y) == compare x y
  check1 $ \x -> compare Nothing (Just x) == LT
  check1 $ \x -> compare (Just x) Nothing == GT
  check1 $ \x -> compare Nothing (Nothing :: Ty) == EQ

  trace "maybe should transform a value wrapped in a Just"
  check1 $ \n -> maybe 0 negate (Just n) == -n

  trace "maybe should return the default value when applied to Nothing"
  check1 $ \n -> maybe n id Nothing == n

  trace "isJust should return the appropriate value"
  assert $ isJust (Just {}) == true
  assert $ isJust Nothing == false

  trace "isNothing should return the appropriate value"
  assert $ isNothing Nothing == true
  assert $ isNothing (Just {}) == false

  trace "test functor laws"
  checkFunctor ty

  trace "test applicative laws"
  checkApplicative ty ty ty

  trace "test monad laws"
  checkMonad ty
  
assert :: Boolean -> QC
assert = quickCheck' 1
  
check1 :: (Number -> Boolean) -> QC
check1 = quickCheck

check2 :: (Number -> Number -> Boolean) -> QC
check2 = quickCheck

instance arbAToMaybeB :: (Arb (a -> b)) => Arb (a -> Maybe b) where
  arb = do
    f <- arb
    jn <- arb
    return $ \x -> if jn then Just (f x) else Nothing

instance showAToMaybeB :: (Arb (a -> b)) => Show (a -> Maybe b) where
  show _ = "<a -> Maybe b>"
