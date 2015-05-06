//
//  AccordionTableViewController.swift
//  AccordionMenu
//
//  Created by super_user on 5/6/15.
//  Copyright (c) 2015 DevCom. All rights reserved.
//

import UIKit

private let CELL_IDENTIFIER = "Cell"

class AccordionTableViewController: UITableViewController {

    private var stateSections: [Bool] = [false, true, false, false, false]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        var nib = UINib(nibName: "Cell", bundle: nil)
        tableView.registerNib(nib, forCellReuseIdentifier: CELL_IDENTIFIER)
    }
    
    
    
    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        
        return stateSections.count
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if stateSections[section] {
            return 3
        }
        return 0
    }
    
    // MARK - section header
    
    override func tableView(tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        
        return 80
    }
    
    override func tableView(tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        let headerView = SectionHeaderView()
        
        headerView.handler = {
            (headerView) -> Void in
            
            self.stateSections[section] = !self.stateSections[section]
            
            var range = NSMakeRange(section, 1)
            var sectionToReload = NSIndexSet(indexesInRange: range)
            
            self.tableView.reloadSections(sectionToReload, withRowAnimation: UITableViewRowAnimation.Fade)
        }
        
        return headerView
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        return tableView.dequeueReusableCellWithIdentifier(CELL_IDENTIFIER, forIndexPath: indexPath) as! UITableViewCell
    }
}
