//
//  ViewController.swift
//  FitOS
//
//  Created by cumulations on 05/02/23.
//

import UIKit
import CryptoKit
import AuthenticationServices
import FirebaseAuth
import GoogleSignIn
import Firebase
class LoginViewController: UIViewController, UITextViewDelegate, ASAuthorizationControllerPresentationContextProviding {
    func presentationAnchor(for controller: ASAuthorizationController) -> ASPresentationAnchor {
        ASPresentationAnchor()
    }
    
    
    @IBOutlet weak var Andabel: UILabel!
    @IBOutlet weak var tcapolicybutton: UIButton!
    @IBOutlet weak var tacbutton1: UIButton!
    @IBOutlet weak var tacstackview: UIView!
    @IBOutlet weak var taclabel1: UILabel!
    @IBOutlet weak var termsandconditionsview: UIView!
    @IBOutlet weak var HeaderInsideView: UIView!
    @IBOutlet weak var DescriptionLabel: UILabel!
    @IBOutlet weak var LogoImageview: UIImageView!
    @IBOutlet weak var topView: UIView!
    @IBOutlet weak var StraightLineLeftView: UIView!
    @IBOutlet weak var StraightlineRightView: UIView!
    @IBOutlet weak var OrLabel: UILabel!
    @IBOutlet weak var BottomStackview: UIView!
    @IBOutlet weak var LogInWithGoogle: UIButton!
    @IBOutlet weak var LoginWithApple: UIButton!
    @IBOutlet weak var LogginwithEmail: UIButton!
    fileprivate var currentNonce: String?
    var isLoggedIn:Bool = false
    var tokenString:String?
    override func viewDidLoad() {
        super.viewDidLoad()
        try! Auth.auth().signOut()
        setUI()
        setLayouts()
    }
    override func viewWillAppear(_ animated: Bool) {
        handleLogin()
    }
    override func viewDidAppear(_ animated: Bool) {
    }
    func handleLogin(){
        GIDSignIn.sharedInstance.restorePreviousSignIn { user, error in
            if error != nil || user == nil {
                print("Not signed in with google")
            } else {
                print("signed in with google")
                self.isLoggedIn = true
            }
        }
        if Auth.auth().currentUser != nil {
            print(Auth.auth().currentUser)
            print("signed in")
            self.isLoggedIn = true
        }
        else{
            print("Not signed in")
        }
        

        if(isLoggedIn){
            PushToHome()
        }
    }
    func PushToHome(){
        let ChallengesStoryboard = UIStoryboard(name: "ChallengesStoryboard", bundle: nil)
        let vc = ChallengesStoryboard.instantiateViewController(withIdentifier: "HomeViewController") as! HomeViewController
        self.navigationController?.pushViewController(vc, animated: true)
    }
    func setUI() {
        guard let backgroundImage = UIImage(named: "BG")?.cgImage else{
            return
        }
        self.view.layer.contents = backgroundImage
        self.view.layer.contentsGravity = CALayerContentsGravity.resize
        //        self.view.backgroundColor = UIColor(patternImage: backgroundImage)
        LogInWithGoogle.backgroundColor = .white
        LogInWithGoogle.layer.cornerRadius = 7
        LogInWithGoogle.setImage(UIImage(named: "google_ic"), for: .normal)
        LoginWithApple.titleLabel?.font = UIFont(name: "Inter-Black", size:17)
        LogInWithGoogle.setTitle(constants.LoginWithGoogleTitle, for: .normal)
        LogInWithGoogle.setTitleColor(UIColor.black, for: .normal)
        LoginWithApple.backgroundColor = .white
        LoginWithApple.layer.cornerRadius = 7
        LoginWithApple.setImage(UIImage(named: "Apple"), for: .normal)
        LoginWithApple.setTitle(constants.LoginWithAppleTitle, for: .normal)
        LoginWithApple.setTitleColor(UIColor.black, for: .normal)
        LogginwithEmail.layer.cornerRadius = 7
        LogginwithEmail.backgroundColor = .white
        LogginwithEmail.setTitleColor(UIColor.black, for: .normal)
        LogginwithEmail.setImage(UIImage(named: "mail"), for: .normal)
        LogginwithEmail.setTitle(constants.LoginWithEmailTitle, for: .normal)
        OrLabel.text = "or continue with"
        //        OrLabel.font = UIFont(name: "Inter-Black",size: 1)
        OrLabel.backgroundColor = UIColor.clear
        OrLabel.textColor = .white
        topView.backgroundColor = UIColor.clear
        BottomStackview.backgroundColor = .clear
        HeaderInsideView.backgroundColor = UIColor.clear
        guard let logoImage = UIImage(named: "FitOS logo") else {
            return
        }
        taclabel1.textColor = .white
        LogoImageview.image = logoImage
        DescriptionLabel.text = constants.appTitleDescriptionLoginScreen
        DescriptionLabel.textColor = .white
        termsandconditionsview.backgroundColor = .clear
        Andabel.textColor = .white
        Andabel.text = " and"
        tacbutton1.titleLabel?.font = UIFont(name: "Inter-Black", size: 10)
        tacbutton1.titleLabel?.textColor = UIColor.blend(color1: UIColor(red: 103, green: 27, blue: 224, alpha: 1.0), color2: UIColor(red: 255, green: 97, blue: 220, alpha: 1.0))
    }
    func setLayouts(){
        let margins = view.layoutMarginsGuide
        let heightOfSuperview = self.view.bounds.height
        NSLayoutConstraint.activate([
        ])
    }
    //MARK:- Log in actions
    @IBAction func ActionButtonLoginGoogle(_ sender: Any){
        AuthenticationHandler.Shared.SignInWithGoogle(Controller: self) { Results,status in
            if(status){
                let accessToken = GIDSignIn.sharedInstance.currentUser!.accessToken.tokenString
                guard let tokenString = Results else{return}
                print(tokenString)
                networkService.shared.SignIn(withToken: tokenString) { status, statuscode in
                    if(status){
                        if(statuscode == 201){
                            let ChallengesStoryboard = UIStoryboard(name: "ChallengesStoryboard", bundle: nil)
                            let vc = ChallengesStoryboard.instantiateViewController(withIdentifier: "HomeViewController") as! HomeViewController
                            self.navigationController?.pushViewController(vc, animated: true)
                        }
                        else if(statuscode == 200){
                            let vc = self.storyboard?.instantiateViewController(withIdentifier: "Createprofile1ViewController") as! Createprofile1ViewController
                            vc.Init(email: Results ?? "")
                            self.navigationController?.pushViewController(vc, animated: true)
                        }
                        else{
                            print(statuscode)
                            DispatchQueue.main.async {
                            UiUtils.showToast(message: "Failed with error: \(statuscode)")
                            }
                            GIDSignIn.sharedInstance.signOut()
                        }
                    }
                    else{
                        print("failure")
                    }
                }
            }
            else{
                DispatchQueue.main.async {
                UiUtils.showToast(message: "Cancelled signing-in")
                }
            }
        }
    }
//    func signIn() {
//      // 1
//      if GIDSignIn.sharedInstance.hasPreviousSignIn() {
//        GIDSignIn.sharedInstance.restorePreviousSignIn { [unowned self] user, error in
//            authenticateUser(for: user, with: error)
//        }
//      } else {
//        // 2
//        guard let clientID = FirebaseApp.app()?.options.clientID else { return }
//
//        // 3
//        let configuration = GIDConfiguration(clientID: clientID)
//
//        // 4
//        guard let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene else { return }
//        guard let rootViewController = windowScene.windows.first?.rootViewController else { return }
//
//        // 5
//          GIDSignIn.sharedInstance.signIn(withPresenting: self) { [unowned self] user, error in
//              authenticateUser(for: user?.user, with: error)
//        }
//      }
//    }

//    private func authenticateUser(for user: GIDGoogleUser?, with error: Error?) {
//      // 1
//      if let error = error {
//        print(error.localizedDescription)
//        return
//      }
//
//      // 2
//        guard let authentication = user?.authentication, let idToken = authentication.idtoken else { return }
//
//      let credential = GoogleAuthProvider.credential(withIDToken: idToken, accessToken: authentication.accessToken)
//
//      // 3
//      Auth.auth().signIn(with: credential) { [unowned self] (_, error) in
//        if let error = error {
//          print(error.localizedDescription)
//        } else {
//          self.state = .signedIn
//        }
//      }
//    }
        @IBAction func ActionButtonLoginApple(_ sender: Any) {
            startSignInWithAppleFlow()
        }
        @IBAction func ActionButtonLoginEmail(_ sender: Any) {
            print("ActionButtonLoginEmail")
            let signinVC = storyboard?.instantiateViewController(withIdentifier: "SignInWithEmail") as! SignInWithEmailViewController
            navigationController?.pushViewController(signinVC, animated: true)
        }
        
