module Data.Maybe.Last where

import Prelude

import Control.Extend (class Extend, extend)

import Data.Functor.Invariant (class Invariant, imapF)
import Data.Maybe (Maybe(..))
import Data.Monoid (class Monoid)
import Data.Newtype (class Newtype)

-- | Monoid returning the last (right-most) non-`Nothing` value.
-- |
-- | ``` purescript
-- | Last (Just x) <> Last (Just y) == Last (Just y)
-- | Last (Just x) <> Nothing == Last (Just x)
-- | Last Nothing <> Nothing == Last Nothing
-- | mempty :: Last _ == Last Nothing
-- | ```
newtype Last a = Last (Maybe a)

derive instance newtypeLast :: Newtype (Last a) _

derive newtype instance eqLast :: Eq a => Eq (Last a)

derive newtype instance ordLast :: Ord a => Ord (Last a)

derive newtype instance boundedLast :: Bounded a => Bounded (Last a)

instance functorLast :: Functor Last where
  map f (Last x) = Last (f <$> x)

instance invariantLast :: Invariant Last where
  imap = imapF

instance applyLast :: Apply Last where
  apply (Last f) (Last x) = Last (f <*> x)

instance applicativeLast :: Applicative Last where
  pure = Last <<< pure

instance bindLast :: Bind Last where
  bind (Last x) f = Last (x >>= \y -> case f y of Last ma -> ma)

instance monadLast :: Monad Last

instance extendLast :: Extend Last where
  extend f (Last x) = Last (extend (f <<< Last) x)

instance showLast :: Show a => Show (Last a) where
  show (Last a) = "(Last " <> show a <> ")"

instance semigroupLast :: Semigroup (Last a) where
  append _ last@(Last (Just _)) = last
  append last (Last Nothing) = last

instance monoidLast :: Monoid (Last a) where
  mempty = Last Nothing
