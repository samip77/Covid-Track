//
//  VisitHistoryViewController.swift
//  Covid Track
//
//  Created by Samip shah on 28/7/20.
//  Copyright © 2020 Samip shah. All rights reserved.
//

import UIKit

class VisitHistoryViewController: UIViewController {
  
  //MARK:- Outlets
  @IBOutlet weak var titleLabel: UILabel!
  @IBOutlet weak var tableView: UITableView!
  
  //MARK:- Variables
  private var viewModel:VisitHistoryViewModel = VisitHistoryViewModel(with: VisitDBRepository())
  private var dataSource: [VisitViewModel] = []{
    didSet{
      DispatchQueue.main.async {
        self.tableView.reloadData()
        self.refreshControl.endRefreshing()
      }
    }
  }
  
  private lazy var refreshControl: UIRefreshControl = {
    let control = UIRefreshControl()
    control.addTarget(self, action: #selector(self.getVisitorList), for: .valueChanged)
    return control
  }()
  
  //MARK:- LifeCycle Methods
  override func viewDidLoad() {
    super.viewDidLoad()
    setupView()
  }
  
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    getVisitorList()
  }
  
  //MARK:- View Setup
  private func setupView() {
    titleLabel.font = AppConstants.Font.title
    titleLabel.text = "History"
    
    tableView.register(VisitHistoryTableViewCell.self)
    tableView.estimatedRowHeight =  UITableView.automaticDimension
    tableView.separatorStyle = .singleLine
    tableView.delegate = self
    tableView.dataSource = self
    
    tableView.addSubview(refreshControl)
  }
  
  //MARK:- Actions
  @objc func getVisitorList(){
    refreshControl.beginRefreshing()
    viewModel.loadVisitors { [weak self] (result) in
      switch(result){
      case .success(let dataSource):
        self?.dataSource = dataSource
       
      case .failure(let error):
      self?.showActionAlert(with: "Error", and: error.localizedDescription, in: self, action: #selector(VisitHistoryViewController.getVisitorList))
      }
      DispatchQueue.main.async {
        self?.refreshControl.endRefreshing()
      }
    }
  }
}

//MARK:- TableView Delegate and DataSource
extension VisitHistoryViewController: UITableViewDelegate {
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    let visitModel = dataSource[indexPath.row]
    let nextVC = VisitDetailViewController.load(with: visitModel)
    self.present(nextVC, animated: true, completion: nil)
  }
  
}

extension VisitHistoryViewController: UITableViewDataSource {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return dataSource.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell:VisitHistoryTableViewCell = tableView.dequeueReusableCell(forIndexPath: indexPath)
    cell.configure(with: dataSource[indexPath.row])
    return cell
  }
  
  
}



