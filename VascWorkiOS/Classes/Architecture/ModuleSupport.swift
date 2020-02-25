//
//  ModuleSupport.swift
//  VascWork
//
//  Created by noizar on 17/02/20.
//  Copyright © 2020 Mobile. All rights reserved.
//

import Foundation


public protocol ViewStateDelegate {
    func onSuccess(result:Result)
    func onFailure(result:Result)
    func onLoading(result:Result)
}

open class Result {
    open var tag :String?
    open var code:String?
    open var message:String?
    open var data:Any
    open var isLoading:Bool
    
    init(tag:String,code:String,message:String,data:Any,isLoading:Bool = false) {
        self.tag = tag
        self.code = code
        self.message = message
        self.data = data
        self.isLoading = isLoading
    }
}

open class NetworkState {
    fileprivate var tag:String
    fileprivate var viewState:ViewStateDelegate
    
    init( tag:String, viewState:ViewStateDelegate) {
        self.tag = tag
        self.viewState = viewState
    }
    
    open func success(code:String = "",message:String = "",data:Any = ""){
        viewState.onSuccess(result: Result(tag: tag, code: code, message: message, data: data))
    }
    
    open func failure(code:String = "",message:String = "",data:Any = ""){
        viewState.onFailure(result: Result(tag: tag, code: code, message: message, data: data))
    }
    
    open func loading(code:String = "",message:String = "",isLoading:Bool = false,data:Any = ""){
        viewState.onLoading(result: Result(tag: tag, code: code, message: message, data: data, isLoading: isLoading))
    }
}


