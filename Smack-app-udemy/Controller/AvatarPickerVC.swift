//
//  AvatarPickerVC.swift
//  Smack-app-udemy
//
//  Created by Роман Мисников on 16.04.2018.
//  Copyright © 2018 Роман Мисников. All rights reserved.
//

import UIKit

class AvatarPickerVC: UIViewController {
    
    // variables
    public var avatarStyle = AvatarType.dark

    // outlets
    @IBOutlet weak var segmentedControl: CustomSegmentedControl!
    @IBOutlet weak var avatarCollectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        avatarCollectionView.delegate = self
        avatarCollectionView.dataSource = self
    }
    
    // change BG color of icons
    @IBAction func selectAvatarType(_ sender: CustomSegmentedControl) {
        switch sender.selectedSegmentIndex {
        case 0:
            print("Dark icons selected")
            avatarStyle = .dark
            avatarCollectionView.reloadData()
        case 1:
            print("Light icons selected")
            avatarStyle = .light
            avatarCollectionView.reloadData()
        default:
            print("There is extra button in segmented control")
        }
    }
    
    // go to previous screen
    @IBAction func backBtnPressed(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
}

// extension to properly use Collection View
extension AvatarPickerVC: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    // * UICollectionViewFlowLayout позволяет получить доступ к таким методам как:
    //  sizeForItemAt indexPath, insetForSectionAt section, minimumLineSpacingForSectionAt section, minimumInteritemSpacingForSectionAt section, referenceSizeForHeaderInSection section, referenceSizeForFooterInSection section
    
    // set number of elements in collection view
    public func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 28
    }
    
    // numbers of sections in collection view
    public func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    // configure each cell in collecton view
    public func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: AVATAR_CELL, for: indexPath) as! AvatarCell
        
        cell.configureCell(index: indexPath.item, type: avatarStyle)
        
        return cell
    }
    
    
}
