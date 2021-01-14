
import Foundation

enum LocalizableStrings: String, Localizable {

    case navTitle = "ui.home.navigation.title"
    case headerTitle = "ui.venues.header.title"


    var tableName: String {
        "Localizable"
    }

    var bundle: Bundle {
        .main
    }

}
