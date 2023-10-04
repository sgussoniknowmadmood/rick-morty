//
//  Detail.swift
//  Rick&Morty
//
//  Created by pw-sgussoni on 2/10/23.
//

import UIKit

class DetailVC: UIViewController, DetailVcContract, DetailOutputContract {
    var presenter: DetailPresenterContract!
    var character: CharacterModel?
    @IBOutlet weak var favoriteButton: UIButton!
    @IBOutlet weak var characterImage: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var specieLabel: UILabel!
    @IBOutlet weak var statusView: UIView!
    @IBOutlet weak var genderLabel: UILabel!
    @IBOutlet weak var originLabel: UILabel!
    @IBOutlet weak var locationLabel: UILabel!
        
    override func viewDidLoad() {
        super.viewDidLoad()
        DetailBuilder.build(detailOutput: self) { presenter in
            self.presenter = presenter
            self.presenter.wireframe.view = self
            self.presenter.view = self
        }
        
        setUpCharacter()
    }
    
    func setUpCharacter() {
        nameLabel.text = character?.name
        specieLabel.text = character?.species

        genderLabel.text = character?.gender?.rawValue
        originLabel.text = character?.origin?.name
        locationLabel.text = character?.location?.name

        guard let status = character?.status else { return }
        switch status {
        case StatusEnum.alive:
            statusView.backgroundColor = UIColor(named: "LiveColor")
        case StatusEnum.dead:
            statusView.backgroundColor = UIColor(named: "DeathColor")
        case StatusEnum.unknown:
            statusView.backgroundColor = UIColor(named: "UnknowColoer")
        }
        
        if  presenter.isFav(id: character?.id ?? 0) {
            setButtonFav()
        } else {
            setOffButtonFav()
        }

        guard let imageUrl = character?.image else { return }
        NetworkProvider.getImage(imageUrl: imageUrl) { image in
            DispatchQueue.main.async {
                self.characterImage.image = image
            }
        }

    }
    
    func setButtonFav() {
        favoriteButton.setImage(UIImage(systemName: "star.fill"), for: .normal)
    }
    
    func setOffButtonFav() {
        favoriteButton.setImage(UIImage(systemName: "star"), for: .normal)
    }
    
    @IBAction func closeTapped(_ sender: Any) {
        self.dismiss(animated: true)
    }
    
    @IBAction func favoritoTapped(_ sender: Any) {
        presenter.setUpFav(id: character?.id ?? 0)
    }
}
