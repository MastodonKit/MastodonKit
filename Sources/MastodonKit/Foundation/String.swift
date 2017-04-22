import Foundation

extension String {
    init?<A>(optional: A?) {
        guard let value = optional else { return nil }
        self.init(describing: value)
    }
}
