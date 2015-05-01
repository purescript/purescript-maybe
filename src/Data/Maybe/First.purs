module Data.Maybe.First where

import Control.Comonad (Comonad)
import Control.Extend (Extend, extend)
import Data.Functor.Invariant (Invariant, imap)
import Data.Maybe (Maybe(..))
import Data.Monoid (Monoid)

-- | Monoid returning the first (left-most) non-`Nothing` value.
-- |
-- | ``` purescript
-- | First (Just x) <> First (Just y) == First (Just x)
-- | First Nothing <> First (Just y) == First (Just y)
-- | First Nothing <> Nothing == First Nothing
-- | mempty :: First _ == First Nothing
-- | ```
newtype First a = First (Maybe a)

runFirst :: forall a. First a -> Maybe a
runFirst (First m) = m

instance eqFirst :: (Eq a) => Eq (First a) where
  eq (First x) (First y) = x == y

instance ordFirst :: (Ord a) => Ord (First a) where
  compare (First x) (First y) = compare x y

instance boundedFirst :: (Bounded a) => Bounded (First a) where
  top = First top
  bottom = First bottom

instance functorFirst :: Functor First where
  map f (First x) = First (f <$> x)

instance applyFirst :: Apply First where
  apply (First f) (First x) = First (f <*> x)

instance applicativeFirst :: Applicative First where
  pure = First <<< pure

instance bindFirst :: Bind First where
  bind (First x) f = First (bind x (runFirst <<< f))

instance monadFirst :: Monad First

instance extendFirst :: Extend First where
  extend f (First x) = First (extend (f <<< First) x)

instance invariantFirst :: Invariant First where
  imap f _ (First x) = First (f <$> x)

instance showFirst :: (Show a) => Show (First a) where
  show (First a) = "First (" ++ show a ++ ")"

instance semigroupFirst :: Semigroup (First a) where
  append first@(First (Just _)) _ = first
  append _ second = second

instance monoidFirst :: Monoid (First a) where
  mempty = First Nothing
