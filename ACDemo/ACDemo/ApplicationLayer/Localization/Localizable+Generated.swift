// swiftlint:disable all
// Generated using SwiftGen — https://github.com/SwiftGen/SwiftGen

import Foundation

// swiftlint:disable superfluous_disable_command file_length implicit_return

// MARK: - Strings


// swiftlint:disable explicit_type_interface function_parameter_count identifier_name line_length
// swiftlint:disable nesting type_body_length type_name vertical_whitespace_opening_braces

public enum Strings {
  /// Change lang
  public static let initialChangeBt = Strings.tr("Localizable", "initial_change_bt")
  /// Current lang: %@
  public static func initialCurrentLang(_ p1: Any) -> String {
    return Strings.tr("Localizable", "initial_current_lang", String(describing: p1))
  }
  /// Hello!
  public static let initialMain = Strings.tr("Localizable", "initial_main")
  /// Fddfg dfgdfg dfgd dgdgdgd fdfgdgfdfs sfds dfs
  public static let initialSubtitle = Strings.tr("Localizable", "initial_subtitle")
}
// swiftlint:enable explicit_type_interface function_parameter_count identifier_name line_length
// swiftlint:enable nesting type_body_length type_name vertical_whitespace_opening_braces

// MARK: - Implementation Details

extension Strings {
  private static func tr(_ table: String, _ key: String, _ args: CVarArg...) -> String {
    let format = AppLocalizedManager.shared.localizedBundle.localizedString(forKey: key, value: nil, table: table)
    return String(format: format, locale: Locale.current, arguments: args)
  }
}


