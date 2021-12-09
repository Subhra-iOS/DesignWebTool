//
//  ViewController.swift
//  DesignWebToolDemo
//
//  Created by Subhra Roy on 09/12/21.
//

import UIKit
import DesignWebTool

struct NavigationColor {
    static let navColor : UIColor = UIColor(red: (255.0/255.0), green: (23.0/255.0), blue: (77.0/255.0), alpha: 1.0)
}

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) { [weak self] in
            self?.openDesignTool()
        }
        
    }
    
    private func openDesignTool(){
        let shareDesignTool = SharedDesignToolController()
        shareDesignTool.set(model: WebToolModel(url: URL(string: "https://en.wikipedia.org/wiki/Code_coverage")!,  header: [:],
            param: [:],
            method: "get"),
            delegate: self,
            navigationColor: NavigationColor.navColor,
            navigationTextColor: .white)
        self.navigationController?.pushViewController(shareDesignTool, animated: true)
    }


}

extension ViewController: NavigationProtocol{
    func popViewController(on: Status, data: Data?) {
        
    }
    
    func didBackNavigation() {
        print("Back here")
    }
    
}

