//
//  ViewController.swift
//  AddFormTest


import UIKit

class ViewController: UIViewController, AFAdInlineDelegate {

    var adView: AFAdInline!
    override func viewDidLoad() {
        super.viewDidLoad()
        adView = AFAdInline(masterTagId: masterTagID(), presenting: self) 
        //adView.debugMode = true
        adView.areAditionalDimmensionsEnabled = true
        adView.frame = CGRect(x: (self.view.frame.size.width - self.adView.adSize.width) / 2, y: 300, width: self.adView.adSize.width, height: self.adView.adSize.height)
        self.view.addSubview(adView)
        adView.delegate = self
    }

    func adInlineWillShow(_ adInline: AFAdInline!) {
        print("Will show")
    }
    
    func adInlineWillHide(_ adInline: AFAdInline!) {
        print("Will hide")
    }
    
    func adInlineDidLoadAd(_ adInline: AFAdInline!) {
        print("Did load")
    }
    
    func adInlineDidFail(toLoadAd adInline: AFAdInline!, withError error: Error!) {
        print("Did fail")
    }
    override func viewDidAppear(_ animated: Bool) {
        DispatchQueue.main.asyncAfter(deadline: .now() + 3) { 
            self.adView.loadAd()
        }
    }

    func masterTagID() -> Int{
        return 142493 // adform sample app tag
    }

}

