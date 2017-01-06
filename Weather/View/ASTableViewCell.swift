//
//  ASTableViewCell.swift
//  Weather
//
//  Created by Stéphane AZZOPARDI on 06/01/2017.
//  Copyright © 2017 Stéhane Azzopardi AE. All rights reserved.
//

import UIKit

class ASTableViewCell: UITableViewCell {

    public class var cellIdentifier: String {
        
        return String(describing: self)
    }
    
    public class func registerCell(forTableView tableView: UITableView) {
        
        tableView.register(UINib.init(nibName: self.cellIdentifier, bundle: Bundle.main), forCellReuseIdentifier: self.cellIdentifier)
    }

}
