//
//  ViewController.swift
//  collection 1.0
//
//  Created by Harsha R Mundaragi on 18/11/22.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var collectinView: UICollectionView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: 80, height: 80)
        collectinView.collectionViewLayout = layout
        
        collectinView.register(MyCollectionViewCell.nib(), forCellWithReuseIdentifier: MyCollectionViewCell.indentifier)
        
        collectinView.delegate = self
        collectinView.dataSource = self
        // Do any additional setup after loading the view.
    }


}

extension ViewController: UICollectionViewDelegate{
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        collectionView.deselectItem(at: indexPath, animated: true)
        print("Hi")
    }
}

extension ViewController: UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 100
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MyCollectionViewCell.indentifier, for: indexPath) as! MyCollectionViewCell
        
        cell.configure(with: #imageLiteral(resourceName: "1318341815.0"))
        return cell
    }
    
    
    
    
}



extension ViewController: UICollectionViewDelegateFlowLayout{
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 80, height: 80)
    }
}

