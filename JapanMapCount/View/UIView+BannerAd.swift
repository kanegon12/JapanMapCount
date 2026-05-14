import GoogleMobileAds
import UIKit

extension BannerView {
    /// 広告ID・rootViewController・読み込みを設定済みのBannerViewを生成して返す
    static func make(rootViewController: UIViewController) -> BannerView {
        let banner = BannerView(adSize: AdSizeBanner)
        // DEBUGビルド（開発中）はテスト用ID、リリースビルドは本番IDを使用
        // ※開発中に本番IDを使うとAdMobの規約違反になるため必ずこの分岐が必要
        #if DEBUG
        banner.adUnitID = "ca-app-pub-3940256099942544/2934735716" // テスト用ID
        #else
        banner.adUnitID = "ca-app-pub-7789771720408622/3105217660" // 本番用ID
        #endif
        banner.rootViewController = rootViewController
        banner.load(Request())
        return banner
    }
}

extension UIView {
    /// BannerViewを生成してselfの内側いっぱいに埋め込む
    /// Storyboard上のUIViewをコンテナとして使い、配置はStoryboard・生成はコードで担う
    func embedBannerAd(rootViewController: UIViewController) {
        let banner = BannerView.make(rootViewController: rootViewController)
        // AutoLayoutでコンテナいっぱいに広げる
        banner.translatesAutoresizingMaskIntoConstraints = false
        addSubview(banner)
        NSLayoutConstraint.activate([
            banner.topAnchor.constraint(equalTo: topAnchor),
            banner.bottomAnchor.constraint(equalTo: bottomAnchor),
            banner.leadingAnchor.constraint(equalTo: leadingAnchor),
            banner.trailingAnchor.constraint(equalTo: trailingAnchor)
        ])
    }
}
