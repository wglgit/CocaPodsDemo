//
//  ViewController.swift
//  LearnSwift
//
//  Created by lq on 15/8/24.
//  Copyright (c) 2015年 lq. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var sayStr:String = "hello"
    
    let digitNames = [
        0: "Zero", 1: "One", 2: "Two", 3: "Three", 4: "Four", 5: "Five", 6: "Six", 7: "Seven", 8: "Eight", 9: "Nine"
    ]
    let numbers = [16, 58, 510]
    
    
    
    override func viewDidLoad() {
        let viewD = UIView()
        viewD.backgroundColor = UIColor.greenColor();
        viewD.frame = CGRectMake(0, 0, 200, 200)
        self.view .addSubview(viewD)
        super.viewDidLoad()
        printfSayHello("222")
        let bounds = minMaxValue([22,22])
        print("maxvalue is, \(bounds!.max) ,minvalue is \(bounds!.min)")
        someFunc(2, 2)
        let strings = numbers.map { (var number) -> String in var output = ""
        while number > 0 {
            output = self.digitNames[number % 10]! + output
            number /= 10
            }
            return output
        }
        
            
            
            
            
            // Do any additional setup after loading the view, typically from a nib.
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func sayHello(personName : String) -> String{
        let greatStr = "hello ," + personName + "!"
        return greatStr;
    }
    func minMaxValue(mainArray:[Int]) -> (min:Int,max:Int)?{
        if mainArray.isEmpty{
            return nil
        }
        var minValue = mainArray[0]
        var maxValue = mainArray[0]
        for value in mainArray[1..<mainArray.count]{
            if value < minValue
            {
                minValue = value;
            }
            if value > maxValue{
                maxValue = value;
            }
        }
        return (minValue , maxValue)
    }
    func printfSayHello(printV:String){
        print(sayHello("wgl"))
    }
    func someFunc(fist:Int,_ next:Int)->(){
    }
    func someValue(values:Double...){
        for value in values{
            
        }
    }

}

