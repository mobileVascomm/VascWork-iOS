//
//  TextFieldExtension.swift
//  VascWork
//
//  Created by noizar on 20/02/20.
//  Copyright © 2020 Mobile. All rights reserved.
//

import UIKit

private var __maxLengths = [UITextField: Int]()

extension UITextField{
    @IBInspectable var maxLength: Int {
        get {
            guard let l = __maxLengths[self] else {
                return 250 // (global default-limit. or just, Int.max)
            }
            return l
        }
        set {
            __maxLengths[self] = newValue
            addTarget(self, action: #selector(fix), for: .editingChanged)
        }
    }
    
    @objc func fix(textField: UITextField) {
        let t = textField.text
        textField.text = t?.safelyLimitedTo(length: maxLength)
    }
}
