//
//  Journal.swift
//  JournalApp
//
//  Created by Lujain sh on 29/10/2024.
//


// Journal.swift
import Foundation

struct Journal: Identifiable {
    let id = UUID()
    var title: String
    var date: Date
    var description: String
    var isBookmarked: Bool = false
}
