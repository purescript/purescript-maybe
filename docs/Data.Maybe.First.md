## Module Data.Maybe.First

#### `First`

``` purescript
newtype First a
  = First (Maybe a)
```

##### Instances
``` purescript
instance eqFirst :: (Eq a) => Eq (First a)
instance ordFirst :: (Ord a) => Ord (First a)
instance boundedFirst :: (Bounded a) => Bounded (First a)
instance functorFirst :: Functor First
instance applyFirst :: Apply First
instance applicativeFirst :: Applicative First
instance bindFirst :: Bind First
instance monadFirst :: Monad First
instance extendFirst :: Extend First
instance invariantFirst :: Invariant First
instance showFirst :: (Show a) => Show (First a)
instance semigroupFirst :: Semigroup (First a)
instance monoidFirst :: Monoid (First a)
```

Monoid returning the first (left-most) non-`Nothing` value.

``` purescript
First (Just x) <> First (Just y) == First (Just x)
First Nothing <> First (Just y) == First (Just y)
First Nothing <> Nothing == First Nothing
mempty :: First _ == First Nothing
```

#### `runFirst`

``` purescript
runFirst :: forall a. First a -> Maybe a
```


