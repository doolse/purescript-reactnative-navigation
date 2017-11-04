module ReactNative.Navigation where

import Control.Monad.Eff (Eff)
import Prelude (Unit)
import React (ReactClass)
import Unsafe.Coerce (unsafeCoerce)

foreign import data ScreenClass :: Type
foreign import data NavigationOptions :: Type
foreign import data Route :: Type
foreign import data Navigation :: Type -> Type

type RouteM o = { screen :: ScreenClass | o}
type RouteO = (path::String, navigationOptions::NavigationOptions)

route :: forall o. RouteM o -> Route
route = unsafeCoerce

ignoreNav :: forall a c. ReactClass {navigation::a|c} -> ScreenClass
ignoreNav = unsafeCoerce

navAware :: forall r p. ReactClass {navigation::Navigation p|r} -> ScreenClass
navAware = unsafeCoerce

navState :: forall p. Navigation p -> {routeName ::String, key::String, params::p}
navState n = (unsafeCoerce n).state

foreign import navigate :: forall e p. Navigation p -> String -> p -> Eff e Unit
