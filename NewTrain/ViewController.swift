//
//  ViewController.swift
//  NewTrain
//
//  Created by Леонид Локтик on 05.09.2022.
//

import UIKit

class ViewController: UIViewController {
    
    var nextButton = UIButton()
    var newImageView = UIImageView()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "HALOOO"
        
        self.nextButton = UIButton(type: .system)
        self.nextButton.setTitle("Go through", for: .normal)
        nextButton.center = view.center
        //self.nextButton.sizeToFit()
        nextButton.addTarget(self, action: #selector(goThrough), for: .touchUpInside)
        self.view.addSubview(nextButton)
        
        newImageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 50, height: 50))
        if let image = UIImage(named: "apple") {
            newImageView.image = image
            newImageView.contentMode = .scaleAspectFit
            self.navigationItem.titleView = newImageView
        }
        
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector (goThrough))
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .camera, target: self, action: #selector (goThrough))
    }
    
    
    
    @objc func goThrough() {
        let vc2 = ViewController2()
        self.navigationController?.pushViewController(vc2, animated: true)
        
    }


}

