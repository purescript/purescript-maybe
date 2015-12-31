
module Test.Main where

import Prelude
import Control.Monad.Eff.Console (log)
import Data.Maybe (Maybe())
import Test.QuickCheck.Laws.Control.Alt
import Test.QuickCheck.Laws.Control.Alternative
import Test.QuickCheck.Laws.Control.Applicative
import Test.QuickCheck.Laws.Control.Apply
import Test.QuickCheck.Laws.Control.Bind
import Test.QuickCheck.Laws.Control.Extend
import Test.QuickCheck.Laws.Control.Monad
import Test.QuickCheck.Laws.Control.MonadPlus
import Test.QuickCheck.Laws.Control.Plus
import Test.QuickCheck.Laws.Data.Bounded
import Test.QuickCheck.Laws.Data.Eq
import Test.QuickCheck.Laws.Data.Functor
import Test.QuickCheck.Laws.Data.Monoid
import Test.QuickCheck.Laws.Data.Ord
import Test.QuickCheck.Laws.Data.Semigroup
import Type.Proxy (Proxy(..), Proxy2(..))

prxMaybe2 :: Proxy2 Maybe
prxMaybe2 = Proxy2

main = do
  log "\n\nChecking Maybe instances...\n"
  checkFunctor prxMaybe2
  checkApply prxMaybe2
  checkApplicative prxMaybe2
  checkAlt prxMaybe2
  checkPlus prxMaybe2
  checkAlternative prxMaybe2
  checkBind prxMaybe2
  checkMonad prxMaybe2
  checkMonadPlus prxMaybe2
  checkExtend prxMaybe2
  checkSemigroup (Proxy :: Proxy (Maybe String))
  checkEq (Proxy :: Proxy (Maybe Int))
  checkOrd (Proxy :: Proxy (Maybe Int))
  checkBounded (Proxy :: Proxy (Maybe Boolean))
  checkMonoid (Proxy :: Proxy (Maybe String))
