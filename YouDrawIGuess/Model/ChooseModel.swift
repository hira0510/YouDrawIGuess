//
//  ChooseModel.swift
//  YouDrawIGuess
//
//  Created by  on 2020/1/31.
//  Copyright © 2020 . All rights reserved.
//

import UIKit

class ChooseModel {
    ///交通天氣
    let tag1: [String] = ["战斗机", "高铁", "步行", "跑步", "游泳", "火箭", "直升机", "公车", "卡车", "摩托车", "脚踏车", "蒸汽船", "缆车", "火车", "捷运", "游览车", "帆船", "水上摩托车", "香蕉船", "电车", "地铁", "飞机", "邮轮", "救生圈", "爬行", "晴天", "下雨", "多云", "阴天", "下雪", "打雷", "闪电", "台风", "沙尘暴", "雾", "冰雹", "热气球", "跳伞", "电梯", "楼梯", "马路", "斑马线", "红绿灯", "拖吊车", "货车", "汽车", "计程车", "电动车", "滑板", "滑板车", "坦克"]

    ///吃的
    let tag2: [String] = ["泡面", "鸡腿饭", "罐头", "雪糕", "西瓜", "蛋", "蔬菜", "苹果", "柳丁", "冬瓜", "苦瓜", "竹笋", "茄子", "白萝卜", "蘑菇", "柚子", "柿子", "杨桃", "芒果", "香蕉", "草莓", "蜂蜜", "酱油", "茶", "啤酒", "燕麦", "玉米", "花生", "青菜", "马铃薯", "胡萝卜", "香菇", "蒲公英", "豌豆", "四季豆", "金针菇", "桑椹", "莲子", "梅子", "甘蔗", "荷叶", "南瓜", "辣椒", "大蒜", "葱", "洋葱", "生姜", "木瓜", "桃子", "葡萄", "椰子", "荔枝", "柠檬", "樱桃", "槟榔", "八角茴香", "咖啡", "葡萄酒", "猪肉", "火腿", "鸭血", "鸭肉", "螃蟹", "蛤蛎", "牡蛎", "牛肉", "凤梨", "哈密瓜", "橘子", "地瓜", "巧克力", "火锅", "臭豆腐", "烟", "烤肉", "咸水鸡", "咸酥鸡", "饼干", "糖果", "海苔"]
    
    ///動漫遊戲
    let tag3: [String] = ["二次元", "音速小子", "玛利欧", "库巴", "林克", "皮卡丘", "小火龙", "杰尼龟", "超梦", "鲁夫", "孙悟空", "Switch", "PS4", "Wii", "耀西", "面包超人", "魔兽世界", "天堂", "跑跑卡丁车", "枫之谷", "爆爆王", "极速领域", "传说对决", "游戏王", "神奇宝贝", "猎人", "樱桃小丸子", "蜡笔小新", "鬼灭之刃", "圣斗士星矢", "真珠美人鱼", "浪客剑心", "未闻花名", "海贼王", "我的英雄学院", "刀剑神域", "魔导少年", "美少女战士", "死亡笔记本", "七龙珠", "一拳超人", "火影忍者", "犬夜叉", "家庭教师", "反叛的鲁路修", "暗杀教室", "死神", "银魂", "网球王子", "黑子的篮球", "进击的巨人", "东京食尸鬼", "名侦探柯南"]
    
    ///動物
    let tag4: [String] = ["石虎", "熊猫", "青蛙", "鲤鱼", "鲨鱼", "牛", "信鸽", "骆驼", "狗", "大象", "马", "鹿", "狮子", "老虎", "蜗牛", "蚯蚓", "蜘蛛", "海豚", "北极熊", "海狮", "金鱼", "海星", "蚊子", "企鹅", "鸡", "鸭子", "猪", "猴子", "鲸鱼", "老鼠", "犀牛", "猫", "狼", "貂", "树懒", "狐狸", "斑马", "熊", "长颈鹿", "猩猩", "刺猬", "河马", "袋鼠", "老鹰", "鹦鹉", "鸽子", "鸵鸟", "乌龟", "蜻蜓", "蜈蚣", "水母", "恐龙", "松鼠", "绵羊", "兔子"]
    
    ///休閒娛樂
    let tag5: [String] = ["钓鱼", "跑步", "登山", "脚踏车", "游泳", "划船", "斗鸡", "跳栏赛马", "赛马", "跳远", "跳高", "跳高", "摔跤", "跆拳道", "忍术", "剑道", "击剑", "拳击", "相扑", "足球", "篮球", "网球", "排球", "舞蹈", "跳舞机", "体操", "有氧运动", "弹跳床", "赛车", "羽毛球", "任天堂", "电视游乐机", "桌球", "举重", "拔河", "腕力", "大老二", "跳棋", "西洋棋", "象棋", "魔术方块", "围棋", "五子棋", "麻将", "大富翁", "扑克牌", "数独", "电子竞技", "射箭", "弓道", "撞球", "9号球", "保龄球", "飞镖", "高尔夫球", "打弹珠", "棒球", "躱避球", "橄榄球", "沙滩排球", "跳水", "冲浪", "太极拳", "伏地挺身", "仰卧起坐", "踢毽子", "放风筝"]
    
    ///日常用品
    let tag6: [String] = ["洗面乳", "电脑", "鱼缸", "主机", "萤幕", "电视", "卫生纸", "床垫", "充电线", "手机", "钥匙", "被子", "床单", "炒锅", "电磁炉", "微波炉", "碗筷", "抽油烟机", "盘子", "汤匙", "叉子", "冰箱", "洗衣机", "冷气", "热水器", "台灯", "沙发", "桌子", "椅子", "衣柜", "鞋柜", "牙膏", "杯子", "牙刷", "肥皂", "洗发乳", "衣架", "梳子", "镜子", "衣服", "鞋子", "时钟", "闹钟", "牙刷", "拖鞋", "内裤", "剪刀", "雨伞", "挂钩", "扫把", "拖把", "畚箕", "吸尘器", "掏耳棒", "菜刀", "指甲剪", "铅笔", "橡皮擦", "水彩笔", "外套", "长裤", "袜子", "围巾", "卫生棉", "短裤"]
    ///題目選擇自定義
    var mCustomTag7: [String] = []
}
