//
//  SelfSizeCollectionView.swift
//  IOS12Sample
//
//  Created by Chethan on 10/04/19.
//  Copyright © 2019 Chethan. All rights reserved.
//

import UIKit

class SelfSizeCollectionView: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let flowLayout = collectionView.collectionViewLayout as? UICollectionViewFlowLayout {
            let w = collectionView.frame.width
            flowLayout.estimatedItemSize = CGSize(width: w, height: 20)
        }
    }
}

extension SelfSizeCollectionView : UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "\(SelfSizeCollectionViewCell.self)", for: indexPath) as? SelfSizeCollectionViewCell
        cell?.cellLabel.text = "fffggf gfgfg gfgfgf gfgf gf gf gf gf gg fg g g fg fg fg g fg fg fg fg f gf gfg fg fg fg ff  f ff g f ff f f "
        return cell ?? UICollectionViewCell()
    }
}
