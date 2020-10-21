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
    var refreshControl = UIRefreshControl()


    //MARK: -Life Cycle methods
    override func viewDidLoad() {
        super.viewDidLoad()
       
        //UI Initialization
        view.backgroundColor = .white
        safeArea = view.layoutMarginsGuide
        setupTableView()
        
        if Reachability.isConnectedToNetwork(){
            fetchData()
        }else{
            showAlertMessage("No internet connection.")
        }
        
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
        
        
        refreshControl.attributedTitle = NSAttributedString(string: "Pull to refresh")
        refreshControl.addTarget(self, action: #selector(self.refresh(_:)), for: .valueChanged)
        factsTableView.addSubview(refreshControl)
    }
    
    //MARK: -Pull to refresh TableView
    @objc func refresh(_ sender: AnyObject) {
        if Reachability.isConnectedToNetwork(){
            fetchData()
        }else{
            showAlertMessage("No internet connection.")
            self.refreshControl.endRefreshing()

        }
    }
    
    //MARK: -Alert Message
    func showAlertMessage(_ message:String){
        let alert = UIAlertController(title: "Proficiency Exercise", message: message, preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    
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
                    self.refreshControl.endRefreshing()
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
