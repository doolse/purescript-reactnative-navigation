module Test.Main where

import React (ReactClass)
import ReactNative.Navigation (NavParams(..), NewNavigation, createRoute, createRouteDynamic, initRoutes, navOpts)
import Unsafe.Coerce (unsafeCoerce)


type Routes = (a::String, b::Int)

test :: Record Routes
test = initRoutes {a: createRouteDynamic classA (\t -> {title: t.state.params}), b: createRoute classB {}}


classA :: ReactClass {navigation::NewNavigation Routes String, fuck :: Int}
classA = unsafeCoerce 1

classB :: ReactClass {navigation::NewNavigation Routes Int, notOn :: Int}
classB = unsafeCoerce 1
