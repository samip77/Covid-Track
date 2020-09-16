//
//  VisitDetailViewController.swift
//  Covid Track
//
//  Created by Samip shah on 28/7/20.
//  Copyright © 2020 Samip shah. All rights reserved.
//

import UIKit

class VisitDetailViewController: UIViewController {
  //MARK:- Outlets
  @IBOutlet weak private var profileImage: UIImageView!
  @IBOutlet weak private var nameTitleLabel: UILabel!
  @IBOutlet weak private var emailTitleLabel: UILabel!
  @IBOutlet weak private var phoneTitleLabel: UILabel!
  @IBOutlet weak private var homeTitleLabel: UILabel!
  @IBOutlet weak private var workTitleLabel: UILabel!
  @IBOutlet weak private var timeTitleLabel: UILabel!
  @IBOutlet weak private var temperatureTitleLabel: UILabel!
  
  @IBOutlet weak private var nameLabel: UILabel!
  @IBOutlet weak private var emailLabel: UILabel!
  @IBOutlet weak private var phoneLabel: UILabel!
  @IBOutlet weak private var homeLabel: UILabel!
  @IBOutlet weak private var workLabel: UILabel!
  @IBOutlet weak private var timeLabel: UILabel!
  @IBOutlet weak private var temperatureLabel: UILabel!
  
  @IBOutlet var titleLabels: [UILabel]!
  @IBOutlet var subtitleLabels: [UILabel]!
  
  @IBOutlet weak var backButton: UIButton!
  
  //MARK:- variables
  private var viewModel: VisitViewModel!
  
  //MARK:- LifeCycle Methods
  class func load(with visitViewModel: VisitViewModel)-> VisitDetailViewController {
    let vc: VisitDetailViewController = UIStoryboard(storyboard: .visit).instantiateViewController()
    vc.viewModel = visitViewModel
    return vc
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    setupView()
    setupViewInformations()
  }
  
  override func viewDidLayoutSubviews() {
    super.viewDidLayoutSubviews()
    //this setup needs to be done here, as view controller doesn't know about frame size at viewDidLoad
    profileImage.rounded()
  }
  
  //MARK:- View Setup
  func setupView() {
    titleLabels.forEach {
      $0.font = AppConstants.Font.subtitle
    }
    subtitleLabels.forEach{
      $0.font = AppConstants.Font.body
    }
    profileImage.contentMode = .scaleAspectFill
  }
  
  func setupViewInformations(){
    nameLabel.text = viewModel.name
    emailLabel.text = viewModel.email
    phoneLabel.text = viewModel.phone
    homeLabel.text = viewModel.home
    workLabel.text = viewModel.work
    temperatureLabel.text = viewModel.temperatureDescription
    timeLabel.text = viewModel.checkInTimeDescription
    
    temperatureLabel.textColor = viewModel.temperatureColor
    timeLabel.textColor = viewModel.temperatureColor
    
    if let image = viewModel.profile {
      profileImage.image = image
    }else {
      profileImage.image =  UIImage(systemName: "person.circle")
    }
  }
  
  //MARK:- Actions
  @IBAction func backButtonAction(_ sender: UIButton) {
    dismiss(animated: true)
  }
}


