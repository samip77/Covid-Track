//
//  VisitHistoryViewController.swift
//  Covid Track
//
//  Created by Samip shah on 28/7/20.
//  Copyright © 2020 Samip shah. All rights reserved.
//

import UIKit

class VisitHistoryViewController: UIViewController {
  
  @IBOutlet weak var titleLabel: UILabel!
  @IBOutlet weak var tableView: UITableView!
  
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
  
  override func viewDidLoad() {
    super.viewDidLoad()
    setupView()
  }
  
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    getVisitorList()
  }
  
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

extension VisitHistoryViewController: UITableViewDelegate {
  
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



