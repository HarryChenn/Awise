//
//  ViewController.swift
//  Awise
//
//  Created by liu zhenke on 11/8/22.
//

import UIKit

class ViewController: UIViewController {
    private let imageView: UIImageView = {
        let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width:150,height:150))
        imageView.image = UIImage(named: "logo")
        return imageView
    }()


    override func viewDidLoad(){
        super.viewDidLoad()
        view.addSubview(imageView)
    }

    override func viewDidLayoutSubviews(){
        super.viewDidLayoutSubviews()
        imageView.center = view.center
        DispatchQueue.main.asyncAfter(deadline: .now() + 1, execute: {
            self.animate()
        })
    }
    
    private func animate(){
        UIView.animate(withDuration: 1, animations: {
            let size = self.view.frame.size.width * 3
            let diffX = size - self.view.frame.size.width
            let diffY = size - self.view.frame.size.width-size
            self.imageView.frame = CGRect(x: -(diffX)/2,
                                          y: -(diffY)/2,
                                          width:size,
                                          height:size
            )
        })
        
        UIView.animate(withDuration: 1.5, animations: {
            self.imageView.alpha = 0
            
        },completion: { done in
            if done{
                DispatchQueue.main.asyncAfter(deadline: .now()+0.3, execute: {
                    let ViewController = HomeViewController()
                    ViewController.modalTransitionStyle = .crossDissolve
                    ViewController.modalPresentationStyle = .fullScreen
                    self.present(ViewController, animated: true)
                    
                })
            }
                       })
        
       
        
    }
}

