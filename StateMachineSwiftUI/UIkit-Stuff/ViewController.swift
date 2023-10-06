//
//  ViewController.swift
//  StateMachineSwiftUI
//
//  Created by huse on 2/10/23.
//

import UIKit
import SwiftUI

class ViewController: UIViewController {
  
  let machineView: UIHostingController = UIHostingController(rootView: MachineViewHolder())
  
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view.
  }
  
  @IBAction func touchUpInsideStartButton(_ sender: UIButton) {
    debugPrint("Hello")
    machineView.modalPresentationStyle = .fullScreen
    machineView.rootView.resetMachine()
    present(machineView, animated: true)
  }
  



}

