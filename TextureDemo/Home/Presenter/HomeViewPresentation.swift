//
//  HomeViewPresentation.swift
//  TextureDemo
//
//  Created by Phil Martin on 22/10/2019.
//  Copyright © 2019 Phil Martin. All rights reserved.
//

import UIKit
import AsyncDisplayKit

class HomeViewPresentation: ASDisplayNode, ASCollectionDelegate{
    
    fileprivate var dataSource = CharacterCollectionDataSource()
    
    var collectionView: ASCollectionNode = {
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.itemSize = CGSize(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.size.width)
        flowLayout.scrollDirection = .vertical
        flowLayout.minimumLineSpacing = 15.0
        let collection = ASCollectionNode(collectionViewLayout: flowLayout)
        collection.backgroundColor = UIColor.colourStringWitHex(hexColour: "d3d3d3", withAlpha: 1)
        return collection
    }()
    
    override init() {
        super.init()
        dataSource.presenter = self
        dataSource.fetchData()
        collectionView.dataSource = dataSource
    
        collectionView.delegate = self
        addSubnode(collectionView)
    }
    
    override func layoutSpecThatFits(_ constrainedSize: ASSizeRange) -> ASLayoutSpec {
        
        return ASInsetLayoutSpec(insets: UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0), child: collectionView)
    }
    
    func collectionNode(_ collectionNode: ASCollectionNode, constrainedSizeForItemAt indexPath: IndexPath) -> ASSizeRange {
        let width = UIScreen.main.bounds.width
        return ASSizeRangeMake(CGSize(width: width, height: 0), CGSize(width: width, height: CGFloat.greatestFiniteMagnitude))
    }
    
    
    func collectionNode(_ collectionNode: ASCollectionNode, didSelectItemAt indexPath: IndexPath) {
        
    }

}


