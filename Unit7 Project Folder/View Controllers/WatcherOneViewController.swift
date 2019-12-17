//
//  WatcherOneViewController.swift
//  Unit7 Project Folder
//
//  Created by Joseph Heydorn on 12/11/19.
//  Copyright © 2019 Joseph Heydorn. All rights reserved.
//

import UIKit

var appendArrayOne = [Int]()

class WatcherOneViewController: UIViewController, UITextFieldDelegate {
    var textFieldVariable = 0
    
    //MARK: - IBOutlets
    
    //PickerView
    @IBOutlet private weak var pickerView: UIPickerView!
    
    //Text Fields
    @IBOutlet weak var textField1: UITextField!
    @IBOutlet weak var textField2: UITextField!
    @IBOutlet weak var textField3: UITextField!
    @IBOutlet weak var textField4: UITextField!
    @IBOutlet weak var textField5: UITextField!
    
    //Buttons
    @IBOutlet weak var finishButton: UIButton!
    
    
    //Variables for Selected Actors
    private var names: [NameData]?
    private var selectedName: NameData?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.pickerView.dataSource = self
        self.pickerView.delegate = self
        
        textFieldDelegate()
        downloadActorNames()
        
        appendArrayOne.removeAll()
        arrayOfURLSOne.removeAll()

        // Do any additional setup after loading the view.
    }
    //MARK: - Data Downloading
    private func downloadActorNames() {
        MovieAPI.downloadPeople { [weak self] result in
            switch result {
            case .failure(let error):
                DispatchQueue.main.async {
                    self?.presentAlert(with: "Error", message: error.localizedDescription)
                }
            case .success(let names):
                self?.names = names
                DispatchQueue.main.async {
                    self?.pickerView.reloadAllComponents()
                    self?.pickerView.selectedRow(inComponent: 0)
                }
            }
            
        }
    }
    
    //MARK: - TextField Editing
    
    internal func textFieldDidBeginEditing(_ textField: UITextField) {
        if textField1.isEditing == true {
            textFieldVariable = 1
        } else if textField2.isEditing == true {
            textFieldVariable = 2
        } else if textField3.isEditing == true {
            textFieldVariable = 3
        } else if textField4.isEditing == true {
            textFieldVariable = 4
        } else if textField5.isEditing == true {
            textFieldVariable = 5
        } else {
            fatalError()
        }
        
    }
    
    private func textFieldDelegate() {
        textField1.delegate = self
        textField2.delegate = self
        textField3.delegate = self
        textField4.delegate = self
        textField5.delegate = self
    }
    
    private func gatherID() {
        appendArrayOne.append(watcherOneIDOne)
        appendArrayOne.append(watcherOneIDTwo)
        appendArrayOne.append(watcherOneIDThree)
        appendArrayOne.append(watcherOneIDFour)
        appendArrayOne.append(watcherOneIDFive)
    }
    
    //MARK: - Button Pressed
    @IBAction func finishButtonPressed(_ sender: Any) {
        gatherID()
        stringConversionOne()
    }
    
    
}

extension WatcherOneViewController: UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return names?.count ?? 0
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int)-> String? {
        guard let actorNames = names else { return nil }
        let specificName = actorNames[row].name
        return specificName
    }
}

extension WatcherOneViewController: UIPickerViewDelegate {
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        guard let actorNames = names else { return }
        let specificName = actorNames[row].name
        let specificID = actorNames[row].id
        if textFieldVariable == 1 {
            textField1.text = specificName
            watcherOneIDOne = specificID
        } else if textFieldVariable == 2 {
            textField2.text = specificName
            watcherOneIDTwo = specificID
        } else if textFieldVariable == 3 {
            textField3.text = specificName
            watcherOneIDThree = specificID
        } else if textFieldVariable == 4 {
            textField4.text = specificName
            watcherOneIDFour = specificID
        } else if textFieldVariable == 5 {
            textField5.text = specificName
            watcherOneIDFive = specificID
        }
    }
}
