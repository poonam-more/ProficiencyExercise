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
    var factsViewModel = FactsViewModel()
    var refreshControl = UIRefreshControl()
    var indicator: UIActivityIndicatorView!
    var rowsArray = [Rows]()
    private var allConstraints: [NSLayoutConstraint] = []

    // MARK: - Life Cycle methods
    override func viewDidLoad() {
        super.viewDidLoad()
        //UI Initialization
        view.backgroundColor = .white
        safeArea = view.layoutMarginsGuide
        setupTableView()
        setUpProgress()
        if Reachability.isConnectedToNetwork() {
            initBindings()
        } else {
            setUpAlertMessage("No internet connection.")
        }
    }
    // MARK: - View Model Binding
    func initBindings() {
        factsViewModel.factsArray.bind { [weak self] array in
            self!.rowsArray = (array as? [Rows])!
            DispatchQueue.main.async {
                self!.factsTableView.reloadData()
                self!.refreshControl.endRefreshing()
            }
        }
        factsViewModel.factsTitle.bind { [weak self] title in
            DispatchQueue.main.async {
                self!.title = title
            }
        }
        factsViewModel.isLoading.bind { [weak self] (isLoading) in
            DispatchQueue.main.async {
                if isLoading {
                    self!.indicator.startAnimating()
                } else {
                    self!.indicator.stopAnimating()
                }
            }
        }
    }
    // MARK: - Set up TableView
    func setupTableView() {
        //TableView initialization
        view.addSubview(factsTableView)
        factsTableView.dataSource = self
        factsTableView.register(FactsTableViewCell.self, forCellReuseIdentifier: Constants.reuseIdOfTableView)
        factsTableView.translatesAutoresizingMaskIntoConstraints = false
        let views = ["table": factsTableView]

       let visual = "H:|[table]|"
        view.addConstraints( NSLayoutConstraint.constraints(withVisualFormat: visual, metrics: nil, views: views))

        factsTableView.topAnchor.constraint(equalTo: safeArea.topAnchor).isActive = true
        factsTableView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        factsTableView.bottomAnchor.constraint(equalTo: safeArea.bottomAnchor).isActive = true
        factsTableView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        //Pull to refresh control initialization
        refreshControl.attributedTitle = NSAttributedString(string: "Pull to refresh")
        refreshControl.addTarget(self, action: #selector(self.refresh(_:)), for: .valueChanged)
        factsTableView.addSubview(refreshControl)
    }
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        if UIDevice.current.hasNotch {
            let orientation = UIDevice.current.orientation
        if orientation.isLandscape {
                self.factsTableView.contentInset = UIEdgeInsets(top: 0, left: 30, bottom: 0, right: -10)
            } else {
                self.factsTableView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
            }
        }
    }
    // MARK: - Pull to refresh TableView
    @objc func refresh(_ sender: AnyObject) {
        if Reachability.isConnectedToNetwork() {
            initBindings()
        } else {
            setUpAlertMessage("No internet connection.")
            self.refreshControl.endRefreshing()
        }
    }
    // MARK: - Setup Alert Message
    func setUpAlertMessage(_ message: String) {
        let style = UIAlertController.Style.alert
        let alert = UIAlertController(title: "Proficiency Exercise", message: message, preferredStyle: style)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    // MARK: - Setup Progress
    func setUpProgress() {
        indicator = UIActivityIndicatorView(style: UIActivityIndicatorView.Style.gray)
        indicator.frame = CGRect(x: 0, y: 0, width: 40, height: 40)
        indicator.center = view.center
        self.view.addSubview(indicator)
        self.view.bringSubviewToFront(indicator)
    }
}

// MARK: - TableView Delegate and DataSource Methods
extension ViewController: UITableViewDataSource {
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return rowsArray.count
    }
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let currentRow = rowsArray[indexPath.row]
        let reuseId = Constants.reuseIdOfTableView
        let cell = tableView.dequeueReusableCell(withIdentifier: reuseId, for: indexPath) as? FactsTableViewCell
        cell!.selectionStyle = .none
        cell!.rowsModel = currentRow
        return cell!
    }
}
extension ViewController: UITableViewDelegate {
  func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    return UITableView.automaticDimension
  }
}
