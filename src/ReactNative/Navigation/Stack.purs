module ReactNative.Navigation.Stack
where

import Data.StrMap (StrMap)
import React (ReactClass)
import ReactNative.Navigation (Route)
import ReactNative.Optional (class Optional)

type StackNavigatorConfig = (headerMode::String)

foreign import stackNavigator :: forall a o. Optional o StackNavigatorConfig => {|o} -> StrMap Route -> ReactClass a
