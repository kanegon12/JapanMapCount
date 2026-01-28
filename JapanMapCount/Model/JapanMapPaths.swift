//
//  JapanMapPaths.swift
//  JapanMapCount
//
//  Created by Newbie on 2025/12/27.
//

import UIKit

enum Prefecture: Int, CaseIterable {
    case hokkaido = 1
    case aomori = 2
    case iwate = 3
    case miyagi = 4
    case akita = 5
    case yamagata = 6
    case fukushima = 7
    case ibaraki = 8
    case tochigi = 9
    case gunma = 10
    case saitama = 11
    case chiba = 12
    case tokyo = 13
    case kanagawa = 14
    case niigata = 15
    case toyama = 16
    case ishikawa = 17
    case fukui = 18
    case yamanashi = 19
    case nagano = 20
    case gifu = 21
    case shizuoka = 22
    case aichi = 23
    case mie = 24
    case shiga = 25
    case kyoto = 26
    case osaka = 27
    case hyogo = 28
    case nara = 29
    case wakayama = 30
    case tottori = 31
    case shimane = 32
    case okayama = 33
    case hiroshima = 34
    case yamaguchi = 35
    case tokushima = 36
    case kagawa = 37
    case ehime = 38
    case kochi = 39
    case fukuoka = 40
    case saga = 41
    case nagasaki = 42
    case kumamoto = 43
    case oita = 44
    case miyazaki = 45
    case kagoshima = 46
    case okinawa = 47
    
    var displayName: String {
        switch self {
        case .hokkaido:
            return "北海道"
        case .aomori:
            return "青森"
        case .iwate:
            return "岩手"
        case .miyagi:
            return "宮城"
        case .akita:
            return "秋田"
        case .yamagata:
            return "山形"
        case .fukushima:
            return "福島"
        case .ibaraki:
            return "茨城"
        case .tochigi:
            return "栃木"
        case .gunma:
            return "群馬"
        case .saitama:
            return "埼玉"
        case .chiba:
            return "千葉"
        case .tokyo:
            return "東京"
        case .kanagawa:
            return "神奈川"
        case .niigata:
            return "新潟"
        case .toyama:
            return "富山"
        case .ishikawa:
            return "石川"
        case .fukui:
            return "福井"
        case .yamanashi:
            return "山梨"
        case .nagano:
            return "長野"
        case .gifu:
            return "岐阜"
        case .shizuoka:
            return "静岡"
        case .aichi:
            return "愛知"
        case .mie:
            return "三重"
        case .shiga:
            return "滋賀"
        case .kyoto:
            return "京都"
        case .osaka:
            return "大阪"
        case .hyogo:
            return "兵庫"
        case .nara:
            return "奈良"
        case .wakayama:
            return "和歌山"
        case .tottori:
            return "鳥取"
        case .shimane:
            return "島根"
        case .okayama :
            return "岡山"
        case .hiroshima:
            return "広島"
        case .yamaguchi:
            return "山口"
        case .tokushima:
            return "徳島"
        case .kagawa:
            return "香川"
        case .ehime:
            return "愛媛"
        case .kochi:
            return "高知"
        case .fukuoka:
            return "福岡"
        case .saga:
            return "佐賀"
        case .nagasaki:
            return "長崎"
        case .kumamoto:
            return "熊本"
        case .oita:
            return "大分"
        case .miyazaki:
            return "宮崎"
        case .kagoshima:
            return "鹿児島"
        case .okinawa:
            return "沖縄"
        }
    }
    
    var region: Region {
        switch self {
        case .hokkaido:
            return .hokkaido
        case .aomori, .iwate, .miyagi, .akita, .yamagata, .fukushima:
            return .tohoku
        case .ibaraki, .tochigi, .gunma, .saitama, .chiba, .tokyo, .kanagawa:
            return .kanto
        case .niigata, .toyama, .ishikawa, .fukui, .yamanashi, .nagano, .gifu, .shizuoka, .aichi:
            return .chubu
        case .mie, .shiga, .kyoto, .osaka, .hyogo, .nara, .wakayama:
            return .kinki
        case .tottori, .shimane, .okayama, .hiroshima, .yamaguchi:
            return .chugoku
        case .tokushima, .kagawa, .ehime, .kochi:
            return .shikoku
        case .fukuoka, .saga, .nagasaki, .kumamoto, .oita, .miyazaki, .kagoshima, .okinawa:
            return .kyusyu
        }
    }
}

enum JapanMapPaths {
    
    static func path(for prefecture: Prefecture) -> UIBezierPath {
        switch prefecture {
        case .hokkaido:
            return makeHokkaidoPath()
        case .aomori:
            return makeAomoriPath()
        case .iwate:
            return makeIwatePath()
        case .miyagi:
            return makeMiyagiPath()
        case .akita:
            return makeAkitaPath()
        case .yamagata:
            return makeYamagataPath()
        case .fukushima:
            return makeFukushimaPath()
        case .ibaraki:
            return makeIbarakiPath()
        case .tochigi:
            return makeTochigiPath()
        case .gunma:
            return makeGunmaPath()
        case .saitama:
            return makeSaitamaPath()
        case .chiba:
            return makeChibaPath()
        case .tokyo:
            return makeTokyoPath()
        case .kanagawa:
            return makeKanagawaPath()
        case .niigata:
            return makeNiigataPath()
        case .toyama:
            return makeToyamaPath()
        case .ishikawa:
            return makeIshikawaPath()
        case .fukui:
            return makeFukuiPath()
        case .yamanashi:
            return makeYamanashiPath()
        case .nagano:
            return makeNaganoPath()
        case .gifu:
            return makeGifuPath()
        case .shizuoka:
            return makeShizuokaPath()
        case .aichi:
            return makeAichiPath()
        case .mie:
            return makeMiePath()
        case .shiga:
            return makeShigaPath()
        case .kyoto:
            return makeKyotoPath()
        case .osaka:
            return makeOsakaPath()
        case .hyogo:
            return makeHyogoPath()
        case .nara:
            return makeNaraPath()
        case .wakayama:
            return makeWakayamaPath()
        case .tottori:
            return makeTottoriPath()
        case .shimane:
            return makeShimanePath()
        case .okayama:
            return makeOkayamaPath()
        case .hiroshima:
            return makeHiroshimaPath()
        case .yamaguchi:
            return makeYamaguchiPath()
        case .tokushima:
            return makeTokushimaPath()
        case .kagawa:
            return makeKagawaPath()
        case .ehime:
            return makeEhimePath()
        case .kochi:
            return makeKochiPath()
        case .fukuoka:
            return makeFukuokaPath()
        case .saga:
            return makeSagaPath()
        case .nagasaki:
            return makeNagasakiPath()
        case .kumamoto:
            return makeKumamotoPath()
        case .oita:
            return makeOitaPath()
        case .miyazaki:
            return makeMiyazakiPath()
        case .kagoshima:
            return makeKagoshimaPath()
        case .okinawa:
            return makeOkinawaPath()
        }
    }
}

func makeHokkaidoPath() -> UIBezierPath {
    let path = UIBezierPath()
    path.move(to: CGPoint(x: 843.1, y: 436.82))
    path.addLine(to: CGPoint(x: 843.36, y: 663.07))
    path.addLine(to: CGPoint(x: 846.83, y: 675.61))
    path.addLine(to: CGPoint(x: 851.9, y: 684.42))
    path.addLine(to: CGPoint(x: 859.1, y: 691.62))
    path.addLine(to: CGPoint(x: 868.71, y: 696.42))
    path.addLine(to: CGPoint(x: 1081.36, y: 695.62))
    path.addLine(to: CGPoint(x: 1092.83, y: 689.22))
    path.addLine(to: CGPoint(x: 1100.03, y: 679.88))
    path.addLine(to: CGPoint(x: 1104.3, y: 670.28))
    path.addLine(to: CGPoint(x: 1106.97, y: 659.6))
    path.addLine(to: CGPoint(x: 1106.44, y: 437.09))
    path.addLine(to: CGPoint(x: 1104.03, y: 426.68))
    path.addLine(to: CGPoint(x: 1100.03, y: 417.88))
    path.addLine(to: CGPoint(x: 1094.43, y: 409.34))
    path.addLine(to: CGPoint(x: 1087.23, y: 403.47))
    path.addLine(to: CGPoint(x: 1080.02, y: 400))
    path.addLine(to: CGPoint(x: 868.18, y: 400))
    path.addLine(to: CGPoint(x: 860.44, y: 404.27))
    path.addLine(to: CGPoint(x: 855.64, y: 408.8))
    path.addLine(to: CGPoint(x: 850.03, y: 416.01))
    path.addLine(to: CGPoint(x: 847.63, y: 421.08))
    path.addLine(to: CGPoint(x: 844.16, y: 428.28))
    path.addLine(to: CGPoint(x: 843.1, y: 436.82))
    path.close()
    return path
}

func makeAomoriPath() -> UIBezierPath {
    let path = UIBezierPath()
    path.move(to: CGPoint(x: 842.83, y: 733.84))
    path.addLine(to: CGPoint(x: 842.96, y: 821.49))
    path.addLine(to: CGPoint(x: 843.5, y: 824.62))
    path.addLine(to: CGPoint(x: 844.63, y: 826.89))
    path.addLine(to: CGPoint(x: 846.36, y: 829.09))
    path.addLine(to: CGPoint(x: 848.5, y: 830.63))
    path.addLine(to: CGPoint(x: 850.43, y: 831.1))
    path.addLine(to: CGPoint(x: 1021.19, y: 830.36))
    path.addLine(to: CGPoint(x: 1024.03, y: 830.08))
    path.addLine(to: CGPoint(x: 1026.2, y: 829.19))
    path.addLine(to: CGPoint(x: 1028.09, y: 827.77))
    path.addLine(to: CGPoint(x: 1029.69, y: 825.93))
    path.addLine(to: CGPoint(x: 1030.78, y: 823.95))
    path.addLine(to: CGPoint(x: 1031.39, y: 820.93))
    path.addLine(to: CGPoint(x: 1031.6, y: 735.64))
    path.addLine(to: CGPoint(x: 1031.25, y: 732.5))
    path.addLine(to: CGPoint(x: 1029.88, y: 729.29))
    path.addLine(to: CGPoint(x: 1028.89, y: 727.17))
    path.addLine(to: CGPoint(x: 1027.52, y: 725.38))
    path.addLine(to: CGPoint(x: 1025.4, y: 723.87))
    path.addLine(to: CGPoint(x: 1022.62, y: 723.16))
    path.addLine(to: CGPoint(x: 854.04, y: 722.3))
    path.addLine(to: CGPoint(x: 851.71, y: 722.73))
    path.addLine(to: CGPoint(x: 849.57, y: 723.72))
    path.addLine(to: CGPoint(x: 848.2, y: 724.83))
    path.addLine(to: CGPoint(x: 846.83, y: 726.46))
    path.addLine(to: CGPoint(x: 845.6, y: 728.11))
    path.addLine(to: CGPoint(x: 844.28, y: 730.47))
    path.addLine(to: CGPoint(x: 843.39, y: 732.24))
    path.addLine(to: CGPoint(x: 842.83, y: 733.84))
    path.close()
    return path
}

func makeIwatePath() -> UIBezierPath {
    let path = UIBezierPath()
    path.move(to: CGPoint(x: 937.06, y: 842.16))
    path.addLine(to: CGPoint(x: 937.06, y: 928.47))
    path.addLine(to: CGPoint(x: 937.86, y: 931.06))
    path.addLine(to: CGPoint(x: 939.23, y: 933.8))
    path.addLine(to: CGPoint(x: 941.11, y: 936.11))
    path.addLine(to: CGPoint(x: 943.14, y: 937.81))
    path.addLine(to: CGPoint(x: 945.03, y: 938.56))
    path.addLine(to: CGPoint(x: 1023.06, y: 938.69))
    path.addLine(to: CGPoint(x: 1025.33, y: 937.75))
    path.addLine(to: CGPoint(x: 1027.86, y: 936.02))
    path.addLine(to: CGPoint(x: 1029.59, y: 933.75))
    path.addLine(to: CGPoint(x: 1030.93, y: 931.08))
    path.addLine(to: CGPoint(x: 1031.6, y: 928.81))
    path.addLine(to: CGPoint(x: 1031.46, y: 843.17))
    path.addLine(to: CGPoint(x: 1031.01, y: 840.32))
    path.addLine(to: CGPoint(x: 1030.68, y: 838.15))
    path.addLine(to: CGPoint(x: 1029.74, y: 835.88))
    path.addLine(to: CGPoint(x: 1028.51, y: 834))
    path.addLine(to: CGPoint(x: 1026.72, y: 832.39))
    path.addLine(to: CGPoint(x: 1025.12, y: 831.17))
    path.addLine(to: CGPoint(x: 1022.76, y: 830.51))
    path.addLine(to: CGPoint(x: 945.75, y: 830.96))
    path.addLine(to: CGPoint(x: 943.68, y: 831.8))
    path.addLine(to: CGPoint(x: 942.06, y: 832.82))
    path.addLine(to: CGPoint(x: 940.55, y: 834.04))
    path.addLine(to: CGPoint(x: 939.18, y: 835.55))
    path.addLine(to: CGPoint(x: 938, y: 837.49))
    path.addLine(to: CGPoint(x: 937.43, y: 839.04))
    path.addLine(to: CGPoint(x: 937.06, y: 842.16))
    path.close()
    return path
}

