
import Foundation

protocol Localizable {

    var tableName: String { get }

    var localized: String { get }

    var bundle: Bundle { get }

}

extension Localizable where Self: RawRepresentable, Self.RawValue == String {

    var localized: String {
        rawValue.localize(bundle: bundle, tableName: tableName)
    }

}
