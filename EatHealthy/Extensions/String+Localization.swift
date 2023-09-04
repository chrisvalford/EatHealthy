//
//  String+Localization.swift
//  PulltexCata
//
//  Created by Christopher Alford on 23/8/23.
//  Copyright © 2023 marine.digital. All rights reserved.
//

import Foundation

extension String {
    public var localizedString: String {
        return NSLocalizedString(self, comment: "")
    }
}
