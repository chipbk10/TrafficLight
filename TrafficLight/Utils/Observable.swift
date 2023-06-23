//
//  Observable.swift
//  TrafficLight
//
//  Created by Hieu Luong on 22/06/2023.
//

import Foundation

// Simple React
// Listener & Observer pattern
final class Observable<T> where T: Equatable {

    // MARK: - Public Properties

    typealias Listener = (T, T) -> Void
    
    var value: T {
        didSet {
            self.notify(oldValue: oldValue, newValue: value)
        }
    }
    
    // MARK: - Private Properties
    
    private var listener: Listener?

    // MARK: - Init & Deinit Methods

    init(_ value: T) {
        self.value = value
    }

    deinit {
        removeObserver()
    }

    // MARK: - Public Methods
    
    func addObserver(_ listener: @escaping Listener) {
        self.listener = listener
        listener(value, value)
    }

    func removeObserver() {
        listener = nil
    }

    func notify(oldValue: T, newValue: T) {
        guard oldValue != newValue else { return }
        listener?(oldValue, newValue)
    }
}
