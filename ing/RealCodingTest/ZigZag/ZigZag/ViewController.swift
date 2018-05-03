//
//  ViewController.swift
//  ZigZag
//
//  Created by sungnni on 2018. 5. 3..
//  Copyright © 2018년 ohteam. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    @IBAction private func firstBtnAction() {
        let nextVC = FirstProblem()
        self.present(nextVC, animated: false, completion: nil)
    }
    
    @IBAction private func secondBtnAction() {
        let nextVC = SecondProblem()
        self.present(nextVC, animated: false, completion: nil)
    }
    
    @IBAction private func thirdBtnAction() {
        let nextVC = ThirdProblem()
        self.present(nextVC, animated: false, completion: nil)
    }

}

