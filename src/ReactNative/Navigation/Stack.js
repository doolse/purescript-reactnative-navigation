const RNN = require('react-navigation')

exports.stackNavigator = function (d) {
    return function (opts) {
        return function (screens) {
            return RNN.StackNavigator(screens, opts);
        }
    }
}
