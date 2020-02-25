//
//  ViewExtension.swift
//  VascWork
//
//  Created by noizar on 19/02/20.
//  Copyright © 2020 Mobile. All rights reserved.
//

import UIKit

extension UIView{
    @IBInspectable var borderWidth : CGFloat {
        set{ layer.borderWidth = newValue }
        get{ return layer.borderWidth }
    }
    
    @IBInspectable var cornerRadius : CGFloat {
        set { layer.cornerRadius = newValue }
        get { return layer.cornerRadius }
    }
    
    @IBInspectable var borderColor : UIColor! {
        set{ guard let uiColor = newValue else { return }
            layer.borderColor = uiColor.cgColor }
        
        get{ guard let color = layer.borderColor else { return nil }
             return UIColor(cgColor: color) }
    }
    
    @IBInspectable var shadowColor:UIColor {
        set{ self.layer.shadowColor = newValue.cgColor }
        get{ return UIColor.black }
    }
    
    @IBInspectable var shadowOppacity : Float {
        set{ self.layer.shadowOpacity = newValue }
        get{ return 0.5 }
    }
    
    @IBInspectable var shadowOffset:CGSize {
        set { self.layer.shadowOffset = newValue }
        get { return CGSize(width: 3, height: 3) }
    }
    
    @IBInspectable var shadowRadius : CGFloat {
        set { self.layer.shadowRadius = newValue }
        get { return 15.0 }
    }
    
}

class SeperatorDashed:UIView{
    
    override func awakeFromNib() {
        makeDashedBorderLine()
    }
    
    func makeDashedBorderLine(){
        let path = CGMutablePath()
        let shapeLayer = CAShapeLayer()
        
        shapeLayer.lineWidth = 1.0
        shapeLayer.strokeColor = UIColor.lightGray.cgColor
        shapeLayer.lineDashPattern = [2,2]
        path.addLines(between: [CGPoint(x: bounds.minX, y: bounds.height/2),
                                CGPoint(x: bounds.maxX, y: bounds.height/2)])
        
        shapeLayer.path = path
        
        backgroundColor = .clear
        layer.addSublayer(shapeLayer)
    }
}
