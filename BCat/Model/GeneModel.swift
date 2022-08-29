//
//  GeneModel.swift
//  BCat
//
//  Created by 汉秋 on 2022/8/16.
//

import Foundation
import SwiftUI

protocol Gene {
    func geneChain() -> Gene
    var color: Color { get }
}
/// 黑色基因，控制‘真黑素’
/// 三个等位基因控制
/// 表达顺序为B>b>b'
enum BGene: Int {
    case B  //纯黑色
    case b  //巧克力色
    case b_ //肉桂色
}

/// 稀释基因(Dilution)
/// 表达顺序为D>d
/// 黑色      巧克力色        肉桂色             橘色
/// ⬇️          ⬇️                  ⬇️                  ⬇️
/// 蓝色      浅紫/丁香色      浅黄褐色       奶油色
enum DGene {
    case D  //不影响猫咪颜色
    case d  //只有d基因时，毛色会被稀释
}

/// 强力白基因
/// 强力白属于突变基因，一旦出现显性突变（w→W），就会阻止色素到达皮肤，
/// 猫咪身上原本的颜色被白色覆盖，整只猫变成纯白色
enum WGene {
    case W  //
    case w  //
}

/// 斑点白基因
/// 斑点白不像强力白那么霸道，具有亲民可调节的不同白档
/// ss不影响原有颜色
/// Ss 会让猫咪全身的50%以下出现白色
/// SS 则会让猫咪全身出现50%以上的白色
/// 在这种基因的作用下，猫咪全身会出现各种不同白色块，演变成我们常见的：燕尾服、警长、奶牛、三花，传统的雪里拖枪、乌云盖雪、衔蝶等等。
enum SGene {
    case S  //
    case s  //
}
