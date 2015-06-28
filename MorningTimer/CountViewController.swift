//
//  CountViewController.swift
//  MorningTimer
//
//  Created by yuki takei on 2015/06/22.
//  Copyright (c) 2015年 yuki takei. All rights reserved.
//

import UIKit
import AVFoundation

class CountViewController: UIViewController,AVAudioPlayerDelegate {

    var appDelegate:AppDelegate = UIApplication.sharedApplication().delegate as! AppDelegate //AppDelegateのインスタンスを取得
    var timer:NSTimer!
    var audioPlayerC:AVAudioPlayer!
    var count:Int=0;
    var soundFlag:Int=0;

    @IBOutlet var TimeLabelC:UILabel!
    @IBOutlet var CountLabelC:UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
//        let infoViewController: InformationViewController = self.storyboard?.instantiateViewControllerWithIdentifier("infoVC") as! InformationViewController
//        // アニメーションを設定する.
//        //secondViewController.modalTransitionStyle = UIModalTransitionStyle.PartialCurl
//        // 値渡ししたい時 hoge -> piyo
//        //secondViewController.piyo = self.hoge
//        // Viewの移動する.
//        self.presentViewController(infoViewController, animated: true, completion: nil)
//        

        
        timer=NSTimer.scheduledTimerWithTimeInterval(1.0,target: self,
            selector: Selector("update"),
            userInfo: nil,
            repeats: true)
        
        var soundFilePath : NSString = NSBundle.mainBundle().pathForResource("Forest", ofType: "mp3")!
        var fileURL : NSURL = NSURL(fileURLWithPath: soundFilePath as String)!
        var soundCount:Int=0
        
        //AVAudioPlayerのインスタンス化
        audioPlayerC = AVAudioPlayer(contentsOfURL: fileURL, error: nil)
        
        audioPlayerC.numberOfLoops = soundCount
        audioPlayerC.play()
        audioPlayerC.volume = 1.0

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
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func update(){
        TimeLabelC.text = appDelegate.time();
        if appDelegate.countFlag == 0 {
            self.CountLabelC.text = self.appDelegate.countDown();
        }else{
            self.CountLabelC.text = self.appDelegate.countUp();
            self.CountLabelC.textColor = UIColor.redColor();
        }
        
        count++;
        if count==10 {
            audioPlayerC.stop();
        }
        if appDelegate.RemainingTime[1]==10{
            soundFlag=1
        }
        if soundFlag == 0 {
        if appDelegate.RemainingTime[1] % 5 == 0 {
            if appDelegate.RemainingTime[2] == 0 {
                
                audioPlayerC.play()
                audioPlayerC.volume = 1.0
                
                count=0;
                
            }
        }
        }else if soundFlag == 1 {
            if appDelegate.RemainingTime[1] % 2 == 0 {
                if appDelegate.RemainingTime[2] == 0 {
                    
                    var soundFilePath : NSString = NSBundle.mainBundle().pathForResource("アラーム", ofType: "mp3")!
                    var fileURL : NSURL = NSURL(fileURLWithPath: soundFilePath as String)!
                    var soundCount:Int=0
                    
                    //AVAudioPlayerのインスタンス化
                    audioPlayerC = AVAudioPlayer(contentsOfURL: fileURL, error: nil)
                    audioPlayerC.numberOfLoops = soundCount

                  
                        audioPlayerC.play()
                        audioPlayerC.volume = 1.0
                    
                    }
                }

            
        }
            
        
        
    }

    @IBAction func next(){
        audioPlayerC.stop()
        timer.invalidate();  //timerを破棄する.
        
    }
    
    @IBAction func weather(){
        
        let infoViewController: InformationViewController = self.storyboard?.instantiateViewControllerWithIdentifier("InfoVC") as! InformationViewController
        // アニメーションを設定する.
        //secondViewController.modalTransitionStyle = UIModalTransitionStyle.PartialCurl
        // 値渡ししたい時 hoge -> piyo
        //secondViewController.piyo = self.hoge
        // Viewの移動する.
        self.presentViewController(infoViewController, animated: true, completion: nil)
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
