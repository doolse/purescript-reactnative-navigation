module ReactNative.Navigation where

import Data.Maybe (Maybe)
import Effect (Effect)
import Prelude (Unit, identity)
import React (ReactClass)
import ReactNative.Optional (class Optional)
import Type.Proxy (Proxy(..))
import Type.Row (class RowToList, Cons, Nil, RLProxy(..), kind RowList)
import Unsafe.Coerce (unsafeCoerce)
import Prim.Row as R

foreign import data ScreenClass :: Type
foreign import data NavigationOptions :: Type
foreign import data Route :: Type
foreign import data Navigation :: Type -> Type

foreign import data NewRoute :: # Type -> Type -> Type
foreign import data NewNavigation :: # Type -> Type -> Type

type NavParams p = { state :: {params::p} }

foreign import data NavOpts :: Type -> Type

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

foreign import navigate :: forall p. Navigation p -> String -> p -> Effect Unit

class Routes a (params :: # Type)

class RoutesList (a :: RowList) (params :: # Type) (outp :: # Type) | a -> outp
instance rlNil :: RoutesList Nil params ()
instance rlCons :: (RoutesList tail params tailparams, R.Cons s t tailparams outp) => RoutesList (Cons s (NewRoute params t) tail) params outp

instance routeRecord :: (RowToList r l, RoutesList l params params) => Routes (Record r) params

class MakeNavOptions a p where
    navOpts :: a -> NavOpts p

instance staticOpts :: Optional o (title::String) => MakeNavOptions (Record o) p where
    navOpts = unsafeCoerce

createRoute :: forall routes p r o.
       Optional o (path::String, navigationOptions::NavOpts p)
    => ReactClass {navigation :: NewNavigation routes p | r}
    -> {|o}
    -> NewRoute routes p
createRoute = unsafeCoerce

createRouteDynamic :: forall routes p r o.
       Optional o (title::String)
    => ReactClass {navigation :: NewNavigation routes p | r}
    -> (NavParams p -> Record o)
    -> NewRoute routes p
createRouteDynamic = unsafeCoerce

initRoutes :: forall a b. Routes a b => a -> Record b
initRoutes = unsafeCoerce
