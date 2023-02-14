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
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
        setLayouts()
    }
    override func viewWillAppear(_ animated: Bool) {
        GIDSignIn.sharedInstance.restorePreviousSignIn { user, error in
          if error != nil || user == nil {
            // Show the app's signed-out state.
              print("Not signed in")
          } else {
            // Show the app's signed-in state.
              print("signed in")
              let vc = self.storyboard?.instantiateViewController(withIdentifier: "HomeViewController") as! HomeViewController
              self.navigationController?.pushViewController(vc, animated: true)
          }
        }

    }
    func setUI() {
        guard let backgroundImage = UIImage(named: "BG") else{
            return
        }
        self.view.backgroundColor = UIColor(patternImage: backgroundImage)
        LogInWithGoogle.backgroundColor = .white
        LogInWithGoogle.layer.cornerRadius = 7
        LogInWithGoogle.setImage(UIImage(named: "google_ic"), for: .normal)
        LoginWithApple.titleLabel?.font = UIFont(name: "Inter-Black", size:17)
        LogInWithGoogle.setTitle(constants.LoginWithGoogleTitle, for: .normal)
        LogInWithGoogle.tintColor = .black
        LoginWithApple.backgroundColor = UIColor.systemRed
        LoginWithApple.layer.cornerRadius = 7
        LoginWithApple.setImage(UIImage(named: "Apple"), for: .normal)
        LoginWithApple.setTitle(constants.LoginWithAppleTitle, for: .normal)
        LoginWithApple.tintColor = .black
        LogginwithEmail.layer.cornerRadius = 7
        LogginwithEmail.backgroundColor = .white
        LogginwithEmail.tintColor = .black
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
//            topView.heightAnchor.constraint(equalToConstant: heightOfSuperview * 0.50),
//            topView.bottomAnchor.constraint(equalTo: view.bottomAnchor,constant: heightOfSuperview * 0.55),
//            topView.topAnchor.constraint(equalTo: margins.topAnchor),
//            HeaderInsideView.centerXAnchor.constraint(equalTo: topView.centerXAnchor),
//            HeaderInsideView.centerYAnchor.constraint(equalTo: topView.centerYAnchor),
//            HeaderInsideView.trailingAnchor.constraint(equalTo: topView.trailingAnchor),
//            HeaderInsideView.leadingAnchor.constraint(equalTo: topView.leadingAnchor),
//            HeaderInsideView.heightAnchor.constraint(equalToConstant: 300),
//            LogoImageview.topAnchor.constraint(equalTo: HeaderInsideView.topAnchor),
//            LogoImageview.bottomAnchor.constraint(equalTo: HeaderInsideView.bottomAnchor,constant: HeaderInsideView.bounds.height * 0.50),
//            DescriptionLabel.topAnchor.constraint(equalTo: LogoImageview.bottomAnchor,constant: 10),
//            BottomStackview.topAnchor.constraint(equalTo: view.topAnchor, constant: heightOfSuperview * 0.55),
//            BottomStackview.bottomAnchor.constraint(equalTo: margins.bottomAnchor,constant: -60),
//            BottomStackview.leadingAnchor.constraint(equalTo: margins.leadingAnchor),
//            BottomStackview.trailingAnchor.constraint(equalTo: margins.trailingAnchor),
//            LogInWithGoogle.widthAnchor.constraint(equalTo: BottomStackview.widthAnchor),
//            LoginWithApple.widthAnchor.constraint(equalTo: BottomStackview.widthAnchor),
//            LogginwithEmail.widthAnchor.constraint(equalTo: BottomStackview.widthAnchor),
//            termsandconditionsview.topAnchor.constraint(equalTo: BottomStackview.bottomAnchor, constant: 10),
//            termsandconditionsview.bottomAnchor.constraint(equalTo: margins.bottomAnchor, constant: -10),
//            termsandconditionsview.leadingAnchor.constraint(equalTo: margins.leadingAnchor),
//            termsandconditionsview.trailingAnchor.constraint(equalTo: margins.trailingAnchor),
//            StraightLineLeftView.heightAnchor.constraint(equalToConstant: 1),
//            StraightlineRightView.heightAnchor.constraint(equalToConstant: 1),
//            taclabel1.topAnchor.constraint(equalTo: termsandconditionsview.topAnchor, constant: 2),
//            taclabel1.bottomAnchor.constraint(equalTo: termsandconditionsview.bottomAnchor, constant: termsandconditionsview.bounds.height * 0.5),
////            taclabel1.centerXAnchor.constraint(equalTo: termsandconditionsview.centerXAnchor),
//            tacstackview.topAnchor.constraint(equalTo: taclabel1.bottomAnchor, constant: 1),
//            tacstackview.bottomAnchor.constraint(equalTo: termsandconditionsview.bottomAnchor, constant: 1),
//            tacstackview.centerXAnchor.constraint(equalTo: termsandconditionsview.centerXAnchor)
        ])
    }