func makeMiyagiPath() -> UIBezierPath {
    let path = UIBezierPath()
    path.move(to: CGPoint(x: 937.39, y: 948.75))
    path.addLine(to: CGPoint(x: 937.39, y: 1036.57))
    path.addLine(to: CGPoint(x: 937.76, y: 1038.65))
    path.addLine(to: CGPoint(x: 938.57, y: 1040.63))
    path.addLine(to: CGPoint(x: 939.7, y: 1042.28))
    path.addLine(to: CGPoint(x: 941.11, y: 1043.6))
    path.addLine(to: CGPoint(x: 942.81, y: 1044.73))
    path.addLine(to: CGPoint(x: 944.37, y: 1045.49))
    path.addLine(to: CGPoint(x: 946.49, y: 1046.1))
    path.addLine(to: CGPoint(x: 1020.63, y: 1046.01))
    path.addLine(to: CGPoint(x: 1023.46, y: 1045.44))
    path.addLine(to: CGPoint(x: 1025.68, y: 1044.26))
    path.addLine(to: CGPoint(x: 1027.95, y: 1042.61))
    path.addLine(to: CGPoint(x: 1029.69, y: 1040.87))
    path.addLine(to: CGPoint(x: 1030.96, y: 1038.51))
    path.addLine(to: CGPoint(x: 1031.67, y: 1036.24))
    path.addLine(to: CGPoint(x: 1031.6, y: 950.83))
    path.addLine(to: CGPoint(x: 1031.2, y: 947.49))
    path.addLine(to: CGPoint(x: 1030, y: 944.96))
    path.addLine(to: CGPoint(x: 1028.66, y: 942.42))
    path.addLine(to: CGPoint(x: 1026.93, y: 941.09))
    path.addLine(to: CGPoint(x: 1024.66, y: 939.49))
    path.addLine(to: CGPoint(x: 1022.99, y: 938.85))
    path.addLine(to: CGPoint(x: 946.44, y: 938.85))
    path.addLine(to: CGPoint(x: 944.48, y: 938.95))
    path.addLine(to: CGPoint(x: 943.35, y: 939.29))
    path.addLine(to: CGPoint(x: 942.22, y: 940.09))
    path.addLine(to: CGPoint(x: 941.08, y: 941.22))
    path.addLine(to: CGPoint(x: 939.68, y: 942.62))
    path.addLine(to: CGPoint(x: 938.55, y: 944.36))
    path.addLine(to: CGPoint(x: 937.81, y: 945.69))
    path.addLine(to: CGPoint(x: 937.28, y: 947.29))
    path.addLine(to: CGPoint(x: 937.39, y: 948.75))
    path.close()
    return path
}

func makeAkitaPath() -> UIBezierPath {
    let path = UIBezierPath()
    path.move(to: CGPoint(x: 842.59, y: 841.87))
    path.addLine(to: CGPoint(x: 842.59, y: 927.48))
    path.addLine(to: CGPoint(x: 842.96, y: 930.15))
    path.addLine(to: CGPoint(x: 843.76, y: 932.28))
    path.addLine(to: CGPoint(x: 845.23, y: 934.55))
    path.addLine(to: CGPoint(x: 847.23, y: 936.82))
    path.addLine(to: CGPoint(x: 849.1, y: 938.29))
    path.addLine(to: CGPoint(x: 850.57, y: 938.82))
    path.addLine(to: CGPoint(x: 929.54, y: 938.82))
    path.addLine(to: CGPoint(x: 932.08, y: 938.02))
    path.addLine(to: CGPoint(x: 933.81, y: 936.02))
    path.addLine(to: CGPoint(x: 935.14, y: 933.88))
    path.addLine(to: CGPoint(x: 936.21, y: 931.08))
    path.addLine(to: CGPoint(x: 936.75, y: 928.55))
    path.addLine(to: CGPoint(x: 936.88, y: 843.57))
    path.addLine(to: CGPoint(x: 936.63, y: 841.17))
    path.addLine(to: CGPoint(x: 935.97, y: 839.09))
    path.addLine(to: CGPoint(x: 935.12, y: 836.54))
    path.addLine(to: CGPoint(x: 933.8, y: 835.04))
    path.addLine(to: CGPoint(x: 931.92, y: 833.43))
    path.addLine(to: CGPoint(x: 930.03, y: 832.11))
    path.addLine(to: CGPoint(x: 927.86, y: 830.98))
    path.addLine(to: CGPoint(x: 851.74, y: 831.36))
    path.addLine(to: CGPoint(x: 849.66, y: 832.21))
    path.addLine(to: CGPoint(x: 848.06, y: 833.34))
    path.addLine(to: CGPoint(x: 846.45, y: 834.75))
    path.addLine(to: CGPoint(x: 845.23, y: 836.36))
    path.addLine(to: CGPoint(x: 844.09, y: 838.53))
    path.addLine(to: CGPoint(x: 842.59, y: 841.87))
    path.close()
    return path
}

func makeYamagataPath() -> UIBezierPath {
    let path = UIBezierPath()
    path.move(to: CGPoint(x: 842.76, y: 949.82))
    path.addLine(to: CGPoint(x: 842.56, y: 1034.14))
    path.addLine(to: CGPoint(x: 842.96, y: 1036.47))
    path.addLine(to: CGPoint(x: 843.96, y: 1038.67))
    path.addLine(to: CGPoint(x: 844.96, y: 1040.67))
    path.addLine(to: CGPoint(x: 846.63, y: 1042.54))
    path.addLine(to: CGPoint(x: 848.37, y: 1044.07))
    path.addLine(to: CGPoint(x: 850.5, y: 1045.27))
    path.addLine(to: CGPoint(x: 852.1, y: 1045.74))
    path.addLine(to: CGPoint(x: 927.81, y: 1045.61))
    path.addLine(to: CGPoint(x: 930.61, y: 1044.87))
    path.addLine(to: CGPoint(x: 932.54, y: 1043.67))
    path.addLine(to: CGPoint(x: 934.41, y: 1041.94))
    path.addLine(to: CGPoint(x: 936.21, y: 1039.54))
    path.addLine(to: CGPoint(x: 937.15, y: 1036.67))
    path.addLine(to: CGPoint(x: 936.82, y: 951.25))
    path.addLine(to: CGPoint(x: 936.63, y: 947.48))
    path.addLine(to: CGPoint(x: 936.16, y: 945.31))
    path.addLine(to: CGPoint(x: 935.22, y: 943.42))
    path.addLine(to: CGPoint(x: 933.61, y: 941.44))
    path.addLine(to: CGPoint(x: 932.29, y: 940.31))
    path.addLine(to: CGPoint(x: 930.5, y: 939.55))
    path.addLine(to: CGPoint(x: 928.61, y: 938.99))
    path.addLine(to: CGPoint(x: 852.5, y: 939.09))
    path.addLine(to: CGPoint(x: 850.43, y: 939.35))
    path.addLine(to: CGPoint(x: 849.17, y: 940.09))
    path.addLine(to: CGPoint(x: 847.57, y: 941.22))
    path.addLine(to: CGPoint(x: 846.16, y: 942.42))
    path.addLine(to: CGPoint(x: 844.76, y: 944.09))
    path.addLine(to: CGPoint(x: 843.7, y: 945.89))
    path.addLine(to: CGPoint(x: 842.9, y: 947.69))
    path.addLine(to: CGPoint(x: 842.76, y: 949.82))
    path.close()
    return path
}

func makeFukushimaPath() -> UIBezierPath {
    let path = UIBezierPath()
    path.move(to: CGPoint(x: 862.24, y: 1056.55))
    path.addLine(to: CGPoint(x: 862.24, y: 1143.79))
    path.addLine(to: CGPoint(x: 862.84, y: 1146.2))
    path.addLine(to: CGPoint(x: 863.71, y: 1148.46))
    path.addLine(to: CGPoint(x: 864.64, y: 1150.06))
    path.addLine(to: CGPoint(x: 866.11, y: 1151.53))
    path.addLine(to: CGPoint(x: 867.84, y: 1152.8))
    path.addLine(to: CGPoint(x: 870.24, y: 1153.73))
    path.addLine(to: CGPoint(x: 1022.12, y: 1153.47))
    path.addLine(to: CGPoint(x: 1025.86, y: 1152.8))
    path.addLine(to: CGPoint(x: 1028.13, y: 1151.06))
    path.addLine(to: CGPoint(x: 1030.4, y: 1148.66))
    path.addLine(to: CGPoint(x: 1031.73, y: 1146.26))
    path.addLine(to: CGPoint(x: 1032.4, y: 1144.39))
    path.addLine(to: CGPoint(x: 1032, y: 1058.22))
    path.addLine(to: CGPoint(x: 1031.44, y: 1054.73))
    path.addLine(to: CGPoint(x: 1030.59, y: 1052.37))
    path.addLine(to: CGPoint(x: 1028.89, y: 1049.64))
    path.addLine(to: CGPoint(x: 1026.53, y: 1047.75))
    path.addLine(to: CGPoint(x: 1024.17, y: 1046.62))
    path.addLine(to: CGPoint(x: 1021.72, y: 1046.15))
    path.addLine(to: CGPoint(x: 870.51, y: 1046.01))
    path.addLine(to: CGPoint(x: 868.48, y: 1046.48))
    path.addLine(to: CGPoint(x: 866.36, y: 1047.7))
    path.addLine(to: CGPoint(x: 864.66, y: 1049.36))
    path.addLine(to: CGPoint(x: 863.34, y: 1051.24))
    path.addLine(to: CGPoint(x: 862.35, y: 1053.55))
    path.addLine(to: CGPoint(x: 862.24, y: 1056.55))
    path.close()
    return path
}

func makeIbarakiPath() -> UIBezierPath {
    let path = UIBezierPath()
    path.move(to: CGPoint(x: 975.12, y: 1162.08))
    path.addLine(to: CGPoint(x: 975.12, y: 1335.27))
    path.addLine(to: CGPoint(x: 975.69, y: 1337.06))
    path.addLine(to: CGPoint(x: 976.53, y: 1338.86))
    path.addLine(to: CGPoint(x: 978.04, y: 1340.7))
    path.addLine(to: CGPoint(x: 979.55, y: 1341.78))
    path.addLine(to: CGPoint(x: 981.63, y: 1342.39))
    path.addLine(to: CGPoint(x: 1023.86, y: 1342.1))
    path.addLine(to: CGPoint(x: 1026.79, y: 1341.17))
    path.addLine(to: CGPoint(x: 1028.93, y: 1339.43))
    path.addLine(to: CGPoint(x: 1030.53, y: 1337.16))
    path.addLine(to: CGPoint(x: 1031.6, y: 1334.49))
    path.addLine(to: CGPoint(x: 1032, y: 1332.36))
    path.addLine(to: CGPoint(x: 1032, y: 1162.36))
    path.addLine(to: CGPoint(x: 1031.44, y: 1160.01))
    path.addLine(to: CGPoint(x: 1030.4, y: 1157.93))
    path.addLine(to: CGPoint(x: 1029.08, y: 1156.33))
    path.addLine(to: CGPoint(x: 1027.19, y: 1155.1))
    path.addLine(to: CGPoint(x: 1024.74, y: 1154.06))
    path.addLine(to: CGPoint(x: 1022.38, y: 1153.68))
    path.addLine(to: CGPoint(x: 981.34, y: 1153.63))
    path.addLine(to: CGPoint(x: 979.9, y: 1153.87))
    path.addLine(to: CGPoint(x: 978.7, y: 1154.43))
    path.addLine(to: CGPoint(x: 977.47, y: 1155.5))
    path.addLine(to: CGPoint(x: 976.43, y: 1156.97))
    path.addLine(to: CGPoint(x: 975.73, y: 1158.17))
    path.addLine(to: CGPoint(x: 975.3, y: 1159.57))
    path.addLine(to: CGPoint(x: 975.12, y: 1162.08))
    path.close()
    return path
}

func makeTochigiPath() -> UIBezierPath {
    let path = UIBezierPath()
    path.move(to: CGPoint(x: 899.93, y: 1164.54))
    path.addLine(to: CGPoint(x: 899.93, y: 1250.85))
    path.addLine(to: CGPoint(x: 900.46, y: 1253.79))
    path.addLine(to: CGPoint(x: 901.39, y: 1256.05))
    path.addLine(to: CGPoint(x: 902.73, y: 1258.05))
    path.addLine(to: CGPoint(x: 904.33, y: 1259.66))
    path.addLine(to: CGPoint(x: 905.93, y: 1260.86))
    path.addLine(to: CGPoint(x: 908.06, y: 1261.52))
    path.addLine(to: CGPoint(x: 964.49, y: 1261.26))
    path.addLine(to: CGPoint(x: 967.43, y: 1260.72))
    path.addLine(to: CGPoint(x: 970.1, y: 1259.66))
    path.addLine(to: CGPoint(x: 972.1, y: 1257.92))
    path.addLine(to: CGPoint(x: 973.3, y: 1256.05))
    path.addLine(to: CGPoint(x: 973.97, y: 1254.19))
    path.addLine(to: CGPoint(x: 974.63, y: 1251.38))
    path.addLine(to: CGPoint(x: 974.63, y: 1164.06))
    path.addLine(to: CGPoint(x: 974.37, y: 1161.89))
    path.addLine(to: CGPoint(x: 973.61, y: 1160.01))
    path.addLine(to: CGPoint(x: 972.38, y: 1158.12))
    path.addLine(to: CGPoint(x: 970.88, y: 1156.61))
    path.addLine(to: CGPoint(x: 968.99, y: 1155.48))
    path.addLine(to: CGPoint(x: 965.88, y: 1153.97))
    path.addLine(to: CGPoint(x: 908.24, y: 1153.97))
    path.addLine(to: CGPoint(x: 905.5, y: 1154.25))
    path.addLine(to: CGPoint(x: 903.9, y: 1155.01))
    path.addLine(to: CGPoint(x: 902.3, y: 1156.23))
    path.addLine(to: CGPoint(x: 901.07, y: 1157.93))
    path.addLine(to: CGPoint(x: 900.22, y: 1159.91))
    path.addLine(to: CGPoint(x: 899.84, y: 1161.51))
    path.addLine(to: CGPoint(x: 899.93, y: 1164.54))
    path.close()
    return path
}

