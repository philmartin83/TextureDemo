//
//  CharacterCell.swift
//  TextureDemo
//
//  Created by Phil Martin on 24/10/2019.
//  Copyright © 2019 Philip Martin. All rights reserved.
//

import UIKit
import AsyncDisplayKit
import SDWebImage

class CharacterCell: ASCellNode {
    let label = ASTextNode()
    let image = ASNetworkImageNode()
    let textUnderPhoto = ASTextNode()
    
    init(character: Character?) {
        super.init()
        guard let character = character else {return}
        style.flexShrink = 1.0
        style.flexGrow = 1.0
        backgroundColor = .white
        image.url = URL(string: character.img ?? "")
        image.isCropEnabled = false
        image.contentMode = .scaleAspectFill
        image.cropRect = CGRect(x: 0, y: 0, width: 0.0, height: 0.0);
        image.shouldCacheImage = true
        label.attributedText = NSAttributedString(string: character.name ?? "Null", attributes: [NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 23), NSAttributedString.Key.foregroundColor : UIColor.black])
        
        let text1 = NSMutableAttributedString(string: "Series Appeared In: ", attributes: [NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 16)])
        let text2 = NSAttributedString(string: "\(character.appearance ?? [])", attributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 16)])
        text1.append(text2)
        textUnderPhoto.attributedText = text1
        addSubnode(label)
        addSubnode(image)
        addSubnode(textUnderPhoto)
    }
    
    override func layoutSpecThatFits(_ constrainedSize: ASSizeRange) -> ASLayoutSpec {
        
        image.style.preferredSize = CGSize(width: constrainedSize.max.width - 20, height: 450)
        let seriesStack = ASStackLayoutSpec.horizontal()
        seriesStack.style.flexShrink = 1.0
        seriesStack.style.flexGrow = 1.0
        seriesStack.spacing = 5
        seriesStack.children = [textUnderPhoto]
        
        let nameLocationStack = ASStackLayoutSpec.vertical()
        nameLocationStack.style.flexShrink = 1.0
        nameLocationStack.style.flexGrow = 1.0
        nameLocationStack.spacing = 15
        nameLocationStack.children = [label, image, seriesStack]
        
        
        
        return ASInsetLayoutSpec(insets: UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10), child: nameLocationStack)
    }

}
