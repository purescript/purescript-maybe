module Data.Maybe where

  import Prelude

  data Maybe a = Nothing | Just a

  maybe :: forall a b. b -> (a -> b) -> Maybe a -> b
  maybe b _ Nothing = b
  maybe _ f (Just a) = f a

  fromMaybe :: forall a. a -> Maybe a -> a
  fromMaybe a = maybe a (id :: forall a. a -> a)

  isJust :: forall a. Maybe a -> Boolean
  isJust = maybe false (const true)

  isNothing :: forall a. Maybe a -> Boolean
  isNothing = maybe true (const false)

  instance monadMaybe :: Monad Maybe where
    return = Just
    (>>=) m f = maybe Nothing f m

  instance applicativeMaybe :: Applicative Maybe where
    pure = Just
    (<*>) (Just fn) x = fn <$> x
    (<*>) Nothing _ = Nothing

  instance functorMaybe :: Functor Maybe where
    (<$>) fn (Just x) = Just (fn x)
    (<$>) _ _ = Nothing

  instance showMaybe :: (Show a) => Show (Maybe a) where
    show (Just x) = "Just " ++ (show x)
    show Nothing = "Nothing"

  instance eqMaybe :: (Eq a) => Eq (Maybe a) where
    (==) Nothing Nothing = true
    (==) (Just a1) (Just a2) = a1 == a2
    (==) _ _ = false
    (/=) a b = not (a == b)