func makeGunmaPath() -> UIBezierPath {
    let path = UIBezierPath()
    path.move(to: CGPoint(x: 824.55, y: 1164.81))
    path.addLine(to: CGPoint(x: 824.62, y: 1251.58))
    path.addLine(to: CGPoint(x: 825.15, y: 1254.12))
    path.addLine(to: CGPoint(x: 826.02, y: 1256.12))
    path.addLine(to: CGPoint(x: 827.42, y: 1258.25))
    path.addLine(to: CGPoint(x: 828.89, y: 1259.66))
    path.addLine(to: CGPoint(x: 830.69, y: 1260.79))
    path.addLine(to: CGPoint(x: 833.16, y: 1261.52))
    path.addLine(to: CGPoint(x: 890.12, y: 1261.46))
    path.addLine(to: CGPoint(x: 892.66, y: 1261.06))
    path.addLine(to: CGPoint(x: 894.32, y: 1260.19))
    path.addLine(to: CGPoint(x: 895.92, y: 1258.92))
    path.addLine(to: CGPoint(x: 897.32, y: 1256.99))
    path.addLine(to: CGPoint(x: 898.39, y: 1254.79))
    path.addLine(to: CGPoint(x: 899.06, y: 1252.98))
    path.addLine(to: CGPoint(x: 899.66, y: 1250.92))
    path.addLine(to: CGPoint(x: 899.73, y: 1163.8))
    path.addLine(to: CGPoint(x: 899.06, y: 1160.87))
    path.addLine(to: CGPoint(x: 897.99, y: 1158.8))
    path.addLine(to: CGPoint(x: 896.19, y: 1156.8))
    path.addLine(to: CGPoint(x: 894.06, y: 1155.27))
    path.addLine(to: CGPoint(x: 891.92, y: 1154.33))
    path.addLine(to: CGPoint(x: 889.72, y: 1153.87))
    path.addLine(to: CGPoint(x: 833.82, y: 1154.4))
    path.addLine(to: CGPoint(x: 830.96, y: 1155.07))
    path.addLine(to: CGPoint(x: 829.09, y: 1156.2))
    path.addLine(to: CGPoint(x: 827.42, y: 1157.8))
    path.addLine(to: CGPoint(x: 825.95, y: 1159.47))
    path.addLine(to: CGPoint(x: 824.82, y: 1161.87))
    path.addLine(to: CGPoint(x: 824.55, y: 1164.81))
    path.close()
    return path
}

func makeSaitamaPath() -> UIBezierPath {
    let path = UIBezierPath()
    path.move(to: CGPoint(x: 824.47, y: 1269.24))
    path.addLine(to: CGPoint(x: 824.57, y: 1335.18))
    path.addLine(to: CGPoint(x: 825.23, y: 1337.72))
    path.addLine(to: CGPoint(x: 826.17, y: 1339.42))
    path.addLine(to: CGPoint(x: 827.3, y: 1340.84))
    path.addLine(to: CGPoint(x: 829, y: 1342.06))
    path.addLine(to: CGPoint(x: 830.89, y: 1342.54))
    path.addLine(to: CGPoint(x: 967.01, y: 1341.78))
    path.addLine(to: CGPoint(x: 970.03, y: 1340.84))
    path.addLine(to: CGPoint(x: 972.1, y: 1339.52))
    path.addLine(to: CGPoint(x: 973.42, y: 1337.63))
    path.addLine(to: CGPoint(x: 974.55, y: 1335.74))
    path.addLine(to: CGPoint(x: 974.83, y: 1334.83))
    path.addLine(to: CGPoint(x: 974.93, y: 1269.49))
    path.addLine(to: CGPoint(x: 974.77, y: 1267.63))
    path.addLine(to: CGPoint(x: 974.07, y: 1265.89))
    path.addLine(to: CGPoint(x: 972.96, y: 1264.36))
    path.addLine(to: CGPoint(x: 971.86, y: 1262.79))
    path.addLine(to: CGPoint(x: 970.06, y: 1261.69))
    path.addLine(to: CGPoint(x: 968.13, y: 1261.42))
    path.addLine(to: CGPoint(x: 965.26, y: 1261.39))
    path.addLine(to: CGPoint(x: 831.99, y: 1261.66))
    path.addLine(to: CGPoint(x: 830.09, y: 1261.96))
    path.addLine(to: CGPoint(x: 828.66, y: 1262.72))
    path.addLine(to: CGPoint(x: 827.35, y: 1263.72))
    path.addLine(to: CGPoint(x: 826.09, y: 1265.09))
    path.addLine(to: CGPoint(x: 825.22, y: 1266.53))
    path.addLine(to: CGPoint(x: 824.65, y: 1267.66))
    path.addLine(to: CGPoint(x: 824.47, y: 1269.24))
    path.close()
    return path
}

func makeChibaPath() -> UIBezierPath {
    let path = UIBezierPath()
    path.move(to: CGPoint(x: 974.84, y: 1350.18))
    path.addLine(to: CGPoint(x: 974.84, y: 1519.66))
    path.addLine(to: CGPoint(x: 975.17, y: 1522.86))
    path.addLine(to: CGPoint(x: 976.03, y: 1525.46))
    path.addLine(to: CGPoint(x: 977.17, y: 1527.86))
    path.addLine(to: CGPoint(x: 978.5, y: 1529.53))
    path.addLine(to: CGPoint(x: 979.84, y: 1530.47))
    path.addLine(to: CGPoint(x: 981.9, y: 1531.2))
    path.addLine(to: CGPoint(x: 1024.66, y: 1531.27))
    path.addLine(to: CGPoint(x: 1027.73, y: 1530.47))
    path.addLine(to: CGPoint(x: 1029.66, y: 1529.06))
    path.addLine(to: CGPoint(x: 1031.13, y: 1527.33))
    path.addLine(to: CGPoint(x: 1031.8, y: 1525.2))
    path.addLine(to: CGPoint(x: 1032.26, y: 1522.73))
    path.addLine(to: CGPoint(x: 1032, y: 1351.44))
    path.addLine(to: CGPoint(x: 1031.81, y: 1349.19))
    path.addLine(to: CGPoint(x: 1031.06, y: 1347.16))
    path.addLine(to: CGPoint(x: 1030.07, y: 1345.46))
    path.addLine(to: CGPoint(x: 1028.56, y: 1343.76))
    path.addLine(to: CGPoint(x: 1026.86, y: 1342.72))
    path.addLine(to: CGPoint(x: 1024.41, y: 1342.21))
    path.addLine(to: CGPoint(x: 981.58, y: 1342.54))
    path.addLine(to: CGPoint(x: 979.79, y: 1342.77))
    path.addLine(to: CGPoint(x: 978.56, y: 1343.43))
    path.addLine(to: CGPoint(x: 977.24, y: 1344.38))
    path.addLine(to: CGPoint(x: 976.3, y: 1345.55))
    path.addLine(to: CGPoint(x: 975.4, y: 1346.83))
    path.addLine(to: CGPoint(x: 975.03, y: 1347.82))
    path.addLine(to: CGPoint(x: 974.79, y: 1348.9))
    path.addLine(to: CGPoint(x: 974.84, y: 1350.18))
    path.close()
    return path
}

func makeTokyoPath() -> UIBezierPath {
    let path = UIBezierPath()
    path.move(to: CGPoint(x: 899.86, y: 1351.04))
    path.addLine(to: CGPoint(x: 899.73, y: 1415.27))
    path.addLine(to: CGPoint(x: 900.26, y: 1417.14))
    path.addLine(to: CGPoint(x: 901.53, y: 1419.01))
    path.addLine(to: CGPoint(x: 903.13, y: 1420.41))
    path.addLine(to: CGPoint(x: 905, y: 1421.74))
    path.addLine(to: CGPoint(x: 906.8, y: 1422.61))
    path.addLine(to: CGPoint(x: 908.6, y: 1423.01))
    path.addLine(to: CGPoint(x: 964.74, y: 1422.72))
    path.addLine(to: CGPoint(x: 967.95, y: 1422.34))
    path.addLine(to: CGPoint(x: 970.03, y: 1421.58))
    path.addLine(to: CGPoint(x: 971.72, y: 1420.45))
    path.addLine(to: CGPoint(x: 973.42, y: 1418.57))
    path.addLine(to: CGPoint(x: 974.37, y: 1416.3))
    path.addLine(to: CGPoint(x: 974.63, y: 1414.94))
    path.addLine(to: CGPoint(x: 974.65, y: 1351.31))
    path.addLine(to: CGPoint(x: 974.46, y: 1348.2))
    path.addLine(to: CGPoint(x: 973.61, y: 1346.21))
    path.addLine(to: CGPoint(x: 972.48, y: 1344.52))
    path.addLine(to: CGPoint(x: 970.97, y: 1343.29))
    path.addLine(to: CGPoint(x: 969.46, y: 1342.44))
    path.addLine(to: CGPoint(x: 967.29, y: 1341.97))
    path.addLine(to: CGPoint(x: 906.26, y: 1342.44))
    path.addLine(to: CGPoint(x: 904.18, y: 1343.01))
    path.addLine(to: CGPoint(x: 902.77, y: 1343.95))
    path.addLine(to: CGPoint(x: 901.54, y: 1345.18))
    path.addLine(to: CGPoint(x: 900.79, y: 1346.31))
    path.addLine(to: CGPoint(x: 900.03, y: 1347.91))
    path.addLine(to: CGPoint(x: 899.86, y: 1351.04))
    path.close()
    return path
}

func makeKanagawaPath() -> UIBezierPath {
    let path = UIBezierPath()
    path.move(to: CGPoint(x: 843.3, y: 1434.75))
    path.addLine(to: CGPoint(x: 843.36, y: 1519.93))
    path.addLine(to: CGPoint(x: 844.16, y: 1522.59))
    path.addLine(to: CGPoint(x: 845.43, y: 1525.06))
    path.addLine(to: CGPoint(x: 847.23, y: 1527.4))
    path.addLine(to: CGPoint(x: 849.23, y: 1529.33))
    path.addLine(to: CGPoint(x: 851.43, y: 1530.33))
    path.addLine(to: CGPoint(x: 853.1, y: 1530.73))
    path.addLine(to: CGPoint(x: 917.74, y: 1530.73))
    path.addLine(to: CGPoint(x: 920.67, y: 1530.2))
    path.addLine(to: CGPoint(x: 922.58, y: 1529.22))
    path.addLine(to: CGPoint(x: 924.18, y: 1527.9))
    path.addLine(to: CGPoint(x: 925.6, y: 1526.29))
    path.addLine(to: CGPoint(x: 926.73, y: 1524.41))
    path.addLine(to: CGPoint(x: 927.58, y: 1522.8))
    path.addLine(to: CGPoint(x: 928.33, y: 1520.54))
    path.addLine(to: CGPoint(x: 928.33, y: 1434.32))
    path.addLine(to: CGPoint(x: 928.05, y: 1431.68))
    path.addLine(to: CGPoint(x: 927.2, y: 1429.79))
    path.addLine(to: CGPoint(x: 925.6, y: 1427.72))
    path.addLine(to: CGPoint(x: 923.9, y: 1426.21))
    path.addLine(to: CGPoint(x: 921.45, y: 1424.98))
    path.addLine(to: CGPoint(x: 919.37, y: 1424.04))
    path.addLine(to: CGPoint(x: 916, y: 1423.09))
    path.addLine(to: CGPoint(x: 852.25, y: 1423.33))
    path.addLine(to: CGPoint(x: 849.94, y: 1423.57))
    path.addLine(to: CGPoint(x: 848.34, y: 1424.27))
    path.addLine(to: CGPoint(x: 846.74, y: 1425.31))
    path.addLine(to: CGPoint(x: 845.13, y: 1426.96))
    path.addLine(to: CGPoint(x: 844.14, y: 1428.38))
    path.addLine(to: CGPoint(x: 843.39, y: 1429.93))
    path.addLine(to: CGPoint(x: 843.3, y: 1434.75))
    path.close()
    return path
}

func makeNiigataPath() -> UIBezierPath {
    let path = UIBezierPath()
    path.move(to: CGPoint(x: 768.97, y: 1058.03))
    path.addLine(to: CGPoint(x: 768.97, y: 1143.69))
    path.addLine(to: CGPoint(x: 769.72, y: 1146.7))
    path.addLine(to: CGPoint(x: 770.86, y: 1148.78))
    path.addLine(to: CGPoint(x: 772.37, y: 1151.04))
    path.addLine(to: CGPoint(x: 774.25, y: 1152.36))
    path.addLine(to: CGPoint(x: 777.27, y: 1153.87))
    path.addLine(to: CGPoint(x: 852.17, y: 1154.02))
    path.addLine(to: CGPoint(x: 855.23, y: 1153.68))
    path.addLine(to: CGPoint(x: 857.03, y: 1152.69))
    path.addLine(to: CGPoint(x: 858.91, y: 1150.81))
    path.addLine(to: CGPoint(x: 860.56, y: 1148.92))
    path.addLine(to: CGPoint(x: 861.7, y: 1146.85))
    path.addLine(to: CGPoint(x: 862.73, y: 1144.06))
    path.addLine(to: CGPoint(x: 863.06, y: 1056.67))
    path.addLine(to: CGPoint(x: 862.92, y: 1054.64))
    path.addLine(to: CGPoint(x: 862.17, y: 1052.56))
    path.addLine(to: CGPoint(x: 860.85, y: 1050.82))
    path.addLine(to: CGPoint(x: 859.15, y: 1049.02))
    path.addLine(to: CGPoint(x: 857.17, y: 1047.42))
    path.addLine(to: CGPoint(x: 854.67, y: 1046.43))
    path.addLine(to: CGPoint(x: 852.45, y: 1046.01))
    path.addLine(to: CGPoint(x: 777.79, y: 1045.94))
    path.addLine(to: CGPoint(x: 774.99, y: 1047.01))
    path.addLine(to: CGPoint(x: 773.13, y: 1048.34))
    path.addLine(to: CGPoint(x: 771.26, y: 1050.34))
    path.addLine(to: CGPoint(x: 769.79, y: 1052.61))
    path.addLine(to: CGPoint(x: 768.99, y: 1055.01))
    path.addLine(to: CGPoint(x: 768.97, y: 1058.03))
    path.close()
    return path
}

