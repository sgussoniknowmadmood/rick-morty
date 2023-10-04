//
//  ViewController.swift
//  Rick&Morty
//
//  Created by pw-sgussoni on 2/10/23.
//

import UIKit

class MainListVC: UIViewController, MainListVcContract, MainListOutputContract {
    
    var presenter: MainListPresenterContract!
    @IBOutlet weak var indicatroShadoView: UIView!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    @IBOutlet weak var mainListCollectionView: UICollectionView!
    @IBOutlet weak var erroLabel: UILabel!
    @IBOutlet weak var favButtom: UIButton!
    var isShowFav = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        MainListBuilder.build(mainListOutput: self) { presenter in
            self.presenter = presenter
            self.presenter.wireframe.view = self
            self.presenter.view = self
        }
        
        setUpCollection()
        showIndicatorView()
        presenter.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        updateCollection()
    }
    
    func setUpCollection() {
        let nib = UINib(nibName: MainListCell.identifier, bundle: Bundle(for: MainListCell.self))
        self.mainListCollectionView.register(nib, forCellWithReuseIdentifier: MainListCell.identifier)
    }
    
    func updateCollection() {
        hiddeIndicatorView()
        mainListCollectionView.isHidden = false
        mainListCollectionView.reloadData()
    }
    
    func showIndicatorView() {
        indicatroShadoView.isHidden = false
        activityIndicator.startAnimating()
    }
    
    func hiddeIndicatorView() {
        erroLabel.isHidden = true
        indicatroShadoView.isHidden = true
        activityIndicator.stopAnimating()
    }
    
    func showError(alert: UIAlertController) {
        erroLabel.isHidden = false
        mainListCollectionView.isHidden = true
        self.present(alert, animated: true, completion: nil)
    }
    
    @IBAction func searchType(_ sender: Any) {
        guard let searchView = UINib(nibName: "SearchView", bundle: nil).instantiate(withOwner: self, options: nil)[0] as? SearchView else { return  }
        searchView.delegate = self
        isShowFav = false
        favButtom.setImage(UIImage(systemName: "star"), for: .normal)
        self.view.addSubview(searchView)
    }
    
    @IBAction func favTapped(_ sender: Any) {
        if isShowFav {
            isShowFav = false
            favButtom.setImage(UIImage(systemName: "star"), for: .normal)
            presenter.getFirstChracterPage()
        } else {
            isShowFav = true
            favButtom.setImage(UIImage(systemName: "star.fill"), for: .normal)
            presenter.showFav()
        }
        
    }
}

extension MainListVC: SearchViewDelegate {
    func addFilter(filters: [FilterModel]) {
        presenter.addfiletrs(filters: filters)
    }
    
    
}

extension MainListVC: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        presenter.getCharactersCoutn()
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
      
        var cell = UICollectionViewCell()
        cell = mainListCollectionView.dequeueReusableCell(withReuseIdentifier: MainListCell.identifier, for: indexPath)
     
        if let listCell = cell as? MainListCell,
           let character = presenter.getCharacter(atIndex: indexPath.row){
            listCell.configureCell(character: character)
        }
        return cell
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        presenter.getNewCharacterPage()
    }
    
    func scrollViewWillBeginDragging(_ scrollView: UIScrollView) {
    }

}

extension MainListVC: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        presenter?.characterSelected(atIndex: indexPath.row)
    }
}

extension MainListVC: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let leftAndRightPaddings: CGFloat = 10
        let numberOfItemsPerRow: CGFloat = 2.0
    
        let width = (collectionView.frame.width - leftAndRightPaddings) / numberOfItemsPerRow
        return CGSize(width: width, height: width)
    }
}

