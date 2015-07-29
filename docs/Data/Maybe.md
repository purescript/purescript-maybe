## Module Data.Maybe

#### `Maybe`

``` purescript
data Maybe a
  = Nothing
  | Just a
```

The `Maybe` type is used to represent optional values and can be seen as
something like a type-safe `null`, where `Nothing` is `null` and `Just x`
is the non-null value `x`.

##### Instances
``` purescript
instance functorMaybe :: Functor Maybe
instance applyMaybe :: Apply Maybe
instance applicativeMaybe :: Applicative Maybe
instance altMaybe :: Alt Maybe
instance plusMaybe :: Plus Maybe
instance alternativeMaybe :: Alternative Maybe
instance bindMaybe :: Bind Maybe
instance monadMaybe :: Monad Maybe
instance monadPlusMaybe :: MonadPlus Maybe
instance extendMaybe :: Extend Maybe
instance invariantMaybe :: Invariant Maybe
instance semigroupMaybe :: (Semigroup a) => Semigroup (Maybe a)
instance monoidMaybe :: (Semigroup a) => Monoid (Maybe a)
instance semiringMaybe :: (Semiring a) => Semiring (Maybe a)
instance moduloSemiringMaybe :: (ModuloSemiring a) => ModuloSemiring (Maybe a)
instance ringMaybe :: (Ring a) => Ring (Maybe a)
instance divisionRingMaybe :: (DivisionRing a) => DivisionRing (Maybe a)
instance numMaybe :: (Num a) => Num (Maybe a)
instance eqMaybe :: (Eq a) => Eq (Maybe a)
instance ordMaybe :: (Ord a) => Ord (Maybe a)
instance boundedMaybe :: (Bounded a) => Bounded (Maybe a)
instance boundedOrdMaybe :: (BoundedOrd a) => BoundedOrd (Maybe a)
instance booleanAlgebraMaybe :: (BooleanAlgebra a) => BooleanAlgebra (Maybe a)
instance showMaybe :: (Show a) => Show (Maybe a)
```

#### `maybe`

``` purescript
maybe :: forall a b. b -> (a -> b) -> Maybe a -> b
```

Takes a default value, a function, and a `Maybe` value. If the `Maybe`
value is `Nothing` the default value is returned, otherwise the function
is applied to the value inside the `Just` and the result is returned.

``` purescript
maybe x f Nothing == x
maybe x f (Just y) == f y
```

#### `maybe'`

``` purescript
maybe' :: forall a b. (Unit -> b) -> (a -> b) -> Maybe a -> b
```

Similar to `maybe` but for use in cases where the default value may be
expensive to compute. As PureScript is not lazy, the standard `maybe` has
to evaluate the default value before returning the result, whereas here
the value is only computed when the `Maybe` is known to be `Nothing`.

``` purescript
maybe' (\_ -> x) f Nothing == x
maybe' (\_ -> x) f (Just y) == f y
```

#### `fromMaybe`

``` purescript
fromMaybe :: forall a. a -> Maybe a -> a
```

Takes a default value, and a `Maybe` value. If the `Maybe` value is
`Nothing` the default value is returned, otherwise the value inside the
`Just` is returned.

``` purescript
fromMaybe x Nothing == x
fromMaybe x (Just y) == y
```

#### `fromMaybe'`

``` purescript
fromMaybe' :: forall a. (Unit -> a) -> Maybe a -> a
```

Similar to `fromMaybe` but for use in cases where the default value may be
expensive to compute. As PureScript is not lazy, the standard `fromMaybe`
has to evaluate the default value before returning the result, whereas here
the value is only computed when the `Maybe` is known to be `Nothing`.

``` purescript
fromMaybe' (\_ -> x) Nothing == x
fromMaybe' (\_ -> x) (Just y) == y
```

#### `isJust`

``` purescript
isJust :: forall a. Maybe a -> Boolean
```

Returns `true` when the `Maybe` value was constructed with `Just`.

#### `isNothing`

``` purescript
isNothing :: forall a. Maybe a -> Boolean
```

Returns `true` when the `Maybe` value is `Nothing`.


