//
//  ViewController.swift
//  SlideshowApp
//
//  Created by セロラー on 2017/11/16.
//  Copyright © 2017年 mikiya.tadano. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    //タイマー
    var timer: Timer!
    
    @IBOutlet weak var go: UIButton! //進むボタン
    @IBOutlet weak var back: UIButton! //戻るボタン
    @IBOutlet weak var SP: UIButton! //再生/停止ボタン
    
    @IBAction func unwind(_ segue: UIStoryboardSegue){
        //遷移元へ戻る
    }
    @IBOutlet weak var imageView: UIImageView!
    
    //表示する画像No.
    var imageNo:Int = 1
    //画像
    var image = UIImage(named: "1.jpg")
    
    //タイマーで呼び出される関数
    func slide(timer: Timer) {
        if imageNo == 5 {
            imageNo = 1
        }else{
            imageNo += 1
        }
        image = UIImage(named: "\(imageNo).jpg")
        imageView.image = image
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        imageNo = 1
        image = UIImage(named: "\(imageNo).jpg")
        imageView.image = image
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?){
        //segueから遷移先のSecondViewControllerを取得する
        let secondViewController:SecondViewController = segue.destination as! SecondViewController
        secondViewController.x = imageNo
    }
    
    @IBAction func back(_ sender: Any) {
        //戻るボタンをタップした時の処理
        if imageNo == 1 {
            imageNo = 5
        }else{
            imageNo -= 1
        }
        image = UIImage(named: "\(imageNo).jpg")
        imageView.image = image
    }
    @IBAction func go(_ sender: Any) {
        //進むボタンをタップした時の処理
        if imageNo == 5 {
            imageNo = 1
        }else{
            imageNo += 1
        }
        image = UIImage(named: "\(imageNo).jpg")
        imageView.image = image
    }
    
    @IBAction func SP(_ sender: Any) {
        //再生/停止ボタンを押した時の処理
        if self.timer == nil { //タイマーが動いていないときに処理する
            self.timer = Timer.scheduledTimer(timeInterval: 2, target: self, selector: #selector(slide), userInfo: nil, repeats: true)
            
            go.isEnabled = false //進むボタンの無効化
            back.isEnabled = false //戻るボタンの無効化
            SP.setTitle("停止", for: .normal)
        }else{
            self.timer.invalidate() //現在のタイマーを破棄する
            self.timer = nil //タイマーの有無を判断するためnilとする
            go.isEnabled = true //進むボタンの有効化
            back.isEnabled = true //戻るボタンの有効化
            SP.setTitle("再生", for: .normal)
        }
    }
    
    @IBAction func tapimage(_ sender: Any) {
        //画像をタップした時の処理
        performSegue(withIdentifier: "second", sender: nil)
        if self.timer != nil { //タイマーが動いているときに画面遷移させた時にタイマーを止める
            self.timer.invalidate() //現在のタイマーを破棄する
            self.timer = nil //タイマーの有無を判断するためnilとする
            go.isEnabled = true //進むボタンの有効化
            back.isEnabled = true //戻るボタンの有効化
            SP.setTitle("再生", for: .normal)
        }
    }


}

