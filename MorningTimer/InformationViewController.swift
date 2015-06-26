//
//  InformationViewController.swift
//  MorningTimer
//
//  Created by yuki takei on 2015/06/25.
//  Copyright (c) 2015年 yuki takei. All rights reserved.
//

import UIKit

class InformationViewController: UIViewController {
    
   
    let sectionNum = 1      // セクションの数
    let cellNum = 10        // 1セクションあたりのセルの行数
    // 取得するAPI
    let urlString =  "api.openweathermap.org/data/2.5/forecast/daily?q=Tokyo,jp&units=metric&cnt=1"
    var cellItems = NSMutableArray()    // セルの中身
    var isInLoad = false            // ロード中かどうか
    var selectedRow: Int?       // 選択されたセルの列番号
    
    @IBOutlet var label:UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        makeTableData()
        label.text=self.cellItems[0] as? String
     //   println(self.cellItems[0] as! String)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    func makeTableData() {
        self.isInLoad = true
        var url = NSURL(string: self.urlString)!
        var task = NSURLSession.sharedSession().dataTaskWithURL(url, completionHandler: {data, response, error in
            // リソースの取得が終わると、ここに書いた処理が実行される
            var json = JSON(data: data)
         
            // 各セルに情報を突っ込む
          //  for var i = 0; i < self.cellNum; i++ {

            var i=0
           // var dt_txt = json["list"][i]["weather"][0]["dt_txt"]
//            var weatherMain = json["list"][i]["weather"][0]["main"]
            var weatherDescription = json["list"][i]["weather"][0]["description"]
//            var weatherDescription2 = json["list"][i]["weather"][0]["icon"]
//            var dt0 = json["list"][i]["dt"]
//            var temp = json["list"][i]["main"]["temp"]
//            
//            var tempMin = json["list"][0]["temp"]["min"]
            
            var xxx = json["message"]
//            var tempMax = json["main"]["temp_max"]
//
            println("\(xxx),");
            var info = "\(xxx), \(weatherDescription), "
                self.cellItems[i] = info
           // }
            // ロードが完了したので、falseに
            self.isInLoad = false
        })
        task.resume()
        
        // 読み込みが終わるまで待機
        // (ゆる募)
        // 下の解決策以外に何か方法があればと。。。
        // jsonの取得に非同期通信を使ってるので、読み込むまで待ってからじゃないと
        // cellに値が入らない。同期通信使えって話もあるけど今後の拡張を考えてNSURLSession使ってます(^_^;)
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