//MARK:- Log in actions
    @IBAction func ActionButtonLoginGoogle(_ sender: Any) {
        AuthenticationHandler.Shared.SignInWithGoogle(Controller: self) { Results,status in
            print(Results)
            if(status){
                let vc  = self.storyboard?.instantiateViewController(withIdentifier: "Createprofile1ViewController") as! Createprofile1ViewController
                print(vc)
                vc.Init(email: Results ?? "")
                self.navigationController?.pushViewController(vc, animated: true)
            }
            else{
                let alert = UIAlertController(title: "Failure", message: Results ?? "Cancelled", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "Ok", style: .default))
                self.present(alert, animated: true)
            }
        }
    }
    @IBAction func ActionButtonLoginApple(_ sender: Any) {
       startSignInWithAppleFlow()
    }
    @IBAction func ActionButtonLoginEmail(_ sender: Any) {
        print("ActionButtonLoginEmail")
        let signinVC = storyboard?.instantiateViewController(withIdentifier: "SignInWithEmail") as! SignInWithEmailViewController
        navigationController?.pushViewController(signinVC, animated: true)
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
              // Error. If error.code == .MissingOrInvalidNonce, make sure
              // you're sending the SHA256-hashed nonce as a hex string with
              // your request to Apple.
                print(error!.localizedDescription)
              return
            }
              if let authResult = authResult{
              authResult.user.getIDToken { token, error in
                  print(token ?? error)
                  let vc  = self.storyboard?.instantiateViewController(withIdentifier: "Createprofile1ViewController") as! Createprofile1ViewController
                  self.navigationController?.pushViewController(vc, animated: true)
              }
              }
            // User is signed in to Firebase with Apple.
            
          }
      }

      func authorizationController(controller: ASAuthorizationController, didCompleteWithError error: Error) {
        // Handle error.
        print("Sign in with Apple errored: \(error)")
      }

    }
}


extension UIColor {

    func add(overlay: UIColor) -> UIColor {
        var bgR: CGFloat = 103
        var bgG: CGFloat = 7
        var bgB: CGFloat = 224
        var bgA: CGFloat = 1
        
        var fgR: CGFloat = 255
        var fgG: CGFloat = 97
        var fgB: CGFloat = 220
        var fgA: CGFloat = 1
        
        self.getRed(&bgR, green: &bgG, blue: &bgB, alpha: &bgA)
        overlay.getRed(&fgR, green: &fgG, blue: &fgB, alpha: &fgA)
        
        let r = fgA * fgR + (1 - fgA) * bgR
        let g = fgA * fgG + (1 - fgA) * bgG
        let b = fgA * fgB + (1 - fgA) * bgB
        
        return UIColor(red: r, green: g, blue: b, alpha: 1.0)
    }
}
extension UILabel
{
    func applyGradient(colors: [CGColor])
    {
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = colors
        gradientLayer.startPoint = CGPoint(x: 0, y: 0)
        gradientLayer.endPoint = CGPoint(x: 1, y: 0)
        gradientLayer.frame = self.bounds
        self.layer.insertSublayer(gradientLayer, at: 0)
    }
}

extension UIColor {
    static func blend(color1: UIColor, intensity1: CGFloat = 0.5, color2: UIColor, intensity2: CGFloat = 0.5) -> UIColor {
        let total = intensity1 + intensity2
        let l1 = intensity1/total
        let l2 = intensity2/total
        guard l1 > 0 else { return color2}
        guard l2 > 0 else { return color1}
        var (r1, g1, b1, a1): (CGFloat, CGFloat, CGFloat, CGFloat) = (0, 0, 0, 0)
        var (r2, g2, b2, a2): (CGFloat, CGFloat, CGFloat, CGFloat) = (0, 0, 0, 0)

        color1.getRed(&r1, green: &g1, blue: &b1, alpha: &a1)
        color2.getRed(&r2, green: &g2, blue: &b2, alpha: &a2)

        return UIColor(red: l1*r1 + l2*r2, green: l1*g1 + l2*g2, blue: l1*b1 + l2*b2, alpha: l1*a1 + l2*a2)
    }
}
