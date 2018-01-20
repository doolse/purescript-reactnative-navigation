module ReactNative.Navigation.Stack
where

import Data.Nullable (Nullable)
import Data.StrMap (StrMap)
import React (ReactClass, ReactElement)
import ReactNative.Navigation (Route)
import ReactNative.Optional (class Optional)

type StackNavigatorConfig = (headerMode::String)

foreign import stackNavigator :: forall a o. Optional o StackNavigatorConfig => {|o} -> StrMap Route -> ReactClass a

foreign import data HeaderProps :: Type

-- incomplete, see https://reactnavigation.org/docs/navigators/stack
type StackNavigationOptions = (title:: String, header :: Nullable (HeaderProps -> ReactElement))

foreign import setStackNavigationOptions :: forall props o. Optional o StackNavigationOptions => {|o} -> ReactClass props -> ReactClass props
