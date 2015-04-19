# Module Documentation

## Module Data.Maybe.First

#### `First`

``` purescript
newtype First a
  = First (Maybe a)
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


#### `eqFirst`

``` purescript
instance eqFirst :: (Eq a) => Eq (First a)
```


#### `ordFirst`

``` purescript
instance ordFirst :: (Ord a) => Ord (First a)
```


#### `boundedFirst`

``` purescript
instance boundedFirst :: (Bounded a) => Bounded (First a)
```


#### `functorFirst`

``` purescript
instance functorFirst :: Functor First
```


#### `applyFirst`

``` purescript
instance applyFirst :: Apply First
```


#### `applicativeFirst`

``` purescript
instance applicativeFirst :: Applicative First
```


#### `bindFirst`

``` purescript
instance bindFirst :: Bind First
```


#### `monadFirst`

``` purescript
instance monadFirst :: Monad First
```


#### `extendFirst`

``` purescript
instance extendFirst :: Extend First
```


#### `invariantFirst`

``` purescript
instance invariantFirst :: Invariant First
```


#### `showFirst`

``` purescript
instance showFirst :: (Show a) => Show (First a)
```


#### `semigroupFirst`

``` purescript
instance semigroupFirst :: Semigroup (First a)
```


#### `monoidFirst`

``` purescript
instance monoidFirst :: Monoid (First a)
```




