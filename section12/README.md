## Thanks For Your Help

I really do appreciate it. What we've written so far is... OK but I need it to be *a lot tighter*, using some of the idioms I've been showing you up until now.

So, can you go through and refactor this to be a bit more... *Elixiry*. You've gotten rather good at this stuff and I need it spiffed up.

## Step 1: A Better Planet Module

Right now there are three methods and we need all the planets, minus the moon. You can keep it there if you want I guess but... whatever we need all of them.

Here's the data you'll need:

```elixir
"Mercury", type: :rocky, mass: 3.3e23, radius: 2.439e6
"Venus", type: :rocky, mass: 4.86e24, radius: 6.05e6
"Earth", type: :rocky, mass: 5.972e24, radius: 6.37e6
"Mars", type: :rocky, mass: 6.41e23, radius: 3.37e6
"Jupiter", type: :gaseous, mass: 1.89e27, radius: 7.14e7
"Saturn", type: :gaseous, mass: 5.68e26, radius: 6.02e7
"Uranus", type: :gaseous, mass: 8.68e25, radius: 2.55e7
"Neptune", type: :gaseous, mass: 1.02e26, radius: 2.47e7
```

I need this put into a struct that defines the above fields *as well as* Escape Velocity, which we'll be calculating on the fly.

After the struct is created, please create a function called `load` that returns all the planets *as well as* sets the Escape Velocity (`ev`) on each planet's struct. Extra points if you use a comprehension.

Since Escape Velocity is specific to a planet, please move it to the `Planet` module.

Finally, I want each planet to be accessible with a key:

```elixir
earth = Planet.select[:earth]
```

That means you'll need to construct your `load` routine to handle it. You should have covered this in the last chapter of the manual.

## Step 2: A Cleaner Rocketry Module

The `Physics.Rocketry` module is OK - it got us up and running... but it's kind of a mess. My fault.

Let's remove all of the extra functions for `:earth`, `:moon` and `:mars` - we don't need them. Instead, define a default planet at the top of the module; use `@earth` and reference your `Planet.select[:earth]` structure.

Anything else you see that you think you can improve, have at it. **The goal is clarity and elegance** so we can build this out.

I've been waiting on a data drop from the Science Team and I think we'll be all set soon for working with PostgreSQL. That'll be fun.

## TEST THIS

I've setup some tests for you in the test directory; they currently pass. If you screw up, they'll tell you. I've also added some pending tests using test tagging (which I'm not going into) - make sure those pass as well.

Have fun testing - you'll notice it's a pretty fast process.
