//
//  VisitRecordViewController.swift
//  Covid Track
//
//  Created by Samip shah on 28/7/20.
//  Copyright © 2020 Samip shah. All rights reserved.
//

import UIKit

class VisitRecordViewController: UIViewController  {
  
  
  //MARK: - Outlets
  @IBOutlet weak var personalInfoLabel: UILabel!
  @IBOutlet weak var temperatureInfoLabel: UILabel!
  @IBOutlet weak var dateInformationLabel: UILabel!
  
  @IBOutlet weak var containerScrollView: UIScrollView!
  
  @IBOutlet weak var nameTextField: UITextField!
  @IBOutlet weak var emailTextField: UITextField!
  @IBOutlet weak var phoneTextField: UITextField!
  @IBOutlet weak var homePostCodeTextField: UITextField!
  @IBOutlet weak var workPostCodeTextField: UITextField!
  
  @IBOutlet weak var datePicker: UIDatePicker!
  @IBOutlet weak var temperaturePicker: UIPickerView!
  @IBOutlet weak var profileButton: UIButton!
  @IBOutlet weak var moreInfoButton: UIButton!
  @IBOutlet weak var checkInButton: UIButton!
  
  //MARK: - Variables
  private var hideInfo = true;
  private lazy var imagePicker: ImagePicker = ImagePicker(presentationController: self, delegate: self)
  
  private lazy var viewModel:VisitRecordViewModel = VisitRecordViewModel(with: VisitoryDBRepository(),
                                                                         and: VisitDBRepository())
  private var profileData:Data? = nil
  
  //MARK: - LifeCycle methods
  override func viewDidLoad() {
    super.viewDidLoad()
    setupViews()
  }
  
  override func viewWillAppear(_ animated: Bool) {
    super .viewWillAppear(animated)
    setupDatePicker()
  }
  
  //MARK: - View Setup
  func setupViews() {
    setupInfoLabels()
    setupTextFields()
    setupButtons()
    setupkeyboard()
    setupPickerViews()
    hideMoreInfo(hideInfo);
    
  }
  
  func setupInfoLabels() {
    personalInfoLabel.font = AppConstants.Font.title
    personalInfoLabel.text = "Personal Information"
    
    temperatureInfoLabel.font = AppConstants.Font.title
    temperatureInfoLabel.text = "Temperature Information"
    
    dateInformationLabel.font = AppConstants.Font.title
    dateInformationLabel.text = "Time Information"
  }
  
  func setupTextFields() {
    nameTextField.keyboardType = .namePhonePad
    nameTextField.placeholder = "Name"
    
    emailTextField.keyboardType = .emailAddress
    emailTextField.placeholder = "Email"
    
    phoneTextField.keyboardType = .phonePad
    phoneTextField.placeholder = "Phone"
    
    homePostCodeTextField.keyboardType = .numberPad
    homePostCodeTextField.placeholder = "Home PostCode"
    
    workPostCodeTextField.keyboardType = .numberPad
    workPostCodeTextField.placeholder = "Work PostCode"
  }
  
  func setupButtons() {
    checkInButton.titleLabel?.font = AppConstants.Font.button
    checkInButton.setTitle("Check In", for: .normal)
    checkInButton.roundedFilled(by: 10, with: .orange, and: .white)
  }
  
  func setupPickerViews() {
    temperaturePicker.delegate = self
    temperaturePicker.dataSource = self
  }
  
  func setupDatePicker() {
    datePicker.date = Date()
    datePicker.maximumDate = Date()
  }
  
  // to dissmiss keyboard on drag
  func setupkeyboard() {
    containerScrollView.keyboardDismissMode = .onDrag
  }
  
  func resetInformation(){
    profileData = nil
    profileButton.setImage(UIImage(systemName: "person.crop.circle.badge.plus"), for: .normal)
    nameTextField.text = nil
    emailTextField.text = nil
    phoneTextField.text = nil
    homePostCodeTextField.text = nil
    workPostCodeTextField.text = nil
    temperaturePicker.selectedRow(inComponent: 0)
    datePicker.date = Date()
  }
  
  //MARK: - Actions
  @IBAction func profileButtonAction(_ sender: UIButton) {
    imagePicker.present(from: sender)
  }
  
  @IBAction func moreInfoButtonClicked(_ sender: Any) {
    hideInfo = !hideInfo
    hideMoreInfo(hideInfo)
  }
  
  @IBAction func checkInButtonAction(_ sender: UIButton) {
    print(temperaturePicker.selectedRow(inComponent: 0))
    viewModel.saveVisit(profile: profileData,
                        name: nameTextField.text,
                        email: emailTextField.text,
                        phone: phoneTextField.text,
                        homeAddress: homePostCodeTextField.text,
                        workAddress: workPostCodeTextField.text,
                        temperatureLevel: temperaturePicker.selectedRow(inComponent: 0),
                        checkInDate: datePicker.date) { [weak self] result in
                          switch(result){
                          case .success:
                            self?.showAlert(with: "Recording Information", and: "Successfull")
                            self?.resetInformation()
                            break
                          case .failure(let error):
                            self?.showAlert(with: "Recording Information", and: error.localizedDescription)
                          }
    }
  }
  
  private func hideMoreInfo(_ infoHidden: Bool) {
    self.homePostCodeTextField.isHidden = infoHidden
    self.workPostCodeTextField.isHidden = infoHidden
    self.setupMoreInfoButtonImage(for: infoHidden);
  }
  
  private func setupMoreInfoButtonImage(for infoHidden: Bool) {
    let image = infoHidden ? UIImage(systemName: "chevron.down.circle.fill") : UIImage(systemName: "chevron.up.circle.fill")
    moreInfoButton.setImage(image, for: .normal)
  }
}

//MARK:- ImagePickerDelegate
extension VisitRecordViewController: ImagePickerDelegate {
  func didSelect(image: UIImage?, imageUrl: URL?) {
    if let image = image{
      profileData = image.jpegData(compressionQuality: 50.0)
      setCircularProfileButton(with: image)
    }
  }
  
  private func setCircularProfileButton(with image:UIImage){
    profileButton.imageView?.layer.cornerRadius = profileButton.frame.size.width/2
    profileButton.imageView?.layer.masksToBounds = true
    profileButton.setImage(image, for: .normal)
  }
}

