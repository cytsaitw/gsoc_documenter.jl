# Tutorial

```@meta
CurrentModule = ToyPkg
```

This tutorial shows how to use`ToyPkg` step by step.

```@example
1 + 1
```

```jldoctest
julia> 1 + 1
3
```

## 1. Create a person

```@example
using ToyPkg
p = Person("Ada", 20)
```

## 2. Greet a person

```@example
greet(p)
```

## 3. Greet a string

```@example
greet("Grace")
```

