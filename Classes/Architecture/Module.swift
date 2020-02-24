//
//  Module.swift
//  VascWork
//
//  Created by noizar on 17/02/20.
//  Copyright © 2020 Mobile. All rights reserved.
//

import Foundation
import UIKit

open class ModuleDelegate{
    open var viewState:ViewStateDelegate
    open var controller:UIViewController
    
    public init(viewState:ViewStateDelegate,controller:UIViewController){
        self.viewState = viewState
        self.controller = controller
    }

    open func event(tag:String,action:(_ network:NetworkState)-> Void){
        let network = NetworkState(tag: tag, viewState: self.viewState)
        action(network)
    }
    
}
