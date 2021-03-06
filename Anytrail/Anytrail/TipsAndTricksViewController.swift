//
//  TipsAndTricksViewController.swift
//  Anytrail
//
//  Created by Elli Scharlin on 8/17/16.
//  Copyright © 2016 Flatiron School. All rights reserved.
//

import UIKit

class TipsAndTricksViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    
    var tableView: UITableView = UITableView()
    var categoryNumber : Int?
    let headerArray = [UIImage(named: "ActiveLiving"), UIImage(named: "MentalHealthHeader"), UIImage(named: "TobaccoFreeLiving"), UIImage(named: "HealthyEatingHeader")]
    var arraySentFromSegue: [String]?
    
    let leafIcon : UIImage = UIImage(named: "leaf")!
    var informationData: [[String]] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        informationData = [FactsForTipsAndTricks.activityTips, FactsForTipsAndTricks.wellBeingTips, FactsForTipsAndTricks.tobaccoTips, FactsForTipsAndTricks.healthyEatingTips]
        arraySentFromSegue = informationData[categoryNumber!]
        
        self.tableView = UITableView(frame: (CGRectMake(0, -30, self.view.bounds.size.width, self.view.bounds.size.height)), style: UITableViewStyle.Grouped)
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: "cell")
        self.view.addSubview(self.tableView)
        
        tableView.registerNib(UINib(nibName: "TipsCell", bundle: nil), forCellReuseIdentifier: "TipsCell")
        
        self.title = FactsForTipsAndTricks.titleArray[categoryNumber!]
        
        self.tableView.backgroundColor = UIColor.whiteColor()
        let header:TipsAndTricksHeader = UINib(nibName: "TipsAndTricksHeader", bundle: nil).instantiateWithOwner(nil, options: nil)[0] as! TipsAndTricksHeader
        header.headerPhoto.image = headerArray[categoryNumber!]!
        self.tableView.tableHeaderView = header
        self.tableView.separatorStyle = .None
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.estimatedRowHeight = 120.0
        
        self.edgesForExtendedLayout = UIRectEdge.All
        self.tableView.contentInset = UIEdgeInsetsMake(0.0, 0.0, CGRectGetHeight((self.tabBarController?.tabBar.frame)!), 0.0)
        
    }
 
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arraySentFromSegue!.count - 1
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell: TipsAndTricksTableViewCell = self.tableView.dequeueReusableCellWithIdentifier("TipsCell", forIndexPath: indexPath) as! TipsAndTricksTableViewCell
        cell.userInteractionEnabled = false
        cell.dataLabel.layer.cornerRadius = 8.0
        cell.dataLabel.text = arraySentFromSegue![indexPath.row]
        
        return cell
    }
}
