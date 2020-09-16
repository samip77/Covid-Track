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
  @IBOutlet weak private var personalInfoLabel: UILabel!
  @IBOutlet weak private var temperatureInfoLabel: UILabel!
  @IBOutlet weak private var dateInformationLabel: UILabel!
  
  @IBOutlet weak private var containerScrollView: UIScrollView!
  
  @IBOutlet weak private var nameTextField: UITextField!
  @IBOutlet weak private var emailTextField: UITextField!
  @IBOutlet weak private var phoneTextField: UITextField!
  @IBOutlet weak private var homeTextField: UITextField!
  @IBOutlet weak private var workTextField: UITextField!
  
  @IBOutlet weak private var datePicker: UIDatePicker!
  @IBOutlet weak private var temperaturePicker: UIPickerView!
  @IBOutlet weak private var profileButton: UIButton!
  @IBOutlet weak private var moreInfoButton: UIButton!
  @IBOutlet weak private var checkInButton: UIButton!
  
  //MARK: - Variables
  private var hideInfo = true;
  private lazy var imagePicker: ImagePicker = ImagePicker(presentationController: self, delegate: self)
  private lazy var viewModel:VisitRecordViewModel = VisitRecordViewModel(with: VisitoryDBRepository(),
                                                                         and: VisitDBRepository())
  private var profileData:Data? = nil
  
  //MARK: - Lifecycle methods
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
    
    homeTextField.keyboardType = .default
    homeTextField.placeholder = "Home Address"
    
    workTextField.keyboardType = .default
    workTextField.placeholder = "Work Address"
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
    homeTextField.text = nil
    workTextField.text = nil
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
                        homeAddress: homeTextField.text,
                        workAddress: workTextField.text,
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
    homeTextField.isHidden = infoHidden
    workTextField.isHidden = infoHidden
    setupMoreInfoButtonImage(for: infoHidden);
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
    if let image = image.circleMasked{
      profileButton.setImage(image, for: .normal)
    }
  }
}

