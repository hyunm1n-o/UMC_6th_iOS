//
//  ProfileViewController.swift
//  UMC_study_2st_mission
//
//  Created by 오현민 on 5/24/24.
//

import UIKit

class ProfileViewController: UIViewController {
    // MARK: - Properties
    @IBOutlet weak var profileCollectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupCollectionView()
      
    }
    // MARK: - Actions
    
    // MARK: - Helpers
    private func setupCollectionView() {
        profileCollectionView.delegate = self
        profileCollectionView.dataSource = self
        
        profileCollectionView.register(
        UINib(nibName: "ProfileCollectionViewCell", bundle: nil),
        forCellWithReuseIdentifier: ProfileCollectionViewCell.identifier)
    }
}

extension ProfileViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ProfileCollectionViewCell.identifier, for: indexPath) as? ProfileCollectionViewCell else {
            fatalError("실패")
        }
        return cell
    }
}

extension ProfileViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(
            width: collectionView.frame.width, height: CGFloat(159))
    }
}
