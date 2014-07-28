//
//  ViewController.swift
//  TheDraw
//
//  Created by Josh Meek on 7/24/14.
//  Copyright (c) 2014 josmek. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDelegate {
    
    @IBOutlet weak var drawView: DrawView!
    @IBOutlet weak var picker: UIPickerView!
    
    var colors: [String] = ["Black", "Blue", "Green", "Red", "Yellow", "Orange"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.picker.hidden = true
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func clearTapped() {
        var theDrawView = drawView as DrawView
        theDrawView.lines = []
        theDrawView.setNeedsDisplay()
    }
    
    @IBAction func colorTapped(button: UIButton!) {
        picker.hidden = !picker.hidden
    }
    
    func numberOfComponentsInPickerView(pickerView: UIPickerView!) -> Int {
        return 1
    }
    
    func pickerView(pickerView: UIPickerView!, numberOfRowsInComponent component: Int) -> Int {
        return colors.count
    }
    
    func pickerView(pickerView: UIPickerView!, titleForRow row: Int, forComponent component: Int) -> String {
        return colors[row]
    }
    
    func pickerView(pickerView: UIPickerView!, didSelectRow row: Int, inComponent component: Int) {
        var selection = colors[row]
        colorSelection(selection)
    }
    
    func colorSelection(color: String) {
        var theDrawView = drawView as DrawView
        var colorSet: UIColor!
        
        switch color {
            case "Black":
                colorSet = UIColor.blackColor()
                picker.hidden = !picker.hidden
            case "Blue":
                colorSet = UIColor.blueColor()
                picker.hidden = !picker.hidden
            case "Green":
                colorSet = UIColor.greenColor()
                picker.hidden = !picker.hidden
            case "Red":
                colorSet = UIColor.redColor()
                picker.hidden = !picker.hidden
            case "Yellow":
                colorSet = UIColor.yellowColor()
                picker.hidden = !picker.hidden
            case "Orange":
                colorSet = UIColor.orangeColor()
                picker.hidden = !picker.hidden
            default:
                colorSet = UIColor.whiteColor()
                picker.hidden = !picker.hidden
        }
        
        theDrawView.drawColor = colorSet
    }

}

