//
//  FileManager-DocumentDirectory.swift
//  WatchReactions WatchKit Extension
//
//  Created by Pawan Kumar on 05/05/19.
//  Copyright © 2019 PawanShivHari inc. All rights reserved.
//

import Foundation


extension FileManager {
    func getDocumentDirectory() -> URL {
        let paths = urls(for: .documentDirectory, in: .userDomainMask)
        return paths[0]
    }
}
