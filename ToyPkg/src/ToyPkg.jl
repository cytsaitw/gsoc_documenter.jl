module ToyPkg

export greet, Person

"""
    Person(name, age)

A simple person record.
"""
struct Person
    name::String
    age::Int
end

"""
    greet(name::AbstractString) -> String

Return a greeting message.

# Examples
```julia
julia> greet("Ada")
"Hello, Ada!"
""" greet(name::AbstractString) = "Hello, $(name)!"

""" greet(p::Person) -> String

Greet a person by their name. """ greet(p::Person) = greet(p.name)

end # module ToyPkg