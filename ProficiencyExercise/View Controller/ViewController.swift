//
//  ViewController.swift
//  ProficiencyExercise
//
//  Created by Poonam More on 20/10/20.
//  Copyright © 2020 Poonam More. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    let tableView = UITableView()
    var safeArea: UILayoutGuide!


    override func viewDidLoad() {
        super.viewDidLoad()
        //UI Initialization
        setupTableView()
    }


    // MARK: -Set up TableView
    func setupTableView()
    {
        view.addSubview(tableView)
        tableView.dataSource = self
        tableView.delegate = self
        
        
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.topAnchor.constraint(equalTo: safeArea.topAnchor).isActive = true
        tableView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: safeArea.bottomAnchor).isActive = true
        tableView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
    }
}

// MARK: - TableView Delegate and DataSource Methods
extension ViewController: UITableViewDataSource {
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       return UITableViewCell()
    }
    
}
 
extension ViewController: UITableViewDelegate{
    
}
