module Data.Maybe.First where

import Prelude

import Control.Extend (class Extend, extend)

import Data.Functor.Invariant (class Invariant, imapF)
import Data.Maybe (Maybe(..))
import Data.Monoid (class Monoid)
import Data.Newtype (class Newtype)

-- | Monoid returning the first (left-most) non-`Nothing` value.
-- |
-- | ``` purescript
-- | First (Just x) <> First (Just y) == First (Just x)
-- | First Nothing <> First (Just y) == First (Just y)
-- | First Nothing <> Nothing == First Nothing
-- | mempty :: First _ == First Nothing
-- | ```
newtype First a = First (Maybe a)

derive instance newtypeFirst :: Newtype (First a) _

derive newtype instance eqFirst :: (Eq a) => Eq (First a)

derive newtype instance ordFirst :: (Ord a) => Ord (First a)

derive newtype instance boundedFirst :: (Bounded a) => Bounded (First a)

instance functorFirst :: Functor First where
  map f (First x) = First (f <$> x)

instance invariantFirst :: Invariant First where
  imap = imapF

instance applyFirst :: Apply First where
  apply (First f) (First x) = First (f <*> x)

instance applicativeFirst :: Applicative First where
  pure = First <<< pure

instance bindFirst :: Bind First where
  bind (First x) f = First (x >>= \y -> case f y of First ma -> ma)

instance monadFirst :: Monad First

instance extendFirst :: Extend First where
  extend f (First x) = First (extend (f <<< First) x)

instance showFirst :: (Show a) => Show (First a) where
  show (First a) = "First (" <> show a <> ")"

instance semigroupFirst :: Semigroup (First a) where
  append first@(First (Just _)) _ = first
  append _ second = second

instance monoidFirst :: Monoid (First a) where
  mempty = First Nothing
