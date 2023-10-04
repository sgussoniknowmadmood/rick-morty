//
//  SearchView.swift
//  Rick&Morty
//
//  Created by pw-sgussoni on 3/10/23.
//

import UIKit

protocol SearchViewDelegate {
    func addFilter(filters: [FilterModel])
}

class SearchView: UIView {
    
    @IBOutlet weak var searchTextField: UITextField!
    @IBOutlet weak var maleButton: UIButton!
    @IBOutlet weak var femaleButton: UIButton!
    @IBOutlet weak var otherGenderButton: UIButton!
    @IBOutlet weak var unknowGenderButton: UIButton!
    @IBOutlet weak var aliveButton: UIButton!
    @IBOutlet weak var deathButton: UIButton!
    @IBOutlet weak var unknowStatus: UIButton!

    var delegate: SearchViewDelegate?
    var currentFilters: [FilterModel] = []
    
    override func awakeFromNib() {
        super.awakeFromNib()
        currentFilters.removeAll()
    }
    @IBAction func searchEditinChanged(_ sender: Any) {
        if searchTextField.text?.count ?? 0 > 3 {
            addFilter(type: .name, value: searchTextField.text ?? "")
        }
    }
        
    func addFilter(type: FilterEnum, value: String) {
        
        let currentFilter = FilterModel(type: type, value: value)


        guard let itemIndex = currentFilters.firstIndex(where: {$0.type == type}) else {
            currentFilters.append(currentFilter)
            return
        }
        
        currentFilters.remove(at: itemIndex)
        currentFilters.append(currentFilter)
    }
    
    @IBAction func quickFilterSelected(_ sender: UIButton) {

        switch sender.tag {
        case 1:
            cleanGenderButton()
            addFilter(type: .gender, value: GenderEnum.male.rawValue)
        case 2:
            cleanGenderButton()
            addFilter(type: .gender, value: GenderEnum.female.rawValue)
        case 3:
            cleanGenderButton()     
            addFilter(type: .gender, value: GenderEnum.genderless.rawValue)
        case 4:
            cleanGenderButton()    
            addFilter(type: .gender, value: GenderEnum.unknown.rawValue)
        case 5:
            cleanStauts()
            addFilter(type: .status, value: StatusEnum.alive.rawValue)
        case 6:
            cleanStauts()
            addFilter(type: .status, value: StatusEnum.dead.rawValue)
        case 7:
            cleanStauts()
            addFilter(type: .status, value: StatusEnum.unknown.rawValue)
        default:
            break
        }
        
        setBorderColor(button: sender)
    }
    
    func setBorderColor(button: UIButton) {
        button.layer.borderColor = UIColor.gray.cgColor
        button.layer.borderWidth = 1
        button.layer.cornerRadius = 15
    }
    
    func cleanGenderButton() {
        maleButton.layer.borderWidth = 0
        femaleButton.layer.borderWidth = 0
        otherGenderButton.layer.borderWidth = 0
        unknowGenderButton.layer.borderWidth = 0
    }
    
    func cleanStauts() {
        aliveButton.layer.borderWidth = 0
        deathButton.layer.borderWidth = 0
        unknowStatus.layer.borderWidth = 0
    }
    
    @IBAction func searchTapped(_ sender: Any) {
        delegate?.addFilter(filters: currentFilters)
        self.removeFromSuperview()
    }
    
    @IBAction func closeView(_ sender: Any) {
        delegate?.addFilter(filters: [])
        self.removeFromSuperview()
    }
}