func makeToyamaPath() -> UIBezierPath {
    let path = UIBezierPath()
    path.move(to: CGPoint(x: 674.21, y: 1056.35))
    path.addLine(to: CGPoint(x: 673.81, y: 1143.73))
    path.addLine(to: CGPoint(x: 674.47, y: 1146.26))
    path.addLine(to: CGPoint(x: 675.81, y: 1148.53))
    path.addLine(to: CGPoint(x: 677.28, y: 1150.13))
    path.addLine(to: CGPoint(x: 679.41, y: 1151.73))
    path.addLine(to: CGPoint(x: 681.68, y: 1152.67))
    path.addLine(to: CGPoint(x: 685.28, y: 1153.47))
    path.addLine(to: CGPoint(x: 758.54, y: 1153.5))
    path.addLine(to: CGPoint(x: 761.46, y: 1152.93))
    path.addLine(to: CGPoint(x: 763.44, y: 1151.89))
    path.addLine(to: CGPoint(x: 764.95, y: 1150.67))
    path.addLine(to: CGPoint(x: 766.46, y: 1149.16))
    path.addLine(to: CGPoint(x: 767.31, y: 1147.65))
    path.addLine(to: CGPoint(x: 767.82, y: 1143.73))
    path.addLine(to: CGPoint(x: 767.82, y: 1055.6))
    path.addLine(to: CGPoint(x: 767.46, y: 1053.01))
    path.addLine(to: CGPoint(x: 766.59, y: 1050.75))
    path.addLine(to: CGPoint(x: 765.12, y: 1048.81))
    path.addLine(to: CGPoint(x: 763.72, y: 1047.61))
    path.addLine(to: CGPoint(x: 762.19, y: 1046.81))
    path.addLine(to: CGPoint(x: 759.79, y: 1046.08))
    path.addLine(to: CGPoint(x: 683.26, y: 1046.15))
    path.addLine(to: CGPoint(x: 680.88, y: 1046.41))
    path.addLine(to: CGPoint(x: 678.98, y: 1047.21))
    path.addLine(to: CGPoint(x: 677.44, y: 1048.44))
    path.addLine(to: CGPoint(x: 676.24, y: 1050.01))
    path.addLine(to: CGPoint(x: 675.51, y: 1051.28))
    path.addLine(to: CGPoint(x: 674.91, y: 1052.81))
    path.addLine(to: CGPoint(x: 674.41, y: 1054.28))
    path.addLine(to: CGPoint(x: 674.21, y: 1056.35))
    path.close()
    return path
}

func makeIshikawaPath() -> UIBezierPath {
    let path = UIBezierPath()
    path.move(to: CGPoint(x: 617.51, y: 974.17))
    path.addLine(to: CGPoint(x: 617.51, y: 1145.73))
    path.addLine(to: CGPoint(x: 618.04, y: 1148.26))
    path.addLine(to: CGPoint(x: 618.98, y: 1150))
    path.addLine(to: CGPoint(x: 620.58, y: 1151.73))
    path.addLine(to: CGPoint(x: 622.71, y: 1152.93))
    path.addLine(to: CGPoint(x: 624.45, y: 1153.6))
    path.addLine(to: CGPoint(x: 665, y: 1153.47))
    path.addLine(to: CGPoint(x: 667.27, y: 1153.2))
    path.addLine(to: CGPoint(x: 669.8, y: 1152.27))
    path.addLine(to: CGPoint(x: 671.67, y: 1150.93))
    path.addLine(to: CGPoint(x: 672.87, y: 1149.2))
    path.addLine(to: CGPoint(x: 673.41, y: 1147.06))
    path.addLine(to: CGPoint(x: 673.66, y: 1143.73))
    path.addLine(to: CGPoint(x: 673.66, y: 974.08))
    path.addLine(to: CGPoint(x: 673.45, y: 972.15))
    path.addLine(to: CGPoint(x: 672.7, y: 970.4))
    path.addLine(to: CGPoint(x: 671.94, y: 969.08))
    path.addLine(to: CGPoint(x: 670.9, y: 967.9))
    path.addLine(to: CGPoint(x: 669.68, y: 966.91))
    path.addLine(to: CGPoint(x: 667.98, y: 965.97))
    path.addLine(to: CGPoint(x: 666.23, y: 965.4))
    path.addLine(to: CGPoint(x: 623.78, y: 965.35))
    path.addLine(to: CGPoint(x: 621.8, y: 965.68))
    path.addLine(to: CGPoint(x: 620.62, y: 966.44))
    path.addLine(to: CGPoint(x: 619.21, y: 967.81))
    path.addLine(to: CGPoint(x: 618.17, y: 969.41))
    path.addLine(to: CGPoint(x: 617.7, y: 970.97))
    path.addLine(to: CGPoint(x: 617.51, y: 974.17))
    path.close()
    return path
}

func makeFukuiPath() -> UIBezierPath {
    let path = UIBezierPath()
    path.move(to: CGPoint(x: 504.65, y: 1164.94))
    path.addLine(to: CGPoint(x: 504.65, y: 1252.45))
    path.addLine(to: CGPoint(x: 505.45, y: 1255.39))
    path.addLine(to: CGPoint(x: 506.92, y: 1257.65))
    path.addLine(to: CGPoint(x: 508.65, y: 1259.79))
    path.addLine(to: CGPoint(x: 509.99, y: 1260.99))
    path.addLine(to: CGPoint(x: 512.25, y: 1261.79))
    path.addLine(to: CGPoint(x: 663.93, y: 1260.99))
    path.addLine(to: CGPoint(x: 666.34, y: 1260.59))
    path.addLine(to: CGPoint(x: 668.07, y: 1259.52))
    path.addLine(to: CGPoint(x: 669.8, y: 1257.65))
    path.addLine(to: CGPoint(x: 671.01, y: 1255.52))
    path.addLine(to: CGPoint(x: 671.94, y: 1253.25))
    path.addLine(to: CGPoint(x: 672.51, y: 1251.35))
    path.addLine(to: CGPoint(x: 673.32, y: 1248.33))
    path.addLine(to: CGPoint(x: 673.45, y: 1165.76))
    path.addLine(to: CGPoint(x: 673.36, y: 1162.27))
    path.addLine(to: CGPoint(x: 672.7, y: 1160.1))
    path.addLine(to: CGPoint(x: 671.37, y: 1158.21))
    path.addLine(to: CGPoint(x: 669.11, y: 1156.23))
    path.addLine(to: CGPoint(x: 666.94, y: 1155.19))
    path.addLine(to: CGPoint(x: 663.73, y: 1154.16))
    path.addLine(to: CGPoint(x: 661.64, y: 1153.6))
    path.addLine(to: CGPoint(x: 516.01, y: 1154.06))
    path.addLine(to: CGPoint(x: 512.24, y: 1154.44))
    path.addLine(to: CGPoint(x: 509.79, y: 1155.48))
    path.addLine(to: CGPoint(x: 507.99, y: 1156.89))
    path.addLine(to: CGPoint(x: 506.48, y: 1158.78))
    path.addLine(to: CGPoint(x: 505.26, y: 1160.67))
    path.addLine(to: CGPoint(x: 504.69, y: 1162.08))
    path.addLine(to: CGPoint(x: 504.65, y: 1164.94))
    path.close()
    return path
}

func makeYamanashiPath() -> UIBezierPath {
    let path = UIBezierPath()
    path.move(to: CGPoint(x: 824.45, y: 1348.37))
    path.addLine(to: CGPoint(x: 824.42, y: 1413.5))
    path.addLine(to: CGPoint(x: 824.59, y: 1415.37))
    path.addLine(to: CGPoint(x: 824.85, y: 1416.91))
    path.addLine(to: CGPoint(x: 825.35, y: 1418.37))
    path.addLine(to: CGPoint(x: 826.15, y: 1419.84))
    path.addLine(to: CGPoint(x: 827.22, y: 1421.04))
    path.addLine(to: CGPoint(x: 828.62, y: 1422.01))
    path.addLine(to: CGPoint(x: 830.29, y: 1422.88))
    path.addLine(to: CGPoint(x: 892.02, y: 1422.88))
    path.addLine(to: CGPoint(x: 893.62, y: 1422.77))
    path.addLine(to: CGPoint(x: 894.82, y: 1422.41))
    path.addLine(to: CGPoint(x: 896.32, y: 1421.41))
    path.addLine(to: CGPoint(x: 897.22, y: 1420.44))
    path.addLine(to: CGPoint(x: 898.03, y: 1419.21))
    path.addLine(to: CGPoint(x: 898.69, y: 1417.91))
    path.addLine(to: CGPoint(x: 899.13, y: 1416.5))
    path.addLine(to: CGPoint(x: 899.52, y: 1415.02))
    path.addLine(to: CGPoint(x: 899.73, y: 1349.47))
    path.addLine(to: CGPoint(x: 899.63, y: 1348.17))
    path.addLine(to: CGPoint(x: 899.43, y: 1347.13))
    path.addLine(to: CGPoint(x: 898.76, y: 1346.03))
    path.addLine(to: CGPoint(x: 897.96, y: 1345.07))
    path.addLine(to: CGPoint(x: 897.02, y: 1344.2))
    path.addLine(to: CGPoint(x: 895.86, y: 1343.57))
    path.addLine(to: CGPoint(x: 894.16, y: 1342.97))
    path.addLine(to: CGPoint(x: 891.72, y: 1342.33))
    path.addLine(to: CGPoint(x: 831.39, y: 1342.63))
    path.addLine(to: CGPoint(x: 829.72, y: 1342.7))
    path.addLine(to: CGPoint(x: 828.79, y: 1342.93))
    path.addLine(to: CGPoint(x: 827.52, y: 1343.5))
    path.addLine(to: CGPoint(x: 826.35, y: 1344.17))
    path.addLine(to: CGPoint(x: 825.49, y: 1344.9))
    path.addLine(to: CGPoint(x: 824.85, y: 1345.63))
    path.addLine(to: CGPoint(x: 824.59, y: 1346.6))
    path.addLine(to: CGPoint(x: 824.45, y: 1348.37))
    path.close()
    return path
}

func makeNaganoPath() -> UIBezierPath {
    let path = UIBezierPath()
    path.move(to: CGPoint(x: 749.11, y: 1165.47))
    path.addLine(to: CGPoint(x: 749.11, y: 1411.67))
    path.addLine(to: CGPoint(x: 749.51, y: 1414.2))
    path.addLine(to: CGPoint(x: 750.45, y: 1416.67))
    path.addLine(to: CGPoint(x: 751.78, y: 1418.41))
    path.addLine(to: CGPoint(x: 753.65, y: 1420.27))
    path.addLine(to: CGPoint(x: 755.85, y: 1421.87))
    path.addLine(to: CGPoint(x: 758.65, y: 1423.08))
    path.addLine(to: CGPoint(x: 814.28, y: 1422.88))
    path.addLine(to: CGPoint(x: 817.15, y: 1422.21))
    path.addLine(to: CGPoint(x: 819.48, y: 1420.67))
    path.addLine(to: CGPoint(x: 821.48, y: 1418.47))
    path.addLine(to: CGPoint(x: 822.75, y: 1416.47))
    path.addLine(to: CGPoint(x: 824.29, y: 1413.4))
    path.addLine(to: CGPoint(x: 824.29, y: 1164.82))
    path.addLine(to: CGPoint(x: 824.09, y: 1162.2))
    path.addLine(to: CGPoint(x: 823.42, y: 1159.94))
    path.addLine(to: CGPoint(x: 822.15, y: 1157.73))
    path.addLine(to: CGPoint(x: 820.55, y: 1156.13))
    path.addLine(to: CGPoint(x: 818.48, y: 1154.93))
    path.addLine(to: CGPoint(x: 816.03, y: 1154.1))
    path.addLine(to: CGPoint(x: 757.98, y: 1154.1))
    path.addLine(to: CGPoint(x: 755.25, y: 1154.5))
    path.addLine(to: CGPoint(x: 753.88, y: 1155.23))
    path.addLine(to: CGPoint(x: 752.22, y: 1156.67))
    path.addLine(to: CGPoint(x: 750.88, y: 1158.27))
    path.addLine(to: CGPoint(x: 749.91, y: 1160.04))
    path.addLine(to: CGPoint(x: 749.25, y: 1161.97))
    path.addLine(to: CGPoint(x: 749.08, y: 1163.07))
    path.addLine(to: CGPoint(x: 749.11, y: 1165.47))
    path.close()
    return path
}

func makeGifuPath() -> UIBezierPath {
    let path = UIBezierPath()
    path.move(to: CGPoint(x: 673.59, y: 1163.02))
    path.addLine(to: CGPoint(x: 674.11, y: 1413.66))
    path.addLine(to: CGPoint(x: 674.49, y: 1416.11))
    path.addLine(to: CGPoint(x: 675.24, y: 1418))
    path.addLine(to: CGPoint(x: 676.47, y: 1419.98))
    path.addLine(to: CGPoint(x: 677.51, y: 1421.02))
    path.addLine(to: CGPoint(x: 678.92, y: 1422.06))
    path.addLine(to: CGPoint(x: 681, y: 1423))
    path.addLine(to: CGPoint(x: 741.09, y: 1422.72))
    path.addLine(to: CGPoint(x: 743.82, y: 1421.68))
    path.addLine(to: CGPoint(x: 745.99, y: 1419.89))
    path.addLine(to: CGPoint(x: 747.59, y: 1417.43))
    path.addLine(to: CGPoint(x: 748.44, y: 1415.45))
    path.addLine(to: CGPoint(x: 748.96, y: 1412.41))
    path.addLine(to: CGPoint(x: 748.91, y: 1164.04))
    path.addLine(to: CGPoint(x: 748.58, y: 1161.54))
    path.addLine(to: CGPoint(x: 747.85, y: 1159.4))
    path.addLine(to: CGPoint(x: 746.58, y: 1157.33))
    path.addLine(to: CGPoint(x: 744.51, y: 1155.53))
    path.addLine(to: CGPoint(x: 742.24, y: 1154.27))
    path.addLine(to: CGPoint(x: 739.79, y: 1153.54))
    path.addLine(to: CGPoint(x: 682.53, y: 1153.59))
    path.addLine(to: CGPoint(x: 680.55, y: 1153.9))
    path.addLine(to: CGPoint(x: 679.16, y: 1154.32))
    path.addLine(to: CGPoint(x: 677.93, y: 1154.93))
    path.addLine(to: CGPoint(x: 676.75, y: 1155.81))
    path.addLine(to: CGPoint(x: 675.76, y: 1156.85))
    path.addLine(to: CGPoint(x: 674.79, y: 1158))
    path.addLine(to: CGPoint(x: 673.97, y: 1159.25))
    path.addLine(to: CGPoint(x: 673.59, y: 1160.43))
    path.addLine(to: CGPoint(x: 673.59, y: 1163.02))
    path.close()
    return path
}