        @IBAction func termsOfServiceBtnTap(_ sender: UIButton) {
            let VC = storyboard?.instantiateViewController(withIdentifier: "LocalWebViewVC") as! LocalWebViewVC
            VC.modalPresentationStyle = .fullScreen
            VC.whatToShow = "termsAndConditions"
            VC.headerLabelText = "FITOS Terms & Conditions"
            //        self.present(VC, animated: true)
            self.navigationController?.pushViewController(VC, animated: true)
        }
        
        @IBAction func privacyPolicyBtnTap(_ sender: UIButton) {
            let VC = storyboard?.instantiateViewController(withIdentifier: "LocalWebViewVC") as! LocalWebViewVC
            VC.modalPresentationStyle = .fullScreen
            VC.whatToShow = "privacyPolicy"
            VC.headerLabelText = "FITOS Privacy Policy"
            self.navigationController?.pushViewController(VC, animated: true)
        }
    }
    extension LoginViewController:ASAuthorizationControllerDelegate{
        private func randomNonceString(length: Int = 32) -> String {
            precondition(length > 0)
            let charset: [Character] =
            Array("0123456789ABCDEFGHIJKLMNOPQRSTUVXYZabcdefghijklmnopqrstuvwxyz-._")
            var result = ""
            var remainingLength = length
            
            while remainingLength > 0 {
                let randoms: [UInt8] = (0 ..< 16).map { _ in
                    var random: UInt8 = 0
                    let errorCode = SecRandomCopyBytes(kSecRandomDefault, 1, &random)
                    if errorCode != errSecSuccess {
                        fatalError(
                            "Unable to generate nonce. SecRandomCopyBytes failed with OSStatus \(errorCode)"
                        )
                    }
                    return random
                }
                
                randoms.forEach { random in
                    if remainingLength == 0 {
                        return
                    }
                    
                    if random < charset.count {
                        result.append(charset[Int(random)])
                        remainingLength -= 1
                    }
                }
            }
            
            return result
        }
        
        private func sha256(_ input: String) -> String {
            let inputData = Data(input.utf8)
            let hashedData = SHA256.hash(data: inputData)
            let hashString = hashedData.compactMap {
                String(format: "%02x", $0)
            }.joined()
            
            return hashString
        }
        
        func startSignInWithAppleFlow() {
            let nonce = randomNonceString()
            currentNonce = nonce
            let appleIDProvider = ASAuthorizationAppleIDProvider()
            let request = appleIDProvider.createRequest()
            request.requestedScopes = [.fullName, .email]
            request.nonce = sha256(nonce)
            
            let authorizationController = ASAuthorizationController(authorizationRequests: [request])
            authorizationController.delegate = self
            authorizationController.presentationContextProvider = self
            authorizationController.performRequests()
        }
        
        func authorizationController(controller: ASAuthorizationController, didCompleteWithAuthorization authorization: ASAuthorization) {
            if let appleIDCredential = authorization.credential as? ASAuthorizationAppleIDCredential {
                guard let nonce = currentNonce else {
                    fatalError("Invalid state: A login callback was received, but no login request was sent.")
                }
                guard let appleIDToken = appleIDCredential.identityToken else {
                    print("Unable to fetch identity token")
                    return
                }
                guard let idTokenString = String(data: appleIDToken, encoding: .utf8) else {
                    print("Unable to serialize token string from data: \(appleIDToken.debugDescription)")
                    return
                }
                // Initialize a Firebase credential.
                let credential = OAuthProvider.credential(withProviderID: "apple.com",
                                                          idToken: idTokenString,
                                                          rawNonce: nonce)
                // Sign in with Firebase.
                Auth.auth().signIn(with: credential) { (authResult, error) in
                    if error != nil {
                        print(error!.localizedDescription)
                        return
                    }
                    if let authResult = authResult{
                        authResult.user.getIDToken { token, error in
                            print(token ?? error)
                            guard let token = token else{
                                DispatchQueue.main.async {
                                UiUtils.showToast(message: "Failed getting access token")
                                }
                                return
                            }
                            networkService.shared.SignIn(withToken: token) { status, statuscode in
                                if(status){
                                    if(statuscode == 201){
                                        DispatchQueue.main.async {
                                            let ChallengesStoryboard = UIStoryboard(name: "ChallengesStoryboard", bundle: nil)
                                            let vc = ChallengesStoryboard.instantiateViewController(withIdentifier: "HomeViewController") as! HomeViewController
                                        self.navigationController?.pushViewController(vc, animated: true)
                                        }
                                    }
                                    else if(statuscode == 200){
                                        DispatchQueue.main.async {
                                        let vc = self.storyboard?.instantiateViewController(withIdentifier: "Createprofile1ViewController") as! Createprofile1ViewController
                                        self.navigationController?.pushViewController(vc, animated: true)
                                        }
                                    }
                                    else{
                                        DispatchQueue.main.async {
                                        UiUtils.showToast(message: "Failed with error: \(statuscode)")
                                        }
                                        print(statuscode)
                                    }
                                }
                        }
                    }
                    // User is signed in to Firebase with Apple.
                    
                }
            }
            }
            
            func authorizationController(controller: ASAuthorizationController, didCompleteWithError error: Error) {
                // Handle error.
                print("Sign in with Apple errored: \(error)")
            }
            
        }
        
    }
