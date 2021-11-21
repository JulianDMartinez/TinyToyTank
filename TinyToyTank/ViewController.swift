//
//  ViewController.swift
//  TinyToyTank
//
//  Created by Julian Martinez on 11/21/21.
//

import UIKit
import RealityKit

class ViewController: UIViewController {
    
    var tankAnchor: TinyToyTank._TinyToyTank?
    
    @IBOutlet weak var arView: ARView!
    
    @IBOutlet weak var tankLeftButton   : UIButton!
    @IBOutlet weak var tankForwardButton: UIButton!
    @IBOutlet weak var tankRightButton  : UIButton!
    @IBOutlet weak var turretLeftButton : UIButton!
    @IBOutlet weak var cannonFireButton : UIButton!
    @IBOutlet weak var turretRightButton: UIButton!
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Load the "Box" scene from the "Experience" Reality File
        do {
            tankAnchor = try TinyToyTank.load_TinyToyTank()
            tankAnchor?.cannon?.setParent(tankAnchor?.tank, preservingWorldTransform: true)
        } catch {
            debugPrint("There was an error while attempting to access the tinty toytank scene.\nError: \(error)")
        }
        

        
        // Add the box anchor to the scene
        if let tankAnchor = tankAnchor {
            arView.scene.anchors.append(tankAnchor)
        }
    }
    
    
    @IBAction func tankRightPressed(_ sender: UIButton) {
        tankAnchor!.notifications.tankRight.post()
    }
    
    
    @IBAction func tankForwardPressed(_ sender: UIButton) {
        tankAnchor!.notifications.tankForward.post()
    }
    
    
    @IBAction func tankLeftPressed(_ sender: UIButton) {
        tankAnchor!.notifications.tankLeft.post()
    }
    
    
    @IBAction func turretLeftPressed(_ sender: UIButton) {
        tankAnchor!.notifications.turretLeft.post()
    }
    
    
    @IBAction func cannonFirePressed(_ sender: UIButton) {
        tankAnchor!.notifications.cannonFire.post()
    }
    
    
    @IBAction func turretRightPressed(_ sender: UIButton) {
        tankAnchor!.notifications.turretLeft.post()
    }
    
    
}
