//
//  SharedDesignToolController.swift
//  DesignWebTool
//
//  Created by Subhra Roy on 09/12/21.
//

import Foundation
import UIKit

public final class SharedDesignToolController: DesignWebToolViewController{
        
    public override init(nibName nibNameOrNil: String? = nil, bundle nibBundleOrNil: Bundle? = nil) {
        super.init(nibName: Nib.DesignNibFile, bundle: Bundle.main)
    }
    
    public override func set( model: WebToolModel,
                     delegate: NavigationProtocol?){
        super.set(model: model, delegate: delegate)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    /*required init?(coder: NSCoder,
                   model: WebToolModel,
                   delegate: NavigationProtocol?) {
        super.init(coder: coder)
        self.model = model
        self.navigationDelegate = delegate
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }*/
}
