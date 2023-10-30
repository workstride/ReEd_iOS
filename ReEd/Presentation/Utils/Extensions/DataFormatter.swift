//
//  DataFormatter.swift
//  ReEd
//
//  Created by 김건우 on 10/28/23.
//

import Foundation

extension DateFormatter {
    static let serverDateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd" 
        return formatter
    }()
}

