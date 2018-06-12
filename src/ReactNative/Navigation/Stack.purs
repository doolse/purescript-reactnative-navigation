module ReactNative.Navigation.Stack
where

import Foreign.Object (Object)
import React (ReactClass)
import ReactNative.Navigation (Route)
import ReactNative.Optional (class Optional)

type StackNavigatorConfig = (headerMode::String)

foreign import stackNavigator :: forall a o. Optional o StackNavigatorConfig => {|o} -> Object Route -> ReactClass a
