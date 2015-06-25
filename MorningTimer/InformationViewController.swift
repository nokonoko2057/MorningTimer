//
//  InformationViewController.swift
//  MorningTimer
//
//  Created by yuki takei on 2015/06/25.
//  Copyright (c) 2015年 yuki takei. All rights reserved.
//

import UIKit

class InformationViewController: UIViewController {

    // セクションの数
    let sectionNum = 1
    // 1セクションあたりのセルの行数
    let cellNum = 10
    // 取得するAPI
    let urlString = "http://api.openweathermap.org/data/2.5/weather?q=Tokyo,jp&units=metric"
    //"http://api.openweathermap.org/data/2.5/forecast?units=metric&q=Tokyo"

    // セルの中身
    var cellItems = NSMutableArray()
    // ロード中かどうか
    var isInLoad = false
    // 選択されたセルの列番号
    var selectedRow: Int?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
