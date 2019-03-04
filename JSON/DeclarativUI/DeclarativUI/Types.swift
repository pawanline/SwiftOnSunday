//
//  Types.swift
//  DeclarativUI
//
//  Created by Pawan Kumar on 04/03/19.
//  Copyright © 2019 PawanShivHari inc. All rights reserved.
//

import Foundation

struct Application : Decodable {
    let screens : [Screen]
}


struct Screen : Decodable {
    let id: String
    let title: String
    let type: String
    let rows: [Row]
}

struct Row: Decodable {
    var title: String
}


class NavigationManager {
    
    private var screens = [String : Screen]()
    
    
    func fetch(completion:(Screen) -> Void) {
        let url = URL(string: "http://localhost:8090/index.json")!
        let data = try! Data(contentsOf: url)
        
        let decoder = JSONDecoder()
        
        let app = try! decoder.decode(Application.self, from: data)
        
        for screen in app.screens {
            screens[screen.id] = screen
        }
        completion(app.screens[0])
    }
    
}