func makeShizuokaPath() -> UIBezierPath {
    let path = UIBezierPath()
    path.move(to: CGPoint(x: 758.82, y: 1433.19))
    path.addLine(to: CGPoint(x: 758.72, y: 1520.44))
    path.addLine(to: CGPoint(x: 759.29, y: 1523.27))
    path.addLine(to: CGPoint(x: 760.05, y: 1525.35))
    path.addLine(to: CGPoint(x: 761.27, y: 1527.33))
    path.addLine(to: CGPoint(x: 762.69, y: 1528.84))
    path.addLine(to: CGPoint(x: 764.48, y: 1530.07))
    path.addLine(to: CGPoint(x: 766.84, y: 1530.63))
    path.addLine(to: CGPoint(x: 833.06, y: 1530.44))
    path.addLine(to: CGPoint(x: 835.51, y: 1529.97))
    path.addLine(to: CGPoint(x: 837.87, y: 1528.74))
    path.addLine(to: CGPoint(x: 839.94, y: 1526.95))
    path.addLine(to: CGPoint(x: 841.45, y: 1524.78))
    path.addLine(to: CGPoint(x: 842.4, y: 1522.33))
    path.addLine(to: CGPoint(x: 843.21, y: 1519.83))
    path.addLine(to: CGPoint(x: 843.23, y: 1429.88))
    path.addLine(to: CGPoint(x: 842.9, y: 1428.18))
    path.addLine(to: CGPoint(x: 841.83, y: 1426.64))
    path.addLine(to: CGPoint(x: 839.79, y: 1425.28))
    path.addLine(to: CGPoint(x: 837.79, y: 1424.48))
    path.addLine(to: CGPoint(x: 835.69, y: 1423.91))
    path.addLine(to: CGPoint(x: 831.82, y: 1423.14))
    path.addLine(to: CGPoint(x: 765.3, y: 1423.14))
    path.addLine(to: CGPoint(x: 763.19, y: 1423.74))
    path.addLine(to: CGPoint(x: 761.25, y: 1424.81))
    path.addLine(to: CGPoint(x: 760.12, y: 1426.14))
    path.addLine(to: CGPoint(x: 759.05, y: 1427.94))
    path.addLine(to: CGPoint(x: 758.82, y: 1433.19))
    path.close()
    return path
}

func makeAichiPath() -> UIBezierPath {
    let path = UIBezierPath()
    path.move(to: CGPoint(x: 674.07, y: 1431.45))
    path.addLine(to: CGPoint(x: 673.97, y: 1521.93))
    path.addLine(to: CGPoint(x: 674.37, y: 1523.86))
    path.addLine(to: CGPoint(x: 675.44, y: 1525.43))
    path.addLine(to: CGPoint(x: 676.87, y: 1526.86))
    path.addLine(to: CGPoint(x: 678.58, y: 1528.2))
    path.addLine(to: CGPoint(x: 680.08, y: 1529.16))
    path.addLine(to: CGPoint(x: 682.08, y: 1529.87))
    path.addLine(to: CGPoint(x: 685.18, y: 1530.6))
    path.addLine(to: CGPoint(x: 748.58, y: 1530.6))
    path.addLine(to: CGPoint(x: 751.85, y: 1530.13))
    path.addLine(to: CGPoint(x: 754.12, y: 1529))
    path.addLine(to: CGPoint(x: 755.98, y: 1527.53))
    path.addLine(to: CGPoint(x: 757.45, y: 1525.4))
    path.addLine(to: CGPoint(x: 758.05, y: 1523.13))
    path.addLine(to: CGPoint(x: 758.57, y: 1520.42))
    path.addLine(to: CGPoint(x: 758.57, y: 1432.41))
    path.addLine(to: CGPoint(x: 758.25, y: 1430.01))
    path.addLine(to: CGPoint(x: 757.48, y: 1428.18))
    path.addLine(to: CGPoint(x: 756.52, y: 1426.61))
    path.addLine(to: CGPoint(x: 755.35, y: 1425.41))
    path.addLine(to: CGPoint(x: 753.72, y: 1424.14))
    path.addLine(to: CGPoint(x: 752.01, y: 1423.21))
    path.addLine(to: CGPoint(x: 750.35, y: 1422.94))
    path.addLine(to: CGPoint(x: 681.01, y: 1423.18))
    path.addLine(to: CGPoint(x: 679.31, y: 1423.34))
    path.addLine(to: CGPoint(x: 677.74, y: 1423.78))
    path.addLine(to: CGPoint(x: 676.44, y: 1424.61))
    path.addLine(to: CGPoint(x: 675.47, y: 1425.68))
    path.addLine(to: CGPoint(x: 674.67, y: 1426.98))
    path.addLine(to: CGPoint(x: 674.31, y: 1428.18))
    path.addLine(to: CGPoint(x: 674.07, y: 1431.45))
    path.close()
    return path
}

func makeMiePath() -> UIBezierPath {
    let path = UIBezierPath()
    path.move(to: CGPoint(x: 617.41, y: 1456.56))
    path.addLine(to: CGPoint(x: 617.31, y: 1629.92))
    path.addLine(to: CGPoint(x: 617.53, y: 1631.74))
    path.addLine(to: CGPoint(x: 617.93, y: 1632.98))
    path.addLine(to: CGPoint(x: 618.41, y: 1634.22))
    path.addLine(to: CGPoint(x: 619.08, y: 1635.19))
    path.addLine(to: CGPoint(x: 620.36, y: 1636.25))
    path.addLine(to: CGPoint(x: 621.95, y: 1637.22))
    path.addLine(to: CGPoint(x: 623.98, y: 1637.89))
    path.addLine(to: CGPoint(x: 668.44, y: 1637.84))
    path.addLine(to: CGPoint(x: 670.43, y: 1637.58))
    path.addLine(to: CGPoint(x: 671.58, y: 1636.96))
    path.addLine(to: CGPoint(x: 672.42, y: 1636.03))
    path.addLine(to: CGPoint(x: 673.17, y: 1634.7))
    path.addLine(to: CGPoint(x: 673.66, y: 1633.24))
    path.addLine(to: CGPoint(x: 674.01, y: 1631.74))
    path.addLine(to: CGPoint(x: 673.62, y: 1457.99))
    path.addLine(to: CGPoint(x: 673.56, y: 1455.86))
    path.addLine(to: CGPoint(x: 673.22, y: 1453.93))
    path.addLine(to: CGPoint(x: 672.44, y: 1452.68))
    path.addLine(to: CGPoint(x: 671, y: 1451.18))
    path.addLine(to: CGPoint(x: 669.66, y: 1450.49))
    path.addLine(to: CGPoint(x: 667.31, y: 1449.93))
    path.addLine(to: CGPoint(x: 623.03, y: 1450.02))
    path.addLine(to: CGPoint(x: 621.34, y: 1450.33))
    path.addLine(to: CGPoint(x: 620.16, y: 1451.15))
    path.addLine(to: CGPoint(x: 618.88, y: 1452.36))
    path.addLine(to: CGPoint(x: 617.84, y: 1453.83))
    path.addLine(to: CGPoint(x: 617.47, y: 1455.18))
    path.addLine(to: CGPoint(x: 617.41, y: 1456.56))
    path.close()
    return path
}

func makeShigaPath() -> UIBezierPath {
    let path = UIBezierPath()
    path.move(to: CGPoint(x: 617.51, y: 1269.39))
    path.addLine(to: CGPoint(x: 617.44, y: 1442.02))
    path.addLine(to: CGPoint(x: 617.78, y: 1444.82))
    path.addLine(to: CGPoint(x: 618.58, y: 1446.69))
    path.addLine(to: CGPoint(x: 619.78, y: 1448.16))
    path.addLine(to: CGPoint(x: 621.18, y: 1449.16))
    path.addLine(to: CGPoint(x: 623.05, y: 1449.89))
    path.addLine(to: CGPoint(x: 666.4, y: 1449.76))
    path.addLine(to: CGPoint(x: 668.8, y: 1449.49))
    path.addLine(to: CGPoint(x: 670.47, y: 1448.69))
    path.addLine(to: CGPoint(x: 671.74, y: 1447.62))
    path.addLine(to: CGPoint(x: 672.67, y: 1446.15))
    path.addLine(to: CGPoint(x: 673.41, y: 1444.49))
    path.addLine(to: CGPoint(x: 673.88, y: 1442.73))
    path.addLine(to: CGPoint(x: 673.64, y: 1269.83))
    path.addLine(to: CGPoint(x: 673.5, y: 1267.45))
    path.addLine(to: CGPoint(x: 673.26, y: 1265.75))
    path.addLine(to: CGPoint(x: 672.74, y: 1264.52))
    path.addLine(to: CGPoint(x: 671.99, y: 1263.39))
    path.addLine(to: CGPoint(x: 671, y: 1262.45))
    path.addLine(to: CGPoint(x: 669.58, y: 1261.79))
    path.addLine(to: CGPoint(x: 668.12, y: 1261.36))
    path.addLine(to: CGPoint(x: 666.38, y: 1261.15))
    path.addLine(to: CGPoint(x: 623.31, y: 1261.29))
    path.addLine(to: CGPoint(x: 621.62, y: 1261.55))
    path.addLine(to: CGPoint(x: 620.51, y: 1262.09))
    path.addLine(to: CGPoint(x: 619.66, y: 1262.83))
    path.addLine(to: CGPoint(x: 619, y: 1263.56))
    path.addLine(to: CGPoint(x: 618.38, y: 1264.38))
    path.addLine(to: CGPoint(x: 617.89, y: 1265.28))
    path.addLine(to: CGPoint(x: 617.58, y: 1266.1))
    path.addLine(to: CGPoint(x: 617.51, y: 1269.39))
    path.close()
    return path
}

func makeKyotoPath() -> UIBezierPath {
    let path = UIBezierPath()
    path.move(to: CGPoint(x: 504.56, y: 1269.18))
    path.addLine(to: CGPoint(x: 504.56, y: 1335.36))
    path.addLine(to: CGPoint(x: 505.06, y: 1337.36))
    path.addLine(to: CGPoint(x: 506.12, y: 1339.11))
    path.addLine(to: CGPoint(x: 507.38, y: 1340.43))
    path.addLine(to: CGPoint(x: 508.56, y: 1341.55))
    path.addLine(to: CGPoint(x: 510.25, y: 1342.3))
    path.addLine(to: CGPoint(x: 611.92, y: 1342.05))
    path.addLine(to: CGPoint(x: 613.55, y: 1341.7))
    path.addLine(to: CGPoint(x: 615.1, y: 1340.77))
    path.addLine(to: CGPoint(x: 616.07, y: 1339.71))
    path.addLine(to: CGPoint(x: 616.82, y: 1338.12))
    path.addLine(to: CGPoint(x: 617.31, y: 1336.39))
    path.addLine(to: CGPoint(x: 617.31, y: 1267.32))
    path.addLine(to: CGPoint(x: 617.13, y: 1265.28))
    path.addLine(to: CGPoint(x: 616.56, y: 1263.65))
    path.addLine(to: CGPoint(x: 615.36, y: 1262.32))
    path.addLine(to: CGPoint(x: 613.82, y: 1261.66))
    path.addLine(to: CGPoint(x: 611.52, y: 1261.35))
    path.addLine(to: CGPoint(x: 512.08, y: 1261.97))
    path.addLine(to: CGPoint(x: 509.43, y: 1262.23))
    path.addLine(to: CGPoint(x: 507.35, y: 1263.07))
    path.addLine(to: CGPoint(x: 505.98, y: 1264.27))
    path.addLine(to: CGPoint(x: 505.01, y: 1265.64))
    path.addLine(to: CGPoint(x: 504.52, y: 1267.27))
    path.addLine(to: CGPoint(x: 504.56, y: 1269.18))
    path.close()
    return path
}

func makeOsakaPath() -> UIBezierPath {
    let path = UIBezierPath()
    path.move(to: CGPoint(x: 504.44, y: 1348.46))
    path.addLine(to: CGPoint(x: 504.26, y: 1469.28))
    path.addLine(to: CGPoint(x: 504.66, y: 1471.49))
    path.addLine(to: CGPoint(x: 505.58, y: 1473.53))
    path.addLine(to: CGPoint(x: 506.87, y: 1475.21))
    path.addLine(to: CGPoint(x: 508.46, y: 1476.44))
    path.addLine(to: CGPoint(x: 510.09, y: 1476.89))
    path.addLine(to: CGPoint(x: 555.26, y: 1476.66))
    path.addLine(to: CGPoint(x: 557.34, y: 1476.36))
    path.addLine(to: CGPoint(x: 558.71, y: 1475.56))
    path.addLine(to: CGPoint(x: 559.9, y: 1474.37))
    path.addLine(to: CGPoint(x: 560.61, y: 1472.86))
    path.addLine(to: CGPoint(x: 560.92, y: 1471.58))
    path.addLine(to: CGPoint(x: 560.78, y: 1347.11))
    path.addLine(to: CGPoint(x: 560.66, y: 1345.36))
    path.addLine(to: CGPoint(x: 560.28, y: 1344.36))
    path.addLine(to: CGPoint(x: 559.37, y: 1343.33))
    path.addLine(to: CGPoint(x: 558.5, y: 1342.68))
    path.addLine(to: CGPoint(x: 557.31, y: 1342.24))
    path.addLine(to: CGPoint(x: 510.16, y: 1342.4))
    path.addLine(to: CGPoint(x: 508.75, y: 1342.61))
    path.addLine(to: CGPoint(x: 507.72, y: 1343.02))
    path.addLine(to: CGPoint(x: 506.78, y: 1343.55))
    path.addLine(to: CGPoint(x: 505.97, y: 1344.21))
    path.addLine(to: CGPoint(x: 505.34, y: 1344.83))
    path.addLine(to: CGPoint(x: 504.78, y: 1345.61))
    path.addLine(to: CGPoint(x: 504.58, y: 1346.32))
    path.addLine(to: CGPoint(x: 504.45, y: 1346.94))
    path.addLine(to: CGPoint(x: 504.44, y: 1348.46))
    path.close()
    return path
}

