//
//  ViewController.swift
//  TextureDemo
//
//  Created by Phil Martin on 22/10/2019.
//  Copyright © 2019 Phil Martin. All rights reserved.
//

import UIKit
import AsyncDisplayKit

class ViewController: ASViewController<ASDisplayNode>{
    
    var homeNode: HomeViewPresentation!
    
    init() {
        super.init(node: ASDisplayNode())
        homeNode = HomeViewPresentation()
        self.node.addSubnode(homeNode)
        node.layoutSpecBlock = { (node, constrainedSize) in
            return ASInsetLayoutSpec(insets: UIEdgeInsets.zero, child: self.homeNode)
        }
    }

    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

