//
//  Date+Ext.swift
//  Appetizers
//
//  Created by Berkay on 9.03.2025.
//

import SwiftUI

extension Date {
    
    var eighteenYearsAgo: Date {
        Calendar.current.date(byAdding: .year, value: -18, to: self)!
    }
    
    var oneHundredYearsAgo: Date {
        Calendar.current.date(byAdding: .year, value: -100, to: self)!
    }
}
