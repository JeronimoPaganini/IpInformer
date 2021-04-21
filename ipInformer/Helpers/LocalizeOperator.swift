//
//  LocalizeOperator.swift
//  ipInformer (iOS)
//
//  Created by Farid Shabonov on 21.04.2021.
//

import Foundation

prefix operator •

/// Localization operator. Use Alt-8 to put it.
///
/// Example: let locString = •"SomeKey"
///
/// - parameter rhs: Localization key
public prefix func • (_ rhs: String) -> String {
    return NSLocalizedString(rhs, comment: "")
}

