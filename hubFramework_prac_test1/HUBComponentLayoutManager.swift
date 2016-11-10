//
//  HUBComponentLayoutManager.swift
//  hubFramework_prac_test1
//
//  Created by Anant on 10/25/16.
//  Copyright © 2016 Anant. All rights reserved.
//

import Foundation
import HubFramework

class HUBComponentLayoutManager1 : NSObject , HUBComponentLayoutManager{
    
    static var margin: CGFloat { return 15 }
    
    func marginBetweenComponent(withLayoutTraits layoutTraits: Set<HUBComponentLayoutTrait>, andContentEdge contentEdge: HUBComponentLayoutContentEdge) -> CGFloat {
        switch contentEdge {
        case .top, .bottom:
            return layoutTraits.contains(.stackable) ? 0 : HUBComponentLayoutManager1.margin
        case .left, .right:
            return layoutTraits.contains(.fullWidth) ? 0 : HUBComponentLayoutManager1.margin
        }
    }
    
    func verticalMarginBetweenComponent(withLayoutTraits layoutTraits: Set<HUBComponentLayoutTrait>, andHeaderComponentWithLayoutTraits headerLayoutTraits: Set<HUBComponentLayoutTrait>) -> CGFloat {
        return 0
    }
    
    func verticalMarginForComponent(withLayoutTraits layoutTraits: Set<HUBComponentLayoutTrait>, precedingComponentLayoutTraits: Set<HUBComponentLayoutTrait>) -> CGFloat {
        if layoutTraits.contains(.stackable) && precedingComponentLayoutTraits.contains(.stackable) {
            return 0
        }
        
        if layoutTraits.contains(.alwaysStackUpwards) {
            return 0
        }
        
        return HUBComponentLayoutManager1.margin
    }
    
    func horizontalMarginForComponent(withLayoutTraits layoutTraits: Set<HUBComponentLayoutTrait>, precedingComponentLayoutTraits: Set<HUBComponentLayoutTrait>) -> CGFloat {
        if layoutTraits.contains(.fullWidth) {
            return 0
        }
        
        return HUBComponentLayoutManager1.margin
    }
    
    func horizontalOffsetForComponents(withLayoutTraits componentsTraits: [Set<HUBComponentLayoutTrait>], firstComponentLeadingHorizontalOffset firstComponentLeadingOffsetX: CGFloat, lastComponentTrailingHorizontalOffset lastComponentTrailingOffsetX: CGFloat) -> CGFloat {
        return 0
    }

}
