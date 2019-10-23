//
//  HomeViewPresentation.swift
//  TextureDemo
//
//  Created by Phil Martin on 22/10/2019.
//  Copyright © 2019 Phil Martin. All rights reserved.
//

import UIKit
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
    
    func collectionNode(_ collectionNode: ASCollectionNode, nodeBlockForItemAt indexPath: IndexPath) -> ASCellNodeBlock {
        let cellNodeBlock = { () -> ASCellNode in
            let cellNode = CellNode()
            return cellNode
        }
        return cellNodeBlock
    }
}

class CellNode: ASCellNode{
    
    let label = ASTextNode()
    let image = ASImageNode()
    let label2 = ASTextNode()
    
    override init() {
        super.init()
        backgroundColor = .blue
        cornerRadius = 20
        style.flexShrink = 1.0
        style.flexGrow = 1.0
        image.style.preferredSize = CGSize(width: 100, height: 100)
        image.cornerRadius = 100/2
        label.attributedText = NSAttributedString(string: "My name is Slim Shady", attributes: [NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 30), NSAttributedString.Key.foregroundColor: UIColor.white])
        
        label2.attributedText = NSAttributedString(string: "Will you please stand up Mr Slim Shady", attributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 25), NSAttributedString.Key.foregroundColor: UIColor.white])
        image.backgroundColor = .yellow
        addSubnode(label)
        addSubnode(label2)
        addSubnode(image)
    }
    
    override func layoutSpecThatFits(_ constrainedSize: ASSizeRange) -> ASLayoutSpec {
        let nameLocationStack = ASStackLayoutSpec.vertical()
         nameLocationStack.style.flexShrink = 1.0
         nameLocationStack.style.flexGrow = 1.0
        nameLocationStack.spacing = 15
        nameLocationStack.children = [label, label2]
        let topStack = ASStackLayoutSpec(direction: .horizontal, spacing: 10, justifyContent: .start, alignItems: .stretch, children:  [image, nameLocationStack])
        
        return ASInsetLayoutSpec(insets: UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10), child: topStack)
    }
}
