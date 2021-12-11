//
//  DesignWebToolViewController.swift
//  DesignWebTool
//
//  Created by Subhra Roy on 09/12/21.
//

import UIKit
import WebKit

public class DesignWebToolViewController: UIViewController {
    
    private var webViewServiceDetails: WKWebView!
    weak var navigationDelegate: NavigationProtocol?
    private var viewModel: WebToolViewModel!
    private var model: WebToolModel!
    private var navigationBarColor: UIColor = .white
    private var navigationTextColor: UIColor = .black
    
    
    private var designTitle: String = "" {
        didSet{
            self.title = designTitle
        }
    }
    
    private func setupNavigationLeftButton(){
        self.navigationItem.leftBarButtonItem = FactoryController.creatLeftBarItem(for: self, title: "Back", tintColor: navigationTextColor)
        self.navigationItem.leftBarButtonItem?.isAccessibilityElement = true
        self.navigationItem.leftBarButtonItem?.accessibilityIdentifier = "Cancel_Button_Identifier"
        self.navigationItem.leftBarButtonItem?.tintColor = navigationTextColor
    }
    
    private func setNavigationBar(){
    
        UINavigationBar.appearance().barTintColor = navigationBarColor
        UINavigationBar.appearance().tintColor = navigationBarColor
        UINavigationBar.appearance().isTranslucent = false
        let textAttributes = [NSAttributedString.Key.foregroundColor:navigationTextColor]
        self.navigationController?.navigationBar.titleTextAttributes = textAttributes

        
    }
    
    func set( model: WebToolModel,
              delegate: NavigationProtocol?){
        self.model = model
        self.navigationDelegate = delegate
        self.navigationBarColor = model.uiModel.navBarColor
        self.navigationTextColor = model.uiModel.navBarTextColor
        self.designTitle = model.uiModel.navBarTitle
    }
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        self.setNavigationBar()
        self.setupNavigationLeftButton()
        //API Call
        self.viewModel = WebToolViewModel(apiModel: self.model)
        self.loadWebAPI()
    }
    
    public override func loadView() {
        webViewServiceDetails = FactoryController.creatWebKitView(for: self)
        view = webViewServiceDetails
    }
    
    public override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
    
    public override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        self.removeAllCacheCookies()
    }
    

    public override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        self.webViewServiceDetails.stopLoading()
        self.removeHTTPCockies()
        
        self.webViewServiceDetails.loadHTMLString("", baseURL: nil)
    }
    
    func loadWebAPI() {
        let concurrentQueue = DispatchQueue(label: "DesignQueue", attributes: .concurrent)
        concurrentQueue.sync {  [weak self] in
            guard let weakSelf = self else { return }
            let request = weakSelf.viewModel.httpRequest
            DispatchQueue.main.async {
                self?.webViewServiceDetails.load(request)
                DispatchQueue.main.asyncAfter(deadline: .now() + 4.0, execute: {
                    print("Load done")
                })
            }
        }
    }
    
    
}

extension DesignWebToolViewController: SRBarButtonItemProtocol{
    
    func didTapOnBarButtonActionWith(sender: Any, type: BarItemType) {
        
        switch type {
            case .leftBarItem:
                print("Tap on left btn")
                self.navigationController?.popViewController(animated: true)
                self.navigationDelegate?.didBackNavigation()
            default:
                break
        }
    }
}


extension DesignWebToolViewController: WKUIDelegate {
    
    public func webView(_ webView: WKWebView, createWebViewWith configuration: WKWebViewConfiguration, for navigationAction: WKNavigationAction, windowFeatures: WKWindowFeatures) -> WKWebView?{
        return self.webViewServiceDetails
    }
}

extension DesignWebToolViewController : WKNavigationDelegate , WKScriptMessageHandler{
    
    public func webView(_ webView: WKWebView, didFailProvisionalNavigation navigation: WKNavigation!, withError error: Error) {
        print(error.localizedDescription)
        webView.stopLoading()
        print("error Loading")
    }
    public func webView(_ webView: WKWebView, didStartProvisionalNavigation navigation: WKNavigation!) {
        print("Strat to load")
    }
    
    public func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        print("finish to load")
        webView.stopLoading()
    }
    
    public func webView(_ webView: WKWebView, didReceiveServerRedirectForProvisionalNavigation navigation: WKNavigation!){
        print("didReceiveServerRedirectForProvisionalNavigation")
    }
    
    public func webView(_ webView: WKWebView, decidePolicyFor navigationResponse: WKNavigationResponse, decisionHandler: @escaping (WKNavigationResponsePolicy) -> Void){
        
        print("navigationResponse")
        
        if let url = navigationResponse.response.url{
            let urlString = url.absoluteString
            print("\(urlString)")
        }
        decisionHandler(.allow)
    }
    
    public func userContentController(_ userContentController: WKUserContentController, didReceive message: WKScriptMessage) {
                
        print("Message received: \(message.name) with body: \(message.body)")
       /* guard let responseString: String = message.body as? String, let data: Data = responseString.data(using: .utf8)  else {
            self.dismiss(animated: true) {
            }
            return
        }*/
        
        self.navigationDelegate?.popViewController(on: .success, data: nil)
        
    }
    
}
