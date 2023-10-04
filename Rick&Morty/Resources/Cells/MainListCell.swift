//
//  MainListCell.swift
//  Rick&Morty
//
//  Created by pw-sgussoni on 2/10/23.
//

import UIKit

class MainListCell: UICollectionViewCell {
    static let identifier = "MainListCell"
    
    @IBOutlet weak var backGraundImage: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var specieLabel: UILabel!
    @IBOutlet weak var liveView: UIView!
    @IBOutlet weak var favButton: UIButton!
    var characterId = 0
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
    }
    
    // MARK: - Public methods
    
    func configureCell(character : CharacterModel){
        characterId = character.id ?? 0
        nameLabel.text = character.name
        specieLabel.text = character.species
        
        guard let status = character.status else { return }
        switch status {
        case StatusEnum.alive:
            liveView.backgroundColor = UIColor(named: "LiveColor")
        case StatusEnum.dead:
            liveView.backgroundColor = UIColor(named: "DeathColor")
        case StatusEnum.unknown:
            liveView.backgroundColor = UIColor(named: "UnknowColoer")
        }
        
        if isUserFav(id: character.id ?? 0) {
            favButton.setImage(UIImage(systemName: "star.fill"), for: .normal)
        } else {
            favButton.setImage(UIImage(systemName: "star"), for: .normal)
        }

        guard let imageUrl = character.image else { return }
        NetworkProvider.getImage(imageUrl: imageUrl) { image in
            DispatchQueue.main.async {
                self.backGraundImage.image = image
            }
        }
    }
    
    @IBAction func favTapped(_ sender: Any) {
        if !isUserFav(id: characterId) {
            saveIdInFav(id: characterId)
            
            favButton.setImage(UIImage(systemName: "star.fill"), for: .normal)
        } else {
            removeIdInFav(id: characterId)
            favButton.setImage(UIImage(systemName: "star"), for: .normal)
        }
}
}
