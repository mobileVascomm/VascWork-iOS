//
//  StringExtension.swift
//  VascWork
//
//  Created by noizar on 19/02/20.
//  Copyright © 2020 Mobile. All rights reserved.
//

import Foundation

extension String{
    
    func safelyLimitedTo(length n:Int) -> String {
        if(self.count <= n) { return self }
        return String(Array(self).prefix(upTo: n))
    }
    
    func htmlToAttributedString() ->NSAttributedString?{
        do{
            guard let data = self.data(using: String.Encoding.utf8,
                                       allowLossyConversion: false) else { return nil }
            let options: [NSAttributedString.DocumentReadingOptionKey : Any] = [
                NSAttributedString.DocumentReadingOptionKey.characterEncoding : String.Encoding.utf8.rawValue,
                NSAttributedString.DocumentReadingOptionKey.documentType : NSAttributedString.DocumentType.html
            ]
            let htmlString = try? NSMutableAttributedString(data: data, options: options, documentAttributes: nil)
            
            // Removing this line makes the bug reappear
            htmlString?.addAttribute(NSAttributedString.Key.backgroundColor, value: self, range: NSMakeRange(0, 1))
            
            return htmlString
        }
    }
    
    func htmlToString() -> String {
        return htmlToAttributedString()?.string ?? ""
    }
    
    func toEncodeBase64() -> String{
        let data = (self).data(using: String.Encoding.utf8)
        let base64 = data!.base64EncodedString(options: NSData.Base64EncodingOptions(rawValue: 0))
        
        return base64
    }
    
    func toDeocedeBase64() -> String{
        let decodeData = Data(base64Encoded: self)!
        let decodeString = String(data: decodeData , encoding: .utf8)
        
        return decodeString!
    }
    
    func separate(every: Int, with separator: String) -> String {
        return String(stride(from: 0, to: Array(self).count, by: every).map {
            Array(Array(self)[$0..<min($0 + every, Array(self).count)])
            }.joined(separator: separator))
    }
    
    func characterAt(_ index:Int) -> Character? {
        guard index < count else { return nil }
        return self[self.index(self.startIndex,offsetBy: index )]
    }
    
    
    
}
