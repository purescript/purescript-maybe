## Module Data.Maybe.Last

#### `Last`

``` purescript
newtype Last a
  = Last (Maybe a)
```

##### Instances
``` purescript
instance eqLast :: (Eq a) => Eq (Last a)
instance ordLast :: (Ord a) => Ord (Last a)
instance boundedLast :: (Bounded a) => Bounded (Last a)
instance functorLast :: Functor Last
instance applyLast :: Apply Last
instance applicativeLast :: Applicative Last
instance bindLast :: Bind Last
instance monadLast :: Monad Last
instance extendLast :: Extend Last
instance invariantLast :: Invariant Last
instance showLast :: (Show a) => Show (Last a)
instance semigroupLast :: Semigroup (Last a)
instance monoidLast :: Monoid (Last a)
```

Monoid returning the last (right-most) non-`Nothing` value.

``` purescript
Last (Just x) <> Last (Just y) == Last (Just y)
Last (Just x) <> Nothing == Last (Just x)
Last Nothing <> Nothing == Last Nothing
mempty :: Last _ == Last Nothing
```

#### `runLast`

``` purescript
runLast :: forall a. Last a -> Maybe a
```


