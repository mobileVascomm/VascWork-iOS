//
//  Utils.swift
//  VascWork
//
//  Created by noizar on 19/02/20.
//  Copyright © 2020 Mobile. All rights reserved.
//

import Foundation


public func convertToRupiahCurrency(nominal:Double,useCurrency:Bool = false) -> String {
    let numberFormat = NumberFormatter()
    
    numberFormat.numberStyle = .decimal
    numberFormat.groupingSeparator = "."
    
    let formatNumber = numberFormat.string(from: NSNumber(value: nominal))
    
    if(useCurrency){ return "Rp\(formatNumber!)" }
    else { return formatNumber! }
}
