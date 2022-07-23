//
//  Bindable.swift
//  SimpleTwoWayBinding
//
//  Created by Manish Katoch on 11/26/17.
//  Modified by J.R on 21/07/22.
//

import Foundation
import UIKit

public protocol Bindable: NSObjectProtocol {
    associatedtype BindingType: Equatable
    func observingValue() -> BindingType?
    func updateValue(with value: BindingType)
    func bind(with observable: MutableObservable<BindingType>)
}

fileprivate struct AssociatedKeys {
    static var binder: UInt8 = 0
}

extension Bindable where Self: NSObject {

    private var binder: MutableObservable<BindingType> {
        get {
            guard let value = objc_getAssociatedObject(self, &AssociatedKeys.binder) as? MutableObservable<BindingType> else {
                let newValue = MutableObservable<BindingType>()
                objc_setAssociatedObject(self, &AssociatedKeys.binder, newValue, objc_AssociationPolicy.OBJC_ASSOCIATION_RETAIN_NONATOMIC)
                return newValue
            }
            return value
        }
        set(newValue) {
             objc_setAssociatedObject(self, &AssociatedKeys.binder, newValue, objc_AssociationPolicy.OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        }
    }
    
    public func getBinderValue() -> BindingType? {
        return binder.property
    }
    
    public func setBinderValue(with value: BindingType?) {
        binder.postValue(value)
    }
    
    public func register(for observable: MutableObservable<BindingType>) {
        binder = observable
    }
    
    func valueChanged() {
        if binder.property != self.observingValue() {
            setBinderValue(with: self.observingValue())
        }
    }

    public func bind(with observable: MutableObservable<BindingType>) {
        if let _self = self as? UIControl {
            _self.addTarget(Selector, action: Selector{ [weak self] in self?.valueChanged() }, for: [.editingChanged, .valueChanged])
        }
        self.binder = observable
        if let val = observable.property {
            self.updateValue(with: val)
        }
        self.observe(for: observable) { (value) in
            self.updateValue(with: value)
        }
    }
    
}