func makeHyogoPath() -> UIBezierPath {
    let path = UIBezierPath()
    path.move(to: CGPoint(x: 447.5, y: 1160.86))
    path.addLine(to: CGPoint(x: 447.5, y: 1414.86))
    path.addLine(to: CGPoint(x: 448.12, y: 1417.61))
    path.addLine(to: CGPoint(x: 449.38, y: 1419.86))
    path.addLine(to: CGPoint(x: 451, y: 1421.61))
    path.addLine(to: CGPoint(x: 453.12, y: 1422.61))
    path.addLine(to: CGPoint(x: 496.38, y: 1422.49))
    path.addLine(to: CGPoint(x: 499.12, y: 1421.86))
    path.addLine(to: CGPoint(x: 501, y: 1420.74))
    path.addLine(to: CGPoint(x: 502.12, y: 1419.11))
    path.addLine(to: CGPoint(x: 502.88, y: 1417.11))
    path.addLine(to: CGPoint(x: 503.93, y: 1413.52))
    path.addLine(to: CGPoint(x: 504.47, y: 1162.05))
    path.addLine(to: CGPoint(x: 504.28, y: 1159.8))
    path.addLine(to: CGPoint(x: 503.56, y: 1157.58))
    path.addLine(to: CGPoint(x: 502.5, y: 1155.96))
    path.addLine(to: CGPoint(x: 500.91, y: 1154.46))
    path.addLine(to: CGPoint(x: 498.97, y: 1153.49))
    path.addLine(to: CGPoint(x: 452.81, y: 1153.43))
    path.addLine(to: CGPoint(x: 450.88, y: 1153.86))
    path.addLine(to: CGPoint(x: 449.44, y: 1154.8))
    path.addLine(to: CGPoint(x: 448.56, y: 1155.99))
    path.addLine(to: CGPoint(x: 447.88, y: 1157.24))
    path.addLine(to: CGPoint(x: 447.44, y: 1158.61))
    path.addLine(to: CGPoint(x: 447.5, y: 1160.86))
    path.close()
    return path
}

func makeNaraPath() -> UIBezierPath {
    let path = UIBezierPath()
    path.move(to: CGPoint(x: 560.96, y: 1349.47))
    path.addLine(to: CGPoint(x: 560.96, y: 1469.55))
    path.addLine(to: CGPoint(x: 561.23, y: 1471.71))
    path.addLine(to: CGPoint(x: 561.84, y: 1473.26))
    path.addLine(to: CGPoint(x: 562.77, y: 1474.85))
    path.addLine(to: CGPoint(x: 563.7, y: 1475.91))
    path.addLine(to: CGPoint(x: 565.47, y: 1476.66))
    path.addLine(to: CGPoint(x: 610, y: 1476.61))
    path.addLine(to: CGPoint(x: 612.88, y: 1476.11))
    path.addLine(to: CGPoint(x: 614.88, y: 1474.86))
    path.addLine(to: CGPoint(x: 616.13, y: 1472.99))
    path.addLine(to: CGPoint(x: 616.82, y: 1471.32))
    path.addLine(to: CGPoint(x: 617.24, y: 1470.15))
    path.addLine(to: CGPoint(x: 617.24, y: 1348.24))
    path.addLine(to: CGPoint(x: 617.06, y: 1346.3))
    path.addLine(to: CGPoint(x: 616.44, y: 1344.8))
    path.addLine(to: CGPoint(x: 615.22, y: 1343.33))
    path.addLine(to: CGPoint(x: 613.94, y: 1342.52))
    path.addLine(to: CGPoint(x: 611.91, y: 1342.14))
    path.addLine(to: CGPoint(x: 565.94, y: 1342.3))
    path.addLine(to: CGPoint(x: 564, y: 1342.58))
    path.addLine(to: CGPoint(x: 562.69, y: 1343.21))
    path.addLine(to: CGPoint(x: 561.81, y: 1344.02))
    path.addLine(to: CGPoint(x: 561.22, y: 1345.08))
    path.addLine(to: CGPoint(x: 560.91, y: 1346.33))
    path.addLine(to: CGPoint(x: 560.96, y: 1349.47))
    path.close()
    return path
}

func makeWakayamaPath() -> UIBezierPath {
    let path = UIBezierPath()
    path.move(to: CGPoint(x: 504.08, y: 1486.12))
    path.addLine(to: CGPoint(x: 504.26, y: 1573.18))
    path.addLine(to: CGPoint(x: 504.79, y: 1576.37))
    path.addLine(to: CGPoint(x: 505.67, y: 1578.93))
    path.addLine(to: CGPoint(x: 507, y: 1580.87))
    path.addLine(to: CGPoint(x: 508.5, y: 1582.73))
    path.addLine(to: CGPoint(x: 510.09, y: 1584.06))
    path.addLine(to: CGPoint(x: 512.21, y: 1584.68))
    path.addLine(to: CGPoint(x: 607.41, y: 1584.59))
    path.addLine(to: CGPoint(x: 609.84, y: 1584.33))
    path.addLine(to: CGPoint(x: 611.75, y: 1583.52))
    path.addLine(to: CGPoint(x: 613.22, y: 1582.43))
    path.addLine(to: CGPoint(x: 614.56, y: 1580.9))
    path.addLine(to: CGPoint(x: 615.66, y: 1579.18))
    path.addLine(to: CGPoint(x: 616.44, y: 1577.24))
    path.addLine(to: CGPoint(x: 617.2, y: 1574.4))
    path.addLine(to: CGPoint(x: 617.3, y: 1485.35))
    path.addLine(to: CGPoint(x: 617.18, y: 1483.43))
    path.addLine(to: CGPoint(x: 616.6, y: 1481.66))
    path.addLine(to: CGPoint(x: 615.76, y: 1480.07))
    path.addLine(to: CGPoint(x: 614.74, y: 1478.83))
    path.addLine(to: CGPoint(x: 613.37, y: 1477.81))
    path.addLine(to: CGPoint(x: 611.96, y: 1477.2))
    path.addLine(to: CGPoint(x: 610.06, y: 1476.75))
    path.addLine(to: CGPoint(x: 510.71, y: 1476.97))
    path.addLine(to: CGPoint(x: 508.63, y: 1477.55))
    path.addLine(to: CGPoint(x: 506.95, y: 1478.57))
    path.addLine(to: CGPoint(x: 505.76, y: 1479.71))
    path.addLine(to: CGPoint(x: 504.79, y: 1481.04))
    path.addLine(to: CGPoint(x: 504.04, y: 1482.5))
    path.addLine(to: CGPoint(x: 504.08, y: 1486.12))
    path.close()
    return path
}

func makeTottoriPath() -> UIBezierPath {
    let path = UIBezierPath()
    path.move(to: CGPoint(x: 390.56, y: 1160.99))
    path.addLine(to: CGPoint(x: 390.5, y: 1280.93))
    path.addLine(to: CGPoint(x: 390.88, y: 1282.74))
    path.addLine(to: CGPoint(x: 391.31, y: 1284.05))
    path.addLine(to: CGPoint(x: 392, y: 1285.11))
    path.addLine(to: CGPoint(x: 392.81, y: 1285.93))
    path.addLine(to: CGPoint(x: 393.88, y: 1286.86))
    path.addLine(to: CGPoint(x: 395.06, y: 1287.43))
    path.addLine(to: CGPoint(x: 441.75, y: 1287.36))
    path.addLine(to: CGPoint(x: 443.48, y: 1287.13))
    path.addLine(to: CGPoint(x: 444.98, y: 1286.42))
    path.addLine(to: CGPoint(x: 446.39, y: 1285.27))
    path.addLine(to: CGPoint(x: 447.01, y: 1284.3))
    path.addLine(to: CGPoint(x: 447.41, y: 1283.35))
    path.addLine(to: CGPoint(x: 447.28, y: 1158.93))
    path.addLine(to: CGPoint(x: 446.97, y: 1157.49))
    path.addLine(to: CGPoint(x: 446.28, y: 1156.36))
    path.addLine(to: CGPoint(x: 445.28, y: 1155.18))
    path.addLine(to: CGPoint(x: 444.16, y: 1154.3))
    path.addLine(to: CGPoint(x: 442.72, y: 1153.65))
    path.addLine(to: CGPoint(x: 441.06, y: 1153.3))
    path.addLine(to: CGPoint(x: 395.88, y: 1153.31))
    path.addLine(to: CGPoint(x: 393.8, y: 1153.71))
    path.addLine(to: CGPoint(x: 392.3, y: 1154.55))
    path.addLine(to: CGPoint(x: 391.37, y: 1155.79))
    path.addLine(to: CGPoint(x: 390.88, y: 1157.2))
    path.addLine(to: CGPoint(x: 390.49, y: 1158.66))
    path.addLine(to: CGPoint(x: 390.56, y: 1160.99))
    path.close()
    return path
}

func makeShimanePath() -> UIBezierPath {
    let path = UIBezierPath()
    path.move(to: CGPoint(x: 333.74, y: 1159.67))
    path.addLine(to: CGPoint(x: 333.7, y: 1280.59))
    path.addLine(to: CGPoint(x: 333.96, y: 1282.4))
    path.addLine(to: CGPoint(x: 334.49, y: 1283.77))
    path.addLine(to: CGPoint(x: 335.25, y: 1284.96))
    path.addLine(to: CGPoint(x: 336.17, y: 1285.98))
    path.addLine(to: CGPoint(x: 337.46, y: 1286.99))
    path.addLine(to: CGPoint(x: 339, y: 1287.66))
    path.addLine(to: CGPoint(x: 384.7, y: 1287.61))
    path.addLine(to: CGPoint(x: 386.69, y: 1287.26))
    path.addLine(to: CGPoint(x: 388.15, y: 1286.46))
    path.addLine(to: CGPoint(x: 389.25, y: 1285.32))
    path.addLine(to: CGPoint(x: 390, y: 1283.81))
    path.addLine(to: CGPoint(x: 390.31, y: 1280.99))
    path.addLine(to: CGPoint(x: 390.38, y: 1159.11))
    path.addLine(to: CGPoint(x: 390.11, y: 1157.64))
    path.addLine(to: CGPoint(x: 389.49, y: 1156.22))
    path.addLine(to: CGPoint(x: 388.68, y: 1155.01))
    path.addLine(to: CGPoint(x: 387.79, y: 1154.1))
    path.addLine(to: CGPoint(x: 386.82, y: 1153.33))
    path.addLine(to: CGPoint(x: 385.3, y: 1152.67))
    path.addLine(to: CGPoint(x: 383.28, y: 1152.34))
    path.addLine(to: CGPoint(x: 339.27, y: 1152.25))
    path.addLine(to: CGPoint(x: 337.44, y: 1152.4))
    path.addLine(to: CGPoint(x: 336.09, y: 1152.8))
    path.addLine(to: CGPoint(x: 335.06, y: 1153.52))
    path.addLine(to: CGPoint(x: 334.41, y: 1154.43))
    path.addLine(to: CGPoint(x: 333.91, y: 1155.33))
    path.addLine(to: CGPoint(x: 333.72, y: 1156.55))
    path.addLine(to: CGPoint(x: 333.74, y: 1159.67))
    path.close()
    return path
}

func makeOkayamaPath() -> UIBezierPath {
    let path = UIBezierPath()
    path.move(to: CGPoint(x: 390.5, y: 1294.55))
    path.addLine(to: CGPoint(x: 390.62, y: 1413.99))
    path.addLine(to: CGPoint(x: 390.88, y: 1415.8))
    path.addLine(to: CGPoint(x: 391.44, y: 1417.24))
    path.addLine(to: CGPoint(x: 392.31, y: 1418.68))
    path.addLine(to: CGPoint(x: 393.38, y: 1419.86))
    path.addLine(to: CGPoint(x: 394.62, y: 1420.8))
    path.addLine(to: CGPoint(x: 396.31, y: 1421.55))
    path.addLine(to: CGPoint(x: 398.12, y: 1421.93))
    path.addLine(to: CGPoint(x: 440.72, y: 1421.71))
    path.addLine(to: CGPoint(x: 442.42, y: 1421.21))
    path.addLine(to: CGPoint(x: 443.74, y: 1420.42))
    path.addLine(to: CGPoint(x: 444.34, y: 1419.93))
    path.addLine(to: CGPoint(x: 444.83, y: 1419.47))
    path.addLine(to: CGPoint(x: 445.42, y: 1418.8))
    path.addLine(to: CGPoint(x: 445.95, y: 1418.1))
    path.addLine(to: CGPoint(x: 446.48, y: 1417.17))
    path.addLine(to: CGPoint(x: 446.77, y: 1416.37))
    path.addLine(to: CGPoint(x: 447.1, y: 1415.25))
    path.addLine(to: CGPoint(x: 447.34, y: 1414.19))
    path.addLine(to: CGPoint(x: 447.37, y: 1292.52))
    path.addLine(to: CGPoint(x: 447.26, y: 1291.17))
    path.addLine(to: CGPoint(x: 446.81, y: 1290))
    path.addLine(to: CGPoint(x: 446.02, y: 1289.07))
    path.addLine(to: CGPoint(x: 445.02, y: 1288.34))
    path.addLine(to: CGPoint(x: 443.79, y: 1287.86))
    path.addLine(to: CGPoint(x: 441.78, y: 1287.46))
    path.addLine(to: CGPoint(x: 395.12, y: 1287.52))
    path.addLine(to: CGPoint(x: 393.98, y: 1287.66))
    path.addLine(to: CGPoint(x: 393.17, y: 1287.96))
    path.addLine(to: CGPoint(x: 392.52, y: 1288.38))
    path.addLine(to: CGPoint(x: 391.95, y: 1288.97))
    path.addLine(to: CGPoint(x: 391.47, y: 1289.66))
    path.addLine(to: CGPoint(x: 391.05, y: 1290.49))
    path.addLine(to: CGPoint(x: 390.7, y: 1291.35))
    path.addLine(to: CGPoint(x: 390.56, y: 1292.08))
    path.addLine(to: CGPoint(x: 390.5, y: 1294.55))
    path.close()
    return path
}

