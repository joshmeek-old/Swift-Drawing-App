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
    @IBOutlet weak var slider: UISlider!
    @IBOutlet weak var eraser: UIButton!
    
    var colors: [String] = ["Black", "Blue", "Green", "Red", "Yellow", "Orange"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.picker.hidden = true
        self.slider.hidden = true
        self.eraser.hidden = true
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
        hideEditor()
    }
    
    @IBAction func sliderValueChanged(slider: UISlider!) {
        //println(Int(slider.value * 100))
        drawView.lineWidth = CGFloat(slider.value * 100)
    }
    
    @IBAction func eraserTapped() {
        drawView.drawColor = UIColor.whiteColor()
        hideEditor()
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
        //var theDrawView = drawView as DrawView
        var colorSet: UIColor!
        
        switch color {
            case "Black":
                colorSet = UIColor.blackColor()
            case "Blue":
                colorSet = UIColor.blueColor()
            case "Green":
                colorSet = UIColor.greenColor()
            case "Red":
                colorSet = UIColor.redColor()
            case "Yellow":
                colorSet = UIColor.yellowColor()
            case "Orange":
                colorSet = UIColor.orangeColor()
            default:
                colorSet = UIColor.whiteColor()
        }
        
        hideEditor()
        
        drawView.drawColor = colorSet
    }
    
    func hideEditor() {
        picker.hidden = !picker.hidden
        slider.hidden = !slider.hidden
        eraser.hidden = !eraser.hidden
    }

}

