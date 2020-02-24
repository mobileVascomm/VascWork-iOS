//
//  ButtonExtension.swift
//  VascWork
//
//  Created by noizar on 19/02/20.
//  Copyright © 2020 Mobile. All rights reserved.
//

import UIKit

open class ButtonLoading: UIButton {
    @IBInspectable var indicatorColor : UIColor = .white
    
    var originButtonText:String?
    var activityIndicator:UIActivityIndicatorView!
    
    open func showLoading(isLoading:Bool){
        if (isLoading){
            self.isUserInteractionEnabled = false
            originButtonText = self.titleLabel?.text
            self.setTitle("", for: .normal)
            
            if(activityIndicator == nil){
                activityIndicator = createActivityIndicator()
            }
            
            showSpinning()
        }else{
            self.isUserInteractionEnabled = true
            DispatchQueue.main.async {
                self.setTitle(self.originButtonText, for: .normal)
                self.activityIndicator.stopAnimating()
            }
        }
    }
    
    open func setButtonTitle(title:String){
        self.titleLabel?.text = title
    }
    
    open func setString(_ string:String){
        setTitle(string, for: .normal)
    }
    
    private func createActivityIndicator() -> UIActivityIndicatorView {
        let activityIndicator = UIActivityIndicatorView()
        activityIndicator.hidesWhenStopped = true
        activityIndicator.color = indicatorColor
        
        return activityIndicator
    }
    
    private func showSpinning(){
        activityIndicator.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(activityIndicator)
        centerActivityIndicatorButton()
        activityIndicator.startAnimating()
        
    }
    
    private func centerActivityIndicatorButton(){
        let xCenterConstraint = NSLayoutConstraint(item: self, attribute: .centerX, relatedBy: .equal, toItem: activityIndicator, attribute: .centerX, multiplier: 1, constant: 0)
        self.addConstraint(xCenterConstraint)
        
        let yCenterConstraint = NSLayoutConstraint(item: self, attribute: .centerY, relatedBy: .equal, toItem: activityIndicator, attribute: .centerY, multiplier: 1, constant: 0)
        self.addConstraint(yCenterConstraint)
    }
}
