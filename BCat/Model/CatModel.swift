//
//  CatModel.swift
//  BCat
//
//  Created by 汉秋 on 2022/8/15.
//

import Foundation

/// 性别
enum Sex: Int {
    case male
    case female
}

/// 性染色体
enum SexChromosome: Int {
    case x
    case y
    
    /// 红色基因，控制‘棕黑素’
    /// 两个等位基因控制
    /// 表达顺序为R>r
    /// 存在于性染色体（X）上
    /// XOXO，XOY为橘猫
    /// XOXo为玳瑁猫
    enum RGene {
        case R  //抑制真黑素的生成，让猫咪表现出橘色
        case r  //不改变喵咪颜色
    }
    
//    var rGene: RGene = .init(rawValue: Int.random(in: 0...1)) ?? .B

}

struct CatModel: Identifiable {
    var id = UUID()
    var weight: Float = 1.0

    var firstSexChromosome: SexChromosome = .x
    var secondSexChromosome: SexChromosome = .x
    
    var bGene: BGene

    var sex: Sex {
        if firstSexChromosome == secondSexChromosome {
            return .female
        }
        return .male
    }
}

extension CatModel {
    func makeNewCat(_ anotherCat: CatModel) -> CatModel? {
        guard self.sex != anotherCat.sex else {
            return nil
        }
        let bSet = Set([self.bGene, anotherCat.bGene])
        var newCat = CatModel(bGene: bSet.randomElement()!)
        
        let selfSexChromosomeSet = Set([self.firstSexChromosome, self.secondSexChromosome]).randomElement()!
        let anotherSexChromosomeSet = Set([anotherCat.firstSexChromosome, anotherCat.secondSexChromosome]).randomElement()!
        newCat.firstSexChromosome = selfSexChromosomeSet.rawValue > anotherSexChromosomeSet.rawValue ? anotherSexChromosomeSet : selfSexChromosomeSet
        newCat.secondSexChromosome = selfSexChromosomeSet.rawValue > anotherSexChromosomeSet.rawValue ? selfSexChromosomeSet : anotherSexChromosomeSet
        
        return newCat
    }
}
