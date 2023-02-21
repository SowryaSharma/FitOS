//
//  AppDelegate.swift
//  FitOS
//
//  Created by cumulations on 05/02/23.
//

import UIKit
import Firebase
import FirebaseAuth
import GoogleSignIn
import IQKeyboardManagerSwift
@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var navigationController:UINavigationController?
    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        FirebaseApp.configure()
        IQKeyboardManager.shared.enable = true
        if #available(iOS 13, *) {
         window?.overrideUserInterfaceStyle = .light
        }
        var isLoggedIn = false
        GIDSignIn.sharedInstance.restorePreviousSignIn { user, error in
            if error != nil || user == nil {
                print("Not signed in with google")
                isLoggedIn = false
            } else {
                print("signed in with google")
                isLoggedIn = true
            }
        }
        if Auth.auth().currentUser != nil {
            print(Auth.auth().currentUser)
            print("signed in")
            isLoggedIn = true
        }
        else{
            print("Not signed in")
            isLoggedIn = false
        }
        let userDefaults = UserDefaults.standard
        if userDefaults.value(forKey: "appFirstTimeOpend") == nil {
            //if app is first time opened then it will be nil
            userDefaults.setValue(true, forKey: "appFirstTimeOpend")
            // signOut from Auth
            do {
                try Auth.auth().signOut()
            }catch {
                
            }
        } else {
            
        }
        
        
//        if(isLoggedIn){
//            loadHomeViewController()
//        }
//        else{
//            LoadLoginScreen()
//        }
        return true
    }
    func LoadLoginScreen(){
        let main = UIStoryboard(name: "Main", bundle: nil)
        self.window?.rootViewController = main.instantiateViewController(withIdentifier: "LoginViewController") as! LoginViewController
        navigationController = self.window?.rootViewController as? UINavigationController
        self.window?.makeKeyAndVisible()
    }
    func loadHomeViewController(){
        let ChallengesStoryboard = UIStoryboard(name: "ChallengesStoryboard", bundle: nil)
        self.window?.rootViewController = ChallengesStoryboard.instantiateViewController(withIdentifier: "HomeViewController") as! HomeViewController
        navigationController = self.window?.rootViewController as? UINavigationController
        self.window?.makeKeyAndVisible()
    }
    func applicationDidBecomeActive(_ application: UIApplication) {
    }
    func application(_ application: UIApplication, open url: URL, sourceApplication: String?, annotation: Any) -> Bool {
        return GIDSignIn.sharedInstance.handle(url)
    }
    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }


}

