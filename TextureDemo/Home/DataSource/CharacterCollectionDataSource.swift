//
//  CharacterCollectionDataSource.swift
//  TextureDemo
//
//  Created by Philip Martin on 23/10/2019.
//  Copyright © 2019 Philip Martin. All rights reserved.
//

import Foundation
import AsyncDisplayKit
import RxSwift

class CharacterCollectionDataSource: NSObject, ASCollectionDataSource{
    var character: [Character]?
    weak  var presenter: HomeViewPresentation?
    let disposeBag = DisposeBag()
    func fetchData(){
        let request = RequestHandler().getAllCharacters()
        let subscriber = JSONDecoder().decoderWithURLString([Character].self, fromURL: request)
        subscriber.subscribe(onNext: { (characters) in
            self.character = characters
        }, onError: { (error) in
            // present aler
        }, onCompleted: {
            DispatchQueue.main.async {
                self.presenter?.collectionView.reloadData()
            }
        }, onDisposed: {
            
            })
        
    }
    
    //MARK:- Datasource
    func collectionNode(_ collectionNode: ASCollectionNode, numberOfItemsInSection section: Int) -> Int {
        return character?.count ?? 0
    }
    
    func numberOfSections(in collectionNode: ASCollectionNode) -> Int {
        return 1
    }
    
    func collectionNode(_ collectionNode: ASCollectionNode, nodeBlockForItemAt indexPath: IndexPath) -> ASCellNodeBlock {
        let cellNodeBlock = { [weak self] () -> ASCellNode in
            let singleCharacter = self?.character?[indexPath.item]
            let cellNode = CharacterCell(character: singleCharacter)
            return cellNode
        }
        return cellNodeBlock
    }

    
}
