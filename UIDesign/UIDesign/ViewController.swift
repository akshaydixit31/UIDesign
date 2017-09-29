//
//  ViewController.swift
//  UIDesign
//
//  Created by Appinventiv Technologies on 28/09/17.
//  Copyright © 2017 Appinventiv Technologies. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    // MARK:- Outlets
    @IBOutlet weak var leftSideTable: UITableView!
    @IBOutlet weak var rightSideTable: UITableView!
    @IBOutlet weak var buttonContainView: UIView!
    @IBOutlet weak var clearAllButton: UIButton!
    @IBOutlet weak var searchBar: UISearchBar!
    
    //    MARK:- Variable's
    let showData = ["Region","Country","State","City","Age","Gender","Position","Organization"]
    let region = ["Asia","Australia","Antarctica","Africa","Europe","North America","South America"]
    var filterData = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //     MARK:- Cell's
        //       Register left tableCell ......
        
        let leftCellNib = UINib(nibName: "LeftSideTableCell",
                                bundle: nil)
        leftSideTable.register(leftCellNib,
                               forCellReuseIdentifier: "LeftSideTableCellId")
        self.leftSideTable.dataSource = self
        self.leftSideTable.delegate = self
        
        //       Register left tableCell ......
        
        let rightCellNib = UINib(nibName: "RightSideTable",
                                 bundle: nil)
        rightSideTable.register(rightCellNib,
                                forCellReuseIdentifier: "RightSideTableId")
        self.rightSideTable.dataSource = self
        self.rightSideTable.delegate = self
        
        searchBar.delegate = self
        filterData = region
        //-------------------------------------------
        
        clearAllButton.layer.borderWidth = 1
        clearAllButton.layer.borderColor = UIColor.lightGray.cgColor
        clearAllButton.layer.cornerRadius = 10
        clearAllButton.clipsToBounds = true 
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        buttonContainView.layer.shadowColor = UIColor.black.cgColor
        buttonContainView.layer.shadowOpacity = 1
        buttonContainView.layer.shadowOffset = CGSize.zero
        buttonContainView.layer.shadowRadius = 10
        
    }
    
    
}

extension ViewController: UITableViewDataSource, UITableViewDelegate, UISearchBarDelegate {
    
    func tableView(_ tableView: UITableView,
                   numberOfRowsInSection section: Int) -> Int {
        
        var nubOfRow = Int()
        if tableView === self.leftSideTable{
            
            nubOfRow = showData.count
            
        }
        
        if tableView === self.rightSideTable{
            
            nubOfRow = filterData.count
            
        }
        
        return nubOfRow
        
    }
    
    func tableView(_ tableView: UITableView,
                   cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        
        if tableView == self.leftSideTable {
            
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "LeftSideTableCellId",
                                                           for: indexPath) as? LeftSideTableCell else {
                                                            
                                                            fatalError("Cell not found:")
            }
            cell.regionDataLabel.text = showData[indexPath.row]
            
            return cell
        }
        if tableView == self.rightSideTable {
            
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "RightSideTableId",
                                                           for: indexPath) as? RightSideTable else {
                                                            
                                                            fatalError("Cell not found:")
            }
            
            cell.rightDataLabel.text = filterData[indexPath.row]
            return cell
        }
        
        return UITableViewCell()
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        
        filterData = searchText.isEmpty ? region : region.filter { (temp: String) -> Bool in
            // If dataItem matches the searchText, return true to include it
            return temp.range(of: searchText, options: .caseInsensitive, range: nil, locale: nil) != nil
            
        }
        
        if filterData .isEmpty {
            let alert = UIAlertController(title: "Alert",
                                          message: "Please Enter valid continent name:",
                                          preferredStyle: UIAlertControllerStyle.alert)
            alert.addAction(UIAlertAction(title: "Click",
                                          style: UIAlertActionStyle.default,
                                          handler: nil))
            
            self.present(alert, animated: true, completion: nil)
        }
        
        rightSideTable.reloadData()
    }
    
    
}
























