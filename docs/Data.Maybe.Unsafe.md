## Module Data.Maybe.Unsafe

#### `fromJust`

``` purescript
fromJust :: forall a. Maybe a -> a
```

A partial function that extracts the value from the `Just` data
constructor. Passing `Nothing` to `fromJust` will throw an error at
runtime.