func makeHiroshimaPath() -> UIBezierPath {
    let path = UIBezierPath()
    path.move(to: CGPoint(x: 333.81, y: 1292.11))
    path.addLine(to: CGPoint(x: 333.62, y: 1415.36))
    path.addLine(to: CGPoint(x: 333.94, y: 1417.11))
    path.addLine(to: CGPoint(x: 334.44, y: 1418.61))
    path.addLine(to: CGPoint(x: 335.44, y: 1420.11))
    path.addLine(to: CGPoint(x: 336.56, y: 1421.18))
    path.addLine(to: CGPoint(x: 338.06, y: 1421.93))
    path.addLine(to: CGPoint(x: 384.38, y: 1422.05))
    path.addLine(to: CGPoint(x: 386.5, y: 1421.55))
    path.addLine(to: CGPoint(x: 388.06, y: 1420.36))
    path.addLine(to: CGPoint(x: 389.25, y: 1418.86))
    path.addLine(to: CGPoint(x: 389.94, y: 1417.11))
    path.addLine(to: CGPoint(x: 390.53, y: 1414.1))
    path.addLine(to: CGPoint(x: 390.36, y: 1292.98))
    path.addLine(to: CGPoint(x: 390.25, y: 1291.17))
    path.addLine(to: CGPoint(x: 389.85, y: 1289.87))
    path.addLine(to: CGPoint(x: 389.07, y: 1288.87))
    path.addLine(to: CGPoint(x: 387.79, y: 1288.12))
    path.addLine(to: CGPoint(x: 386.02, y: 1287.72))
    path.addLine(to: CGPoint(x: 338.67, y: 1287.79))
    path.addLine(to: CGPoint(x: 337.04, y: 1287.97))
    path.addLine(to: CGPoint(x: 335.93, y: 1288.36))
    path.addLine(to: CGPoint(x: 334.94, y: 1289.01))
    path.addLine(to: CGPoint(x: 334.38, y: 1289.8))
    path.addLine(to: CGPoint(x: 333.92, y: 1290.77))
    path.addLine(to: CGPoint(x: 333.81, y: 1292.11))
    path.close()
    return path
}

func makeYamaguchiPath() -> UIBezierPath {
    let path = UIBezierPath()
    path.move(to: CGPoint(x: 276.56, y: 1160.18))
    path.addLine(to: CGPoint(x: 276.12, y: 1415.74))
    path.addLine(to: CGPoint(x: 276.38, y: 1417.99))
    path.addLine(to: CGPoint(x: 277.12, y: 1419.74))
    path.addLine(to: CGPoint(x: 278.25, y: 1421.43))
    path.addLine(to: CGPoint(x: 279.94, y: 1422.55))
    path.addLine(to: CGPoint(x: 281.69, y: 1423.11))
    path.addLine(to: CGPoint(x: 327.75, y: 1422.86))
    path.addLine(to: CGPoint(x: 329.69, y: 1422.24))
    path.addLine(to: CGPoint(x: 331.19, y: 1421.11))
    path.addLine(to: CGPoint(x: 332.62, y: 1419.3))
    path.addLine(to: CGPoint(x: 333.38, y: 1417.36))
    path.addLine(to: CGPoint(x: 333.56, y: 1415.33))
    path.addLine(to: CGPoint(x: 333.61, y: 1158.81))
    path.addLine(to: CGPoint(x: 333.46, y: 1157.02))
    path.addLine(to: CGPoint(x: 332.99, y: 1155.67))
    path.addLine(to: CGPoint(x: 332.17, y: 1154.54))
    path.addLine(to: CGPoint(x: 330.96, y: 1153.7))
    path.addLine(to: CGPoint(x: 329.59, y: 1153.11))
    path.addLine(to: CGPoint(x: 327.82, y: 1152.69))
    path.addLine(to: CGPoint(x: 281.37, y: 1152.51))
    path.addLine(to: CGPoint(x: 279.47, y: 1152.91))
    path.addLine(to: CGPoint(x: 278.41, y: 1153.57))
    path.addLine(to: CGPoint(x: 277.53, y: 1154.37))
    path.addLine(to: CGPoint(x: 276.87, y: 1155.3))
    path.addLine(to: CGPoint(x: 276.47, y: 1156.45))
    path.addLine(to: CGPoint(x: 276.56, y: 1160.18))
    path.close()
    return path
}

func makeTokushimaPath() -> UIBezierPath {
    let path = UIBezierPath()
    path.move(to: CGPoint(x: 352.66, y: 1564.93))
    path.addLine(to: CGPoint(x: 352.66, y: 1653.36))
    path.addLine(to: CGPoint(x: 353.12, y: 1656.36))
    path.addLine(to: CGPoint(x: 353.88, y: 1658.61))
    path.addLine(to: CGPoint(x: 355.12, y: 1660.49))
    path.addLine(to: CGPoint(x: 356.88, y: 1662.11))
    path.addLine(to: CGPoint(x: 358.88, y: 1663.36))
    path.addLine(to: CGPoint(x: 361.38, y: 1663.86))
    path.addLine(to: CGPoint(x: 419.75, y: 1663.86))
    path.addLine(to: CGPoint(x: 422.75, y: 1662.99))
    path.addLine(to: CGPoint(x: 425.38, y: 1661.24))
    path.addLine(to: CGPoint(x: 427.38, y: 1658.86))
    path.addLine(to: CGPoint(x: 428.88, y: 1655.86))
    path.addLine(to: CGPoint(x: 429.5, y: 1652.99))
    path.addLine(to: CGPoint(x: 429.5, y: 1564.76))
    path.addLine(to: CGPoint(x: 428.98, y: 1561.4))
    path.addLine(to: CGPoint(x: 427.57, y: 1558.74))
    path.addLine(to: CGPoint(x: 424.92, y: 1556.62))
    path.addLine(to: CGPoint(x: 422.26, y: 1555.74))
    path.addLine(to: CGPoint(x: 360.5, y: 1556.23))
    path.addLine(to: CGPoint(x: 358.44, y: 1556.36))
    path.addLine(to: CGPoint(x: 356.87, y: 1556.93))
    path.addLine(to: CGPoint(x: 355.56, y: 1557.86))
    path.addLine(to: CGPoint(x: 354.44, y: 1558.99))
    path.addLine(to: CGPoint(x: 353.5, y: 1560.24))
    path.addLine(to: CGPoint(x: 352.81, y: 1561.61))
    path.addLine(to: CGPoint(x: 352.66, y: 1564.93))
    path.close()
    return path
}

func makeKagawaPath() -> UIBezierPath {
    let path = UIBezierPath()
    path.move(to: CGPoint(x: 352.69, y: 1459.05))
    path.addLine(to: CGPoint(x: 352.56, y: 1545.8))
    path.addLine(to: CGPoint(x: 352.94, y: 1548.49))
    path.addLine(to: CGPoint(x: 354.19, y: 1550.99))
    path.addLine(to: CGPoint(x: 356.06, y: 1553.61))
    path.addLine(to: CGPoint(x: 358.25, y: 1555.49))
    path.addLine(to: CGPoint(x: 360.81, y: 1556.11))
    path.addLine(to: CGPoint(x: 419.75, y: 1555.49))
    path.addLine(to: CGPoint(x: 423.32, y: 1554.5))
    path.addLine(to: CGPoint(x: 425.98, y: 1552.38))
    path.addLine(to: CGPoint(x: 428.1, y: 1549.55))
    path.addLine(to: CGPoint(x: 429.34, y: 1545.84))
    path.addLine(to: CGPoint(x: 428.88, y: 1457.8))
    path.addLine(to: CGPoint(x: 428.19, y: 1453.8))
    path.addLine(to: CGPoint(x: 426.75, y: 1451.49))
    path.addLine(to: CGPoint(x: 424.38, y: 1449.49))
    path.addLine(to: CGPoint(x: 421.44, y: 1447.8))
    path.addLine(to: CGPoint(x: 418.06, y: 1446.74))
    path.addLine(to: CGPoint(x: 361.12, y: 1446.55))
    path.addLine(to: CGPoint(x: 358.31, y: 1447.05))
    path.addLine(to: CGPoint(x: 356.31, y: 1448.43))
    path.addLine(to: CGPoint(x: 354.56, y: 1450.05))
    path.addLine(to: CGPoint(x: 353.31, y: 1452.24))
    path.addLine(to: CGPoint(x: 352.81, y: 1454.3))
    path.addLine(to: CGPoint(x: 352.69, y: 1459.05))
    path.close()
    return path
}

func makeEhimePath() -> UIBezierPath {
    let path = UIBezierPath()
    path.move(to: CGPoint(x: 276.95, y: 1459.31))
    path.addLine(to: CGPoint(x: 276.87, y: 1546.28))
    path.addLine(to: CGPoint(x: 277.48, y: 1549.46))
    path.addLine(to: CGPoint(x: 278.9, y: 1551.94))
    path.addLine(to: CGPoint(x: 280.67, y: 1553.88))
    path.addLine(to: CGPoint(x: 282.43, y: 1555.21))
    path.addLine(to: CGPoint(x: 285.17, y: 1555.92))
    path.addLine(to: CGPoint(x: 344.04, y: 1555.65))
    path.addLine(to: CGPoint(x: 346.6, y: 1554.77))
    path.addLine(to: CGPoint(x: 348.99, y: 1552.82))
    path.addLine(to: CGPoint(x: 350.4, y: 1550.7))
    path.addLine(to: CGPoint(x: 351.46, y: 1547.96))
    path.addLine(to: CGPoint(x: 352.17, y: 1545.31))
    path.addLine(to: CGPoint(x: 352.47, y: 1456.71))
    path.addLine(to: CGPoint(x: 352.31, y: 1454.36))
    path.addLine(to: CGPoint(x: 351.56, y: 1452.43))
    path.addLine(to: CGPoint(x: 350.28, y: 1450.46))
    path.addLine(to: CGPoint(x: 348.47, y: 1448.86))
    path.addLine(to: CGPoint(x: 346.12, y: 1447.77))
    path.addLine(to: CGPoint(x: 284.64, y: 1447.82))
    path.addLine(to: CGPoint(x: 282.26, y: 1448.44))
    path.addLine(to: CGPoint(x: 280.14, y: 1449.23))
    path.addLine(to: CGPoint(x: 278.46, y: 1450.47))
    path.addLine(to: CGPoint(x: 277.4, y: 1451.97))
    path.addLine(to: CGPoint(x: 276.87, y: 1454))
    path.addLine(to: CGPoint(x: 276.95, y: 1459.31))
    path.close()
    return path
}

func makeKochiPath() -> UIBezierPath {
    let path = UIBezierPath()
    path.move(to: CGPoint(x: 276.5, y: 1564.05))
    path.addLine(to: CGPoint(x: 276.12, y: 1652.61))
    path.addLine(to: CGPoint(x: 276.38, y: 1656.18))
    path.addLine(to: CGPoint(x: 277, y: 1658.43))
    path.addLine(to: CGPoint(x: 278.06, y: 1660.55))
    path.addLine(to: CGPoint(x: 279.38, y: 1662.11))
    path.addLine(to: CGPoint(x: 281.19, y: 1663.43))
    path.addLine(to: CGPoint(x: 283.81, y: 1664.24))
    path.addLine(to: CGPoint(x: 344.19, y: 1664.18))
    path.addLine(to: CGPoint(x: 346.38, y: 1663.8))
    path.addLine(to: CGPoint(x: 348.44, y: 1662.86))
    path.addLine(to: CGPoint(x: 350.12, y: 1661.55))
    path.addLine(to: CGPoint(x: 351.38, y: 1659.86))
    path.addLine(to: CGPoint(x: 352.19, y: 1657.8))
    path.addLine(to: CGPoint(x: 352.5, y: 1655.24))
    path.addLine(to: CGPoint(x: 352.31, y: 1563.49))
    path.addLine(to: CGPoint(x: 352, y: 1561.09))
    path.addLine(to: CGPoint(x: 351.2, y: 1559.1))
    path.addLine(to: CGPoint(x: 349.92, y: 1557.46))
    path.addLine(to: CGPoint(x: 348.19, y: 1556.27))
    path.addLine(to: CGPoint(x: 346.12, y: 1555.87))
    path.addLine(to: CGPoint(x: 284.95, y: 1556.09))
    path.addLine(to: CGPoint(x: 282.21, y: 1556.18))
    path.addLine(to: CGPoint(x: 280.4, y: 1556.76))
    path.addLine(to: CGPoint(x: 278.72, y: 1557.86))
    path.addLine(to: CGPoint(x: 277.5, y: 1559.05))
    path.addLine(to: CGPoint(x: 276.95, y: 1560.29))
    path.addLine(to: CGPoint(x: 276.47, y: 1562.06))
    path.addLine(to: CGPoint(x: 276.5, y: 1564.05))
    path.close()
    return path
}

func makeFukuokaPath() -> UIBezierPath {
    let path = UIBezierPath()
    path.move(to: CGPoint(x: 134.25, y: 1160.24))
    path.addLine(to: CGPoint(x: 134.25, y: 1307.74))
    path.addLine(to: CGPoint(x: 134.88, y: 1309.74))
    path.addLine(to: CGPoint(x: 135.75, y: 1311.49))
    path.addLine(to: CGPoint(x: 137.12, y: 1312.99))
    path.addLine(to: CGPoint(x: 139, y: 1314.49))
    path.addLine(to: CGPoint(x: 185.5, y: 1314.49))
    path.addLine(to: CGPoint(x: 187.75, y: 1313.49))
    path.addLine(to: CGPoint(x: 189.25, y: 1311.74))
    path.addLine(to: CGPoint(x: 190.12, y: 1309.99))
    path.addLine(to: CGPoint(x: 190.84, y: 1307.24))
    path.addLine(to: CGPoint(x: 190.75, y: 1159.52))
    path.addLine(to: CGPoint(x: 190.55, y: 1158.01))
    path.addLine(to: CGPoint(x: 190.02, y: 1156.53))
    path.addLine(to: CGPoint(x: 189.27, y: 1155.34))
    path.addLine(to: CGPoint(x: 188.21, y: 1154.3))
    path.addLine(to: CGPoint(x: 186.84, y: 1153.59))
    path.addLine(to: CGPoint(x: 184.76, y: 1153.02))
    path.addLine(to: CGPoint(x: 138.69, y: 1152.8))
    path.addLine(to: CGPoint(x: 137.19, y: 1153.05))
    path.addLine(to: CGPoint(x: 135.94, y: 1153.61))
    path.addLine(to: CGPoint(x: 135.25, y: 1154.3))
    path.addLine(to: CGPoint(x: 134.62, y: 1155.24))
    path.addLine(to: CGPoint(x: 134.25, y: 1156.8))
    path.addLine(to: CGPoint(x: 134.25, y: 1160.24))
    path.close()
    return path
}

