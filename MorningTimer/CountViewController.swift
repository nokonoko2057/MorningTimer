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

    @IBOutlet var TimeLabelC:UILabel!
    @IBOutlet var CountLabelC:UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        timer=NSTimer.scheduledTimerWithTimeInterval(1.0,target: self,
            selector: Selector("update"),
            userInfo: nil,
            repeats: true)
        
        let soundFilePath : NSString = NSBundle.mainBundle().pathForResource("Forest", ofType: "mp3")!
        let fileURL : NSURL = NSURL(fileURLWithPath: soundFilePath as String)!
        var soundCount:Int=0
        
        //AVAudioPlayerのインスタンス化
        audioPlayerC = AVAudioPlayer(contentsOfURL: fileURL, error: nil)
        
        audioPlayerC.numberOfLoops = soundCount
        audioPlayerC.play()
        audioPlayerC.volume = 1.0

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func update(){
        TimeLabelC.text = appDelegate.time();
        CountLabelC.text = appDelegate.countDown();
        count++;
        if count==10 {
            audioPlayerC.stop();
        }
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
