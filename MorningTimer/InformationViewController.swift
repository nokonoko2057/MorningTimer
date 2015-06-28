//
//  InformationViewController.swift
//  MorningTimer
//
//  Created by yuki takei on 2015/06/25.
//  Copyright (c) 2015年 yuki takei. All rights reserved.
//

import UIKit

class InformationViewController: UIViewController {
    
   var appDelegate:AppDelegate = UIApplication.sharedApplication().delegate as! AppDelegate //AppDelegateのインスタンスを取得
    // 取得するAPI
    let urlString =  "http://api.openweathermap.org/data/2.5/forecast/daily?q=Tokyo,jp&units=metric&cnt=1"
   var isInLoad = false            // ロード中かどうか

    
  //  @IBOutlet var label:UILabel!
    @IBOutlet var place:UILabel!
    @IBOutlet var tempMaxL:UILabel!
    @IBOutlet var tempMinL:UILabel!
    @IBOutlet var IconIV:UIImageView!
    
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
        
        WeatherData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func back(){
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    func WeatherData() {
        self.isInLoad = true
        var url = NSURL(string: self.urlString)!
        var task = NSURLSession.sharedSession().dataTaskWithURL(url, completionHandler: {data, response, error in
            // リソースの取得が終わると、ここに書いた処理が実行される
            var json = JSON(data: data)
         
            // 各セルに情報を突っ込む
            var i=0
           // var dt_txt = json["list"][i]["weather"][0]["dt_txt"]
            var weatherMain = json["list"][i]["weather"][0]["main"]
            var weatherDescription = json["list"][i]["weather"][0]["description"]
            var weatherIcon = json["list"][i]["weather"][0]["icon"]
            var tempMin = json["list"][0]["temp"]["min"]
            var tempMax = json["list"][0]["temp"]["max"]
            var cityName = json["city"]["name"]

            var iconName = "http://openweathermap.org/img/w/"+"\(weatherIcon)"+".png"
            var image0 = UIImage(named: iconName)
            
            var url = NSURL(string:iconName)
            var req = NSURLRequest(URL:url!)
            
            NSURLConnection.sendAsynchronousRequest(req, queue:NSOperationQueue.mainQueue()){(res, data, err) in
                var image = UIImage(data:data)
                // 画像に対する処理 (UcellのUIImageViewに表示する等)
                self.IconIV.image = image
                
            }

            //self.IconIV.image = image0

          
            var box:Double = atof("\(tempMax)")
            var box2:Int = Int(box)
            var tempMaxS:String = String(box2)
            var box3:Double = atof("\(tempMin)")
            var box4:Int = Int(box3)
            var tempMinS:String = String(box4)

            
            self.place.text = "\(cityName)"
            self.tempMaxL.text="\(tempMaxS)"
            self.tempMinL.text = "\(tempMinS)"
            
            var info = "\(weatherMain), \(weatherDescription),\(weatherIcon), \(tempMax),\(tempMin), \(cityName), "
            println("\(info),");
            // ロードが完了したので、falseに
            self.isInLoad = false
        })
        task.resume()
        
        // 読み込みが終わるまで待機
        while isInLoad {
            usleep(10)
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