func makeSagaPath() -> UIBezierPath {
    let path = UIBezierPath()
    path.move(to: CGPoint(x: 77.5, y: 1160.49))
    path.addLine(to: CGPoint(x: 77.38, y: 1307.61))
    path.addLine(to: CGPoint(x: 78.25, y: 1310.74))
    path.addLine(to: CGPoint(x: 80.25, y: 1313.24))
    path.addLine(to: CGPoint(x: 82.62, y: 1314.86))
    path.addLine(to: CGPoint(x: 127.75, y: 1315.24))
    path.addLine(to: CGPoint(x: 130.38, y: 1313.99))
    path.addLine(to: CGPoint(x: 132.25, y: 1312.11))
    path.addLine(to: CGPoint(x: 133.38, y: 1309.61))
    path.addLine(to: CGPoint(x: 134, y: 1307.36))
    path.addLine(to: CGPoint(x: 134, y: 1157.61))
    path.addLine(to: CGPoint(x: 133.53, y: 1155.96))
    path.addLine(to: CGPoint(x: 132.69, y: 1154.68))
    path.addLine(to: CGPoint(x: 131.75, y: 1153.71))
    path.addLine(to: CGPoint(x: 129.81, y: 1152.9))
    path.addLine(to: CGPoint(x: 82.06, y: 1152.58))
    path.addLine(to: CGPoint(x: 80.73, y: 1152.95))
    path.addLine(to: CGPoint(x: 79.67, y: 1153.57))
    path.addLine(to: CGPoint(x: 78.7, y: 1154.46))
    path.addLine(to: CGPoint(x: 77.9, y: 1155.56))
    path.addLine(to: CGPoint(x: 77.55, y: 1156.67))
    path.addLine(to: CGPoint(x: 77.5, y: 1160.49))
    path.close()
    return path
}

func makeNagasakiPath() -> UIBezierPath {
    let path = UIBezierPath()
    path.move(to: CGPoint(x: 19.75, y: 1159.61))
    path.addLine(to: CGPoint(x: 19.88, y: 1308.11))
    path.addLine(to: CGPoint(x: 20.5, y: 1310.74))
    path.addLine(to: CGPoint(x: 22, y: 1313.11))
    path.addLine(to: CGPoint(x: 24, y: 1314.86))
    path.addLine(to: CGPoint(x: 27, y: 1315.61))
    path.addLine(to: CGPoint(x: 70.88, y: 1315.61))
    path.addLine(to: CGPoint(x: 73, y: 1314.74))
    path.addLine(to: CGPoint(x: 74.88, y: 1312.99))
    path.addLine(to: CGPoint(x: 76.25, y: 1310.74))
    path.addLine(to: CGPoint(x: 77.03, y: 1307.83))
    path.addLine(to: CGPoint(x: 77.03, y: 1159.23))
    path.addLine(to: CGPoint(x: 76.53, y: 1156.98))
    path.addLine(to: CGPoint(x: 75.52, y: 1155.16))
    path.addLine(to: CGPoint(x: 74.19, y: 1153.75))
    path.addLine(to: CGPoint(x: 72.25, y: 1152.69))
    path.addLine(to: CGPoint(x: 24.56, y: 1152.74))
    path.addLine(to: CGPoint(x: 22.88, y: 1152.99))
    path.addLine(to: CGPoint(x: 21.81, y: 1153.8))
    path.addLine(to: CGPoint(x: 20.94, y: 1154.86))
    path.addLine(to: CGPoint(x: 20.13, y: 1156.24))
    path.addLine(to: CGPoint(x: 19.75, y: 1157.86))
    path.addLine(to: CGPoint(x: 19.75, y: 1159.61))
    path.close()
    return path
}

func makeKumamotoPath() -> UIBezierPath {
    let path = UIBezierPath()
    path.move(to: CGPoint(x: 134.25, y: 1320.55))
    path.addLine(to: CGPoint(x: 134.12, y: 1470.24))
    path.addLine(to: CGPoint(x: 134.44, y: 1471.86))
    path.addLine(to: CGPoint(x: 135.31, y: 1473.24))
    path.addLine(to: CGPoint(x: 136.81, y: 1474.55))
    path.addLine(to: CGPoint(x: 138.38, y: 1475.24))
    path.addLine(to: CGPoint(x: 140, y: 1475.68))
    path.addLine(to: CGPoint(x: 185.62, y: 1475.55))
    path.addLine(to: CGPoint(x: 188.06, y: 1474.93))
    path.addLine(to: CGPoint(x: 189.56, y: 1473.74))
    path.addLine(to: CGPoint(x: 190.31, y: 1472.49))
    path.addLine(to: CGPoint(x: 190.81, y: 1470.24))
    path.addLine(to: CGPoint(x: 190.81, y: 1319.55))
    path.addLine(to: CGPoint(x: 190.5, y: 1317.43))
    path.addLine(to: CGPoint(x: 189.69, y: 1315.93))
    path.addLine(to: CGPoint(x: 188.38, y: 1314.99))
    path.addLine(to: CGPoint(x: 186.25, y: 1314.61))
    path.addLine(to: CGPoint(x: 138.81, y: 1314.68))
    path.addLine(to: CGPoint(x: 137, y: 1314.99))
    path.addLine(to: CGPoint(x: 135.88, y: 1315.61))
    path.addLine(to: CGPoint(x: 134.88, y: 1316.61))
    path.addLine(to: CGPoint(x: 134.44, y: 1317.8))
    path.addLine(to: CGPoint(x: 134.25, y: 1320.55))
    path.close()
    return path
}

func makeOitaPath() -> UIBezierPath {
    let path = UIBezierPath()
    path.move(to: CGPoint(x: 191.04, y: 1161.53))
    path.addLine(to: CGPoint(x: 191.04, y: 1307.19))
    path.addLine(to: CGPoint(x: 191.38, y: 1309.86))
    path.addLine(to: CGPoint(x: 192.12, y: 1311.49))
    path.addLine(to: CGPoint(x: 193.12, y: 1313.11))
    path.addLine(to: CGPoint(x: 194.5, y: 1314.36))
    path.addLine(to: CGPoint(x: 196.12, y: 1314.74))
    path.addLine(to: CGPoint(x: 241.75, y: 1314.49))
    path.addLine(to: CGPoint(x: 244.12, y: 1314.11))
    path.addLine(to: CGPoint(x: 246.12, y: 1313.24))
    path.addLine(to: CGPoint(x: 247.38, y: 1312.11))
    path.addLine(to: CGPoint(x: 248.38, y: 1310.49))
    path.addLine(to: CGPoint(x: 248.75, y: 1308.49))
    path.addLine(to: CGPoint(x: 248.38, y: 1160.61))
    path.addLine(to: CGPoint(x: 247.88, y: 1158.11))
    path.addLine(to: CGPoint(x: 246.75, y: 1156.11))
    path.addLine(to: CGPoint(x: 245, y: 1154.24))
    path.addLine(to: CGPoint(x: 243.12, y: 1153.11))
    path.addLine(to: CGPoint(x: 240.88, y: 1152.49))
    path.addLine(to: CGPoint(x: 197, y: 1152.36))
    path.addLine(to: CGPoint(x: 195, y: 1152.86))
    path.addLine(to: CGPoint(x: 193.5, y: 1153.86))
    path.addLine(to: CGPoint(x: 192.38, y: 1154.86))
    path.addLine(to: CGPoint(x: 191.62, y: 1156.24))
    path.addLine(to: CGPoint(x: 191.25, y: 1157.74))
    path.addLine(to: CGPoint(x: 190.88, y: 1159.49))
    path.addLine(to: CGPoint(x: 191.04, y: 1161.53))
    path.close()
    return path
}

func makeMiyazakiPath() -> UIBezierPath {
    let path = UIBezierPath()
    path.move(to: CGPoint(x: 191.04, y: 1321.33))
    path.addLine(to: CGPoint(x: 191.04, y: 1468.94))
    path.addLine(to: CGPoint(x: 191.39, y: 1471.42))
    path.addLine(to: CGPoint(x: 192.1, y: 1473.01))
    path.addLine(to: CGPoint(x: 193.52, y: 1474.42))
    path.addLine(to: CGPoint(x: 195.64, y: 1475.31))
    path.addLine(to: CGPoint(x: 241.78, y: 1475.13))
    path.addLine(to: CGPoint(x: 244.43, y: 1474.42))
    path.addLine(to: CGPoint(x: 246.72, y: 1472.83))
    path.addLine(to: CGPoint(x: 248.32, y: 1470.71))
    path.addLine(to: CGPoint(x: 249.2, y: 1468.41))
    path.addLine(to: CGPoint(x: 248.49, y: 1321.16))
    path.addLine(to: CGPoint(x: 247.96, y: 1318.15))
    path.addLine(to: CGPoint(x: 246.55, y: 1316.03))
    path.addLine(to: CGPoint(x: 244.6, y: 1314.79))
    path.addLine(to: CGPoint(x: 242.59, y: 1314.63))
    path.addLine(to: CGPoint(x: 195.99, y: 1314.93))
    path.addLine(to: CGPoint(x: 194.4, y: 1315.23))
    path.addLine(to: CGPoint(x: 193.29, y: 1315.99))
    path.addLine(to: CGPoint(x: 192.28, y: 1317))
    path.addLine(to: CGPoint(x: 191.53, y: 1318.15))
    path.addLine(to: CGPoint(x: 191.08, y: 1319.39))
    path.addLine(to: CGPoint(x: 191.04, y: 1321.33))
    path.close()
    return path
}

func makeKagoshimaPath() -> UIBezierPath {
    let path = UIBezierPath()
    path.move(to: CGPoint(x: 134.21, y: 1485.47))
    path.addLine(to: CGPoint(x: 133.85, y: 1572.18))
    path.addLine(to: CGPoint(x: 134.29, y: 1576.42))
    path.addLine(to: CGPoint(x: 135.44, y: 1579.87))
    path.addLine(to: CGPoint(x: 137.21, y: 1582.52))
    path.addLine(to: CGPoint(x: 140.04, y: 1583.76))
    path.addLine(to: CGPoint(x: 240.12, y: 1583.86))
    path.addLine(to: CGPoint(x: 243.12, y: 1583.11))
    path.addLine(to: CGPoint(x: 245.31, y: 1581.36))
    path.addLine(to: CGPoint(x: 247.06, y: 1579.05))
    path.addLine(to: CGPoint(x: 248.25, y: 1576.18))
    path.addLine(to: CGPoint(x: 248.81, y: 1573.18))
    path.addLine(to: CGPoint(x: 248.5, y: 1482.49))
    path.addLine(to: CGPoint(x: 247.88, y: 1480.15))
    path.addLine(to: CGPoint(x: 246.56, y: 1478.24))
    path.addLine(to: CGPoint(x: 244.59, y: 1476.52))
    path.addLine(to: CGPoint(x: 242.41, y: 1475.61))
    path.addLine(to: CGPoint(x: 240.81, y: 1475.27))
    path.addLine(to: CGPoint(x: 140.72, y: 1475.96))
    path.addLine(to: CGPoint(x: 138.22, y: 1476.4))
    path.addLine(to: CGPoint(x: 136.84, y: 1477.27))
    path.addLine(to: CGPoint(x: 135.69, y: 1478.55))
    path.addLine(to: CGPoint(x: 134.88, y: 1480.05))
    path.addLine(to: CGPoint(x: 134.38, y: 1481.77))
    path.addLine(to: CGPoint(x: 134.22, y: 1483.43))
    path.addLine(to: CGPoint(x: 134.21, y: 1485.47))
    path.close()
    return path
}

func makeOkinawaPath() -> UIBezierPath {
    let path = UIBezierPath()
    path.move(to: CGPoint(x: 154.27, y: 743.27))
    path.addLine(to: CGPoint(x: 153.92, y: 829.89))
    path.addLine(to: CGPoint(x: 154.8, y: 834.31))
    path.addLine(to: CGPoint(x: 157.1, y: 837.32))
    path.addLine(to: CGPoint(x: 160.1, y: 839.79))
    path.addLine(to: CGPoint(x: 163.64, y: 840.85))
    path.addLine(to: CGPoint(x: 260.69, y: 840.5))
    path.addLine(to: CGPoint(x: 264.76, y: 838.2))
    path.addLine(to: CGPoint(x: 267.58, y: 834.84))
    path.addLine(to: CGPoint(x: 269, y: 830.95))
    path.addLine(to: CGPoint(x: 269, y: 741.68))
    path.addLine(to: CGPoint(x: 268.11, y: 736.73))
    path.addLine(to: CGPoint(x: 266.7, y: 733.55))
    path.addLine(to: CGPoint(x: 264.23, y: 731.08))
    path.addLine(to: CGPoint(x: 260.87, y: 729.84))
    path.addLine(to: CGPoint(x: 161.16, y: 730.72))
    path.addLine(to: CGPoint(x: 158.69, y: 731.61))
    path.addLine(to: CGPoint(x: 157.31, y: 732.8))
    path.addLine(to: CGPoint(x: 156, y: 734.43))
    path.addLine(to: CGPoint(x: 155.13, y: 736.18))
    path.addLine(to: CGPoint(x: 154.44, y: 738.74))
    path.addLine(to: CGPoint(x: 154.27, y: 743.27))
    path.close()
    return path
}

enum Region {
    case hokkaido
    case tohoku
    case kanto
    case chubu
    case kinki
    case chugoku
    case shikoku
    case kyusyu
    
    var color: UIColor {
        switch self {
        case .hokkaido:
            return UIColor(hex: 0x7FFFD4)
        case .tohoku:
            return UIColor(hex: 0x3cebfb)
        case .kanto:
            return UIColor(hex: 0x4bb4fb)
        case .chubu:
            return UIColor(hex: 0xa68ed7)
        case .kinki:
            return UIColor(hex: 0xfb88c2)
        case .chugoku:
            return UIColor(hex: 0xf5b3b3)
        case .shikoku:
            return UIColor(hex: 0xed8282)
        case .kyusyu:
            return UIColor(hex: 0xf9d9a9)
        }
    }
}
