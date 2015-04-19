# Module Documentation

## Module Data.Maybe.Last

#### `Last`

``` purescript
newtype Last a
  = Last (Maybe a)
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


#### `eqLast`

``` purescript
instance eqLast :: (Eq a) => Eq (Last a)
```


#### `ordLast`

``` purescript
instance ordLast :: (Ord a) => Ord (Last a)
```


#### `boundedLast`

``` purescript
instance boundedLast :: (Bounded a) => Bounded (Last a)
```


#### `functorLast`

``` purescript
instance functorLast :: Functor Last
```


#### `applyLast`

``` purescript
instance applyLast :: Apply Last
```


#### `applicativeLast`

``` purescript
instance applicativeLast :: Applicative Last
```


#### `bindLast`

``` purescript
instance bindLast :: Bind Last
```


#### `monadLast`

``` purescript
instance monadLast :: Monad Last
```


#### `extendLast`

``` purescript
instance extendLast :: Extend Last
```


#### `invariantLast`

``` purescript
instance invariantLast :: Invariant Last
```


#### `showLast`

``` purescript
instance showLast :: (Show a) => Show (Last a)
```


#### `semigroupLast`

``` purescript
instance semigroupLast :: Semigroup (Last a)
```


#### `monoidLast`

``` purescript
instance monoidLast :: Monoid (Last a)
```




