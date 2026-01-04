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
