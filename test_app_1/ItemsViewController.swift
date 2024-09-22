//
//  ItemsViewController.swift
//  test_app_1
//
//  Created by Bthloo on 22/09/2024.
//

import UIKit

class ItemsViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
       return itemsList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let collectionCell = collectionView.dequeueReusableCell(withReuseIdentifier: "itemCell", for: indexPath)
        return collectionCell
    }
    
    var itemsList = [Item]()
    
    
    @IBOutlet weak var itemsCollectionView: UICollectionView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        itemsCollectionView.delegate = self
        itemsCollectionView.dataSource = self
        
    }
    

}

struct Item{
    let name : String
    let image : UIImage
}
