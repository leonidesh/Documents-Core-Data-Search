//
//  TextEntryViewController.swift
//  DocumentsChallenge
//
//  Created by 刘洋 on 6/15/19.
//  Copyright © 2019 Yang Liu. All rights reserved.
//

import UIKit

class DocumentViewController: UIViewController {
    @IBOutlet weak var biaoti: UITextField!
    @IBOutlet weak var miaoshu: UITextField!
    
    var document: Document?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        guard let wenjian = document else {
            return
        }
        biaoti.text = wenjian.name
        
        if let data = FileManager.default.contents(atPath: wenjian.name) {
            miaoshu.text = String(data: data, encoding: .utf8) ?? ""
        }
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    @IBAction func huanming(_ sender: Any) {
        self.title = biaoti.text
    }
    
    @IBAction func baocun(_ sender: Any) {
        guard let wenjianming = biaoti.text,
              let wenjianmiaoshu = miaoshu.text
        else {
            return
        }
        FileManager.default.createFile(atPath: wenjianming, contents: wenjianmiaoshu.data(using: .utf8), attributes: nil); navigationController?.popViewController(animated: true)
    }
    
}



