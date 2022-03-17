// swiftlint:disable all
// Generated using SwiftGen — https://github.com/SwiftGen/SwiftGen

import Foundation

// swiftlint:disable superfluous_disable_command file_length implicit_return
// MARK: - Strings

// swiftlint:disable explicit_type_interface function_parameter_count identifier_name line_length
// swiftlint:disable nesting type_body_length type_name vertical_whitespace_opening_braces

public enum Localized {
  /// Change lang
  public static func initial_change_bt() -> String {
      return Localized.tr("Localizable", "initial_change_bt") 
  }
  /// Current lang: %@
  public static func initial_current_lang(_ p1: Any) -> String {
      return Localized.tr("Localizable", "initial_current_lang", String(describing: p1))
  }
  /// Hello!
  public static func initial_main() -> String {
      return Localized.tr("Localizable", "initial_main") 
  }
  /// Fddfg dfgdfg dfgd dgdgdgd fdfgdgfdfs sfds dfs
  public static func initial_subtitle() -> String {
      return Localized.tr("Localizable", "initial_subtitle") 
  }
  public enum Initial {
    /// dfdf
    public static func main_title() -> String {
        return Localized.tr("Localizable", "initial.main_title") 
    }
  }
}
// swiftlint:enable explicit_type_interface function_parameter_count identifier_name line_length
// swiftlint:enable nesting type_body_length type_name vertical_whitespace_opening_braces

// MARK: - Implementation Details

extension Localized {
  private static func tr(_ table: String, _ key: String, _ args: CVarArg...) -> String {
    let format = AppLocalizedManager.shared.localizedBundle.localizedString(forKey: key, value: nil, table: table)
    return String(format: format, locale: Locale.current, arguments: args)
  }
}


