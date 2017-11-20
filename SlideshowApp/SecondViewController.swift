//
//  SecondViewController.swift
//  SlideshowApp
//
//  Created by セロラー on 2017/11/20.
//  Copyright © 2017年 mikiya.tadano. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {

    //イメージビュー
    @IBOutlet weak var imageView: UIImageView!
    
    var x:Int = 1 //遷移元から供給されるimageNo
    var image = UIImage(named: "1.jpg")
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        image = UIImage(named: "\(x).jpg")        
        imageView.image = image
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
