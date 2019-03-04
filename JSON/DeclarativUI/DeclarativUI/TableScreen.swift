//
//  ViewController.swift
//  DeclarativUI
//
//  Created by Pawan Kumar on 03/03/19.
//  Copyright © 2019 PawanShivHari inc. All rights reserved.
//

import UIKit

class TableScreen: UITableViewController {
    var screen : Screen
    
    
    init(screen: Screen) {
        self.screen = screen
        super.init(style: .plain)
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        title = screen.title
        
    }
    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return screen.rows.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        
        let row = screen.rows[indexPath.row]
        cell.textLabel?.text = row.title
        return cell
    }

    
    

}

