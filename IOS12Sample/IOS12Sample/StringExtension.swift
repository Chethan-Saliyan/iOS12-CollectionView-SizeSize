//
//  StringExtension.swift
//  IOS12Sample
//
//  Created by Chethan on 08/04/19.
//  Copyright © 2019 Chethan. All rights reserved.
//

import Foundation
import UIKit

extension String {
    
    func replacingFirstOccurrenceOfString(target: String, withString replaceString: String) -> String {
        if let range = self.range(of: target) {
            return self.replacingCharacters(in: range, with: replaceString)
        }
        return self
    }
}
