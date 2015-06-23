//
//  a.swift
//  MorningTimer
//
//  Created by yuki takei on 2015/06/18.
//  Copyright (c) 2015年 yuki takei. All rights reserved.
//

import UIKit
import AVFoundation

class AlermViewController: UIViewController ,AVAudioPlayerDelegate{

    var appDelegate:AppDelegate = UIApplication.sharedApplication().delegate as! AppDelegate //AppDelegateのインスタンスを取得
    var timer:NSTimer!
    var audioPlayer:AVAudioPlayer!

    

    @IBOutlet var TimeLabelA:UILabel!
    @IBOutlet var CountLabelA:UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    
        var topColor = appDelegate.colorchanger()
        var bottomColor = appDelegate.colorchanger()
        //UIColor(red: 0.0, green: 0.7, blue: 1.0, alpha: 1.0)
        //appDelegate.UIColorFromRGB(0x007fff)
        
        //グラデーションの色を配列で管理
        var gradientColors: [CGColor] = [topColor.CGColor, bottomColor.CGColor]
        //グラデーションレイヤーを作成
        var gradientLayer: CAGradientLayer = CAGradientLayer()
        //グラデーションの色をレイヤーに割り当てる
        gradientLayer.colors = gradientColors
        //グラデーションレイヤーをスクリーンサイズにする
        gradientLayer.frame = self.view.bounds
        //グラデーションレイヤーをビューの一番下に配置
        self.view.layer.insertSublayer(gradientLayer, atIndex: 0)
        
        
        timer=NSTimer.scheduledTimerWithTimeInterval(1.0,target: self,
            selector: Selector("update"),
            userInfo: nil,
            repeats: true)
        
        let soundFilePath : NSString = NSBundle.mainBundle().pathForResource("School Bell Ringing", ofType: "mp3")!
        let fileURL : NSURL = NSURL(fileURLWithPath: soundFilePath as String)!
        
        var soundCount:Int=30
        
        //AVAudioPlayerのインスタンス化
        audioPlayer = AVAudioPlayer(contentsOfURL: fileURL, error: nil)
        
        audioPlayer.numberOfLoops = soundCount
        audioPlayer.play()
        audioPlayer.volume = 1.0

        let alert = UIAlertView()
        alert.title = "起床時間!"
        alert.message = "おはようございます。起床時間です"
        alert.addButtonWithTitle("OK")
        alert.show()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    func update(){
        TimeLabelA.text = appDelegate.time();
        CountLabelA.text = appDelegate.countDown();
        
//
//        if(appDelegate.hour==appDelegate.WakeUpTime[0]){
//            if(appDelegate.minute==appDelegate.WakeUpTime[1]){
//                if appDelegate.flag==
//                //appDelegate.flag=1
//                timer.invalidate()
//                self.dismissViewControllerAnimated(true, completion: nil)
//                
//            }
//        }
    }
    
    @IBAction func WakeUpButton() {
        audioPlayer.stop()
        //timerを破棄する.
        timer.invalidate();
    }

    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}