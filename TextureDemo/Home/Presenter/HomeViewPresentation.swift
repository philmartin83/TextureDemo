//
//  HomeViewPresentation.swift
//  TextureDemo
//
//  Created by Phil Martin on 22/10/2019.
//  Copyright © 2019 Phil Martin. All rights reserved.
//

import Foundation
import AsyncDisplayKit

class HomeViewPresentation: ASDisplayNode, ASCollectionDataSource{
    
    var collectionView: ASCollectionNode = {
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.itemSize = CGSize(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.size.width)
        flowLayout.scrollDirection = .vertical
        flowLayout.minimumLineSpacing = 5.0
        let collection = ASCollectionNode(collectionViewLayout: flowLayout)
        collection.backgroundColor = .red
       
        return collection
    }()
    
    var text: ASTextNode {
        return ASTextNode()
    }
    
    override init() {
        super.init()
        collectionView.dataSource = self
        addSubnode(collectionView)
    }
        
    override func layoutSpecThatFits(_ constrainedSize: ASSizeRange) -> ASLayoutSpec {
        
        return ASInsetLayoutSpec(insets: UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0), child: collectionView)
    }
    
    //MARK:- Datasource
    func collectionNode(_ collectionNode: ASCollectionNode, numberOfItemsInSection section: Int) -> Int {
        return 20
    }
    
    func numberOfSections(in collectionNode: ASCollectionNode) -> Int {
        return 1
    }
    
    func collectionNode(_ collectionNode: ASCollectionNode, nodeForItemAt indexPath: IndexPath) -> ASCellNode {
        let cell = CellNode()
        cell.label.attributedText = NSAttributedString(string: "\(indexPath.section), \(indexPath.row)")
        return cell
    }
}

class CellNode: ASCellNode{
    
    let label = ASTextNode()
    
    override init() {
        super.init()
        backgroundColor = .blue
        cornerRadius = 20
        style.preferredSize = CGSize(width: 100, height: 100)
        addSubnode(label)
    }
    
    override func layoutSpecThatFits(_ constrainedSize: ASSizeRange) -> ASLayoutSpec {
        return ASInsetLayoutSpec(insets: UIEdgeInsets(top: 10, left: 10, bottom: 0, right: 10), child: label)
    }
}
