//
//  TextFieldFormater.swift
//  VascWork
//
//  Created by noizar on 20/02/20.
//  Copyright © 2020 Mobile. All rights reserved.
//

import UIKit

protocol TextFormatterProtocol {
    func formattedText(from unformatted:String?) -> String?
    func unformattedText(from formatted:String?) -> String?
}

public struct TextFormatterConstants {
    public static let defaultPatternSymbol: Character = "#"
}

open class TextFormatter: TextFormatterProtocol{
    public let textPattern:String
    public let patternSymbol: Character
    
    public init(textPattern:String, patternSymbol: Character = TextFormatterConstants.defaultPatternSymbol){
        self.textPattern = textPattern
        self.patternSymbol = patternSymbol
    }
    
    
    open func formattedText(from unformatted: String?) -> String? {
         guard let unformatted = unformatted else { return nil }
               var formatted = String.init()
               var unformattedIndex = 0
               var patternIndex = 0
               
               while patternIndex < textPattern.count && unformattedIndex < unformatted.count {
                   guard let patternCharacter = textPattern.characterAt(patternIndex) else { break }
                   if patternCharacter == patternSymbol {
                       if let unformattedCharacter = unformatted.characterAt(unformattedIndex) {
                           formatted.append(unformattedCharacter)
                       }
                       unformattedIndex += 1
                   } else {
                       formatted.append(patternCharacter)
                   }
                   patternIndex += 1
               }
               return formatted
    }
    
    open func unformattedText(from formatted: String?) -> String? {
        guard let formatted = formatted else { return nil}
        
        var unformatted = String()
        var formattedIndex = 0
        
        while formattedIndex < formatted.count{
            if let formattedCharacter = formatted.characterAt(formattedIndex){
                if formattedIndex >= textPattern.count{
                    unformatted.append(formattedCharacter)
                }else if formattedCharacter != textPattern.characterAt(formattedIndex){
                    unformatted.append(formattedCharacter)
                }
                formattedIndex += 1
            }
            
        }
        
        return unformatted
    }
}


open class TextFieldFormatter:NSObject,UITextFieldDelegate {
    public let pattern:String
    public let textField:UITextField
    
    private var textFormatter:TextFormatter?
    private var rawText:String = ""
    
    
    public init(pattern:String,textField:UITextField) {
        self.pattern = pattern
        self.textField = textField
        
        super.init()
        self.textField.delegate = self


    }
    
    public func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        rawText = NSString(string: textField.text ?? "").replacingCharacters(in: range, with: string)
        textFormatter = TextFormatter(textPattern: pattern)

        textField.text = textFormatter?.formattedText(from: rawText.replacingOccurrences(of: " ", with: ""))
        
        return false
    }
    
    
    public func getFormatedText() -> String {
        textFormatter?.formattedText(from: rawText.replacingOccurrences(of: " ", with: "")) ?? ""
    }
    
    
    public func getUnformatedText() -> String{
        textFormatter?.unformattedText(from: rawText) ?? ""
    }
    
    
    
}
