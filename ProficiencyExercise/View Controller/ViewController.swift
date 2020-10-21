//
//  ViewController.swift
//  ProficiencyExercise
//
//  Created by Poonam More on 20/10/20.
//  Copyright © 2020 Poonam More. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    let factsTableView = UITableView()
    var safeArea: UILayoutGuide!
    var factsList = [FactsViewModel]()


    override func viewDidLoad() {
        super.viewDidLoad()
        //UI Initialization
        view.backgroundColor = .white
        safeArea = view.layoutMarginsGuide
        setupTableView()
        fetchData()
        
    }


    // MARK: -Set up TableView
    func setupTableView()
    {
        view.addSubview(factsTableView)
        factsTableView.dataSource = self
        factsTableView.delegate = self
        factsTableView.register(FactsTableViewCell.self, forCellReuseIdentifier: Constants.reuseIdOfTableView)
        
        factsTableView.translatesAutoresizingMaskIntoConstraints = false
        factsTableView.topAnchor.constraint(equalTo: safeArea.topAnchor).isActive = true
        factsTableView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        factsTableView.bottomAnchor.constraint(equalTo: safeArea.bottomAnchor).isActive = true
        factsTableView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
    }
    
    
    //MARK: - Fetch data
    func fetchData() {
        let utils = Utils()
        utils.parseJson(completionHandler: {
            data,title  in
            if data != nil
            {
                self.factsList = data?.map({return FactsViewModel(rows: $0)}) ?? []
                DispatchQueue.main.async {
                    self.title = title
                    self.factsTableView.reloadData()
                }
            }
        })
    }
}

// MARK: - TableView Delegate and DataSource Methods
extension ViewController: UITableViewDataSource {
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return factsList.count
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let currentRow = factsList[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: Constants.reuseIdOfTableView, for: indexPath) as! FactsTableViewCell
        cell.selectionStyle = .none
        cell.factViewModel = currentRow
        return cell
        
    }
    
}
 
extension ViewController: UITableViewDelegate{
    
}
