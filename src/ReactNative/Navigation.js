exports.navigate = function(nav) {
    return function(to) {
        return function(params) {
            return function() {
                nav.navigate(to, params);
            }
        }
    }
}
