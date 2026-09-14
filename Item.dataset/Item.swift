//
//  Item.swift
//  مشروب فنجالة
//
//  Created by Maram Alraddadi on 21/02/1446 AH.
//

import Foundation
import SwiftData

@Model
final class Item {
    var timestamp: Date
    
    init(timestamp: Date) {
        self.timestamp = timestamp
    }
}
