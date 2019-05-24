//
//  ViewController.swift
//  Kaigi10Baisoku
//
//  Created by ashi on 2018/05/26.
//  Copyright © 2018年 ashi. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var timerLabel: UILabel!
    @IBOutlet weak var passtimes: UILabel!

    var timer = Timer()
    var count:Int=0
    var money:Int=0
    var seconds:Int = 0
    var fractions:Int = 0
    var stopwatchString: String = ""
    var startStopWatch:Bool = false
    
   
    //　お試し
    // 秒単位のコスト＝月単価110万円、1月20営業日、1日8時間として算出。
    var cost:Int = 1100000 / 20 / 8 / 60
    // 会議の参加人数
    var number:Int = 12
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func Sbutton(_ sender: Any) {
        if startStopWatch == true{
            // timerが起動中なら一旦破棄する
            timer.invalidate()
            startStopWatch = false
            
            
        }
        else{
            timer = Timer.scheduledTimer(
                timeInterval: 1,
                target: self,
                selector: #selector(self.updateElapsedTime),
                userInfo: nil,
                repeats: true)
            startStopWatch = true
        }
    }
    
    @IBAction func Rbutton(_ sender: Any) {
        timer.invalidate()
        
        startStopWatch = false
        count=0
        money=0
        passtimes.text = "0秒"
        timerLabel.text = "0円"
    }
    @objc func updateElapsedTime() {
        count += 1
        let money: Int = count * cost * number
        
        let formatter = NumberFormatter()
        formatter.numberStyle = NumberFormatter.Style.decimal
        formatter.groupingSeparator = ","
        formatter.groupingSize = 3
        
        timerLabel.text=(formatter.string(from: money as NSNumber)!)+"円"
        
        passtimes.text = String(format:"%02d"+"秒",count)
    }
    
    
}

