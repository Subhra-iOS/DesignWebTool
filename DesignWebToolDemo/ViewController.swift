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
        self.title = "Home"
        let textAttributes = [NSAttributedString.Key.foregroundColor:UIColor.white]
        self.navigationController?.navigationBar.titleTextAttributes = textAttributes
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) { [weak self] in
            self?.openDesignTool()
        }
        
    }
    
    private func openDesignTool(){
        let shareDesignTool = SharedDesignToolController()
        shareDesignTool.set(model: WebToolModel(url: URL(string: "https://en.wikipedia.org/wiki/Code_coverage")!,
            method: "get",
            uiModel: UIModel(navBarColor: UIColor.systemBackground, navBarTextColor: UIColor.white, dismissBtnText: "Back", navBarTitle: "Design Tool")),
            delegate: self)
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

