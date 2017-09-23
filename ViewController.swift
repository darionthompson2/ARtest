//
//  ViewController.swift
//  ARtest
//
//  Created by Denise Green on 9/19/17.
//  Copyright © 2017 Darion Thompson. All rights reserved.
//

import UIKit
import SceneKit
import ARKit

class ViewController: UIViewController, ARSCNViewDelegate {

    @IBOutlet var sceneView: ARSCNView!
    
    override func viewDidLoad() {
        
        func greet()-> String {
            
            let pasteboardString: String? = UIPasteboard.general.string
            if let theString = pasteboardString{
                
                return theString 
                
            }
            return "broken"
        }
        super.viewDidLoad()
        // using a string as a 3D object.
        let ourText = SCNText(string: greet(), extrusionDepth: 1.0)
        
        //giving the text the red color
        let material = SCNMaterial()
        material.diffuse.contents = UIColor.red
        
        ourText.materials = [material]
        
       let node = SCNNode()
        node.geometry = ourText
        
        node.scale = SCNVector3(x: 0.01, y: 0.01, z: 0.01)
        node.position = SCNVector3(0,0.2, -0.1)
        
        sceneView.scene.rootNode.addChildNode(node)
        
        
        
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // Create a session configuration
        let configuration = ARWorldTrackingConfiguration()

        // Run the view's session
        sceneView.session.run(configuration)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        // Pause the view's session
        sceneView.session.pause()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Release any cached data, images, etc that aren't in use.
    }

    // MARK: - ARSCNViewDelegate
    
/*
    // Override to create and configure nodes for anchors added to the view's session.
    func renderer(_ renderer: SCNSceneRenderer, nodeFor anchor: ARAnchor) -> SCNNode? {
        let node = SCNNode()
     
        return node
    }
*/
    
    func session(_ session: ARSession, didFailWithError error: Error) {
        // Present an error message to the user
        
    }
    
    func sessionWasInterrupted(_ session: ARSession) {
        // Inform the user that the session has been interrupted, for example, by presenting an overlay
        
    }
    
    func sessionInterruptionEnded(_ session: ARSession) {
        // Reset tracking and/or remove existing anchors if consistent tracking is required
        
    }
}
