//
//  DesignWebToolTests.swift
//  DesignWebToolTests
//
//  Created by Subhra Roy on 11/12/21.
//

import XCTest
@testable import DesignWebTool

class DesignWebToolTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testCreateSharedViewController() throws {
        let webModel: WebToolModelStub = WebToolModelStub(
            url: URL(string: "https://en.wikipedia.org/wiki/Code_coverage")!,
            method: "get",
            uiModel: UIModelStub(navBarColor: UIColor.systemBackground,
                             navBarTextColor: UIColor.white,
                             dismissBtnText: "Back",
                             navBarTitle: "Design Tool"))
        
        XCTAssertEqual(webModel.uiModel.navBarTitle, "Design Tool")
    }
    
    func testNavigationToWebToolControllerAndLoadView(){
        let webModel: WebToolModelStub = WebToolModelStub(
            url: URL(string: "https://en.wikipedia.org/wiki/Code_coverage")!,
            method: "get",
            uiModel: UIModelStub(navBarColor: UIColor.systemBackground,
                             navBarTextColor: UIColor.white,
                             dismissBtnText: "Back",
                             navBarTitle: "Design Tool"))
        
        let sutController = TestableShareViewConroller(model: webModel, delegate: nil)
        let navigation = NavigationControllerStub()
        navigation.pushViewController(sutController, animated: false)
        sutController.loadViewIfNeeded()
        XCTAssertEqual(sutController.successOnLoad, true)
        sutController.beginAppearanceTransition(true, animated: false)
        XCTAssertEqual(sutController.successOnLoad, false)
        
    }

}

private class NavigationControllerStub: UINavigationController{
    private var presenetedViewController: UIViewController!
    
    override func pushViewController(_ viewController: UIViewController, animated: Bool) {
        presenetedViewController = viewController
    }

}

private class TestableShareViewConroller: SharedDesignToolController{
    
    var successOnLoad: Bool = false
    
    convenience init( model: WebToolModelStub,
                             delegate: NavigationProtocol?){
        self.init(nibName: nil, bundle: nil)
    }
    
    override func viewDidLoad() {
        successOnLoad = true
    }
    
    override func viewWillAppear(_ animated: Bool) {
        successOnLoad = false
    }
    
}

private class WebToolModelStub: WebToolModelProtocol{
    var selector: String?
    var url: URL
    var header: [String: String]?
    var param: [String: Any]?
    var method: String
    let uiModel: UIModelStub
    
    init(url: URL,
         header: [String: String]? = nil,
         param: [String: Any]? = nil,
         method: String,
         uiModel: UIModelStub = UIModelStub(navBarColor: UIColor.systemBackground, navBarTextColor: UIColor.secondarySystemBackground, dismissBtnText: "Back", navBarTitle: "Design Tool"),
         selector: String? = Constant.Handler.preview){
        self.url = url
        self.header = header
        self.param = param
        self.method = method
        self.uiModel = uiModel
        self.selector = selector
    }
}

private struct UIModelStub: UIModelProtocol{
    var navBarColor: UIColor
    var navBarTextColor: UIColor
    var dismissBtnText: String
    var navBarTitle: String
    
    init(navBarColor: UIColor,
         navBarTextColor: UIColor,
         dismissBtnText: String,
         navBarTitle: String){
        
        self.navBarColor = navBarColor
        self.navBarTextColor = navBarTextColor
        self.dismissBtnText = dismissBtnText
        self.navBarTitle = navBarTitle
    }
}
