//
//  DefaultData.swift
//  ChinesePictureFlashCards
//
//  Created by ian robert blair on 2022/1/19.
//

import Foundation

class DefaultData {
    class func someData() -> [DeckCodeable]?{
        let decoder = JSONDecoder()
        var decodedData:[DeckCodeable]
        do {
            decodedData = try decoder.decode([DeckCodeable].self, from: allWords!)
            return decodedData
        } catch {
            print(error)
            return nil
        }
    }
}

extension DefaultData {
    
    static let allWords = """
[
  {
    "name" : "accessories",
    "words" : [
      {
        "pronunciation" : "pí dài",
        "audio" : "belt",
        "chineseWord" : "皮带",
        "englishWord" : "belt"
      },
      {
        "pronunciation" : "xuē zi",
        "audio" : "boots",
        "chineseWord" : "靴子",
        "englishWord" : "boots"
      },
      {
        "pronunciation" : "shǒu tào",
        "audio" : "gloves",
        "chineseWord" : "手套",
        "englishWord" : "gloves"
      },
      {
        "pronunciation" : "shǒu tí bāo",
        "audio" : "handbag",
        "chineseWord" : "手提包",
        "englishWord" : "handbag"
      },
      {
        "pronunciation" : "mào zi",
        "audio" : "hat",
        "chineseWord" : "帽子",
        "englishWord" : "hat"
      },
      {
        "pronunciation" : "wéi jīn",
        "audio" : "scarf",
        "chineseWord" : "围巾",
        "englishWord" : "scarf"
      },
      {
        "pronunciation" : "xié zi",
        "audio" : "shoes",
        "chineseWord" : "鞋子",
        "englishWord" : "shoes"
      },
      {
        "pronunciation" : "lǐng dài",
        "audio" : "tie",
        "chineseWord" : "领带",
        "englishWord" : "tie"
      }
    ]
  },
  {
    "name" : "air travel",
    "words" : [
      {
        "pronunciation" : "jī chǎng",
        "audio" : "airport",
        "chineseWord" : "机场",
        "englishWord" : "airport"
      },
      {
        "pronunciation" : "jī piào",
        "audio" : "planeticket",
        "chineseWord" : "机票",
        "englishWord" : "plane ticket"
      },
      {
        "pronunciation" : "dēng jī kǒu",
        "audio" : "boardinggate",
        "chineseWord" : "登机口",
        "englishWord" : "boarding gate"
      },
      {
        "pronunciation" : "xíng li xiāng",
        "audio" : "suitcase",
        "chineseWord" : "行李箱",
        "englishWord" : "suitcase"
      },
      {
        "pronunciation" : "qiān zhèng",
        "audio" : "visa",
        "chineseWord" : "签证",
        "englishWord" : "visa"
      },
      {
        "pronunciation" : "suí shēn xíng li",
        "audio" : "carryonbag",
        "chineseWord" : "随身行李",
        "englishWord" : "carry-on bag"
      },
      {
        "pronunciation" : "dēng jī pái",
        "audio" : "boardingpass",
        "chineseWord" : "登机牌",
        "englishWord" : "boarding pass"
      },
      {
        "pronunciation" : "hù zhào",
        "audio" : "passport",
        "chineseWord" : "护照",
        "englishWord" : "passport"
      }
    ]
  },
  {
    "name" : "animals",
    "words" : [
      {
        "pronunciation" : "niǎo",
        "chineseWord" : "鸟",
        "audio" : "bird",
        "englishWord" : "bird"
      },
      {
        "pronunciation" : "māo",
        "chineseWord" : "猫",
        "audio" : "cat",
        "englishWord" : "cat"
      },
      {
        "pronunciation" : "niú",
        "chineseWord" : "牛",
        "audio" : "cow",
        "englishWord" : "cow"
      },
      {
        "pronunciation" : "gǒu",
        "chineseWord" : "狗",
        "audio" : "dog",
        "englishWord" : "dog"
      },
      {
        "pronunciation" : "yú",
        "chineseWord" : "鱼",
        "audio" : "fish",
        "englishWord" : "fish"
      },
      {
        "pronunciation" : "mǎ",
        "chineseWord" : "马",
        "audio" : "horse",
        "englishWord" : "horse"
      },
      {
        "pronunciation" : "yáng",
        "chineseWord" : "羊",
        "audio" : "sheep",
        "englishWord" : "sheep"
      },
      {
        "pronunciation" : "shé",
        "chineseWord" : "蛇",
        "audio" : "snake",
        "englishWord" : "snake"
      }
    ]
  },
  {
    "name" : "appliances",
    "words" : [
      {
        "pronunciation" : "kōng tiáo",
        "chineseWord" : "空调",
        "audio" : "airconditioner",
        "englishWord" : "air conditioner"
      },
      {
        "pronunciation" : "xī chén qì",
        "chineseWord" : "吸尘器",
        "audio" : "vacuumCleaner",
        "englishWord" : "vacuum cleaner"
      },
      {
        "pronunciation" : "xǐ yī jī",
        "chineseWord" : "洗衣机",
        "audio" : "washingmachine",
        "englishWord" : "washing machine"
      },
      {
        "pronunciation" : "bīng xiāng",
        "chineseWord" : "冰箱",
        "audio" : "refrigerator",
        "englishWord" : "refrigerator"
      },
      {
        "pronunciation" : "wēi bō lú",
        "chineseWord" : "微波炉",
        "audio" : "microwave",
        "englishWord" : "microwave oven"
      },
      {
        "pronunciation" : "diàn shì",
        "chineseWord" : "电视",
        "audio" : "tv",
        "englishWord" : "TV"
      },
      {
        "pronunciation" : "shí zhōng",
        "chineseWord" : "时钟",
        "audio" : "clock",
        "englishWord" : "clock"
      }
    ]
  },
  {
    "name" : "bathroom",
    "words" : [
      {
        "pronunciation" : "shuǐcáo",
        "chineseWord" : "水槽",
        "audio" : "sink",
        "englishWord" : "sink"
      },
      {
        "pronunciation" : "yá shuā",
        "chineseWord" : "牙刷",
        "audio" : "toothbrush",
        "englishWord" : "toothbrush"
      },
      {
        "pronunciation" : "xǐ fà shuǐ",
        "chineseWord" : "洗发水",
        "audio" : "shampoo",
        "englishWord" : "shampoo"
      },
      {
        "pronunciation" : "féi zào",
        "chineseWord" : "肥皂",
        "audio" : "soap",
        "englishWord" : "soap"
      },
      {
        "pronunciation" : "chuī fēng jī",
        "chineseWord" : "吹风机",
        "audio" : "hairdryer",
        "englishWord" : "hair dryer"
      },
      {
        "pronunciation" : "yá gāo",
        "chineseWord" : "牙膏",
        "audio" : "toothpaste",
        "englishWord" : "toothpaste"
      },
      {
        "pronunciation" : "máo jīn",
        "chineseWord" : "毛巾",
        "audio" : "towel",
        "englishWord" : "towel"
      }
    ]
  },
  {
    "name" : "body",
    "words" : [
      {
        "pronunciation" : "shǒu bì",
        "chineseWord" : "手臂",
        "audio" : "arm",
        "englishWord" : "arm"
      },
      {
        "pronunciation" : "bèibù",
        "chineseWord" : "背部",
        "audio" : "back",
        "englishWord" : "back"
      },
      {
        "pronunciation" : "xiōng bù",
        "chineseWord" : "胸部",
        "audio" : "chest",
        "englishWord" : "chest"
      },
      {
        "pronunciation" : "jiǎo",
        "chineseWord" : "脚",
        "audio" : "foot",
        "englishWord" : "foot"
      },
      {
        "pronunciation" : "shǒu",
        "chineseWord" : "手",
        "audio" : "hand",
        "englishWord" : "hand"
      },
      {
        "pronunciation" : "tóu",
        "chineseWord" : "头",
        "audio" : "head",
        "englishWord" : "head"
      },
      {
        "pronunciation" : "tuǐ",
        "chineseWord" : "腿",
        "audio" : "leg",
        "englishWord" : "leg"
      },
      {
        "pronunciation" : "wèi",
        "chineseWord" : "胃",
        "audio" : "stomach",
        "englishWord" : "stomach"
      }
    ]
  },
  {
    "name" : "city",
    "words" : [
      {
        "pronunciation" : "gōng yù lóu",
        "chineseWord" : "公寓楼",
        "audio" : "apartmentbuilding",
        "englishWord" : "apartment building"
      },
      {
        "pronunciation" : "dà jiē",
        "chineseWord" : "大街",
        "audio" : "avenue",
        "englishWord" : "avenue"
      },
      {
        "pronunciation" : "zhōng yāng shāng wù qū",
        "chineseWord" : "中央商务区",
        "audio" : "centralbusinessdistrict",
        "englishWord" : "central business district"
      },
      {
        "pronunciation" : "chéng shì",
        "chineseWord" : "城市",
        "audio" : "city",
        "englishWord" : "city"
      },
      {
        "pronunciation" : "qū",
        "chineseWord" : "区",
        "audio" : "district",
        "englishWord" : "district"
      },
      {
        "pronunciation" : "gōngchǎng",
        "chineseWord" : "工厂",
        "audio" : "factory",
        "englishWord" : "factory"
      },
      {
        "pronunciation" : "bàngōng dàlóu",
        "chineseWord" : "办公楼",
        "audio" : "officebuilding",
        "englishWord" : "office building"
      },
      {
        "pronunciation" : "jiēdào",
        "chineseWord" : "街道",
        "audio" : "street",
        "englishWord" : "street"
      }
    ]
  },
  {
    "name" : "clothes",
    "words" : [
      {
        "pronunciation" : "liányīqún ",
        "chineseWord" : "连衣裙",
        "audio" : "dress",
        "englishWord" : "dress"
      },
      {
        "pronunciation" : "jiākè",
        "chineseWord" : "夹克",
        "audio" : "jacket",
        "englishWord" : "jacket"
      },
      {
        "pronunciation" : "niúzǎikù",
        "chineseWord" : "牛仔裤",
        "audio" : "jeans",
        "englishWord" : "jeans"
      },
      {
        "pronunciation" : "kùzi",
        "chineseWord" : "裤子",
        "audio" : "pants",
        "englishWord" : "pants"
      },
      {
        "pronunciation" : "chènshān",
        "chineseWord" : "衬衫",
        "audio" : "shirt",
        "englishWord" : "shirt"
      },
      {
        "pronunciation" : "duǎnkù",
        "chineseWord" : "短裤",
        "audio" : "shorts",
        "englishWord" : "shorts"
      },
      {
        "pronunciation" : "qúnzi",
        "chineseWord" : "裙子",
        "audio" : "skirt",
        "englishWord" : "skirt"
      },
      {
        "pronunciation" : "máoyī",
        "chineseWord" : "毛衣",
        "audio" : "sweater",
        "englishWord" : "sweater"
      }
    ]
  },
  {
    "name" : "colors",
    "words" : [
      {
        "pronunciation" : " hēisè",
        "chineseWord" : "黑色",
        "audio" : "black",
        "englishWord" : "black"
      },
      {
        "pronunciation" : "lánsè ",
        "chineseWord" : "蓝色",
        "audio" : "blue",
        "englishWord" : "blue"
      },
      {
        "pronunciation" : "zōngsè",
        "chineseWord" : "棕色",
        "audio" : "brown",
        "englishWord" : "brown"
      },
      {
        "pronunciation" : "lǜsè",
        "chineseWord" : "绿色",
        "audio" : "green",
        "englishWord" : "green"
      },
      {
        "pronunciation" : "zǐsè",
        "chineseWord" : "紫色",
        "audio" : "purple",
        "englishWord" : "purple"
      },
      {
        "pronunciation" : "hóngsè",
        "chineseWord" : " 红色",
        "audio" : "red",
        "englishWord" : "red"
      },
      {
        "pronunciation" : "báisè",
        "chineseWord" : "白色",
        "audio" : "white",
        "englishWord" : "white"
      },
      {
        "pronunciation" : "huángsè",
        "chineseWord" : " 黄色",
        "audio" : "yellow",
        "englishWord" : "yellow"
      }
    ]
  },
  {
    "name" : "common verbs 1",
    "words" : [
      {
        "pronunciation" : "guān",
        "chineseWord" : "关",
        "audio" : "close",
        "englishWord" : "close"
      },
      {
        "pronunciation" : "gěi",
        "chineseWord" : "给",
        "audio" : "give",
        "englishWord" : "give"
      },
      {
        "pronunciation" : "tīng",
        "chineseWord" : "听",
        "audio" : "listen",
        "englishWord" : "listen"
      },
      {
        "pronunciation" : "dǎ kāi",
        "chineseWord" : "打开",
        "audio" : "open",
        "englishWord" : "open"
      },
      {
        "pronunciation" : "dú",
        "chineseWord" : "读",
        "audio" : "read",
        "englishWord" : "read"
      },
      {
        "pronunciation" : "shuō",
        "chineseWord" : "说",
        "audio" : "speak",
        "englishWord" : "speak"
      },
      {
        "pronunciation" : "ná",
        "chineseWord" : "拿",
        "audio" : "take",
        "englishWord" : "take"
      },
      {
        "pronunciation" : "xiě",
        "chineseWord" : "写",
        "audio" : "write",
        "englishWord" : "write"
      }
    ]
  },
  {
    "name" : "common verbs 2",
    "words" : [
      {
        "pronunciation" : "zhuā zhù",
        "chineseWord" : "抓住",
        "audio" : "catch",
        "englishWord" : "catch"
      },
      {
        "pronunciation" : "tiào wǔ",
        "chineseWord" : "跳舞",
        "audio" : "dance",
        "englishWord" : "dance"
      },
      {
        "pronunciation" : "pǎo",
        "chineseWord" : "跑",
        "audio" : "run",
        "englishWord" : "run"
      },
      {
        "pronunciation" : "chàng gē",
        "chineseWord" : "唱歌",
        "audio" : "sing",
        "englishWord" : "sing"
      },
      {
        "pronunciation" : "rēng",
        "chineseWord" : "扔",
        "audio" : "throw",
        "englishWord" : "throw"
      },
      {
        "pronunciation" : "zǒu lù",
        "chineseWord" : "走路",
        "audio" : "walk",
        "englishWord" : "walk"
      },
      {
        "pronunciation" : "chuān",
        "chineseWord" : "穿",
        "audio" : "wear",
        "englishWord" : "wear"
      },
      {
        "pronunciation" : "huān yíng",
        "chineseWord" : "欢迎",
        "audio" : "welcome",
        "englishWord" : "welcome"
      }
    ]
  },
  {
    "name" : "common verbs 3",
    "words" : [
      {
        "pronunciation" : "chá",
        "chineseWord" : "查",
        "audio" : "check",
        "englishWord" : "check"
      },
      {
        "pronunciation" : "hē",
        "chineseWord" : "喝",
        "audio" : "drink",
        "englishWord" : "drink"
      },
      {
        "pronunciation" : "chī",
        "chineseWord" : "吃",
        "audio" : "eat",
        "englishWord" : "eat"
      },
      {
        "pronunciation" : "qù",
        "chineseWord" : "去",
        "audio" : "go",
        "englishWord" : "go"
      },
      {
        "pronunciation" : "bāng zhù",
        "chineseWord" : "帮助",
        "audio" : "help",
        "englishWord" : "help"
      },
      {
        "pronunciation" : "zhù",
        "chineseWord" : "住",
        "audio" : "live",
        "englishWord" : "live"
      },
      {
        "pronunciation" : "shì",
        "chineseWord" : "试",
        "audio" : "try",
        "englishWord" : "try"
      },
      {
        "pronunciation" : "yòng",
        "chineseWord" : "用",
        "audio" : "use",
        "englishWord" : "use"
      }
    ]
  },
  {
    "name" : "common verbs 4",
    "words" : [
      {
        "pronunciation" : "dào qiàn",
        "chineseWord" : "道歉",
        "audio" : "apologize",
        "englishWord" : "apologize"
      },
      {
        "pronunciation" : "xiāng xìn",
        "chineseWord" : "相信",
        "audio" : "believe",
        "englishWord" : "believe"
      },
      {
        "pronunciation" : "bù xǐ huan",
        "chineseWord" : "不喜欢",
        "audio" : "dislike",
        "englishWord" : "dislike"
      },
      {
        "pronunciation" : "tǎo yàn",
        "chineseWord" : "讨厌",
        "audio" : "hate",
        "englishWord" : "hate"
      },
      {
        "pronunciation" : "ài",
        "chineseWord" : "爱",
        "audio" : "love",
        "englishWord" : "love"
      },
      {
        "pronunciation" : "wán",
        "chineseWord" : "玩",
        "audio" : "play",
        "englishWord" : "play"
      },
      {
        "pronunciation" : "xǐ huan",
        "chineseWord" : "喜欢",
        "audio" : "like",
        "englishWord" : "like"
      },
      {
        "pronunciation" : "kàn",
        "chineseWord" : "看",
        "audio" : "watch",
        "englishWord" : "watch"
      }
    ]
  },
  {
    "name" : "common verbs 5",
    "words" : [
      {
        "pronunciation" : "kū",
        "chineseWord" : "哭",
        "audio" : "cry",
        "englishWord" : "cry"
      },
      {
        "pronunciation" : "wèn",
        "chineseWord" : "问",
        "audio" : "ask",
        "englishWord" : "ask"
      },
      {
        "pronunciation" : "xiào",
        "chineseWord" : "笑",
        "audio" : "laugh",
        "englishWord" : "laugh"
      },
      {
        "pronunciation" : "fù",
        "chineseWord" : "付",
        "audio" : "pay",
        "englishWord" : "pay"
      },
      {
        "pronunciation" : "tíng",
        "chineseWord" : "停",
        "audio" : "stop",
        "englishWord" : "stop"
      },
      {
        "pronunciation" : "ràng",
        "chineseWord" : "让",
        "audio" : "let",
        "englishWord" : "let"
      },
      {
        "pronunciation" : "jiàn miàn",
        "chineseWord" : "见面",
        "audio" : "meet",
        "englishWord" : "meet"
      },
      {
        "pronunciation" : "xū yào",
        "chineseWord" : "需要",
        "audio" : "need",
        "englishWord" : "need"
      }
    ]
  },
  {
    "name" : "common verbs 6",
    "words" : [
      {
        "pronunciation" : "tóng yì",
        "chineseWord" : "同意",
        "audio" : "agree",
        "englishWord" : "agree"
      },
      {
        "pronunciation" : "jiě shì",
        "chineseWord" : "解释",
        "audio" : "explain",
        "englishWord" : "explain"
      },
      {
        "pronunciation" : "wàng",
        "chineseWord" : "忘",
        "audio" : "forget",
        "englishWord" : "forget"
      },
      {
        "pronunciation" : "jì de",
        "chineseWord" : "记得",
        "audio" : "remember",
        "englishWord" : "remember"
      },
      {
        "pronunciation" : "tán",
        "chineseWord" : "谈",
        "audio" : "talk",
        "englishWord" : "talk"
      },
      {
        "pronunciation" : "jué de",
        "chineseWord" : "觉得",
        "audio" : "think",
        "englishWord" : "think"
      },
      {
        "pronunciation" : "fǎng",
        "chineseWord" : "访",
        "audio" : "visit",
        "englishWord" : "visit"
      },
      {
        "pronunciation" : "yíng",
        "chineseWord" : "赢",
        "audio" : "win",
        "englishWord" : "win"
      }
    ]
  },
  {
    "name" : "cooking",
    "words" : [
      {
        "pronunciation" : "hōng kǎo",
        "chineseWord" : "烘烤",
        "audio" : "bake",
        "englishWord" : "bake"
      },
      {
        "pronunciation" : "zhǔ",
        "chineseWord" : "煮",
        "audio" : "boil",
        "englishWord" : "boil"
      },
      {
        "pronunciation" : "jiān",
        "chineseWord" : "煎",
        "audio" : "fry",
        "englishWord" : "fry"
      },
      {
        "pronunciation" : "kǎo",
        "chineseWord" : "烤",
        "audio" : "grill",
        "englishWord" : "grill"
      },
      {
        "pronunciation" : "pí",
        "chineseWord" : "皮",
        "audio" : "peel",
        "englishWord" : "peel"
      },
      {
        "pronunciation" : "piàn",
        "chineseWord" : "切",
        "audio" : "slice",
        "englishWord" : "slice"
      },
      {
        "pronunciation" : "jiǎo",
        "chineseWord" : "搅",
        "audio" : "stir",
        "englishWord" : "stir"
      },
      {
        "pronunciation" : "lǜ",
        "chineseWord" : "滤",
        "audio" : "strain",
        "englishWord" : "strain"
      }
    ]
  },
  {
    "name" : "dairy",
    "words" : [
      {
        "pronunciation" : "huáng yóu",
        "chineseWord" : "黄油",
        "audio" : "butter",
        "englishWord" : "butter"
      },
      {
        "pronunciation" : "nǎi lào",
        "chineseWord" : "奶酪",
        "audio" : "cheese",
        "englishWord" : "cheese"
      },
      {
        "pronunciation" : "jī dàn",
        "chineseWord" : "鸡蛋",
        "audio" : "eggs",
        "englishWord" : "eggs"
      },
      {
        "pronunciation" : "bīng qí lín",
        "chineseWord" : "冰淇淋",
        "audio" : "icecream",
        "englishWord" : "ice cream"
      },
      {
        "pronunciation" : "niú nǎi",
        "chineseWord" : "牛奶",
        "audio" : "milk",
        "englishWord" : "milk"
      },
      {
        "pronunciation" : "mò zhā lǐ lā",
        "chineseWord" : "莫扎里拉",
        "audio" : "mozzarella",
        "englishWord" : "mozzarella"
      },
      {
        "pronunciation" : "suān nǎi yóu",
        "chineseWord" : "酸奶油",
        "audio" : "sourcream",
        "englishWord" : "sour cream"
      },
      {
        "pronunciation" : "suān nǎi",
        "chineseWord" : "酸奶",
        "audio" : "yogurt",
        "englishWord" : "yogurt"
      }
    ]
  },
  {
    "name" : "emotions",
    "words" : [
      {
        "pronunciation" : "shēng qì",
        "chineseWord" : "生气",
        "audio" : "angry",
        "englishWord" : "angry"
      },
      {
        "pronunciation" : "kùn huò",
        "chineseWord" : "困惑",
        "audio" : "confused",
        "englishWord" : "confused"
      },
      {
        "pronunciation" : "xīng fèn",
        "chineseWord" : "兴奋",
        "audio" : "excited",
        "englishWord" : "excited"
      },
      {
        "pronunciation" : "gāo xìng",
        "chineseWord" : "高兴",
        "audio" : "happy",
        "englishWord" : "happy"
      },
      {
        "pronunciation" : "jí dù",
        "chineseWord" : "嫉妒",
        "audio" : "jealous",
        "englishWord" : "jealous"
      },
      {
        "pronunciation" : "shāng xīn",
        "chineseWord" : "伤心",
        "audio" : "sad",
        "englishWord" : "sad"
      },
      {
        "pronunciation" : "jīng yà",
        "chineseWord" : "惊讶",
        "audio" : "suprised",
        "englishWord" : "suprised"
      },
      {
        "pronunciation" : "lèi",
        "chineseWord" : "累",
        "audio" : "tired",
        "englishWord" : "tired"
      }
    ]
  },
  {
    "name" : "describing looks",
    "words" : [
      {
        "pronunciation" : "pàng",
        "chineseWord" : "胖",
        "audio" : "fat",
        "englishWord" : "fat"
      },
      {
        "pronunciation" : "shuài",
        "chineseWord" : "帅",
        "audio" : "handsome",
        "englishWord" : "handsome"
      },
      {
        "pronunciation" : "jī ròu",
        "chineseWord" : "肌肉",
        "audio" : "muscle",
        "englishWord" : "muscular"
      },
      {
        "pronunciation" : "piào liang",
        "chineseWord" : "漂亮",
        "audio" : "pretty",
        "englishWord" : "pretty"
      },
      {
        "pronunciation" : "duǎn",
        "chineseWord" : "短",
        "audio" : "pshort",
        "englishWord" : "short"
      },
      {
        "pronunciation" : "shòu",
        "chineseWord" : "瘦",
        "audio" : "slim",
        "englishWord" : "slim"
      },
      {
        "pronunciation" : "gāo",
        "chineseWord" : "高",
        "audio" : "ptall",
        "englishWord" : "tall"
      },
      {
        "pronunciation" : "nán kàn",
        "chineseWord" : "难看 ",
        "audio" : "ugly",
        "englishWord" : "ugly"
      }
    ]
  },
  {
    "name" : "describing places",
    "words" : [
      {
        "pronunciation" : "gān jìng",
        "chineseWord" : "干净",
        "audio" : "clean",
        "englishWord" : "clean"
      },
      {
        "pronunciation" : "fāng biàn",
        "chineseWord" : "方便",
        "audio" : "convenient",
        "englishWord" : "convenient"
      },
      {
        "pronunciation" : "yōng jǐ",
        "chineseWord" : "拥挤",
        "audio" : "crowded",
        "englishWord" : "crowded"
      },
      {
        "pronunciation" : "wēi xiǎn",
        "chineseWord" : "危险",
        "audio" : "dangerous",
        "englishWord" : "dangerous"
      },
      {
        "pronunciation" : "zāng",
        "chineseWord" : "脏",
        "audio" : "dirty",
        "englishWord" : "dirty"
      },
      {
        "pronunciation" : "lìng rén xīng fèn de",
        "chineseWord" : "令人兴奋",
        "audio" : "exciting",
        "englishWord" : "exciting"
      },
      {
        "pronunciation" : "ān jìng",
        "chineseWord" : "安静",
        "audio" : "quiet",
        "englishWord" : "quiet"
      },
      {
        "pronunciation" : "ān quán",
        "chineseWord" : "安全",
        "audio" : "safe",
        "englishWord" : "safe"
      }
    ]
  },
  {
    "name" : "describing things 1",
    "words" : [
      {
        "pronunciation" : "美丽",
        "chineseWord" : "měi lì",
        "audio" : "beautiful",
        "englishWord" : "beautiful"
      },
      {
        "pronunciation" : "pián yi",
        "chineseWord" : "便宜",
        "audio" : "cheap",
        "englishWord" : "cheap"
      },
      {
        "pronunciation" : "guì",
        "chineseWord" : "贵",
        "audio" : "expensive",
        "englishWord" : "expensive"
      },
      {
        "pronunciation" : "zhòng",
        "chineseWord" : "重",
        "audio" : "heavy",
        "englishWord" : "heavy"
      },
      {
        "pronunciation" : "qīng",
        "chineseWord" : "轻",
        "audio" : "light",
        "englishWord" : "light"
      },
      {
        "pronunciation" : "cháng",
        "chineseWord" : "长",
        "audio" : "long",
        "englishWord" : "long"
      },
      {
        "pronunciation" : "hòu",
        "chineseWord" : "厚",
        "audio" : "thick",
        "englishWord" : "thick"
      },
      {
        "pronunciation" : "báo de",
        "chineseWord" : "薄的",
        "audio" : "thin",
        "englishWord" : "thin"
      }
    ]
  },
  {
    "name" : "describing things 2",
    "words" : [
      {
        "pronunciation" : "dà",
        "chineseWord" : "大",
        "audio" : "big",
        "englishWord" : "big"
      },
      {
        "pronunciation" : "yìng",
        "chineseWord" : "硬",
        "audio" : "hard",
        "englishWord" : "hard"
      },
      {
        "pronunciation" : "yuán",
        "chineseWord" : "圆",
        "audio" : "round",
        "englishWord" : "round"
      },
      {
        "pronunciation" : "duǎn",
        "chineseWord" : "短",
        "audio" : "short",
        "englishWord" : "short"
      },
      {
        "pronunciation" : "xiǎo",
        "chineseWord" : "小",
        "audio" : "small",
        "englishWord" : "small"
      },
      {
        "pronunciation" : "ruǎn",
        "chineseWord" : "软",
        "audio" : "soft",
        "englishWord" : "soft"
      },
      {
        "pronunciation" : "píng fāng",
        "chineseWord" : "平方",
        "audio" : "square",
        "englishWord" : "square"
      },
      {
        "pronunciation" : "gāo",
        "chineseWord" : "高",
        "audio" : "tall",
        "englishWord" : "tall"
      }
    ]
  },
  {
    "name" : "describing things 3",
    "words" : [
      {
        "pronunciation" : "huài ",
        "chineseWord" : "坏",
        "audio" : "broken",
        "englishWord" : "broken"
      },
      {
        "pronunciation" : "fù zá",
        "chineseWord" : "复杂",
        "audio" : "complex",
        "englishWord" : "complex"
      },
      {
        "pronunciation" : "nán",
        "chineseWord" : "难",
        "audio" : "difficult",
        "englishWord" : "difficult"
      },
      {
        "pronunciation" : "róng yì",
        "chineseWord" : "容易",
        "audio" : "easy",
        "englishWord" : "easy"
      },
      {
        "pronunciation" : "miǎn fèi",
        "chineseWord" : "免费",
        "audio" : "free",
        "englishWord" : "free"
      },
      {
        "pronunciation" : "jiǎn dān",
        "chineseWord" : "简单",
        "audio" : "simple",
        "englishWord" : "simple"
      }
    ]
  },
  {
    "name" : "drinks",
    "words" : [
      {
        "pronunciation" : "pí jiǔ",
        "chineseWord" : "啤酒",
        "audio" : "beer",
        "englishWord" : "beer"
      },
      {
        "pronunciation" : "kā fēi",
        "chineseWord" : "咖啡",
        "audio" : "coffee",
        "englishWord" : "coffee"
      },
      {
        "pronunciation" : "kě lè",
        "chineseWord" : "可乐",
        "audio" : "cola",
        "englishWord" : "cola"
      },
      {
        "pronunciation" : "guǒ zhī",
        "chineseWord" : "果汁",
        "audio" : "juice",
        "englishWord" : "juice"
      },
      {
        "pronunciation" : "niú nǎi",
        "chineseWord" : "牛奶",
        "audio" : "milk",
        "englishWord" : "milk"
      },
      {
        "pronunciation" : "kuàng quán shuǐ",
        "chineseWord" : "矿泉水",
        "audio" : "mineralwater",
        "englishWord" : "mineral water"
      },
      {
        "pronunciation" : "chá",
        "chineseWord" : "茶",
        "audio" : "tea",
        "englishWord" : "tea"
      },
      {
        "pronunciation" : "jiǔ",
        "chineseWord" : "酒",
        "audio" : "wine",
        "englishWord" : "wine"
      }
    ]
  },
  {
    "name" : "face",
    "words" : [
      {
        "pronunciation" : "ěr duo",
        "chineseWord" : "耳朵",
        "audio" : "ears",
        "englishWord" : "ears"
      },
      {
        "pronunciation" : "méi mao",
        "chineseWord" : "眉毛",
        "audio" : "eyebrows",
        "englishWord" : "eyebrows"
      },
      {
        "pronunciation" : "yǎn jīng",
        "chineseWord" : "眼睛",
        "audio" : "eyes",
        "englishWord" : "eyes"
      },
      {
        "pronunciation" : "nǎo mén",
        "chineseWord" : "脑门",
        "audio" : "forehead",
        "englishWord" : "forehead"
      },
      {
        "pronunciation" : "zuǐ chún",
        "chineseWord" : "嘴唇",
        "audio" : "lips",
        "englishWord" : "lips"
      },
      {
        "pronunciation" : "kǒu",
        "chineseWord" : "口",
        "audio" : "mouth",
        "englishWord" : "mouth"
      },
      {
        "pronunciation" : "bí zi",
        "chineseWord" : "鼻子",
        "audio" : "nose",
        "englishWord" : "nose"
      },
      {
        "pronunciation" : "yá",
        "chineseWord" : "牙",
        "audio" : "teeth",
        "englishWord" : "teeth"
      }
    ]
  },
  {
    "name" : "family",
    "words" : [
      {
        "pronunciation" : "ā yí",
        "chineseWord" : "阿姨",
        "audio" : "aunt",
        "englishWord" : "aunt"
      },
      {
        "pronunciation" : "biǎo dì",
        "chineseWord" : "表弟",
        "audio" : "cousin",
        "englishWord" : "cousin"
      },
      {
        "pronunciation" : "nǚ ér",
        "chineseWord" : "女儿",
        "audio" : "daughter",
        "englishWord" : "daughter"
      },
      {
        "pronunciation" : "bà ba",
        "chineseWord" : "爸爸",
        "audio" : "father",
        "englishWord" : "father"
      },
      {
        "pronunciation" : "mā mā",
        "chineseWord" : "妈妈",
        "audio" : "mother",
        "englishWord" : "mother"
      },
      {
        "pronunciation" : "ér zi",
        "chineseWord" : "儿子",
        "audio" : "son",
        "englishWord" : "son"
      },
      {
        "pronunciation" : "dì di",
        "chineseWord" : "弟弟",
        "audio" : "youngerbrother",
        "englishWord" : "youngerbrother"
      },
      {
        "pronunciation" : "mèi mèi",
        "chineseWord" : "妹妹",
        "audio" : "youngersister",
        "englishWord" : "youngersister"
      }
    ]
  },
  {
    "name" : "fast food",
    "words" : [
      {
        "pronunciation" : "juǎn bǐng",
        "chineseWord" : "卷饼",
        "audio" : "burrito",
        "englishWord" : "burrito"
      },
      {
        "pronunciation" : "zhà shǔ tiáo",
        "chineseWord" : "炸薯条",
        "audio" : "frenchfries",
        "englishWord" : "french fries"
      },
      {
        "pronunciation" : "zhà jī",
        "chineseWord" : "炸鸡",
        "audio" : "friedchicken",
        "englishWord" : "fried chicken"
      },
      {
        "pronunciation" : "hàn bǎo",
        "chineseWord" : "汉堡",
        "audio" : "hamburger",
        "englishWord" : "hamburger"
      },
      {
        "pronunciation" : "rè gǒu",
        "chineseWord" : "热狗",
        "audio" : "hotdog",
        "englishWord" : "hot dog"
      },
      {
        "pronunciation" : "onion rings",
        "chineseWord" : "洋葱圈",
        "audio" : "onionrings",
        "englishWord" : "onion rings"
      },
      {
        "pronunciation" : "pī sà",
        "chineseWord" : "披萨",
        "audio" : "pizza",
        "englishWord" : "pizza"
      },
      {
        "pronunciation" : "sān míng zhì",
        "chineseWord" : "三明治",
        "audio" : "sandwich",
        "englishWord" : "sandwich"
      }
    ]
  },
  {
    "name" : "food",
    "words" : [
      {
        "pronunciation" : "niú ròu",
        "chineseWord" : "牛肉",
        "audio" : "beef",
        "englishWord" : "beef"
      },
      {
        "pronunciation" : "miàn bāo",
        "chineseWord" : "面包",
        "audio" : "bread",
        "englishWord" : "bread"
      },
      {
        "pronunciation" : "jī ròu",
        "chineseWord" : "鸡肉",
        "audio" : "chicken",
        "englishWord" : "chicken"
      },
      {
        "pronunciation" : "yú",
        "chineseWord" : "鱼",
        "audio" : "ffish",
        "englishWord" : "fish"
      },
      {
        "pronunciation" : "yáng ròu",
        "chineseWord" : "羊肉",
        "audio" : "mutton",
        "englishWord" : "mutton"
      },
      {
        "pronunciation" : "zhū ròu",
        "chineseWord" : "猪肉",
        "audio" : "pork",
        "englishWord" : "pork"
      },
      {
        "pronunciation" : "hǎi xiān",
        "chineseWord" : "海鲜",
        "audio" : "seafood",
        "englishWord" : "seafood"
      },
      {
        "pronunciation" : "xiǎo chī",
        "chineseWord" : "小吃",
        "audio" : "snack",
        "englishWord" : "snack"
      }
    ]
  },
  {
    "name" : "fruit",
    "words" : [
      {
        "pronunciation" : "píng guǒ",
        "chineseWord" : "苹果",
        "audio" : "apple",
        "englishWord" : "apple"
      },
      {
        "pronunciation" : "xiāng jiāo",
        "chineseWord" : "香蕉",
        "audio" : "banana",
        "englishWord" : "banana"
      },
      {
        "pronunciation" : "pú táo yòu",
        "chineseWord" : "葡萄柚",
        "audio" : "grapefruit",
        "englishWord" : "grapefruit"
      },
      {
        "pronunciation" : "jú zi",
        "chineseWord" : "橘子",
        "audio" : "orange",
        "englishWord" : "orange"
      },
      {
        "pronunciation" : "táo",
        "chineseWord" : "桃",
        "audio" : "peach",
        "englishWord" : "peach"
      },
      {
        "pronunciation" : "lí",
        "chineseWord" : "梨",
        "audio" : "pear",
        "englishWord" : "pear"
      },
      {
        "pronunciation" : "bō luó",
        "chineseWord" : "菠萝",
        "audio" : "pineapple",
        "englishWord" : "pineapple"
      },
      {
        "pronunciation" : "cǎo méi",
        "chineseWord" : "草莓",
        "audio" : "strawberry",
        "englishWord" : "strawbetty"
      }
    ]
  },
  {
    "name" : "furniture",
    "words" : [
      {
        "pronunciation" : "chuáng",
        "chineseWord" : "床",
        "audio" : "bed",
        "englishWord" : "bed"
      },
      {
        "pronunciation" : "shū guì",
        "chineseWord" : "书柜",
        "audio" : "bookcase",
        "englishWord" : "bookcase"
      },
      {
        "pronunciation" : "yǐ zi",
        "chineseWord" : "椅子",
        "audio" : "chair",
        "englishWord" : "chair"
      },
      {
        "pronunciation" : "shū zhuō",
        "chineseWord" : "书桌",
        "audio" : "desk",
        "englishWord" : "desk"
      },
      {
        "pronunciation" : "jìng zi",
        "chineseWord" : "镜子",
        "audio" : "mirror",
        "englishWord" : "mirror"
      },
      {
        "pronunciation" : "沙发",
        "chineseWord" : "shā fā",
        "audio" : "sofa",
        "englishWord" : "sofa"
      },
      {
        "pronunciation" : "zhuō zi",
        "chineseWord" : "桌子",
        "audio" : "table",
        "englishWord" : "table"
      },
      {
        "pronunciation" : "yī guì",
        "chineseWord" : "衣柜",
        "audio" : "wardrobe",
        "englishWord" : "wardrobe"
      }
    ]
  },
  {
    "name" : "house",
    "words" : [
      {
        "pronunciation" : "dì tǎn",
        "chineseWord" : "地毯",
        "audio" : "carpet",
        "englishWord" : "carpet"
      },
      {
        "pronunciation" : "tiān huā bǎn",
        "chineseWord" : "天花板",
        "audio" : "ceiling",
        "englishWord" : "ceiling"
      },
      {
        "pronunciation" : "mén",
        "chineseWord" : "门",
        "audio" : "door",
        "englishWord" : "door"
      },
      {
        "pronunciation" : "dì bǎn",
        "chineseWord" : "地板",
        "audio" : "floor",
        "englishWord" : "floor"
      },
      {
        "pronunciation" : "lóu tī",
        "chineseWord" : "楼梯",
        "audio" : "stairs",
        "englishWord" : "stairs"
      },
      {
        "pronunciation" : "qiáng",
        "chineseWord" : "墙",
        "audio" : "wall",
        "englishWord" : "wall"
      },
      {
        "pronunciation" : "chuāng hu",
        "chineseWord" : "窗户",
        "audio" : "window",
        "englishWord" : "window"
      }
    ]
  },
  {
    "name" : "illness",
    "words" : [
      {
        "pronunciation" : "gǎn mào",
        "chineseWord" : "感冒",
        "audio" : "acold",
        "englishWord" : "a cold"
      },
      {
        "pronunciation" : "bèi tòng",
        "chineseWord" : "背痛",
        "audio" : "backache",
        "englishWord" : "backache"
      },
      {
        "pronunciation" : "ké sou",
        "chineseWord" : "咳嗽",
        "audio" : "cough",
        "englishWord" : "cough"
      },
      {
        "pronunciation" : "fā shāo",
        "chineseWord" : "发烧",
        "audio" : "fever",
        "englishWord" : "fever"
      },
      {
        "pronunciation" : "tóu tòng",
        "chineseWord" : "头痛",
        "audio" : "headache",
        "englishWord" : "headache"
      },
      {
        "pronunciation" : "hóu lóng tòng",
        "chineseWord" : "喉咙痛",
        "audio" : "sorethroat",
        "englishWord" : "sorethroat"
      },
      {
        "pronunciation" : "liú gǎn",
        "chineseWord" : "流感",
        "audio" : "theflu",
        "englishWord" : "the flu"
      },
      {
        "pronunciation" : "yá tòng",
        "chineseWord" : "牙痛",
        "audio" : "toothache",
        "englishWord" : "toothache"
      }
    ]
  },
  {
    "name" : "jewelry",
    "words" : [
      {
        "pronunciation" : "shǒu zhuó",
        "chineseWord" : "手镯",
        "audio" : "bracelet",
        "englishWord" : "bracelet"
      },
      {
        "pronunciation" : "ěr huán",
        "chineseWord" : "耳环",
        "audio" : "earrings",
        "englishWord" : "earrings"
      },
      {
        "pronunciation" : "xiàng liàn",
        "chineseWord" : "项链",
        "audio" : "necklace",
        "englishWord" : "necklace"
      },
      {
        "pronunciation" : "zhēn zhū",
        "chineseWord" : "珍珠",
        "audio" : "pearls",
        "englishWord" : "pearls"
      },
      {
        "pronunciation" : "jiè zhi",
        "chineseWord" : "戒指",
        "audio" : "ring",
        "englishWord" : "ring"
      },
      {
        "pronunciation" : "shǒu biǎo",
        "chineseWord" : "手表",
        "audio" : "jwatch",
        "englishWord" : "watch"
      },
      {
        "pronunciation" : "jié hūn jiè zhi",
        "chineseWord" : "结婚戒指",
        "audio" : "weddingring",
        "englishWord" : "wedding ring"
      }
    ]
  },
  {
    "name" : "jobs 1",
    "words" : [
      {
        "pronunciation" : "shāng rén",
        "chineseWord" : "商人",
        "audio" : "businessperson",
        "englishWord" : "business person"
      },
      {
        "pronunciation" : "chú shī",
        "chineseWord" : "厨师",
        "audio" : "chef",
        "englishWord" : "chef"
      },
      {
        "pronunciation" : "yī shēng",
        "chineseWord" : "医生",
        "audio" : "doctor",
        "englishWord" : "doctor"
      },
      {
        "pronunciation" : "nóng mín",
        "chineseWord" : "农民",
        "audio" : "farmer",
        "englishWord" : "farmer"
      },
      {
        "pronunciation" : "yīn yuè jiā",
        "chineseWord" : "音乐家",
        "audio" : "musician",
        "englishWord" : "musician"
      },
      {
        "pronunciation" : "hù shi",
        "chineseWord" : "护士",
        "audio" : "nurse",
        "englishWord" : "nurse"
      },
      {
        "pronunciation" : "jǐng chá",
        "chineseWord" : "警察",
        "audio" : "policeman",
        "englishWord" : "policeman"
      },
      {
        "pronunciation" : "lǎo shī",
        "chineseWord" : "老师",
        "audio" : "teacher",
        "englishWord" : "teacher"
      }
    ]
  },
  {
    "name" : "jobs 2",
    "words" : [
      {
        "pronunciation" : "yǎn yuán",
        "chineseWord" : "演员",
        "audio" : "actor",
        "englishWord" : "actor"
      },
      {
        "pronunciation" : "huà jiā",
        "chineseWord" : "画家",
        "audio" : "artist",
        "englishWord" : "artist"
      },
      {
        "pronunciation" : "yùn dòng yuán",
        "chineseWord" : "运动员",
        "audio" : "athlete",
        "englishWord" : "athlete"
      },
      {
        "pronunciation" : "yá yī",
        "chineseWord" : "牙医",
        "audio" : "dentist",
        "englishWord" : "dentist"
      },
      {
        "pronunciation" : "sī jī",
        "chineseWord" : "司机",
        "audio" : "driver",
        "englishWord" : "driver"
      },
      {
        "pronunciation" : "kuài dì yuán",
        "chineseWord" : "快递员",
        "audio" : "expressdeliveryman",
        "englishWord" : "express delivery man"
      },
      {
        "pronunciation" : "lǐ fà shī",
        "chineseWord" : "理髮師",
        "audio" : "hairdresser",
        "englishWord" : "hair dresser"
      },
      {
        "pronunciation" : "mì shū",
        "chineseWord" : "秘书",
        "audio" : "secretary",
        "englishWord" : "secretary"
      }
    ]
  },
  {
    "name" : "materials 1",
    "words" : [
      {
        "pronunciation" : "bō lí",
        "chineseWord" : "玻璃",
        "audio" : "mglass",
        "englishWord" : "glass"
      },
      {
        "pronunciation" : "jīn",
        "chineseWord" : "金",
        "audio" : "gold",
        "englishWord" : "gold"
      },
      {
        "pronunciation" : "jīn shǔ",
        "chineseWord" : "金属",
        "audio" : "metal",
        "englishWord" : "metal"
      },
      {
        "pronunciation" : "zhǐ",
        "chineseWord" : "纸",
        "audio" : "paper",
        "englishWord" : "paper"
      },
      {
        "pronunciation" : "sù jiāo",
        "chineseWord" : "塑胶",
        "audio" : "plastic",
        "englishWord" : "plastic"
      },
      {
        "pronunciation" : "xiàng jiāo",
        "chineseWord" : "橡胶",
        "audio" : "rubber",
        "englishWord" : "rubber"
      },
      {
        "pronunciation" : "yín",
        "chineseWord" : "银",
        "audio" : "silver",
        "englishWord" : "silver"
      },
      {
        "pronunciation" : "mù",
        "chineseWord" : "木",
        "audio" : "wood",
        "englishWord" : "wood"
      }
    ]
  },
  {
    "name" : "materials 2",
    "words" : [
      {
        "pronunciation" : "huáng tóng",
        "chineseWord" : "黄铜",
        "audio" : "brass",
        "englishWord" : "brass"
      },
      {
        "pronunciation" : "mián huā",
        "chineseWord" : "棉花",
        "audio" : "cotton",
        "englishWord" : "cotton"
      },
      {
        "pronunciation" : "pí gé",
        "chineseWord" : "皮革",
        "audio" : "leather",
        "englishWord" : "leather"
      },
      {
        "pronunciation" : "shā",
        "chineseWord" : "沙",
        "audio" : "sand",
        "englishWord" : "sand"
      },
      {
        "pronunciation" : "sī chóu",
        "chineseWord" : "丝绸",
        "audio" : "silk",
        "englishWord" : "silk"
      },
      {
        "pronunciation" : "gāng",
        "chineseWord" : "钢",
        "audio" : "steel",
        "englishWord" : "steel"
      },
      {
        "pronunciation" : "shí tou",
        "chineseWord" : "石头",
        "audio" : "stone",
        "englishWord" : "stone"
      },
      {
        "pronunciation" : "yáng máo",
        "chineseWord" : "羊毛",
        "audio" : "wool",
        "englishWord" : "wool"
      }
    ]
  },
  {
    "name" : "music",
    "words" : [
      {
        "pronunciation" : "gǔ diǎn yuè",
        "chineseWord" : "古典乐",
        "audio" : "classical",
        "englishWord" : "classical"
      },
      {
        "pronunciation" : "xiāng cūn yīn yuè",
        "chineseWord" : "乡村音乐",
        "audio" : "country",
        "englishWord" : "country"
      },
      {
        "pronunciation" : "diàn zǐ xué",
        "chineseWord" : "电子学",
        "audio" : "electronica",
        "englishWord" : "electronica"
      },
      {
        "pronunciation" : "xī hā yīn yuè",
        "chineseWord" : "嘻哈音乐",
        "audio" : "hiphop",
        "englishWord" : "hip-hop"
      },
      {
        "pronunciation" : "jué shì yuè",
        "chineseWord" : "爵士乐",
        "audio" : "jazz",
        "englishWord" : "jazz"
      },
      {
        "pronunciation" : "liú xíng yīn yuè",
        "chineseWord" : "流行音乐",
        "audio" : "popmusic",
        "englishWord" : "pop music"
      },
      {
        "pronunciation" : "yáo gǔn yuè",
        "chineseWord" : "摇滚乐",
        "audio" : "rockmusic",
        "englishWord" : "rock music"
      }
    ]
  },
  {
    "name" : "office supplies",
    "words" : [
      {
        "pronunciation" : "bǐ jì běn",
        "chineseWord" : "笔记本",
        "audio" : "notebook",
        "englishWord" : "notebook"
      },
      {
        "pronunciation" : "huí xíng zhēn",
        "chineseWord" : "回形针",
        "audio" : "paperclip",
        "englishWord" : "paper clip"
      },
      {
        "pronunciation" : "gāng bǐ",
        "chineseWord" : "钢笔",
        "audio" : "pen",
        "englishWord" : "pen"
      },
      {
        "pronunciation" : "qiān bǐ",
        "chineseWord" : "铅笔",
        "audio" : "pencil",
        "englishWord" : "pencil"
      },
      {
        "pronunciation" : "xiàng pí jīn",
        "chineseWord" : "橡皮筋",
        "audio" : "rubberband",
        "englishWord" : "rubberband"
      },
      {
        "pronunciation" : "dìng shū jī",
        "chineseWord" : "订书机",
        "audio" : "stapler",
        "englishWord" : "stapler"
      },
      {
        "pronunciation" : "jiāo dài",
        "chineseWord" : "胶带",
        "audio" : "tape",
        "englishWord" : "tape"
      },
      {
        "pronunciation" : "bái bǎn",
        "chineseWord" : "白板",
        "audio" : "whiteboard",
        "englishWord" : "white board"
      }
    ]
  },
  {
    "name" : "personality",
    "words" : [
      {
        "pronunciation" : "yǎ",
        "chineseWord" : "哑",
        "audio" : "dumb",
        "englishWord" : "dumb"
      },
      {
        "pronunciation" : "cū lǔ",
        "chineseWord" : "粗鲁",
        "audio" : "rude",
        "englishWord" : "rude"
      },
      {
        "pronunciation" : "qín fèn",
        "chineseWord" : "勤奋",
        "audio" : "hardworking",
        "englishWord" : "hardworking"
      },
      {
        "pronunciation" : "lǎn duò",
        "chineseWord" : "懒惰",
        "audio" : "lazy",
        "englishWord" : "lazy"
      },
      {
        "pronunciation" : "cōng míng",
        "chineseWord" : "聪明",
        "audio" : "smart",
        "englishWord" : "smart"
      },
      {
        "pronunciation" : "yǒu hǎo",
        "chineseWord" : "友好",
        "audio" : "friendly",
        "englishWord" : "friendly"
      }
    ]
  },
  {
    "name" : "places 1",
    "words" : [
      {
        "pronunciation" : "yín háng",
        "chineseWord" : "银行",
        "audio" : "bank",
        "englishWord" : "bank"
      },
      {
        "pronunciation" : "kā fēi diàn",
        "chineseWord" : "咖啡店",
        "audio" : "cafe",
        "englishWord" : "cafe"
      },
      {
        "pronunciation" : "lǚ guǎn",
        "chineseWord" : "旅馆",
        "audio" : "hotel",
        "englishWord" : "hotel"
      },
      {
        "pronunciation" : "gōng yuán",
        "chineseWord" : "公园",
        "audio" : "park",
        "englishWord" : "park"
      },
      {
        "pronunciation" : "jǐng chá jú",
        "chineseWord" : "警察局",
        "audio" : "policestation",
        "englishWord" : "police station"
      },
      {
        "pronunciation" : "fàn guǎn",
        "chineseWord" : "饭馆",
        "audio" : "restaurant",
        "englishWord" : "restaurant"
      },
      {
        "pronunciation" : "shāng chǎng",
        "chineseWord" : "商场",
        "audio" : "shoppingmall",
        "englishWord" : "shopping mall"
      },
      {
        "pronunciation" : "chāo shì",
        "chineseWord" : "超市",
        "audio" : "supermarket",
        "englishWord" : "supermarket"
      }
    ]
  },
  {
    "name" : "places 2",
    "words" : [
      {
        "pronunciation" : "měi shù guǎn",
        "chineseWord" : "美术馆",
        "audio" : "artgallery",
        "englishWord" : "art gallery"
      },
      {
        "pronunciation" : "gōng gòng qì chē zhàn",
        "chineseWord" : "公共汽车站",
        "audio" : "busstop",
        "englishWord" : "bus stop"
      },
      {
        "pronunciation" : "yī yuàn",
        "chineseWord" : "医院",
        "audio" : "hospital",
        "englishWord" : "hospital"
      },
      {
        "pronunciation" : "tú shū guǎn",
        "chineseWord" : "图书馆",
        "audio" : "library",
        "englishWord" : "library"
      },
      {
        "pronunciation" : "diàn yǐng yuàn",
        "chineseWord" : "电影院",
        "audio" : "movietheater",
        "englishWord" : "movie theater"
      },
      {
        "pronunciation" : "bó wù guǎn",
        "chineseWord" : "博物馆",
        "audio" : "museum",
        "englishWord" : "museum"
      },
      {
        "pronunciation" : "yào diàn",
        "chineseWord" : "药店",
        "audio" : "pharmacy",
        "englishWord" : "pharmacy"
      },
      {
        "pronunciation" : "dì tiě zhàn",
        "chineseWord" : "地铁站",
        "audio" : "subwaystation",
        "englishWord" : "subway station"
      }
    ]
  },
  {
    "name" : "reading",
    "words" : [
      {
        "pronunciation" : "shū",
        "chineseWord" : "书",
        "audio" : "book",
        "englishWord" : "book"
      },
      {
        "pronunciation" : "zì diǎn",
        "chineseWord" : "字典",
        "audio" : "dictionary",
        "englishWord" : "dictionary"
      },
      {
        "pronunciation" : "wén zhāng",
        "chineseWord" : "文章",
        "audio" : "essay",
        "englishWord" : "essay"
      },
      {
        "pronunciation" : "zá zhì",
        "chineseWord" : "杂志",
        "audio" : "magazine",
        "englishWord" : "magazine"
      },
      {
        "pronunciation" : "bào zhǐ",
        "chineseWord" : "报纸",
        "audio" : "newspaper",
        "englishWord" : "newspaper"
      },
      {
        "pronunciation" : "shī gē",
        "chineseWord" : "诗歌",
        "audio" : "poem",
        "englishWord" : "poem"
      }
    ]
  },
  {
    "name" : "relationships",
    "words" : [
      {
        "pronunciation" : "nán péng yǒu",
        "chineseWord" : "男朋友",
        "audio" : "boyfriend",
        "englishWord" : "boyfriend"
      },
      {
        "pronunciation" : "nǚ péng yǒu",
        "chineseWord" : "女朋友",
        "audio" : "girlfriend",
        "englishWord" : "girlfriend"
      },
      {
        "pronunciation" : "dí rén",
        "chineseWord" : "敌人",
        "audio" : "enemy",
        "englishWord" : "enemy"
      },
      {
        "pronunciation" : "dìng hūn",
        "chineseWord" : "订婚",
        "audio" : "engaged",
        "englishWord" : "engaged"
      },
      {
        "pronunciation" : "jiā rén",
        "chineseWord" : "家人",
        "audio" : "familymember",
        "englishWord" : "family member"
      },
      {
        "pronunciation" : "péng you",
        "chineseWord" : "朋友",
        "audio" : "friend",
        "englishWord" : "friend"
      },
      {
        "pronunciation" : "zhàng fu",
        "chineseWord" : "丈夫",
        "audio" : "husband",
        "englishWord" : "husband"
      },
      {
        "pronunciation" : "qī zi",
        "chineseWord" : "妻子",
        "audio" : "wife",
        "englishWord" : "wife"
      }
    ]
  },
  {
    "name" : "restaurant",
    "words" : [
      {
        "pronunciation" : "qián cài",
        "chineseWord" : "前菜",
        "audio" : "appetizer",
        "englishWord" : "appetizer"
      },
      {
        "pronunciation" : "zǎo fàn",
        "chineseWord" : "早饭",
        "audio" : "breakfast",
        "englishWord" : "breakfast"
      },
      {
        "pronunciation" : "tián diǎn",
        "chineseWord" : "甜点",
        "audio" : "dessert",
        "englishWord" : "dessert"
      },
      {
        "pronunciation" : "wǎn fàn",
        "chineseWord" : "晚饭",
        "audio" : "dinner",
        "englishWord" : "dinner"
      },
      {
        "pronunciation" : "wǔ fàn",
        "chineseWord" : "午饭",
        "audio" : "lunch",
        "englishWord" : "lunch"
      },
      {
        "pronunciation" : "cài dān",
        "chineseWord" : "菜单",
        "audio" : "menu",
        "englishWord" : "menu"
      },
      {
        "pronunciation" : "mǎi dān",
        "chineseWord" : "买单",
        "audio" : "paybill",
        "englishWord" : "pay the bill"
      },
      {
        "pronunciation" : "fú wù yuán",
        "chineseWord" : "服务员",
        "audio" : "waiter",
        "englishWord" : "waiter"
      }
    ]
  },
  {
    "name" : "rooms",
    "words" : [
      {
        "pronunciation" : "yáng tái",
        "chineseWord" : "阳台",
        "audio" : "balcony",
        "englishWord" : "balcony"
      },
      {
        "pronunciation" : "wèi shēng jiān",
        "chineseWord" : "卫生间",
        "audio" : "bathroom",
        "englishWord" : "bathroom"
      },
      {
        "pronunciation" : "wò shì",
        "chineseWord" : "卧室",
        "audio" : "bedroom",
        "englishWord" : "bedroom"
      },
      {
        "pronunciation" : "yī guì",
        "chineseWord" : "衣柜",
        "audio" : "closet",
        "englishWord" : "closet"
      },
      {
        "pronunciation" : "cān tīng",
        "chineseWord" : "餐厅",
        "audio" : "diningroom",
        "englishWord" : "dining room"
      },
      {
        "pronunciation" : "huā yuán",
        "chineseWord" : "花园",
        "audio" : "garden",
        "englishWord" : "garden"
      },
      {
        "pronunciation" : "chú fáng",
        "chineseWord" : "厨房",
        "audio" : "kitchen",
        "englishWord" : "kitchen"
      },
      {
        "pronunciation" : "kè tīng",
        "chineseWord" : "客厅",
        "audio" : "livingroom",
        "englishWord" : "living room"
      }
    ]
  },
  {
    "name" : "school",
    "words" : [
      {
        "pronunciation" : "shí táng",
        "chineseWord" : "食堂",
        "audio" : "cafeteria",
        "englishWord" : "cafeteria"
      },
      {
        "pronunciation" : "xiào yuán",
        "chineseWord" : "校园",
        "audio" : "campus",
        "englishWord" : "campus"
      },
      {
        "pronunciation" : "kè",
        "chineseWord" : "课",
        "audio" : "class",
        "englishWord" : "class"
      },
      {
        "pronunciation" : "sù shè",
        "chineseWord" : "宿舍",
        "audio" : "dorm",
        "englishWord" : "dorm"
      },
      {
        "pronunciation" : "kǎo shì",
        "chineseWord" : "考试",
        "audio" : "exam",
        "englishWord" : "exam"
      },
      {
        "pronunciation" : "bì yè",
        "chineseWord" : "毕业",
        "audio" : "graduate",
        "englishWord" : "graduate"
      },
      {
        "pronunciation" : "jiào shòu",
        "chineseWord" : "教授",
        "audio" : "professor",
        "englishWord" : "professor"
      },
      {
        "pronunciation" : "xué shēng",
        "chineseWord" : "学生",
        "audio" : "student",
        "englishWord" : "student"
      }
    ]
  },
  {
    "name" : "sports",
    "words" : [
      {
        "pronunciation" : "yǔ máo qiú",
        "chineseWord" : "羽毛球",
        "audio" : "badminton",
        "englishWord" : "badminton"
      },
      {
        "pronunciation" : "bàng qiú",
        "chineseWord" : "棒球",
        "audio" : "baseball",
        "englishWord" : "baseball"
      },
      {
        "pronunciation" : "lán qiú",
        "chineseWord" : "篮球",
        "audio" : "basketball",
        "englishWord" : "basketball"
      },
      {
        "pronunciation" : "bǎn qiú",
        "chineseWord" : "板球",
        "audio" : "cricket",
        "englishWord" : "cricket"
      },
      {
        "pronunciation" : "bīng qiú",
        "chineseWord" : "冰球",
        "audio" : "icehockey",
        "englishWord" : "ice hockey"
      },
      {
        "pronunciation" : "zú qiú",
        "chineseWord" : "足球",
        "audio" : "soccer",
        "englishWord" : "soccer"
      },
      {
        "pronunciation" : "wǎng qiú",
        "chineseWord" : "网球",
        "audio" : "tennis",
        "englishWord" : "tennis"
      },
      {
        "pronunciation" : "pái qiú",
        "chineseWord" : "排球",
        "audio" : "volleyball",
        "englishWord" : "volleyball"
      }
    ]
  },
  {
    "name" : "taste",
    "words" : [
      {
        "pronunciation" : "kǔ",
        "chineseWord" : "苦",
        "audio" : "bitter",
        "englishWord" : "bitter"
      },
      {
        "pronunciation" : "píng dàn",
        "chineseWord" : "平淡",
        "audio" : "bland",
        "englishWord" : "bland"
      },
      {
        "pronunciation" : "hào chī",
        "chineseWord" : "好吃",
        "audio" : "delicious",
        "englishWord" : "delicious"
      },
      {
        "pronunciation" : "ě xin",
        "chineseWord" : "恶心",
        "audio" : "disgusting",
        "englishWord" : "disgusting"
      },
      {
        "pronunciation" : "xián",
        "chineseWord" : "咸",
        "audio" : "salty",
        "englishWord" : "salty"
      },
      {
        "pronunciation" : "suān",
        "chineseWord" : "酸",
        "audio" : "sour",
        "englishWord" : "sour"
      },
      {
        "pronunciation" : "là",
        "chineseWord" : "辣",
        "audio" : "spicy",
        "englishWord" : "spicy"
      },
      {
        "pronunciation" : "tián",
        "chineseWord" : "甜",
        "audio" : "sweet",
        "englishWord" : "sweet"
      }
    ]
  },
  {
    "name" : "technology",
    "words" : [
      {
        "pronunciation" : "chōng diàn qì",
        "chineseWord" : "充电器",
        "audio" : "charger",
        "englishWord" : "charger"
      },
      {
        "pronunciation" : "fù yìn jī",
        "chineseWord" : "复印机",
        "audio" : "copier",
        "englishWord" : "copier"
      },
      {
        "pronunciation" : "tái shì diàn nǎo",
        "chineseWord" : "台式电脑",
        "audio" : "desktopcomputer",
        "englishWord" : "desktop computer"
      },
      {
        "pronunciation" : "bǐ jì běn diàn nǎo",
        "chineseWord" : "笔记本电脑",
        "audio" : "laptop",
        "englishWord" : "laptop"
      },
      {
        "pronunciation" : "shǒu jī",
        "chineseWord" : "手机",
        "audio" : "mobilephone",
        "englishWord" : "mobile phone"
      },
      {
        "pronunciation" : "dǎ yìn jī",
        "chineseWord" : "打印机",
        "audio" : "printer",
        "englishWord" : "printer"
      },
      {
        "pronunciation" : "píng bǎn diàn nǎo",
        "chineseWord" : "平板电脑 ",
        "audio" : "tablet",
        "englishWord" : "tablet"
      },
      {
        "pronunciation" : "wú xiàn wǎng luò",
        "chineseWord" : "无线网络",
        "audio" : "wifi",
        "englishWord" : "wifi"
      }
    ]
  },
  {
    "name" : "transportation",
    "words" : [
      {
        "pronunciation" : "zì xíng chē",
        "chineseWord" : "自行车",
        "audio" : "bike",
        "englishWord" : "bike"
      },
      {
        "pronunciation" : "gōng gòng qì chē",
        "chineseWord" : "公共汽车",
        "audio" : "bus",
        "englishWord" : "bus"
      },
      {
        "pronunciation" : "qì chē",
        "chineseWord" : "汽车",
        "audio" : "car",
        "englishWord" : "car"
      },
      {
        "pronunciation" : "diàn dòng zì xíng chē",
        "chineseWord" : "电动自行车",
        "audio" : "ebike",
        "englishWord" : "ebike"
      },
      {
        "pronunciation" : "dì tiě",
        "chineseWord" : "地铁",
        "audio" : "subway",
        "englishWord" : "subway"
      },
      {
        "pronunciation" : "chū zū chē",
        "chineseWord" : "出租车",
        "audio" : "taxi",
        "englishWord" : "taxi"
      },
      {
        "pronunciation" : "kǎ chē",
        "chineseWord" : "卡车",
        "audio" : "truck",
        "englishWord" : "truck"
      },
      {
        "pronunciation" : "sàn bù",
        "chineseWord" : "散步",
        "audio" : "walking",
        "englishWord" : "walking"
      }
    ]
  },
  {
    "name" : "utencils",
    "words" : [
      {
        "pronunciation" : "wǎn",
        "chineseWord" : "碗",
        "audio" : "bowl",
        "englishWord" : "bowl"
      },
      {
        "pronunciation" : "guō",
        "chineseWord" : "锅",
        "audio" : "fryingpan",
        "englishWord" : "frying pan"
      },
      {
        "pronunciation" : "bēi",
        "chineseWord" : "杯",
        "audio" : "glass",
        "englishWord" : "glass"
      },
      {
        "pronunciation" : "dāo",
        "chineseWord" : "刀",
        "audio" : "knife",
        "englishWord" : "knife"
      },
      {
        "pronunciation" : "pán zi",
        "chineseWord" : "盘子",
        "audio" : "plate",
        "englishWord" : "plate"
      },
      {
        "pronunciation" : "guō chǎn",
        "chineseWord" : "锅铲",
        "audio" : "spatula",
        "englishWord" : "spatula"
      }
    ]
  },
  {
    "name" : "vegetables 1",
    "words" : [
      {
        "pronunciation" : "tián jiāo",
        "chineseWord" : "甜椒",
        "audio" : "bellpepper",
        "englishWord" : "bell pepper"
      },
      {
        "pronunciation" : "là jiāo",
        "chineseWord" : "辣椒",
        "audio" : "chilli",
        "englishWord" : "chillis"
      },
      {
        "pronunciation" : "yù mǐ",
        "chineseWord" : "玉米",
        "audio" : "corn",
        "englishWord" : "corn"
      },
      {
        "pronunciation" : "qié zi",
        "chineseWord" : "茄子",
        "audio" : "eggplant",
        "englishWord" : "eggplant"
      },
      {
        "pronunciation" : "mó gu",
        "chineseWord" : "蘑菇",
        "audio" : "mushroom",
        "englishWord" : "mushroom"
      },
      {
        "pronunciation" : "yáng cōng",
        "chineseWord" : "洋葱",
        "audio" : "onions",
        "englishWord" : "onions"
      },
      {
        "pronunciation" : "tǔ dòu",
        "chineseWord" : "土豆",
        "audio" : "potato",
        "englishWord" : "potato"
      },
      {
        "pronunciation" : "xī hóng shi",
        "chineseWord" : "西红柿",
        "audio" : "tomato",
        "englishWord" : "tomato"
      }
    ]
  },
  {
    "name" : "vegetables 2",
    "words" : [
      {
        "pronunciation" : "xiǎo bái cài",
        "chineseWord" : "小白菜",
        "audio" : "bokchoi",
        "englishWord" : "bok choy"
      },
      {
        "pronunciation" : "xī lán huā",
        "chineseWord" : "西兰花",
        "audio" : "broccoli",
        "englishWord" : "broccoli"
      },
      {
        "pronunciation" : "huáng guā",
        "chineseWord" : "黄瓜",
        "audio" : "cucumber",
        "englishWord" : "cucumber"
      },
      {
        "pronunciation" : "hú luó bo",
        "chineseWord" : "胡萝卜",
        "audio" : "carrots",
        "englishWord" : "carrots"
      },
      {
        "pronunciation" : "suàn",
        "chineseWord" : "蒜",
        "audio" : "garlic",
        "englishWord" : "garlic"
      },
      {
        "pronunciation" : "hóng shǔ",
        "chineseWord" : "红薯",
        "audio" : "sweetpotato",
        "englishWord" : "sweet potatos"
      }
    ]
  },
  {
    "name" : "weather",
    "words" : [
      {
        "pronunciation" : "duō yún",
        "chineseWord" : "多云",
        "audio" : "cloudy",
        "englishWord" : "cloudy"
      },
      {
        "pronunciation" : "lěng",
        "chineseWord" : "冷",
        "audio" : "cold",
        "englishWord" : "cold"
      },
      {
        "pronunciation" : "liáng shuǎng",
        "chineseWord" : "凉爽",
        "audio" : "cool",
        "englishWord" : "cool"
      },
      {
        "pronunciation" : "rè",
        "chineseWord" : "热",
        "audio" : "hot",
        "englishWord" : "hot"
      },
      {
        "pronunciation" : "xià yǔ",
        "chineseWord" : "下雨",
        "audio" : "raining",
        "englishWord" : "raining"
      },
      {
        "pronunciation" : "xià xuě",
        "chineseWord" : "下雪",
        "audio" : "snowing",
        "englishWord" : "snowing"
      },
      {
        "pronunciation" : "nuǎn huo",
        "chineseWord" : "暖和",
        "audio" : "warm",
        "englishWord" : "warm"
      },
      {
        "pronunciation" : "dà fēng",
        "chineseWord" : "大风",
        "audio" : "windy",
        "englishWord" : "windy"
      }
    ]
  },
  {
    "name" : "zoo animals",
    "words" : [
      {
        "pronunciation" : "xióng",
        "chineseWord" : "熊",
        "audio" : "bear",
        "englishWord" : "bear"
      },
      {
        "pronunciation" : "dà xiàng",
        "chineseWord" : "大象",
        "audio" : "elephant",
        "englishWord" : "elephant"
      },
      {
        "pronunciation" : "cháng jǐng lù",
        "chineseWord" : "长颈鹿",
        "audio" : "giraffe",
        "englishWord" : "giraffe"
      },
      {
        "pronunciation" : "dà xīng xing",
        "chineseWord" : "大猩猩",
        "audio" : "gorilla",
        "englishWord" : "gorilla"
      },
      {
        "pronunciation" : "shī zi",
        "chineseWord" : "狮子",
        "audio" : "lion",
        "englishWord" : "lion"
      },
      {
        "pronunciation" : "hóu zi",
        "chineseWord" : "猴子",
        "audio" : "monkey",
        "englishWord" : "monkey"
      },
      {
        "pronunciation" : "xióng māo",
        "chineseWord" : "熊猫",
        "audio" : "panda",
        "englishWord" : "panda"
      },
      {
        "pronunciation" : "lǎo hǔ",
        "chineseWord" : "老虎",
        "audio" : "tiger",
        "englishWord" : "tiger"
      }
    ]
  }
]

""".data(using: .utf8)
}
