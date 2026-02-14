# Tutorial

```@meta
CurrentModule = ToyPkg
DocTestSetup = quote
    using ToyPkg
end
```

This tutorial shows how to use`ToyPkg` step by step.

```@example
1 + 1
```

```jldoctest
julia> 1 + 1
2
```

## 1. Create a person

```@example
using ToyPkg
p = Person("Ada", 20)
```

## 2. Greet a person

```@example
using ToyPkg
p = Person("Ada", 20)
greet(p)
```

```jldoctest
julia> p = Person("Ada", 20)
Person("Ada", 20)

julia> greet(p)
"Hello, Ada!"
```

## 3. Greet a string

```@example
using ToyPkg
greet("Grace")
```

```jldoctest
julia> greet("Grace")
"Hello, Grace!"
```

