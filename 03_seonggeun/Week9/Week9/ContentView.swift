import SwiftUI
import GoogleSignIn
import GoogleSignInSwift

// _UserData를 Codable로 만들어줍니다.
struct _UserData: Codable {
    // url: profile image
    var url: URL?
    var name: String
    var email: String
}

struct ContentView: View {
    // 로그인 상태
    @State private var isLogined = false
    // 유저 데이터
    @State private var userData: _UserData
    // popUp
    @State private var isAlert = false

    public init(isLogined: Bool = false, userData: _UserData = _UserData(url: nil, name: "", email: "")) {
        _isLogined = State(initialValue: isLogined)
        _userData = State(initialValue: userData)
    }

    var body: some View {
        NavigationStack {
            ZStack {
                // 구글 로그인 버튼 생성
                GoogleSignInButton(
                    scheme: .light,
                    style: .wide,
                    action: {
                        googleLogin()
                    })
                    .frame(width: 300, height: 60, alignment: .center)
            }
            // 로그인 상태에 따라 MyPageView로 네비게이션
            .navigationDestination(isPresented: $isLogined, destination: { MyPageView(userData: $userData) })
        }
        .onAppear(perform: {
            // 로그인 상태 체크
            checkState()
        })
        // 로그인 실패 시 알림뜨기
        .alert(isPresented: $isAlert) {
            Alert(
                title: Text("로그인 실패"),
                message: Text("다시 시도해주세요"),
                dismissButton: .default(Text("확인"))
            )
        }
    }
    
    // 로그인 상태를 체크하는 함수
    func checkState() {
        if let savedUserData = UserDefaults.standard.data(forKey: "userData"),
           let decodedUserData = try? JSONDecoder().decode(_UserData.self, from: savedUserData) {
            userData = decodedUserData
            isLogined = true
        } else {
            GIDSignIn.sharedInstance.restorePreviousSignIn { user, error in
                if error != nil || user == nil {
                    // 로그아웃 상태
                    print("Not Sign In")
                } else {
                    // 로그인 상태
                    guard let profile = user?.profile else { return }
                    let data = _UserData(url: profile.imageURL(withDimension: 180), name: profile.name, email: profile.email)
                    userData = data
                    isLogined = true
                    saveUserData()
                }
            }
        }
    }

    // 구글 로그인
    func googleLogin() {
        // rootViewController 가져오기
        guard let presentingViewController = (UIApplication.shared.connectedScenes.first as? UIWindowScene)?.windows.first?.rootViewController else { return }
        // 구글 로그인 진행
        GIDSignIn.sharedInstance.signIn(withPresenting: presentingViewController) { signInResult, error in
            // 로그인 실패 시 알림 표시
            guard let result = signInResult else {
                isAlert = true
                return
            }
            // 유저 프로필 정보를 _UserData로 저장
            guard let profile = result.user.profile else { return }
            let data = _UserData(url: profile.imageURL(withDimension: 180), name: profile.name, email: profile.email)
            userData = data
            // If sign in succeeded, display the app's main content View.
            isLogined = true
            saveUsers에 사용자 데이터를 저장하는 함수
    func saveUserData() {
        if let encoded = try? JSONEncoder().encode(userData) {
            UserDefaults.standard.set(encoded, forKey: "userData")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(userData: _UserData(url: nil, name: "", email: ""))
    }
}
