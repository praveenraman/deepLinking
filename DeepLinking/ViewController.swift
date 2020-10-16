//
//  ViewController.swift
//  DeepLinking
//
//  Created by Praveen Raman on 10/15/20.
//
import StoreKit
import UIKit

class ViewController: UIViewController {
    let application = UIApplication.shared
    @IBOutlet weak var passMessageText: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //
        let footer = UIView(frame: CGRect(x: 0, y: view.frame.size.height - 150, width: view.frame.size.width, height: 40))
        view.addSubview(footer)
        let size = (view.frame.size.width-80)/3
        for x in 0..<3{
            let button = UIButton(frame: CGRect(x: CGFloat(x) * size + (CGFloat(x) + 1 * 40), y: 0, width: size, height: size))
            button.layer.cornerRadius = 10.0
            button.contentMode = .scaleToFill
            button.tag = x+1
            button.setBackgroundImage(UIImage(named: "easemytrip\(x+1)"), for: .normal)
            footer.addSubview(button)
            button.addTarget(self, action: #selector(didTapButton(_:)), for: .touchUpInside)
        }
    }
    
    @objc private func didTapButton(_ sender: UIButton){
        let tag = sender.tag
        if tag == 1{
            // open easemytrip app
            guard let url =  URL(string: "SQLiteExample://") else {
                return
            }
            if application.canOpenURL(url)
            {
                application.open(url, options: [:], completionHandler: nil)
                
            }else{
                let vc = SKStoreProductViewController()
                vc.loadProduct(withParameters: [SKStoreProductParameterITunesItemIdentifier: NSNumber(value: 1053030595)], completionBlock: nil)
                present(vc, animated: true, completion: nil)
            }

        }else if tag == 2{
            // open BEC app
            let message = passMessageText.text?.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)
            
            guard let url =  URL(string: "SQLiteExample://secretPage?message=\(message ?? "")") else {
                return
            }
            if application.canOpenURL(url)
            {
                application.open(url, options: [:], completionHandler: nil)
                
            }else{
                let vc = SKStoreProductViewController()
                vc.loadProduct(withParameters: [SKStoreProductParameterITunesItemIdentifier: NSNumber(value: 1533512740)], completionBlock: nil)
                present(vc, animated: true, completion: nil)
            }
        }else if tag == 3{
            // open easemytrip app
            guard let url =  URL(string: "SQLiteExample://") else {
                return
            }
            if application.canOpenURL(url)
            {
                application.open(url, options: [:], completionHandler: nil)
                
            }else{
                let vc = SKStoreProductViewController()
                vc.loadProduct(withParameters: [SKStoreProductParameterITunesItemIdentifier: NSNumber(value: 1053030595)], completionBlock: nil)
                present(vc, animated: true, completion: nil)
            }
        }
    }
}

