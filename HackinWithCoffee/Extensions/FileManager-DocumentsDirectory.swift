//
//  FileManager-DocumentsDirectory.swift
//  HackinWithCoffee
//
//  Created by Sergey Petrosyan on 06.02.24.
//

import Foundation

extension FileManager {
    static var documentsDirectory: URL {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        return paths[0]
    }
}
