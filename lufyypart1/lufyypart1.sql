/*
Navicat MySQL Data Transfer

Source Server         : mydb
Source Server Version : 50621
Source Host           : localhost:3306
Source Database       : lufyypart1

Target Server Type    : MYSQL
Target Server Version : 50621
File Encoding         : 65001

Date: 2018-06-05 15:46:49
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for app01_account
-- ----------------------------
DROP TABLE IF EXISTS `app01_account`;
CREATE TABLE `app01_account` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(64) NOT NULL,
  `password` varchar(64) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of app01_account
-- ----------------------------
INSERT INTO `app01_account` VALUES ('1', 'tom', '123');
INSERT INTO `app01_account` VALUES ('2', 'kitty', '123');
INSERT INTO `app01_account` VALUES ('3', 'xiaoming', '123');

-- ----------------------------
-- Table structure for app01_article
-- ----------------------------
DROP TABLE IF EXISTS `app01_article`;
CREATE TABLE `app01_article` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `article_type` smallint(6) NOT NULL,
  `brief` longtext NOT NULL,
  `head_img` varchar(255) NOT NULL,
  `content` longtext NOT NULL,
  `pub_date` datetime(6) NOT NULL,
  `offline_date` datetime(6) NOT NULL,
  `status` smallint(6) NOT NULL,
  `order` smallint(6) NOT NULL,
  `vid` varchar(128) DEFAULT NULL,
  `comment_num` smallint(6) NOT NULL,
  `agree_num` smallint(6) NOT NULL,
  `view_num` smallint(6) NOT NULL,
  `collect_num` smallint(6) NOT NULL,
  `date` datetime(6) NOT NULL,
  `position` smallint(6) NOT NULL,
  `source_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `title` (`title`),
  KEY `app01_article_source_id_b01de268_fk_app01_articlesource_id` (`source_id`),
  CONSTRAINT `app01_article_source_id_b01de268_fk_app01_articlesource_id` FOREIGN KEY (`source_id`) REFERENCES `app01_articlesource` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of app01_article
-- ----------------------------
INSERT INTO `app01_article` VALUES ('1', '无人驾驶引发车祸，背锅的到底是人还是车？', '0', '为无人车事故定责不是个简单的选择题。', 'default.png', '大数据文摘作品。作者：晚君、傅一洋、小鱼、闫雨莹、龙牧雪。\r\n让我们先来做一道选择题。\r\n\r\n\r\n司机老王正开着一辆带有自动驾驶系统的车，这时道路前方突然出现了一个行人，可怕的是刹车失灵了。如果及时左转，老王的车就不会撞人；如果依旧直行，老王的车会将人撞死。\r\n\r\n\r\n\r\n\r\n\r\n你觉得以下哪种情景，老王要为行人之死负责？\r\n\r\n\r\n老王决定左转，而自动驾驶系统强制选择了直行（撞人）；\r\n\r\n老王决定直行（撞人），而自动驾驶系统没有干预；\r\n\r\n自动驾驶系统决定左转，而老王强制选择了直行（撞人）；\r\n\r\n自动驾驶系统决定直行（撞人），而老王没有干预。\r\n\r\n\r\nA和C选项中，人类和机器驾驶员都进行了错误干预。B和D选项中，两者都没有进行有效干预（错过干预）。到底谁的责任更大？\r\n\r\n\r\n为无人车事故定责不是个简单的选择题。\r\n\r\n\r\nMIT、哈佛、加州大学尔湾分校、法国图卢兹大学的一个联合研究小组，致力于通过定量研究的手段，了解人们在面对无人车事故时的态度，并于最近发布了研究成果。\r\n\r\n\r\n\r\n\r\n\r\n\r\n论文作者来自脑与认知科学、心理学、经济学等多个不同领域，MIT火爆的无人车课程讲师Sydney Levine也是作者之一。\r\n\r\n\r\n先说MIT联合研究小组通过向2583个人发放3次调查问卷得出的结论：\r\n\r\n\r\n进行了错误干预的驾驶者是过失方，无论是人架势还是机器驾驶；\r\n\r\n如果人机同时错过有效干预，舆论对机器更包容，人类司机的疏忽更受关注。\r\n\r\n\r\n明确事故定责，是无人车发展的前提\r\n\r\n\r\n3月18日，美国亚利桑那州发生的Uber无人车撞伤行人并致死的事故可以理解为“错过干预”。车祸正式报告还未公布，但据外媒报道，事故发生时，车辆已经检测到车头前的行人，但决策系统却“决定”不采取任何闪避措施，同时人类安全驾驶员也未能及时作出反应。\r\n\r\n\r\nUber之后，3月23日，一辆开启了Autopilot的Model X在高速上撞向隔离带，导致车主不幸丧生，还引发车辆起火和两车追尾。\r\n\r\n\r\n\r\n\r\n\r\n对此，特斯拉表示：“司机已收到过几次警告，包括可视警告和声音警告。在碰撞发生前的6秒钟，司机都没有手握方向盘。事故发生前，司机有大约5秒钟的时间和150米的无障碍视野，但车辆记录显示司机没有做出任何动作。”同样，可以理解为“错过干预”。\r\n\r\n\r\n历史总是惊人地相似。\r\n\r\n\r\n2016年5月，全球首例引起广泛关注的Autopilot致死事故在佛罗里达发生。一辆特斯拉Model S在使用Autopilot模式行驶途中与一辆正在转弯的卡车相撞，导致特斯拉车主死亡。\r\n\r\n\r\n\r\n\r\n\r\n特斯拉解释说：“在强烈的日照条件下，驾驶员和自动驾驶系统都未能注意到卡车的白色车身，所以没有及时启动刹车系统。”\r\n\r\n\r\n也就是说，在这场事故中，无论是机器驾驶员还是人类驾驶员都应该采取措施（避开正在左转的卡车），然而他们并没有采取行动。人类和机器驾驶员的“错过干预”导致了撞车事故。美国高速公路安全管理局等部门在经过6个月的调查后，认定特斯拉Autopilot系统不存在缺陷。\r\n\r\n\r\n据世界卫生组织统计，全球每年约有125万人死于车祸。通常，法律裁决的重点是判定谁是过失方，谁为事故承担责任。\r\n\r\n\r\n随着半自动驾驶和全自动驾驶技术趋于成熟，如何公正判决谁该承担责任，成了法官和陪审团的难题，因为事故中的过失和责任将由人类和机器驾驶员共同承担。\r\n\r\n\r\n法官和陪审团都是人类。他们会偏袒自己的同胞吗？还是认为人类因为智力更胜一筹所以应当承担更多责任？\r\n\r\n\r\n在2016年的特斯拉Autopilot事故中，公众明显偏向于指责事故中疏忽的人类驾驶员，比如有传闻说车主当时正在看哈利·波特电影（尽管没有任何证据证实这点）。\r\n\r\n\r\n\r\n\r\n\r\n舆论对自动驾驶产业有直接的影响。\r\n\r\n\r\n目前，公众对混合驾驶模式造成的车祸态度仍不明确，制造商也无法判断他们的责任范围，这直接反映在了无人车高昂的定价上，也减缓了无人车普及的速度。如果公众倾向于将责任归咎于人类驾驶员而不是机器，这将导致法律体系建设的放缓和监管的缺失，也无法给制造商施加足够的压力来提升无人车安全性。\r\n\r\n\r\nMIT联合研究小组呼吁，为事故明确定责，是完善监管、促进自动驾驶行业发展的第一步。\r\n\r\n\r\n有司机的无人车，司机责任更大？\r\n\r\n\r\n目前，自动驾驶技术以混合驾驶模式为主。一些自动驾驶系统可以越过司机的权限执行紧急操作（例如丰田的Guardian Angel）。其他半自动驾驶车辆可以完成大部分驾驶操作，同时要求司机不断监控情况并随时准备采取控制措施（例如特斯拉的Autopilot）。\r\n\r\n\r\n这里的核心问题是：当一辆半自动驾驶的汽车发生事故并造成人员伤亡时，如何判定人类和机器驾驶员之间的过失和因果责任？\r\n\r\n\r\n让我们详细看看MIT联合研究小组的结论。\r\n\r\n\r\n\r\n\r\n\r\n他们研究了6种驾驶模式，分别是单人驾驶模式、单机驾驶模式（全自动驾驶汽车）以及双驾驶员（两个人类或两个机器）的不同组合模式。这些模式分别对应无人车的6个等级，从L0到L5。比较典型的是，L2级的丰田Guardian Angel被归类为H-M模式，即人类（H）是主驾驶，机器（M）是副驾驶；L3级的特斯拉Autopilot被归类为M-H模式，即机器是主驾驶，人类是副驾驶。\r\n\r\n\r\n焦点在于H-M和M-H模式下的两个场景：\r\n\r\n\r\n主驾驶做出正确判断，而副驾驶错误干预（“错误干预”）；\r\n\r\n主驾驶做出错误判断，而副驾驶没有进行干预（“错过干预”）。\r\n\r\n\r\n研究人员使用了两个自变量做回归：驾驶员是否犯错、驾驶员类型（人或机器）。\r\n\r\n\r\n在“错误干预”的场景下，最重要的发现是：驾驶员是否犯错对评分具有显著的影响，而驾驶员类型对结果的影响并不明显。可以从下图左边看到，做出错误干预的副驾驶被认为过失更大，而且副驾驶是蓝色（机器）或红色（人类）的情况下过失及责任分数接近。\r\n\r\n\r\n也就是说，人们普遍认为，做出错误判断的一方是过失方。如果“错误干预”的驾驶操作导致行人死亡，那么无论做出误判的是人还是机器，都应当承担更多责任。\r\n\r\n\r\n\r\n\r\n不同驾驶模式的过失及责任评估分数（分数越高责任越大）。蓝色代表车辆本身和汽车制造商的叠加责任分数，红色代表人类司机的责任分数。x轴标签first driver指主驾驶，last driver指副驾驶。\r\n\r\n\r\n而有关“错过干预”的研究结果和此前的结果不同。\r\n\r\n\r\n此前的研究表明，当机器和人类都做出错误的判断时，机器会受到更多的指责。而且，当人和算法犯了同样的错误时，人们对算法失去信任的速度要快于人类本身。\r\n\r\n\r\n这次的结论是，如果发生“错过干预”的情况（即人类犯错机器没有干预，或者机器犯错人类没有干预），机器责任程度明显小于人类。\r\n\r\n\r\n在双驾驶员模式下，人类和机器驾驶员都承担责任（缺乏有效干预），但是可以明显看出红蓝两色的差距。作为对照，如果主驾驶和副驾驶都是人类或者都是机器，他们的责任分数相同（对应上图右第2行及第7行）。\r\n\r\n\r\n具体回归结果可以看这张图：\r\n\r\n\r\n\r\n\r\n\r\n他们本应采取行动，但他们什么都没做\r\n\r\n\r\n尽管人们对无人车的普及可能存在着许多心理上的障碍，但这一结果表明，公众不会对混合驾驶模式下的事故做出过度反应。\r\n\r\n\r\n尽管在研究中进行了一些系统的简化，但结果也能反映出一定的公众言论效应。公众倾向于将注意力集中在人类驾驶员的极度疏忽上，因此将责任归咎于人类驾驶员而不是机器。\r\n\r\n\r\n受访者也对人类和机器驾驶员的能力分别做了评估，结果相近。在了解事故前，受访者对人类和机器的驾驶能力同样有信心。在被告知发生了“错过干预”的事故后，信心同比例下降。\r\n\r\n\r\n\r\n\r\n“错过干预”情况下，对驾驶员的能力评估\r\n\r\n\r\n事实上，更应该关心的也许是公众的反应不足（under-reaction）。\r\n\r\n\r\n研究人员认为，公众的反应不足会导致驱动监管法案制定的舆论压力缺失。如果半自动驾驶汽车的监管法案在有陪审团的法庭上制定，陪审团的裁决会偏向于汽车制造商，使其在人机共同犯错的案例中免责。这样的话，就无法给制造商施加足够的压力来改善汽车的安全性能设计。\r\n\r\n\r\n其实，我们之前也经历过类似的情况。在20世纪60年代之前，汽车制造商将伤害事故责任归咎于驾驶员的错误或疏忽，从而逍遥法外。为此，很有必要通过自上而下的监管，将“事故责任制”的概念引入法律体系，即汽车的设计应尽可能减少发生事故时对乘客造成的伤害。\r\n\r\n\r\n只有在法律约束下，汽车制造商才能被迫改进他们的设计。然而，安全的标准究竟如何，仍然是一个悬而未决的问题。\r\n\r\n\r\n\r\n\r\n\r\n研究人员指出，仅仅在一种条件下，公众有可能产生过度反应，机器受到的责备会大于人类：机器做出了“错误干预”。\r\n\r\n\r\n在这种驾驶模式中，人类并没有义务去纠正机器犯的错误。也就是说，机器的工作是纠正人类可能犯下的错误，但如果机器犯了错误，人类没有纠正的义务（仅在“H-M”模式下如此。在“M-H”模式下，如果机器发生故障，纠正故障始终是人类的责任）。\r\n\r\n\r\n因此，一旦发生由“错误干预”造成的事故，可能会引起公众的广泛关注。如果我们对此不加以适当的预测和管理，那么全自动驾驶技术的进程可能会减缓。在研发机器比人类具有更大权限的汽车时，制造商们应该关注这类极端情况，因为在该情况下，机器比人类更易受到指责。\r\n\r\n\r\n公众反应和舆论压力会影响判决和立法，也会影响个体的决策。\r\n\r\n\r\n比如，人们可能会选择“能承担事故责任和舆论压力”的驾驶系统。更糟糕的是，人们可能会改变驾驶习惯，尽量让机器成为过失方（比如说，不去纠正机器的“错误干预”）。\r\n\r\n\r\n毕竟，如果什么都不做，可以让机器背锅。\r\n\r\n\r\nOne More Thing\r\n\r\n\r\n如果你对社会实验感兴趣，这里还有一个MIT开发的小游戏，你可以自己试试看在两难时你会怎么操控无人车：http://moralmachine.mit.edu/\r\n\r\n\r\n\r\n\r\n\r\n\r\n本文由 大数据文摘 发表，此文转自虎嗅网。\r\n\r\n原文链接https://www.huxiu.com/article/244209.html', '2018-05-15 12:01:22.000000', '2018-07-31 12:02:17.000000', '0', '100', null, '0', '0', '655', '276', '2018-06-01 12:02:19.380900', '0', '1');
INSERT INTO `app01_article` VALUES ('2', 'IT“民科”罗永浩', '0', '拜托，“民科”是真的拿不到诺贝尔奖的', 'default.png', '文|财经无忌\r\n46岁还“易燃易爆炸”的罗永浩正在失去自己的“中间派”。他的“狂妄”变得越来越不可爱，焦虑吞噬了六年前的那个老罗，他现在是一个IT界野心勃勃的“民科”。\r\n\r\n \r\n\r\n1\r\n\r\n \r\n\r\n发布会迎来了大雨，这让这场露天的活动显得有些尴尬，不过老罗并不在意，这对一场“见证历史”的发布会而言，又能算的了什么。\r\n\r\n \r\n\r\n发布会之前老罗早在社交平台上高调宣称将发布革命性的产品，这吊足了那些支持和反对他的人的胃口。他们都想知道，这个带刺的家伙是否能给自己这一方带去足够多的弹药，同时他们也清楚，发布会后之后，一场论战不可避免。\r\n\r\n \r\n\r\n客观来说，这场发布会几乎等同于“糟糕”一词。\r\n\r\n \r\n\r\n面对一台Android优化版的大PC，很多人的心情就像被高喊“狼来了”的小孩骗上山的壮汉——他们可能想打人。至于售价8848元的坚果R1，我们甚至都可以不去提起，毕竟连老罗自己都对手机开始不耐烦了。\r\n\r\n \r\n\r\n老罗的重心在那台“重新定义下一个十年的个人电脑”上，他津津乐道于自创的那套“革命性交互”。虽然现场的演示基本靠“理解万岁”来掩盖，但老罗依然信誓旦旦地表示：“这三个系统性的交互解决方案，将会知道未来十几年，甚至是几十年的人类计算平台设计。即便十年内过渡到AR/VR时代，它的交互依然会成为基础的交互。”\r\n\r\n \r\n\r\n老罗的忠粉们群情激动，他们像教徒一样为老罗欢呼，但稍微有点理智的人难免会想一想，这种站在“巨人的肩膀”上的微创新价值到底几许？站在“巨人的肩膀”是指老罗演示的那些创新，基本都是在现有系统或者供应商产品的基础上，进行的个性化定制。\r\n\r\n \r\n\r\n所谓的TNT（Touch&Talk）系统，由科大讯飞和三角兽提供技术支持；基于Crystal Ball功能的Office办公套件，背后是永中Office；整个系统也是基于安卓平台。换句话说，在核心技术上，老罗和他的锤子科技并没有多少突破和优势。\r\n\r\n \r\n\r\n再回到“重新定义”上，老罗将语音输入作为人机交互的首要入口，这几乎是一个拍脑袋的设想。\r\n\r\n \r\n\r\n很难想象，未来的办公室将会成为一个话务室——人们都需要用语音指令来办公或者娱乐。不可否认，从现在来看，语音输入比键盘打字会有更高的效率，我们甚至可以设想在未来，语音的识别率可以达到100%，但你真的会在办公室对着Office喊“给我复制第三段”“给我粘贴那张图”吗？\r\n\r\n \r\n\r\n如果真要畅想未来，是不是通过“脑波”来操作电脑会更让人感到兴奋和惊喜呢？\r\n\r\n \r\n\r\n2\r\n\r\n \r\n\r\n40年前，诗人徐迟写了一篇给他带去足够知名度的报告文学《哥德巴赫猜想》，在这篇发表在《人民文学》上的一万六千多字的长文中，数学家陈景润被塑造成不食人间烟火、孤军奋战的奇人。\r\n\r\n \r\n\r\n文章本意是“全国科学大会即将召开之际，动员和鼓舞科学家投入到四个现代化的建设中”，但这篇文笔优美，通俗易懂，流传甚广的长文，也同样鼓舞了很多普通人“勇攀科学高峰”的激情。\r\n\r\n \r\n\r\n初中学历的装卸工庄严、只有小学文化的曾凡成，都相信自己有能力摘下“哥德巴赫猜想”这颗“数学皇冠上的明珠”。据说陈景润和数学研究所每天都要收到几麻袋的信——除了一部分是浪漫的女青年给陈景润的情书，大部分都是宣称自己破解了哥德巴赫猜想之谜。\r\n\r\n \r\n\r\n那段时间估计是中国“民科”涌出最多的一个时期，而现在，最为知名的“民科”是那位“有实力争夺诺贝尔物理学奖”的郭英森。\r\n\r\n \r\n\r\n六年前，当英语老师、网站站长罗永浩准备去制造手机时，社会给予了这位表演欲极强的年轻人足够的宽容——至少在资本市场上，罗永浩拿到了让他可以请得起大牌帮手的真金白银。\r\n\r\n \r\n\r\n罗永浩是打着“挑战权威”的旗号冲进手机市场的，虽然带着点狂妄，但大多数心地善良的人们还是认为要给这个“理想主义者”一次机会，为“情怀买单”是一件道德高尚的事情。\r\n\r\n \r\n\r\n只是任性从来都不是一个成功商人身上的品质，残酷的市场竞争最终教育了这头闯进瓷器店的公牛，也让很多人失去了耐心了。而这个时候，如果你还是继续一副“语不惊人死不休”的态度，只会失去更多的支持者。\r\n\r\n \r\n\r\n曾经人们会认为，手机毕竟是一个高度集成式的工业品，品牌商找对合作伙伴或许并不需要太多的专业门槛。当然，后来事实也证明这是一个幼稚的想法。现在做手机的锤子团队，要转身去做一台所谓“面向未来的PC”，这样的难度无异是在挑战大众的常识。\r\n\r\n \r\n\r\n3\r\n\r\n \r\n\r\n罗永浩的“非正式同行”郭德纲曾经说过这么一段话：\r\n\r\n \r\n\r\n“内行要是与外行去辩论那是外行。比如我和火箭科学家说，你那火箭不行，燃料不好，我认为得烧柴，最好是煤，煤最好选精煤，水洗煤不好。如果那个科学家拿正眼看我一眼，那他就输了。”\r\n\r\n \r\n\r\n现在，罗永浩向全世界的PC制造商宣战了。说实话，老罗如果像做手机一样，也只是找找供应商，做个品牌PC，也未尝不可，但现在老罗要做的是“定义下一个十年”的产品。\r\n\r\n \r\n\r\n只是他的这番野心，几万公里以外位于华盛顿西雅图的数万名微软工程师们，可能并没有接收到相关的信息。\r\n\r\n \r\n\r\n就在罗永浩发布TNT工作站时，微软也低调发布了Surface Hub 2。Surface Hub 2运行Windows 10，内置Office 365、Microsoft Teams、Power BI、White Board等生产力工具。微软称，这款设备最大的亮点是支持多人同时登陆，允许多人同时访问他们的文档，提高生产力和创造性。\r\n\r\n \r\n\r\n另一家明星巨头谷歌则是在去年推了自己的平板电脑Jamboard，这款产品被谷歌用来帮助提升办公室工作的协同效率。\r\n\r\n \r\n\r\n不过这两家在产品推介中，都未提及是否具有足够的先进性乃至“定义下一个十年”。在这一点上，他们的中国新晋对手锤子科技已经“领先”了。\r\n\r\n \r\n\r\n一年多以前，当锤子M1L发布时，我曾写过一篇文章，称“罗永浩似乎已经明白过来了——情怀终究不能成为现金流”。甚至我自己也入手了一台M1L。只是一年后这台皮革褪色，卡顿严重的Android手机最终沦为了备用机。\r\n\r\n \r\n\r\n但是，你还是得承认，在罗永浩的周围，依然围绕着一大批的粉丝——他们不是纯粹的用户，这些人喜欢老罗的“幽默”“真诚”“死磕”“特立独行”。他们考虑的是，老罗会不会辜负这个时代或者这个时代会不会辜负老罗。\r\n\r\n \r\n\r\n拜托，“民科”是真的拿不到诺贝尔奖的。\r\n\r\n\r\n本文由 seaver 发表，此文转自虎嗅网。原文链接https://www.huxiu.com/article/244293.html', '2018-05-06 12:02:53.000000', '2018-07-31 12:02:59.000000', '0', '0', null, '0', '0', '1363', '447', '2018-06-01 12:04:00.381900', '0', '2');
INSERT INTO `app01_article` VALUES ('3', '程序员身上的异味，你会直接告诉他吗？', '0', '别多想，“程序员身上的异味”不是标题党，这是有根据的。', 'default.png', '本文来自微信公众号：余晟以为（yurii-says），作者：余晟。\r\n\r\n\r\n别多想，“程序员身上的异味”不是标题党，这是有根据的。\r\n\r\n\r\n在我翻译的《成为技术领导者》（曾用名：《技术领导之路》）中，作者温伯格专门讲了“程序员身上有异味”的故事。可惜老实说，在我翻译这本书的时候，我还不能完全明白温伯格的道理，身为译者，又只能“生吞活剥”。不过，现在我终于明白这个道理了。回头再看，当时的翻译虽然不好理解，但还不算太差。为了把这个道理讲得更清楚，有必要再写一篇文章。\r\n\r\n\r\n我先简单复述温伯格的故事：\r\n\r\n\r\n程序员Ralph身上有异味，许多人不愿意跟他共事。于是他们去找老板说：头儿，味道实在太难闻了，如果你不想点办法，我就不干了。这时候，老板该怎么办？\r\n\r\n\r\n据温伯格说，最早他只是在《程序开发心理学》里讲了这么个故事。但是后来，他收到了大量关于这个故事的反馈：天呐，你怎么也知道这种事。\r\n\r\n\r\n从外人看来，问题很简单，身上有异味，多洗手洗澡，保持清洁，就好了。这种办法，温伯格称为“机械”的方案，意思是它直截了当，没有那么多弯弯绕，没有那么多花花肠子。\r\n\r\n\r\n然而现实世界是复杂的，“机械”的方案未必行得通。比如程序员们，面对这种问题，他们最喜欢的办法往往是这样的：既然你身上有味道让我不舒服，我又不得不跟你合作，那么咱们就动用计算机中的经典思路——增加一个中间层。不跟你当面讨论，只打字聊天。不光是人，代码也是这样，尽量避免和你的代码交互，把接口都写成文档定义清楚，保证出了事责任也很清楚。这样一来，咱们打交道的机会就降到了最低。\r\n\r\n\r\n不幸的是，这样的方案几乎一定会降低效率，甚至增加错误。大家都知道，论沟通质量，打字不如打电话，打电话不如当面。如果两个家伙本来工位就不远，合作起来竟然还要新建严格规范的中间层，可以想见，问题会层出不穷。\r\n\r\n\r\n如果从程序员这一侧不能解决，从领导这一侧能解决吗？似乎也不能。按照常理，领导似乎也很难走机械方案，直接跟Ralph说：哥们，你身上味儿也太重了，多洗洗吧。\r\n\r\n\r\n为什么呢？领导的顾虑也不难想象：这样的程序员，虽然身上有异味是问题，但确实也为公司贡献了自己的力量。换位思考，如果自己身上有味道，你会怎么想？难道你的人格就低人一等？难道你就应该成为大家眼中的另类？\r\n\r\n\r\n故事暂时就讲到这里。\r\n\r\n\r\n十年前，我在翻译书的时候确实很难理解，为什么一个人身上有味道，其他人想尽办法，却谁都不敢告诉他呢？回想起来，这或许和我当时的身份和经历有关。当时我只是一个“看起来还算正常”的程序员嘛。如今再让我翻译这本书，我光看到这个故事就忍俊不禁了。\r\n\r\n\r\n遇到这种事，许多人宁可选择发朋友圈、发微博来抱怨，也不愿意当面说。但是程序员不一样，程序员们相当愿意“动脑筋”，当时是动技术的脑筋。我曾在以前的文章里说过，有一次我们的爬虫系统出了错误，被内容提供方封了服务器IP。大家修正错误之后，下一步的安排并不是大方跟对方解释求得谅解（本来对方也希望内容被“适度”抓取，广泛传播），而是升级系统，找一批代理服务器，再写个代理管理系统，硬生生把个简单系统做成了复杂系统（最终我打了几十个电话，找到对方的负责人，谈妥之后，系统仍然保持简单。这段经历给我印象特别深刻）。\r\n\r\n\r\n就我的了解，这种思路绝不是个案，而是在程序员身上广泛存在着。我们经常看到一些炫耀帖，比如想知道女友（或意向女友）的一些个人情况，又不愿意当面问，就想各种技术办法去“搞定”，比如猜测密码、登入对方账号。我一度也很羡慕这些手段，后来我才发现根本不是这样。许多问题，不选择大方坦诚沟通来解决，而是剑走偏锋，其实很容易把事情搞砸，给人不健康、不尊重、不值得信任的感觉，反而会把事情搞砸。一个得意洋洋炫耀帖的背后，可能是十起二十起的尴尬和破碎。\r\n\r\n\r\n从管理者的角度出发，这也确实是个棘手的问题。只要员工不是成心和你做对，都必须多肯定、多包容、多看到他们的积极贡献。尤其是对业绩突出的员工，更是必须如此。直接告诉人家“你身上有味道”，或者“你和其他人讨论时声音太大”，或者“你的文档写得实在太马虎”，都难免会被人多想，带来一系列麻烦：你是不是看不到我的贡献？你是不是对我不满意？你是不是想搞些什么鬼名堂，所以小炉匠戴眼镜——成心找茬（碴）？…… 这样下去，管理成本直线上升。\r\n\r\n\r\n这样的情况确实挺麻烦，那么，怎么解决呢？\r\n\r\n\r\n在摸索了很久之后，我不得不承认，温伯格说的是对的：你别无选择，只能而且必须直面问题。下面我来讲讲为什么是这个答案。\r\n\r\n\r\n首先，有问题的人，很多时候意识不到自己的问题。温伯格在书里说，只有一位技术主管采纳了他的建议，直接跟那个程序员谈。结果这名主管惊异地发现，程序员根本意识不到这点。那家伙在写程序之余，还喜欢鞣革（古怪的爱好）。鞣革用的各种制剂当然会带来古怪的味道，但是呆久了也就习以为常了，所以他根本感觉不到，不觉得这是问题。即便看到其他人的古怪反应，他也没法跟自己的气味和爱好联系起来。\r\n\r\n\r\n按照我的经验，有相当一部分问题，当事人根本意识不到自己的问题。或则会即便意识到了，也没有准确意识到它的程度、范围。或者低估了问题，所以轻描淡写、不以为然。或者高估了问题，所以高度敏感、一谈就崩。\r\n\r\n\r\n然而，一旦当事人准确认识到自己的问题，许多时候的反应并不是迷惑、难堪、反感甚至愤怒，而是承认并且不好意思。下面，自然而然的反应就是去注意和改善，所以问题也就不复存在了。\r\n\r\n\r\n所以管理者必须清楚，真正解决问题的前提条件绝对是直面问题，对齐大家对问题的认识。注意，我这里说的是“直面”，而不是简单“面对”。许多时候，不直接面对它，而是处心积虑去走曲折的通道，发模糊的信号，给晦涩的暗示，其实都是在逃避问题，无助于解决问题。\r\n\r\n\r\n其次，管理者在谈问题的时候，必须把握“就事论事”的原则。越是麻烦的问题，越要费尽心思，踩准“就事论事”的边界。\r\n\r\n\r\n大家为什么会觉得这类问题很复杂，很难处理？其实复杂的和难的并不是事实本身，而是大家对事实的反应：你跟我谈这个，是不是小题大做？是不是对我不满意？是不是要抹杀我的成绩？是不是背后想搞什么名堂？…… 种种反应包含的种种情绪、种种疑虑，就如同盘丝洞，一旦进去就休想出来。\r\n\r\n\r\n所以管理者必须严格踩准“就事论事”的边界，不要让人产生过多的联想，产生过多的连带反应。这件事说起来微妙，做起来不容易，也没有固定的规矩可循。但是，我还是可以提供一些经验供参考。\r\n\r\n\r\n首先，管理者应当平复自己的情绪。要知道这样的谈话一定是很难的，加上情绪只会让事情更加复杂。要想就事论事，就必须平复自己的情绪，哪怕问题再眼中，也从客观描述、讲解问题出发。\r\n\r\n\r\n其次，管理者应当仔细斟酌自己的用词。我经常发现，事情本来很简单，一旦用词不当，就容易搞砸。比如“又是”、“总是”之类的说法通常要戒除，你找对方谈的时候，他可能刚刚接收到一些新的信息，心态还没调整好，听到这些词，就容易觉得负担沉重、来者不善，很容易产生排斥感，结果事与愿违。\r\n\r\n\r\n同时也要注意避免太多反问句。很多人在谈话时会不自觉大量使用反问句，比如“你难道没想到自己的味道让其他人不舒服吗？”之类。他们提出反问，潜意识里大概是要急切把对方“引导”到自己认定的结论上去。但是，反问句其实是相当容易让人难堪、引起对立情绪的，一旦引起对立情绪，就根本谈不上“引导”了。比较好的办法，是放弃反问，平心静气多探寻，比如“鞣革的味道很特别，你能闻到吗”。通过探寻了解对方的真实想法和来龙去脉，才更容易达成共识。\r\n\r\n\r\n最后，尽量不要做额外“补充”。有些领导为了避免谈话对象多想，在直陈问题之前，要做些铺垫，在讲完问题之后，还要挽回一些面子。我也曾尝试过这些做法，但总的来看效果并不好。短期来看，谈话里包含的信息太多，反而可能混淆了你要表达的主要意思；长期来看，如果大家不能形成直截了当、就事论事的工作作风，每次说问题都要事前铺垫、都要事后安抚，考虑得多了，协作效率必然下降。\r\n\r\n\r\n当然，温伯格还讲了另外一点，也是我看来也是更重要的点，那就是自我修炼，控制自己面对事情的反应。我们面对其他人指出问题的时候，到底是选择成为问题的一部分，想想“这背后到底是什么意思”（其实许多时候真没那么多意思），还是解法的一部分，想想“问题是不是真的存在”，以及“如果问题真的存在，我们该如何解决”。按照温伯格的说法，“成熟”存在于在大量的行为之中，这些行为体现出下面的特点：\r\n\r\n\r\n与其他人打交道时保持头脑清晰；\r\n\r\n清楚知道自己的想法和感受；\r\n\r\n能够看到、听到、感受到身外的世界；\r\n\r\n交流的时候，把其他人视为与自己不同的独特个体；\r\n\r\n把差异作为学习和探索的机会来看待，而不是视为威胁或冲突的信号；\r\n\r\n能够设身处地与人交往，能认清事实，而不是永远按照自己的理解或期望，认为世界“应该”是这样；\r\n\r\n自己对自己负责，不把自己的见闻和感受归咎于其他人；\r\n\r\n能够坦率表达、接纳、检查其他人的意图。\r\n\r\n\r\n如果说十年前翻译这本书时，我还不了解这个话题的奥妙，那么现在，我的理解已经大大加深了。我必须承认，“成熟”行为的这些特点，说起来很简单，做起来很不简单，做好了获益很多。如果你看过《情商》（而不是那些乱七八糟解释“情商”的书）就会发现，丹尼尔·戈尔曼的“情商”和上面说的“成熟”的行为特点，其实是一回事。\r\n\r\n\r\n当然，我还想更进一步，补充点自己的经验：不要轻易形成对人的判断，不要轻易动摇对人的判断。\r\n\r\n\r\n不要轻易形成对人的判断，指的是不要轻信其他人。虽然我们内心对世界常怀善意，但具体到每一个人，我们仍然需要听其言，观其行，才能知道，他/她到底是不是善良的人，值得不值得信任，他/她有什么个人偏好。许多时候，看一个人做了什么，比听他说了什么，更有助于形成准确的判断。\r\n\r\n\r\n不要轻易动摇对人的判断，是建立在已经对人有判读的基础之上。如果我们确认某个人不是坏人，值得信任，那么即便出现一些分歧、误解甚至冲突，都不应该动摇我们的基础判断。\r\n\r\n\r\n如果我们已经相信身边的某人是正直的，那么他来找我谈某些事情，我都应该坚持这个判断。哪怕我之前完全没想到，自己也很难堪，我也应当认为“确实出了问题”，而不是辗转纠结“他为什么让我这么难堪”，“他在搞什么鬼”，“我之前看错了他了吗”。这种纠结，不但对自己是煎熬，对已有的协作和信任也是极大的威胁。更关键的是，它们往往毫无根据。\r\n\r\n\r\n最后，让我们回到原来的问题：程序员身上有异味，你会直接告诉他吗？然后横跨一步：亲人有让你不舒服的举动，你会直接告诉他吗？再前进一步：其他人告诉你，你的某些言行让他们不舒服，你会是什么反应呢？\r\n\r\n\r\n本文来自微信公众号：余晟以为（yurii-says），作者：余晟。\r\n\r\n\r\n\r\n*文章为作者独立观点，不代表路飞学城立场\r\n\r\n本文由 余晟以为© 发表，此文转自虎嗅网。\r\n\r\n原文链接https://www.huxiu.com/article/243980.html', '2018-05-16 12:04:58.000000', '2018-08-22 12:05:03.000000', '0', '0', null, '0', '0', '1662', '500', '2018-06-01 12:05:42.337900', '0', '3');

-- ----------------------------
-- Table structure for app01_articlesource
-- ----------------------------
DROP TABLE IF EXISTS `app01_articlesource`;
CREATE TABLE `app01_articlesource` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(64) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of app01_articlesource
-- ----------------------------
INSERT INTO `app01_articlesource` VALUES ('1', '大数据文摘作品');
INSERT INTO `app01_articlesource` VALUES ('3', '微信公众号');
INSERT INTO `app01_articlesource` VALUES ('2', '文|财经无忌');

-- ----------------------------
-- Table structure for app01_collection
-- ----------------------------
DROP TABLE IF EXISTS `app01_collection`;
CREATE TABLE `app01_collection` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `object_id` int(10) unsigned NOT NULL,
  `date` datetime(6) NOT NULL,
  `account_id` int(11) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `app01_collection_content_type_id_object_i_b7b81b30_uniq` (`content_type_id`,`object_id`,`account_id`),
  KEY `app01_collection_account_id_91bc4a12_fk_app01_account_id` (`account_id`),
  CONSTRAINT `app01_collection_account_id_91bc4a12_fk_app01_account_id` FOREIGN KEY (`account_id`) REFERENCES `app01_account` (`id`),
  CONSTRAINT `app01_collection_content_type_id_8d639698_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of app01_collection
-- ----------------------------
INSERT INTO `app01_collection` VALUES ('1', '1', '2018-06-01 12:07:14.191900', '1', '21');
INSERT INTO `app01_collection` VALUES ('2', '2', '2018-06-01 12:07:23.309900', '1', '21');
INSERT INTO `app01_collection` VALUES ('3', '3', '2018-06-01 12:07:31.690900', '2', '21');
INSERT INTO `app01_collection` VALUES ('4', '1', '2018-06-01 12:07:47.632900', '2', '21');
INSERT INTO `app01_collection` VALUES ('5', '3', '2018-06-02 10:29:30.055700', '3', '21');
INSERT INTO `app01_collection` VALUES ('6', '2', '2018-06-02 10:29:35.220200', '3', '21');
INSERT INTO `app01_collection` VALUES ('11', '3', '2018-06-03 14:25:39.232200', '1', '21');

-- ----------------------------
-- Table structure for app01_comment
-- ----------------------------
DROP TABLE IF EXISTS `app01_comment`;
CREATE TABLE `app01_comment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `object_id` int(10) unsigned DEFAULT NULL,
  `content` longtext NOT NULL,
  `disagree_number` int(11) NOT NULL,
  `agree_number` int(11) NOT NULL,
  `date` datetime(6) NOT NULL,
  `account_id` int(11) NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `p_node_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `app01_comment_account_id_95b1fc8d_fk_app01_account_id` (`account_id`),
  KEY `app01_comment_content_type_id_3ed320af_fk_django_content_type_id` (`content_type_id`),
  KEY `app01_comment_p_node_id_b580e21f_fk_app01_comment_id` (`p_node_id`),
  CONSTRAINT `app01_comment_account_id_95b1fc8d_fk_app01_account_id` FOREIGN KEY (`account_id`) REFERENCES `app01_account` (`id`),
  CONSTRAINT `app01_comment_content_type_id_3ed320af_fk_django_content_type_id` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `app01_comment_p_node_id_b580e21f_fk_app01_comment_id` FOREIGN KEY (`p_node_id`) REFERENCES `app01_comment` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of app01_comment
-- ----------------------------
INSERT INTO `app01_comment` VALUES ('1', '1', '无人车，无人车，一楼', '1', '0', '2018-06-02 08:13:20.145200', '1', '21', null);
INSERT INTO `app01_comment` VALUES ('2', '1', '无人车，无人车，回复一楼', '1', '0', '2018-06-02 08:13:43.086700', '2', '21', '1');
INSERT INTO `app01_comment` VALUES ('3', '2', 'IT“民科”罗永浩，一楼', '1', '1', '2018-06-02 08:31:28.687700', '1', '21', null);
INSERT INTO `app01_comment` VALUES ('4', '2', 'IT“民科”罗永浩 二楼', '1', '0', '2018-06-02 08:31:50.457200', '2', '21', '3');
INSERT INTO `app01_comment` VALUES ('5', '3', '程序员身上的异味，你会直接告诉他吗？一楼一楼', '1', '0', '2018-06-02 08:32:15.900200', '1', '21', null);
INSERT INTO `app01_comment` VALUES ('6', '3', '程序员身上的异味，你会直接告诉他吗？ 二楼二楼二楼二楼二楼', '0', '0', '2018-06-02 08:32:35.158700', '2', '21', '5');
INSERT INTO `app01_comment` VALUES ('7', '1', '无人车无人车无人车，三楼三楼', '1', '0', '2018-06-02 09:56:05.537200', '3', '21', '2');
INSERT INTO `app01_comment` VALUES ('8', '1', '无人车，无人车，four floor', '0', '0', '2018-06-02 14:31:52.561800', '1', '21', null);

-- ----------------------------
-- Table structure for app01_course
-- ----------------------------
DROP TABLE IF EXISTS `app01_course`;
CREATE TABLE `app01_course` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(128) NOT NULL,
  `course_img` varchar(255) NOT NULL,
  `course_type` smallint(6) NOT NULL,
  `brief` longtext NOT NULL,
  `level` smallint(6) NOT NULL,
  `pub_date` date DEFAULT NULL,
  `period` int(10) unsigned NOT NULL,
  `order` int(11) NOT NULL,
  `attachment_path` varchar(128) DEFAULT NULL,
  `status` smallint(6) NOT NULL,
  `template_id` smallint(6) NOT NULL,
  `degree_course_id` int(11) DEFAULT NULL,
  `sub_category_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  KEY `app01_course_degree_course_id_dd29bf1e_fk_app01_degreecourse_id` (`degree_course_id`),
  KEY `app01_course_sub_category_id_e8256c53_fk_app01_cou` (`sub_category_id`),
  CONSTRAINT `app01_course_degree_course_id_dd29bf1e_fk_app01_degreecourse_id` FOREIGN KEY (`degree_course_id`) REFERENCES `app01_degreecourse` (`id`),
  CONSTRAINT `app01_course_sub_category_id_e8256c53_fk_app01_cou` FOREIGN KEY (`sub_category_id`) REFERENCES `app01_coursesubcategory` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of app01_course
-- ----------------------------
INSERT INTO `app01_course` VALUES ('4', 'Python开发21天入门必备', 'default.png', '0', 'Python已经成为目前最流行的编程语言，人工智能、机器学习、云计算、大数据开发、爬虫、WEB开发、金融量化、自动化运维、测试、游戏开发等都是Python极为擅长的领域，掌握Python语言已成为技术人员的必备能力', '0', '2018-05-01', '7', '1', '/static/', '0', '1', '1', '5');
INSERT INTO `app01_course` VALUES ('5', 'WEB开发入门', 'default.png', '1', '学习网页开发的基本原理和应用知识，为开发自己的WEB程序打下基础！', '0', '2018-05-02', '3', '2', '/static/', '0', '1', '2', '1');
INSERT INTO `app01_course` VALUES ('6', '计算机硬件与操作系统原理入门', 'default.png', '2', '对于非计算机专业从业者且想进入IT技术领域的初学者，了解计算机硬件之间的关系，操作系统的基本原理，软件与硬件之间如何交互等，都是必须要掌握的基础知识。', '0', '2018-05-03', '5', '3', '/static/', '0', '1', '4', '7');
INSERT INTO `app01_course` VALUES ('7', 'Linux系统基础5周入门精讲', 'default.png', '2', 'Linux世界上使用最多的系统之一，这位幕后英雄支持着各大网站的运行。 Linux就像一个高冷的贵妇，你很难打动她。但是只要你打动她，她就对你死心塌地了。', '0', '2018-05-04', '3', '4', '/static/', '0', '1', '4', '7');
INSERT INTO `app01_course` VALUES ('8', '算法入门', 'default.png', '0', '算法是计算机科学中最有魅力的领域，算法培养的是思考问题解决问题的通性通法，掌握常用算法知识，重新思考如何把你的程序变高效', '0', '2018-05-01', '6', '5', '/static/', '0', '1', '5', '8');
INSERT INTO `app01_course` VALUES ('9', '金融量化自动化分析&交易入门', 'default.png', '0', 'Python在金融分析领域应用非常普遍，本课程将带你在掌握金融股票、量化交易相关知识的基础上，探索如何通过Python开发一个量化交易平台', '0', null, '8', '6', '/static/', '0', '1', '6', '10');
INSERT INTO `app01_course` VALUES ('10', 'Python数据分析与机器学习实战', 'default.png', '1', '机器学习标志着计算机科学、数据分析、软件工程和人工智能领域内的重大技术突破。AlphaGo 战胜人类围棋冠军、人脸识别、大数据挖掘，都和机器学习密切相关。', '1', '2018-05-03', '6', '6', '/static/', '0', '1', '1', '5');

-- ----------------------------
-- Table structure for app01_coursecategory
-- ----------------------------
DROP TABLE IF EXISTS `app01_coursecategory`;
CREATE TABLE `app01_coursecategory` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(64) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of app01_coursecategory
-- ----------------------------
INSERT INTO `app01_coursecategory` VALUES ('1', '前端');
INSERT INTO `app01_coursecategory` VALUES ('2', '后端');

-- ----------------------------
-- Table structure for app01_coursechapter
-- ----------------------------
DROP TABLE IF EXISTS `app01_coursechapter`;
CREATE TABLE `app01_coursechapter` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `chapter` smallint(6) NOT NULL,
  `name` varchar(128) NOT NULL,
  `summary` longtext,
  `pub_date` date NOT NULL,
  `course_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `app01_coursechapter_course_id_chapter_a74bb3e7_uniq` (`course_id`,`chapter`),
  CONSTRAINT `app01_coursechapter_course_id_9750046b_fk_app01_course_id` FOREIGN KEY (`course_id`) REFERENCES `app01_course` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of app01_coursechapter
-- ----------------------------
INSERT INTO `app01_coursechapter` VALUES ('4', '1', '第1章·Python 介绍、基础语法、流程控制', '课程介绍（一）\r\n免费试学\r\n11:15\r\n课程介绍（二）-Python与其他语言的区别\r\n12:50\r\n课程介绍（三）-Python生态圈\r\n10:18\r\n课程介绍（四）\r\n18:53', '2018-05-31', '4');
INSERT INTO `app01_coursechapter` VALUES ('5', '2', '第2章·Python 数据类型、字符编码学习', '数据类型、字符编码学习', '2018-05-31', '4');
INSERT INTO `app01_coursechapter` VALUES ('6', '3', '第3章·Python 文件操作、函数、装饰器', '文件操作、函数、装饰器文件操作、函数、装饰器文件操作、函数、装饰器', '2018-05-31', '4');
INSERT INTO `app01_coursechapter` VALUES ('7', '4', '第4章·Python 学用模块、开发规范学习', 'Python 学用模块、开发规范学习Python 学用模块、开发规范学习Python 学用模块、开发规范学习Python 学用模块、开发规范学习', '2018-05-31', '4');
INSERT INTO `app01_coursechapter` VALUES ('8', '1', '第1章·Linux硬件基础', 'Linux硬件基础Linux硬件基础Linux硬件基础Linux硬件基础Linux硬件基础Linux硬件基础', '2018-05-31', '7');
INSERT INTO `app01_coursechapter` VALUES ('9', '2', '第2章·Linux发展过程', 'Linux发展过程Linux发展过程Linux发展过程Linux发展过程Linux发展过程Linux发展过程', '2018-05-31', '7');
INSERT INTO `app01_coursechapter` VALUES ('10', '3', '第3章·创建虚拟机和系统安装', '创建虚拟机和系统安装创建虚拟机和系统安装创建虚拟机和系统安装创建虚拟机和系统安装', '2018-05-31', '7');
INSERT INTO `app01_coursechapter` VALUES ('11', '4', '第4章·第一关一大波命令及特殊字符知识考试题讲解', '波命令及特殊字符知识考试题讲解', '2018-05-31', '7');

-- ----------------------------
-- Table structure for app01_coursedetail
-- ----------------------------
DROP TABLE IF EXISTS `app01_coursedetail`;
CREATE TABLE `app01_coursedetail` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `hours` int(11) NOT NULL,
  `course_slogan` varchar(125) DEFAULT NULL,
  `video_brief_link` varchar(255) DEFAULT NULL,
  `why_study` longtext NOT NULL,
  `what_to_study_brief` longtext NOT NULL,
  `career_improvement` longtext NOT NULL,
  `prerequisite` longtext NOT NULL,
  `course_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `course_id` (`course_id`),
  CONSTRAINT `app01_coursedetail_course_id_938c94fd_fk_app01_course_id` FOREIGN KEY (`course_id`) REFERENCES `app01_course` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of app01_coursedetail
-- ----------------------------
INSERT INTO `app01_coursedetail` VALUES ('1', '30', '零基础开始，21天掌握进入人工智能领域的必备语言', 'Python 以其简洁、优雅、高效的特点，成为目前最流行的4大主流开发语言之一，其应用广泛，易学易用，让很多人爱不释手。本套课程为初学者量身打造，是你入门 Python 的必修课程。  PS. 此课程特别适合之前完全无任何开发经验的小白白学习！知名网红讲师亲自肉身上阵，课程内容幽默风趣不枯燥，深入浅出，包君满意。', 'Python除了是人工智能领域第一语言之外，其实还广泛的应用于WEB开发、云计算、金融分析、自动化运维、自动化测试、爬虫、大数据分析等领域，生态圈极为丰富和活跃。它强大的模块库大大的提高了开发者的开发效率，简洁明朗的语法使写代码如写诗一样优雅顺畅，极大降低了编程的学习门槛。可以不谦虚的说，Python是唯一一门无论是开发老司机还是小白白都一致称赞的编程语言。\r\n 不论你是什么背景出身，如果对编程感兴趣，从Python入手吧，Python是检测你是否适合做程序员的最好的语言，如果练Python都学不会，哈哈，那你可以放弃这个职业啦！', '你将学习Python基本语法、数据类型、流程控制、文件处理、函数、装饰器、迭代器、常用模块、面向对象编程等知识。除此之外，你将在学习过程完成以下几个实战小程序', '对于非技术从业者，但工作内容涉及需要与技术人员有紧密沟通，比如产品经理、项目经理，掌握一门开发语言，能使你更容易的与技术人员沟通项目内容，对项目进度、产品的可实现性有更精准的预估。自己会开发是产品经理、项目经理避免被开发人员拿刀砍的有力保证，珍惜生命，学好开发。\r\n \r\n 对于技术从业者，如运维、测试，学会开发，可以更深入理解你们公司的技术架构，对开发人员开发的产品亦有能力提出优化方案，可以自如的开发自动化的运维、测试工具来提高你的工作效率，可以淡定的心中不慌的与开发部门撕逼。不再像之前，因为你不会开发，你对技术上的实现、架构其实是没有话语权的，因为你根本不了解各技术模块之间的深入联系。学会了开发，你与开发人员间的那层窗户纸就打破了，从此你们是一类人了，从而跳出了开发、运维、测试、网管、保安间的那尴尬的鄙视链关系。', '对编程感兴趣，熟练使用计算机，理解计算机主要硬件之间关系，理解操作系统基本原理\r\n 若没达到上述条件，请先学习<计算机硬件与操作系统原理入门>', '4');
INSERT INTO `app01_coursedetail` VALUES ('2', '40', '学习网页开发的基本原理和应用知识，为开发自己的WEB程序打下基础！', 'HTML /CSS/JavaScript 是WEB开发中必备的基础知识，假如把WEB开发比如女娲造人的过程，那HTML就像当于人的骨架，CSS是人的皮肤＋衣服，JavaScript是让人可以进行各种动作。这3个技术组件被称为网页开发三剑客，缺一不可，互联网上各种酷炫叼炸天的网站都是基于这3种技术组合开发的，本课程将带你学习网页开发的基本运作原理和应用知识，并完成一系列实战小项目，为日后成为精通 HTML、 CSS 、 JavaScript 的前端开发工程师打下坚实基础！', '你知道么，我们平日里上网80%以上的时间都是在与WEB服务打交道，除了通过电脑上网，你手机上的很多app与后台服务器通信也多是通过http web 协议实现的。加上现在PAAS平台这么流行，企业的产品多通过web方式提供客户使用，可以说，现如今，一个产品要想给用户使用，基本都是要配备web服务的。\r\n So, 若你也梦想日后开发一款伟大的产品供成千上万人使用，better start from learn this course now!', '为了帮你学成Web开发入门，你将深入学习如下内容PROJECT 1\r\nHTML\r\na.HTML介绍\r\nb.剖析HTTP请求周期了解HTML作用\r\nc.HTML文档结构\r\nd.HTML常用标签', '从此开发前端页面再也不用求人啦，可以任性的把自己后端实现的各种NB业务逻辑通过页面展现出来。\r\n 另个掌握WEB开发代表着你离全栈工程师又近了一步，那为什么要成全栈开发工程师呢？Good question , 因为全栈程序员是程序员行业里的上等人，手握上等代码资源，还有可以多跟旁边的设计妹子多说话的权利，连前台妹子看你的眼神都是带着光环的呀。。。\r\n\r\n课程先修要求', '学习此课程前，请确保你已熟练使用计算机', '5');
INSERT INTO `app01_coursedetail` VALUES ('3', '180', '学习Linux系统的基本原理和应用知识，一步步的进入Linux世界', 'Linux世界上使用最多的系统之一，这位幕后英雄支持着各大网站的运行。  Linux就像一个高冷的贵妇，你很难打动她。但是只要你打动她，她就对你死心塌地了。所以如何征服Linux这位贵妇，即Linux入门就很重要了。  自学可能需要半年甚至更久，但观看我们这个专题课程五周让你熟练使用命令和常用服务以及排除常见故障。  PS. 此课程特别适合之前完全无任何Linux使用或运维经验的小白白学习！知名网红讲师亲自肉身上阵，课程内容幽默风趣不枯燥，深入浅出，包君满意。', '你知道么，世界上超过80%的网站都是运行在Linux系统上，所有的安卓手机都是基于Linux内核，你平日里用的微信、QQ、微博的服务器也都是跑在Linux系统上的，可以不夸张的说，互联网世界的幕后英雄，Linux操作系统当之无愧，学习Linux可以让你慢慢的接触、迷恋、爱上Linux这位贵妇。而且各个行业对于Linux的需求也越来越多。\r\n 想把系统掌控在自己的手里，赶快来学习Linux吧。无论你是什么背景，什么学历，拿起手中的手机、计算机来学习Linux吧！', '你将要学习到运维必知必会的常用工具，服务器结构组成详解，Linux必会的一堆命令，以及Linux入门必备的基础知识，Linux权限，文件属性，正则，定时任务等知识。', '这部分内容将带领你一步一步走入Linux世界，解决从0到1的问题。\r\n 一步一个脚印带你掌握Linux命令与知识点，这些命令是所有Linux操作的基础也是，整个linux生涯中的地基。\r\n 这部分内容不能让你学完后出去装逼和大牛们侃大山，但是可以让你在未来的学习中解决已知和未知的错误故障。\r\n 这部分内容不能让你学完后出去马上拿到10k的offer，但是可以让你在未来的找工作中不至于基础不牢而被淘汰。\r\n 这部分内容不能让你学完后出去马上成为Linux大牛，但是可以让你在接下来的学习中如鱼得水。', '计算机基础知识、网络相关知识', '7');

-- ----------------------------
-- Table structure for app01_coursedetail_recommend_courses
-- ----------------------------
DROP TABLE IF EXISTS `app01_coursedetail_recommend_courses`;
CREATE TABLE `app01_coursedetail_recommend_courses` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `coursedetail_id` int(11) NOT NULL,
  `course_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `app01_coursedetail_recom_coursedetail_id_course_i_2b9c5762_uniq` (`coursedetail_id`,`course_id`),
  KEY `app01_coursedetail_r_course_id_3f2853d2_fk_app01_cou` (`course_id`),
  CONSTRAINT `app01_coursedetail_r_course_id_3f2853d2_fk_app01_cou` FOREIGN KEY (`course_id`) REFERENCES `app01_course` (`id`),
  CONSTRAINT `app01_coursedetail_r_coursedetail_id_d4f03a87_fk_app01_cou` FOREIGN KEY (`coursedetail_id`) REFERENCES `app01_coursedetail` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of app01_coursedetail_recommend_courses
-- ----------------------------
INSERT INTO `app01_coursedetail_recommend_courses` VALUES ('1', '1', '5');
INSERT INTO `app01_coursedetail_recommend_courses` VALUES ('2', '1', '6');
INSERT INTO `app01_coursedetail_recommend_courses` VALUES ('3', '2', '6');
INSERT INTO `app01_coursedetail_recommend_courses` VALUES ('4', '2', '7');
INSERT INTO `app01_coursedetail_recommend_courses` VALUES ('6', '3', '5');
INSERT INTO `app01_coursedetail_recommend_courses` VALUES ('5', '3', '8');

-- ----------------------------
-- Table structure for app01_coursedetail_teachers
-- ----------------------------
DROP TABLE IF EXISTS `app01_coursedetail_teachers`;
CREATE TABLE `app01_coursedetail_teachers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `coursedetail_id` int(11) NOT NULL,
  `teacher_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `app01_coursedetail_teach_coursedetail_id_teacher__09120940_uniq` (`coursedetail_id`,`teacher_id`),
  KEY `app01_coursedetail_t_teacher_id_e2d3836e_fk_app01_tea` (`teacher_id`),
  CONSTRAINT `app01_coursedetail_t_coursedetail_id_44118817_fk_app01_cou` FOREIGN KEY (`coursedetail_id`) REFERENCES `app01_coursedetail` (`id`),
  CONSTRAINT `app01_coursedetail_t_teacher_id_e2d3836e_fk_app01_tea` FOREIGN KEY (`teacher_id`) REFERENCES `app01_teacher` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of app01_coursedetail_teachers
-- ----------------------------
INSERT INTO `app01_coursedetail_teachers` VALUES ('1', '1', '2');
INSERT INTO `app01_coursedetail_teachers` VALUES ('2', '1', '4');
INSERT INTO `app01_coursedetail_teachers` VALUES ('3', '2', '1');
INSERT INTO `app01_coursedetail_teachers` VALUES ('4', '2', '3');
INSERT INTO `app01_coursedetail_teachers` VALUES ('5', '3', '1');
INSERT INTO `app01_coursedetail_teachers` VALUES ('6', '3', '2');
INSERT INTO `app01_coursedetail_teachers` VALUES ('7', '3', '3');

-- ----------------------------
-- Table structure for app01_courseoutline
-- ----------------------------
DROP TABLE IF EXISTS `app01_courseoutline`;
CREATE TABLE `app01_courseoutline` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `order` smallint(5) unsigned NOT NULL,
  `title` varchar(128) NOT NULL,
  `content` longtext NOT NULL,
  `course_detail_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `app01_courseoutline_course_detail_id_title_621e0f34_uniq` (`course_detail_id`,`title`),
  CONSTRAINT `app01_courseoutline_course_detail_id_92c6ec37_fk_app01_cou` FOREIGN KEY (`course_detail_id`) REFERENCES `app01_coursedetail` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of app01_courseoutline
-- ----------------------------
INSERT INTO `app01_courseoutline` VALUES ('1', '1', 'Python开发21天入门必备', 'Python已经成为目前最流行的编程语言，人工智能、机器学习、云计算、大数据开发、爬虫、WEB开发、金融量化、自动化运维、测试、游戏开发等都是Python极为擅长的领域，掌握Python语言已成为技术人员的必备能力', '1');
INSERT INTO `app01_courseoutline` VALUES ('2', '2', 'WEB开发入门', '学习网页开发的基本原理和应用知识，为开发自己的WEB程序打下基础！', '2');
INSERT INTO `app01_courseoutline` VALUES ('3', '3', 'Linux系统基础5周入门精讲', 'Linux系统基础5周入门精讲Linux系统基础5周入门精讲Linux系统基础5周入门精讲Linux系统基础5周入门精讲', '3');

-- ----------------------------
-- Table structure for app01_coursesection
-- ----------------------------
DROP TABLE IF EXISTS `app01_coursesection`;
CREATE TABLE `app01_coursesection` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(128) NOT NULL,
  `order` smallint(5) unsigned NOT NULL,
  `section_type` smallint(6) NOT NULL,
  `section_link` varchar(255) DEFAULT NULL,
  `video_time` varchar(32) DEFAULT NULL,
  `pub_date` datetime(6) NOT NULL,
  `free_trail` tinyint(1) NOT NULL,
  `chapter_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `app01_coursesection_chapter_id_section_link_32295150_uniq` (`chapter_id`,`section_link`),
  CONSTRAINT `app01_coursesection_chapter_id_7773bc33_fk_app01_cou` FOREIGN KEY (`chapter_id`) REFERENCES `app01_coursechapter` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of app01_coursesection
-- ----------------------------

-- ----------------------------
-- Table structure for app01_coursesubcategory
-- ----------------------------
DROP TABLE IF EXISTS `app01_coursesubcategory`;
CREATE TABLE `app01_coursesubcategory` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(64) NOT NULL,
  `category_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  KEY `app01_coursesubcateg_category_id_64c8c93f_fk_app01_cou` (`category_id`),
  CONSTRAINT `app01_coursesubcateg_category_id_64c8c93f_fk_app01_cou` FOREIGN KEY (`category_id`) REFERENCES `app01_coursecategory` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of app01_coursesubcategory
-- ----------------------------
INSERT INTO `app01_coursesubcategory` VALUES ('1', 'HTML语言', '1');
INSERT INTO `app01_coursesubcategory` VALUES ('2', 'Javascript入门到精通', '1');
INSERT INTO `app01_coursesubcategory` VALUES ('3', 'jQuery入门到放弃', '1');
INSERT INTO `app01_coursesubcategory` VALUES ('4', 'Bootstrip模板', '1');
INSERT INTO `app01_coursesubcategory` VALUES ('5', 'Python', '2');
INSERT INTO `app01_coursesubcategory` VALUES ('6', 'MySQL', '2');
INSERT INTO `app01_coursesubcategory` VALUES ('7', 'linux', '2');
INSERT INTO `app01_coursesubcategory` VALUES ('8', 'C#', '2');
INSERT INTO `app01_coursesubcategory` VALUES ('9', 'VUE', '1');
INSERT INTO `app01_coursesubcategory` VALUES ('10', 'Java', '2');

-- ----------------------------
-- Table structure for app01_degreecourse
-- ----------------------------
DROP TABLE IF EXISTS `app01_degreecourse`;
CREATE TABLE `app01_degreecourse` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(128) NOT NULL,
  `course_img` varchar(255) NOT NULL,
  `brief` longtext NOT NULL,
  `total_scholarship` int(10) unsigned NOT NULL,
  `mentor_compensation_bonus` int(10) unsigned NOT NULL,
  `period` int(10) unsigned NOT NULL,
  `prerequisite` longtext NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of app01_degreecourse
-- ----------------------------
INSERT INTO `app01_degreecourse` VALUES ('1', 'python基础班', 'default.png', 'Python除了是人工智能领域第一语言之外，其实还广泛的应用于WEB开发、云计算、金融分析、自动化运维、自动化测试、爬虫、大数据分析等领域，生态圈极为丰富和活跃。它强大的模块库大大的提高了开发者的开发效率，简洁明朗的语法使写代码如写诗一样优雅顺畅，极大降低了编程的学习门槛。可以不谦虚的说，Python是唯一一门无论是开发老司机还是小白白都一致称赞的编程语言。\r\n 不论你是什么背景出身，如果对编程感兴趣，从Python入手吧，Python是检测你是否适合做程序员的最好的语言，如果练Python都学不会，哈哈，那你可以放弃这个职业啦！', '30000', '12000', '150', '对编程感兴趣，熟练使用计算机，理解计算机主要硬件之间关系，理解操作系统基本原理\r\n 若没达到上述条件，请先学习<计算机硬件与操作系统原理入门>');
INSERT INTO `app01_degreecourse` VALUES ('2', 'WEB框架', 'default.png', 'HTML /CSS/JavaScript 是WEB开发中必备的基础知识，假如把WEB开发比如女娲造人的过程，那HTML就像当于人的骨架，CSS是人的皮肤＋衣服，JavaScript是让人可以进行各种动作。这3个技术组件被称为网页开发三剑客，缺一不可，互联网上各种酷炫叼炸天的网站都是基于这3种技术组合开发的，本课程将带你学习网页开发的基本运作原理和应用知识，并完成一系列实战小项目，为日后成为精通 HTML、 CSS 、 JavaScript 的前端开发工程师打下坚实基础！', '23000', '11000', '50', '学习此课程前，请确保你已熟练使用计算机');
INSERT INTO `app01_degreecourse` VALUES ('3', 'MySQL删库到跑路', 'default.png', 'MySQL 是最流行的关系型数据库管理系统，在WEB应用方面 MySQL 是最好的RDBMS(Relational Database Management System：关系数据库管理系统)应用软件之一。\r\n\r\n在本教程中，会让大家快速掌握 MySQL 的基本知识，并轻松使用 MySQL 数据库。', '60000', '5000', '15', '我们也可以将数据存储在文件中，但是在文件中读写数据速度相对较慢。\r\n\r\n所以，现在我们使用关系型数据库管理系统（RDBMS）来存储和管理的大数据量。所谓的关系型数据库，是建立在关系模型基础上的数据库，借助于集合代数等数学概念和方法来处理数据库中的数据。');
INSERT INTO `app01_degreecourse` VALUES ('4', 'linux基础', 'default.png', 'Linux世界上使用最多的系统之一，这位幕后英雄支持着各大网站的运行。\r\n Linux就像一个高冷的贵妇，你很难打动她。但是只要你打动她，她就对你死心塌地了。所以如何征服Linux这位贵妇，即Linux入门就很重要了。\r\n 自学可能需要半年甚至更久，但观看我们这个专题课程五周让你熟练使用命令和常用服务以及排除常见故障。\r\n PS. 此课程特别适合之前完全无任何Linux使用或运维经验的小白白学习！知名网红讲师亲自肉身上阵，课程内容幽默风趣不枯燥，深入浅出，包君满意。', '880000', '7800', '67', '这部分内容将带领你一步一步走入Linux世界，解决从0到1的问题。');
INSERT INTO `app01_degreecourse` VALUES ('5', '算法入门', 'default.png', '算法入门算法入门算法入门算法入门算法入门算法入门', '40000', '15000', '150', '算法入门算法入门算法入门算法入门算法入门算法入门算法入门');
INSERT INTO `app01_degreecourse` VALUES ('6', '金融量化自动化分析&交易入门', 'default.png', '金融量化自动化分析&交易入门金融量化自动化分析&交易入门金融量化自动化分析&交易入门', '40000', '15000', '150', '金融量化自动化分析&交易入门金融量化自动化分析&交易入门金融量化自动化分析&交易入门');

-- ----------------------------
-- Table structure for app01_degreecourse_teachers
-- ----------------------------
DROP TABLE IF EXISTS `app01_degreecourse_teachers`;
CREATE TABLE `app01_degreecourse_teachers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `degreecourse_id` int(11) NOT NULL,
  `teacher_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `app01_degreecourse_teach_degreecourse_id_teacher__c8416475_uniq` (`degreecourse_id`,`teacher_id`),
  KEY `app01_degreecourse_t_teacher_id_6f9ecb34_fk_app01_tea` (`teacher_id`),
  CONSTRAINT `app01_degreecourse_t_degreecourse_id_a5b4684e_fk_app01_deg` FOREIGN KEY (`degreecourse_id`) REFERENCES `app01_degreecourse` (`id`),
  CONSTRAINT `app01_degreecourse_t_teacher_id_6f9ecb34_fk_app01_tea` FOREIGN KEY (`teacher_id`) REFERENCES `app01_teacher` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of app01_degreecourse_teachers
-- ----------------------------
INSERT INTO `app01_degreecourse_teachers` VALUES ('1', '1', '2');
INSERT INTO `app01_degreecourse_teachers` VALUES ('2', '2', '1');
INSERT INTO `app01_degreecourse_teachers` VALUES ('3', '2', '4');
INSERT INTO `app01_degreecourse_teachers` VALUES ('4', '3', '1');
INSERT INTO `app01_degreecourse_teachers` VALUES ('5', '4', '3');
INSERT INTO `app01_degreecourse_teachers` VALUES ('6', '5', '3');
INSERT INTO `app01_degreecourse_teachers` VALUES ('7', '5', '4');
INSERT INTO `app01_degreecourse_teachers` VALUES ('8', '6', '1');
INSERT INTO `app01_degreecourse_teachers` VALUES ('9', '6', '2');

-- ----------------------------
-- Table structure for app01_homework
-- ----------------------------
DROP TABLE IF EXISTS `app01_homework`;
CREATE TABLE `app01_homework` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(128) NOT NULL,
  `order` smallint(5) unsigned NOT NULL,
  `homework_type` smallint(6) NOT NULL,
  `requirement` longtext NOT NULL,
  `threshold` longtext NOT NULL,
  `recommend_period` smallint(5) unsigned NOT NULL,
  `scholarship_value` smallint(5) unsigned NOT NULL,
  `note` longtext,
  `enabled` tinyint(1) NOT NULL,
  `chapter_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `app01_homework_chapter_id_title_ec434b6d_uniq` (`chapter_id`,`title`),
  CONSTRAINT `app01_homework_chapter_id_5fa76b0e_fk_app01_coursechapter_id` FOREIGN KEY (`chapter_id`) REFERENCES `app01_coursechapter` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of app01_homework
-- ----------------------------

-- ----------------------------
-- Table structure for app01_oftenaskedquestion
-- ----------------------------
DROP TABLE IF EXISTS `app01_oftenaskedquestion`;
CREATE TABLE `app01_oftenaskedquestion` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `object_id` int(10) unsigned NOT NULL,
  `question` varchar(255) NOT NULL,
  `answer` longtext NOT NULL,
  `content_type_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `app01_oftenaskedquestion_content_type_id_object_i_351387ab_uniq` (`content_type_id`,`object_id`,`question`),
  CONSTRAINT `app01_oftenaskedques_content_type_id_e5e8dba8_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of app01_oftenaskedquestion
-- ----------------------------
INSERT INTO `app01_oftenaskedquestion` VALUES ('1', '4', 'Q：1.学完此课程后能达到什么水平？', 'A：课程中会涉及几个小项目，其中一个比较重要的作业是实现ATM信用卡程序，代码量在500行左右，你学完此课程，至少可以写个500行的不太复杂的程序', '7');
INSERT INTO `app01_oftenaskedquestion` VALUES ('2', '4', 'Q：2.学习过程中碰到疑问怎么办？', 'A：报名后，会提示你加入我们的学习群，学习过程中遇到的问题可以在群里与小伙伴讨论，或询问导师帮助。', '7');
INSERT INTO `app01_oftenaskedquestion` VALUES ('3', '7', 'Q：我是零基础，能学会吗？', 'A：本课程是纯0基础开讲，只要你熟悉电脑基础操作，能熟练使用鼠标进行单击，能通过QQ进行沟通，其实能玩游戏即可。', '7');
INSERT INTO `app01_oftenaskedquestion` VALUES ('4', '7', 'Q：需要学习多长时间？', 'A：话说仅需5周，但是没有态度5个月都学不完！', '7');

-- ----------------------------
-- Table structure for app01_pricepolicy
-- ----------------------------
DROP TABLE IF EXISTS `app01_pricepolicy`;
CREATE TABLE `app01_pricepolicy` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `object_id` int(10) unsigned NOT NULL,
  `valid_period` smallint(6) NOT NULL,
  `price` double NOT NULL,
  `content_type_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `app01_pricepolicy_content_type_id_object_i_b1f0d8e9_uniq` (`content_type_id`,`object_id`,`valid_period`),
  CONSTRAINT `app01_pricepolicy_content_type_id_b208c366_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of app01_pricepolicy
-- ----------------------------
INSERT INTO `app01_pricepolicy` VALUES ('1', '4', '3', '100', '7');
INSERT INTO `app01_pricepolicy` VALUES ('2', '4', '30', '400', '7');

-- ----------------------------
-- Table structure for app01_scholarship
-- ----------------------------
DROP TABLE IF EXISTS `app01_scholarship`;
CREATE TABLE `app01_scholarship` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `time_percent` smallint(5) unsigned NOT NULL,
  `value` int(10) unsigned NOT NULL,
  `degree_course_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `app01_scholarship_degree_course_id_66e7e69d_fk_app01_deg` (`degree_course_id`),
  CONSTRAINT `app01_scholarship_degree_course_id_66e7e69d_fk_app01_deg` FOREIGN KEY (`degree_course_id`) REFERENCES `app01_degreecourse` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of app01_scholarship
-- ----------------------------
INSERT INTO `app01_scholarship` VALUES ('1', '80', '5000', '1');
INSERT INTO `app01_scholarship` VALUES ('2', '56', '6000', '2');
INSERT INTO `app01_scholarship` VALUES ('3', '60', '7000', '3');
INSERT INTO `app01_scholarship` VALUES ('4', '50', '5000', '4');

-- ----------------------------
-- Table structure for app01_teacher
-- ----------------------------
DROP TABLE IF EXISTS `app01_teacher`;
CREATE TABLE `app01_teacher` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(32) NOT NULL,
  `role` smallint(6) NOT NULL,
  `title` varchar(64) NOT NULL,
  `signature` varchar(255) DEFAULT NULL,
  `image` varchar(128) NOT NULL,
  `brief` longtext NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of app01_teacher
-- ----------------------------
INSERT INTO `app01_teacher` VALUES ('1', 'egon', '0', '铜牌讲师', '就是这么硬气', 'default.png', '老男孩教育Python学科金牌讲师曾任某上市公司云计算部门主管\r\n 多年一线运维和开发经验，追求极致的技术分享者，被技术耽误的相声演员。');
INSERT INTO `app01_teacher` VALUES ('2', 'alex', '0', '无证上岗', '之前干过传销，保险', 'default.png', 'CrazyEye,MadKing,TriAquae三款开源软件作者，10多年运维+自动化开发经验，曾任职公安部、飞信、Nokia中国、汽车之家等公司，热爱技术、电影、音乐、旅游、妹子！');
INSERT INTO `app01_teacher` VALUES ('3', '李泳谊', '0', '牌牌讲师', 'Linux很强大', 'default.png', '90后新兴讲师，师从业内顶级Linux专家老男孩老师，多年一线运维经验，讲课坚持以各种图形表达抽象概念。用简单粗暴的例子表达课上内容。追求讲到你懂了为止，适合零基础入门的的小伙伴。曾分享录制awk数组实战分享，http原理实战分享等精品视频，受益数千人，深得网友喜爱！');
INSERT INTO `app01_teacher` VALUES ('4', '武sir', '0', '金牌讲师', '自信发自内心', 'default.png', '多年开发实战经验，先后任职于汽车之家、好大夫在线等多家大型互联网公司。\r\n 擅长C#,Python,PHP等一大堆语言开发，现任某大型互联网公司高级自动化开发工程师，已精读多个开源软件源码，自行开发过改进版的Tornado WEB框架，讲课风趣幽默，除了长的丑，没啥缺点。');
INSERT INTO `app01_teacher` VALUES ('5', '元宝', '1', '无牌导师', '圆圆又OO', 'default.png', '圆圆又OO圆圆又OO圆圆又OO圆圆又OO圆圆又OO圆圆又OO圆圆又OO圆圆又OO');
INSERT INTO `app01_teacher` VALUES ('6', '翠花', '1', '金牌讲师', '酸菜泡面', 'default.png', '酸菜泡面酸菜泡面酸菜泡面酸菜泡面酸菜泡面酸菜泡面酸菜泡面酸菜泡面');
INSERT INTO `app01_teacher` VALUES ('7', '铁锤', '1', '银牌讲师', '胸口碎大石', 'default.png', '胸口碎大石胸口碎大石胸口碎大石胸口碎大石胸口碎大石胸口碎大石胸口碎大石');

-- ----------------------------
-- Table structure for app01_userauthtoken
-- ----------------------------
DROP TABLE IF EXISTS `app01_userauthtoken`;
CREATE TABLE `app01_userauthtoken` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `token` varchar(64) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `token` (`token`),
  UNIQUE KEY `user_id` (`user_id`),
  CONSTRAINT `app01_userauthtoken_user_id_9d0d98f0_fk_app01_account_id` FOREIGN KEY (`user_id`) REFERENCES `app01_account` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of app01_userauthtoken
-- ----------------------------
INSERT INTO `app01_userauthtoken` VALUES ('1', 'e4915d45-957e-4eed-a8c8-169020894f34', '1');
INSERT INTO `app01_userauthtoken` VALUES ('2', '19360da8-a6ea-4af4-9ccc-c8b072b0a711', '2');
INSERT INTO `app01_userauthtoken` VALUES ('3', 'c26243bd-f9cd-4758-ac6f-b65f1edccfc2', '3');

-- ----------------------------
-- Table structure for auth_group
-- ----------------------------
DROP TABLE IF EXISTS `auth_group`;
CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(80) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of auth_group
-- ----------------------------

-- ----------------------------
-- Table structure for auth_group_permissions
-- ----------------------------
DROP TABLE IF EXISTS `auth_group_permissions`;
CREATE TABLE `auth_group_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of auth_group_permissions
-- ----------------------------

-- ----------------------------
-- Table structure for auth_permission
-- ----------------------------
DROP TABLE IF EXISTS `auth_permission`;
CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=76 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of auth_permission
-- ----------------------------
INSERT INTO `auth_permission` VALUES ('1', 'Can add log entry', '1', 'add_logentry');
INSERT INTO `auth_permission` VALUES ('2', 'Can change log entry', '1', 'change_logentry');
INSERT INTO `auth_permission` VALUES ('3', 'Can delete log entry', '1', 'delete_logentry');
INSERT INTO `auth_permission` VALUES ('4', 'Can add permission', '2', 'add_permission');
INSERT INTO `auth_permission` VALUES ('5', 'Can change permission', '2', 'change_permission');
INSERT INTO `auth_permission` VALUES ('6', 'Can delete permission', '2', 'delete_permission');
INSERT INTO `auth_permission` VALUES ('7', 'Can add group', '3', 'add_group');
INSERT INTO `auth_permission` VALUES ('8', 'Can change group', '3', 'change_group');
INSERT INTO `auth_permission` VALUES ('9', 'Can delete group', '3', 'delete_group');
INSERT INTO `auth_permission` VALUES ('10', 'Can add user', '4', 'add_user');
INSERT INTO `auth_permission` VALUES ('11', 'Can change user', '4', 'change_user');
INSERT INTO `auth_permission` VALUES ('12', 'Can delete user', '4', 'delete_user');
INSERT INTO `auth_permission` VALUES ('13', 'Can add content type', '5', 'add_contenttype');
INSERT INTO `auth_permission` VALUES ('14', 'Can change content type', '5', 'change_contenttype');
INSERT INTO `auth_permission` VALUES ('15', 'Can delete content type', '5', 'delete_contenttype');
INSERT INTO `auth_permission` VALUES ('16', 'Can add session', '6', 'add_session');
INSERT INTO `auth_permission` VALUES ('17', 'Can change session', '6', 'change_session');
INSERT INTO `auth_permission` VALUES ('18', 'Can delete session', '6', 'delete_session');
INSERT INTO `auth_permission` VALUES ('19', 'Can add course', '7', 'add_course');
INSERT INTO `auth_permission` VALUES ('20', 'Can change course', '7', 'change_course');
INSERT INTO `auth_permission` VALUES ('21', 'Can delete course', '7', 'delete_course');
INSERT INTO `auth_permission` VALUES ('22', 'Can add course category', '8', 'add_coursecategory');
INSERT INTO `auth_permission` VALUES ('23', 'Can change course category', '8', 'change_coursecategory');
INSERT INTO `auth_permission` VALUES ('24', 'Can delete course category', '8', 'delete_coursecategory');
INSERT INTO `auth_permission` VALUES ('25', 'Can add course chapter', '9', 'add_coursechapter');
INSERT INTO `auth_permission` VALUES ('26', 'Can change course chapter', '9', 'change_coursechapter');
INSERT INTO `auth_permission` VALUES ('27', 'Can delete course chapter', '9', 'delete_coursechapter');
INSERT INTO `auth_permission` VALUES ('28', 'Can add course detail', '10', 'add_coursedetail');
INSERT INTO `auth_permission` VALUES ('29', 'Can change course detail', '10', 'change_coursedetail');
INSERT INTO `auth_permission` VALUES ('30', 'Can delete course detail', '10', 'delete_coursedetail');
INSERT INTO `auth_permission` VALUES ('31', 'Can add course outline', '11', 'add_courseoutline');
INSERT INTO `auth_permission` VALUES ('32', 'Can change course outline', '11', 'change_courseoutline');
INSERT INTO `auth_permission` VALUES ('33', 'Can delete course outline', '11', 'delete_courseoutline');
INSERT INTO `auth_permission` VALUES ('34', 'Can add course section', '12', 'add_coursesection');
INSERT INTO `auth_permission` VALUES ('35', 'Can change course section', '12', 'change_coursesection');
INSERT INTO `auth_permission` VALUES ('36', 'Can delete course section', '12', 'delete_coursesection');
INSERT INTO `auth_permission` VALUES ('37', 'Can add course sub category', '13', 'add_coursesubcategory');
INSERT INTO `auth_permission` VALUES ('38', 'Can change course sub category', '13', 'change_coursesubcategory');
INSERT INTO `auth_permission` VALUES ('39', 'Can delete course sub category', '13', 'delete_coursesubcategory');
INSERT INTO `auth_permission` VALUES ('40', 'Can add degree course', '14', 'add_degreecourse');
INSERT INTO `auth_permission` VALUES ('41', 'Can change degree course', '14', 'change_degreecourse');
INSERT INTO `auth_permission` VALUES ('42', 'Can delete degree course', '14', 'delete_degreecourse');
INSERT INTO `auth_permission` VALUES ('43', 'Can add homework', '15', 'add_homework');
INSERT INTO `auth_permission` VALUES ('44', 'Can change homework', '15', 'change_homework');
INSERT INTO `auth_permission` VALUES ('45', 'Can delete homework', '15', 'delete_homework');
INSERT INTO `auth_permission` VALUES ('46', 'Can add often asked question', '16', 'add_oftenaskedquestion');
INSERT INTO `auth_permission` VALUES ('47', 'Can change often asked question', '16', 'change_oftenaskedquestion');
INSERT INTO `auth_permission` VALUES ('48', 'Can delete often asked question', '16', 'delete_oftenaskedquestion');
INSERT INTO `auth_permission` VALUES ('49', 'Can add price policy', '17', 'add_pricepolicy');
INSERT INTO `auth_permission` VALUES ('50', 'Can change price policy', '17', 'change_pricepolicy');
INSERT INTO `auth_permission` VALUES ('51', 'Can delete price policy', '17', 'delete_pricepolicy');
INSERT INTO `auth_permission` VALUES ('52', 'Can add scholarship', '18', 'add_scholarship');
INSERT INTO `auth_permission` VALUES ('53', 'Can change scholarship', '18', 'change_scholarship');
INSERT INTO `auth_permission` VALUES ('54', 'Can delete scholarship', '18', 'delete_scholarship');
INSERT INTO `auth_permission` VALUES ('55', 'Can add teacher', '19', 'add_teacher');
INSERT INTO `auth_permission` VALUES ('56', 'Can change teacher', '19', 'change_teacher');
INSERT INTO `auth_permission` VALUES ('57', 'Can delete teacher', '19', 'delete_teacher');
INSERT INTO `auth_permission` VALUES ('58', 'Can add account', '20', 'add_account');
INSERT INTO `auth_permission` VALUES ('59', 'Can change account', '20', 'change_account');
INSERT INTO `auth_permission` VALUES ('60', 'Can delete account', '20', 'delete_account');
INSERT INTO `auth_permission` VALUES ('61', 'Can add article', '21', 'add_article');
INSERT INTO `auth_permission` VALUES ('62', 'Can change article', '21', 'change_article');
INSERT INTO `auth_permission` VALUES ('63', 'Can delete article', '21', 'delete_article');
INSERT INTO `auth_permission` VALUES ('64', 'Can add article source', '22', 'add_articlesource');
INSERT INTO `auth_permission` VALUES ('65', 'Can change article source', '22', 'change_articlesource');
INSERT INTO `auth_permission` VALUES ('66', 'Can delete article source', '22', 'delete_articlesource');
INSERT INTO `auth_permission` VALUES ('67', 'Can add collection', '23', 'add_collection');
INSERT INTO `auth_permission` VALUES ('68', 'Can change collection', '23', 'change_collection');
INSERT INTO `auth_permission` VALUES ('69', 'Can delete collection', '23', 'delete_collection');
INSERT INTO `auth_permission` VALUES ('70', 'Can add comment', '24', 'add_comment');
INSERT INTO `auth_permission` VALUES ('71', 'Can change comment', '24', 'change_comment');
INSERT INTO `auth_permission` VALUES ('72', 'Can delete comment', '24', 'delete_comment');
INSERT INTO `auth_permission` VALUES ('73', 'Can add user auth token', '25', 'add_userauthtoken');
INSERT INTO `auth_permission` VALUES ('74', 'Can change user auth token', '25', 'change_userauthtoken');
INSERT INTO `auth_permission` VALUES ('75', 'Can delete user auth token', '25', 'delete_userauthtoken');

-- ----------------------------
-- Table structure for auth_user
-- ----------------------------
DROP TABLE IF EXISTS `auth_user`;
CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(30) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of auth_user
-- ----------------------------
INSERT INTO `auth_user` VALUES ('1', 'pbkdf2_sha256$36000$aFboCBnVIJR8$4ZhqGL7sbu0YQFDAp57NUWLbzHoocDbN44wCFcoLX6A=', '2018-05-31 08:42:57.208300', '1', 'root', '', '', '', '1', '1', '2018-05-31 08:42:43.053300');

-- ----------------------------
-- Table structure for auth_user_groups
-- ----------------------------
DROP TABLE IF EXISTS `auth_user_groups`;
CREATE TABLE `auth_user_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of auth_user_groups
-- ----------------------------

-- ----------------------------
-- Table structure for auth_user_user_permissions
-- ----------------------------
DROP TABLE IF EXISTS `auth_user_user_permissions`;
CREATE TABLE `auth_user_user_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of auth_user_user_permissions
-- ----------------------------

-- ----------------------------
-- Table structure for django_admin_log
-- ----------------------------
DROP TABLE IF EXISTS `django_admin_log`;
CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=98 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of django_admin_log
-- ----------------------------
INSERT INTO `django_admin_log` VALUES ('1', '2018-05-31 08:44:44.336300', '1', '前端', '1', '[{\"added\": {}}]', '8', '1');
INSERT INTO `django_admin_log` VALUES ('2', '2018-05-31 08:44:52.399300', '2', '后端', '1', '[{\"added\": {}}]', '8', '1');
INSERT INTO `django_admin_log` VALUES ('3', '2018-05-31 08:45:15.821300', '1', 'HTML语言', '1', '[{\"added\": {}}]', '13', '1');
INSERT INTO `django_admin_log` VALUES ('4', '2018-05-31 08:45:36.110300', '2', 'Javascript入门到精通', '1', '[{\"added\": {}}]', '13', '1');
INSERT INTO `django_admin_log` VALUES ('5', '2018-05-31 08:46:05.987300', '3', 'jQuery入门到放弃', '1', '[{\"added\": {}}]', '13', '1');
INSERT INTO `django_admin_log` VALUES ('6', '2018-05-31 08:46:27.047300', '4', 'Bootstrip模板', '1', '[{\"added\": {}}]', '13', '1');
INSERT INTO `django_admin_log` VALUES ('7', '2018-05-31 08:46:44.373300', '5', 'Python', '1', '[{\"added\": {}}]', '13', '1');
INSERT INTO `django_admin_log` VALUES ('8', '2018-05-31 08:46:54.122300', '6', 'MySQL', '1', '[{\"added\": {}}]', '13', '1');
INSERT INTO `django_admin_log` VALUES ('9', '2018-05-31 08:47:08.334300', '7', 'linux', '1', '[{\"added\": {}}]', '13', '1');
INSERT INTO `django_admin_log` VALUES ('10', '2018-05-31 08:47:21.825300', '8', 'C#', '1', '[{\"added\": {}}]', '13', '1');
INSERT INTO `django_admin_log` VALUES ('11', '2018-05-31 08:47:37.767300', '9', 'VUE', '1', '[{\"added\": {}}]', '13', '1');
INSERT INTO `django_admin_log` VALUES ('12', '2018-05-31 08:49:43.414300', '10', 'Java', '1', '[{\"added\": {}}]', '13', '1');
INSERT INTO `django_admin_log` VALUES ('13', '2018-05-31 09:12:36.126300', '1', 'egon', '1', '[{\"added\": {}}]', '19', '1');
INSERT INTO `django_admin_log` VALUES ('14', '2018-05-31 09:13:29.160300', '2', 'alex', '1', '[{\"added\": {}}]', '19', '1');
INSERT INTO `django_admin_log` VALUES ('15', '2018-05-31 09:14:28.328300', '3', '李泳谊', '1', '[{\"added\": {}}]', '19', '1');
INSERT INTO `django_admin_log` VALUES ('16', '2018-05-31 09:46:20.817300', '4', '武sir', '1', '[{\"added\": {}}]', '19', '1');
INSERT INTO `django_admin_log` VALUES ('17', '2018-05-31 09:47:08.706300', '5', '元宝', '1', '[{\"added\": {}}]', '19', '1');
INSERT INTO `django_admin_log` VALUES ('18', '2018-05-31 09:47:54.987300', '6', '翠花', '1', '[{\"added\": {}}]', '19', '1');
INSERT INTO `django_admin_log` VALUES ('19', '2018-05-31 09:48:42.314300', '7', '铁锤', '1', '[{\"added\": {}}]', '19', '1');
INSERT INTO `django_admin_log` VALUES ('20', '2018-05-31 09:48:52.340300', '1', 'python基础班', '1', '[{\"added\": {}}]', '14', '1');
INSERT INTO `django_admin_log` VALUES ('21', '2018-05-31 09:51:00.424300', '2', 'WEB框架', '1', '[{\"added\": {}}]', '14', '1');
INSERT INTO `django_admin_log` VALUES ('22', '2018-05-31 09:52:44.535300', '3', 'MySQL删库到跑路', '1', '[{\"added\": {}}]', '14', '1');
INSERT INTO `django_admin_log` VALUES ('23', '2018-05-31 09:54:03.889300', '4', 'linux基础', '1', '[{\"added\": {}}]', '14', '1');
INSERT INTO `django_admin_log` VALUES ('24', '2018-05-31 09:55:38.375300', '1', 'python基础班:5000', '1', '[{\"added\": {}}]', '18', '1');
INSERT INTO `django_admin_log` VALUES ('25', '2018-05-31 09:55:46.133300', '2', 'WEB框架:6000', '1', '[{\"added\": {}}]', '18', '1');
INSERT INTO `django_admin_log` VALUES ('26', '2018-05-31 09:55:54.210300', '3', 'MySQL删库到跑路:7000', '1', '[{\"added\": {}}]', '18', '1');
INSERT INTO `django_admin_log` VALUES ('27', '2018-05-31 09:56:06.604300', '4', 'linux基础:5000', '1', '[{\"added\": {}}]', '18', '1');
INSERT INTO `django_admin_log` VALUES ('28', '2018-05-31 10:56:17.845000', '1', 'Course object', '1', '[{\"added\": {}}]', '7', '1');
INSERT INTO `django_admin_log` VALUES ('29', '2018-05-31 10:57:50.322000', '2', 'Course object', '1', '[{\"added\": {}}]', '7', '1');
INSERT INTO `django_admin_log` VALUES ('30', '2018-05-31 11:03:07.153000', '3', '第3章·Python 文件操作、函数、装饰器', '1', '[{\"added\": {}}]', '7', '1');
INSERT INTO `django_admin_log` VALUES ('31', '2018-05-31 11:03:43.525000', '2', '第1章·Python 介绍、基础语法、流程控制', '2', '[{\"changed\": {\"fields\": [\"name\"]}}]', '7', '1');
INSERT INTO `django_admin_log` VALUES ('32', '2018-05-31 11:04:03.677000', '1', '第2章·Python 数据类型、字符编码学习', '2', '[{\"changed\": {\"fields\": [\"name\"]}}]', '7', '1');
INSERT INTO `django_admin_log` VALUES ('33', '2018-05-31 11:07:39.561000', '1', '第1章·Python 介绍、基础语法、流程控制:(第1章)课程介绍（一） 免费试学', '1', '[{\"added\": {}}]', '9', '1');
INSERT INTO `django_admin_log` VALUES ('34', '2018-05-31 11:15:43.890000', '1', '第1章·Python 介绍、基础语法、流程控制:(第2章)课程介绍（二）-Python与其他语言的区别', '2', '[{\"changed\": {\"fields\": [\"chapter\", \"name\"]}}]', '9', '1');
INSERT INTO `django_admin_log` VALUES ('35', '2018-05-31 11:16:30.846000', '2', '第1章·Python 介绍、基础语法、流程控制:(第3章)课程介绍（三）-Python生态圈', '1', '[{\"added\": {}}]', '9', '1');
INSERT INTO `django_admin_log` VALUES ('36', '2018-05-31 11:17:09.953000', '3', '第1章·Python 介绍、基础语法、流程控制:(第4章)课程介绍（四）', '1', '[{\"added\": {}}]', '9', '1');
INSERT INTO `django_admin_log` VALUES ('37', '2018-05-31 11:25:31.253000', '3', '第3章·Python 文件操作、函数、装饰器', '3', '', '7', '1');
INSERT INTO `django_admin_log` VALUES ('38', '2018-05-31 11:25:31.343500', '2', '第1章·Python 介绍、基础语法、流程控制', '3', '', '7', '1');
INSERT INTO `django_admin_log` VALUES ('39', '2018-05-31 11:25:31.376000', '1', '第2章·Python 数据类型、字符编码学习', '3', '', '7', '1');
INSERT INTO `django_admin_log` VALUES ('40', '2018-05-31 11:28:59.660500', '4', 'Python开发21天入门必备', '1', '[{\"added\": {}}]', '7', '1');
INSERT INTO `django_admin_log` VALUES ('41', '2018-05-31 11:29:57.411000', '5', 'WEB开发入门', '1', '[{\"added\": {}}]', '7', '1');
INSERT INTO `django_admin_log` VALUES ('42', '2018-05-31 11:30:48.614500', '6', '计算机硬件与操作系统原理入门', '1', '[{\"added\": {}}]', '7', '1');
INSERT INTO `django_admin_log` VALUES ('43', '2018-05-31 11:31:25.124000', '7', 'Linux系统基础5周入门精讲', '1', '[{\"added\": {}}]', '7', '1');
INSERT INTO `django_admin_log` VALUES ('44', '2018-05-31 11:33:08.109500', '5', '算法入门', '1', '[{\"added\": {}}]', '14', '1');
INSERT INTO `django_admin_log` VALUES ('45', '2018-05-31 11:33:42.990500', '8', '算法入门', '1', '[{\"added\": {}}]', '7', '1');
INSERT INTO `django_admin_log` VALUES ('46', '2018-05-31 11:34:19.865000', '6', '金融量化自动化分析&交易入门', '1', '[{\"added\": {}}]', '14', '1');
INSERT INTO `django_admin_log` VALUES ('47', '2018-05-31 11:34:41.492500', '9', '金融量化自动化分析&交易入门', '1', '[{\"added\": {}}]', '7', '1');
INSERT INTO `django_admin_log` VALUES ('48', '2018-05-31 11:35:22.742000', '10', 'Python数据分析与机器学习实战', '1', '[{\"added\": {}}]', '7', '1');
INSERT INTO `django_admin_log` VALUES ('49', '2018-05-31 11:38:53.374000', '1', 'Python开发21天入门必备', '1', '[{\"added\": {}}]', '10', '1');
INSERT INTO `django_admin_log` VALUES ('50', '2018-05-31 11:40:26.917000', '2', 'WEB开发入门', '1', '[{\"added\": {}}]', '10', '1');
INSERT INTO `django_admin_log` VALUES ('51', '2018-05-31 11:48:04.458000', '1', 'Python开发21天入门必备', '1', '[{\"added\": {}}]', '11', '1');
INSERT INTO `django_admin_log` VALUES ('52', '2018-05-31 11:48:26.469500', '2', 'WEB开发入门', '1', '[{\"added\": {}}]', '11', '1');
INSERT INTO `django_admin_log` VALUES ('53', '2018-05-31 11:50:14.437500', '4', 'Python开发21天入门必备:(第1章)第1章·Python 介绍、基础语法、流程控制', '1', '[{\"added\": {}}]', '9', '1');
INSERT INTO `django_admin_log` VALUES ('54', '2018-05-31 12:02:27.872500', '5', 'Python开发21天入门必备:(第2章)第2章·Python 数据类型、字符编码学习', '1', '[{\"added\": {}}]', '9', '1');
INSERT INTO `django_admin_log` VALUES ('55', '2018-05-31 12:02:50.918000', '6', 'Python开发21天入门必备:(第3章)第3章·Python 文件操作、函数、装饰器', '1', '[{\"added\": {}}]', '9', '1');
INSERT INTO `django_admin_log` VALUES ('56', '2018-05-31 12:03:10.496000', '7', 'Python开发21天入门必备:(第4章)第4章·Python 学用模块、开发规范学习', '1', '[{\"added\": {}}]', '9', '1');
INSERT INTO `django_admin_log` VALUES ('57', '2018-05-31 12:10:14.433500', '3', 'Linux系统基础5周入门精讲', '1', '[{\"added\": {}}]', '10', '1');
INSERT INTO `django_admin_log` VALUES ('58', '2018-05-31 12:11:08.587000', '8', 'Linux系统基础5周入门精讲:(第1章)第1章·Linux硬件基础', '1', '[{\"added\": {}}]', '9', '1');
INSERT INTO `django_admin_log` VALUES ('59', '2018-05-31 12:11:21.890500', '9', 'Linux系统基础5周入门精讲:(第2章)第2章·Linux发展过程', '1', '[{\"added\": {}}]', '9', '1');
INSERT INTO `django_admin_log` VALUES ('60', '2018-05-31 12:11:33.104000', '10', 'Linux系统基础5周入门精讲:(第3章)第3章·创建虚拟机和系统安装', '1', '[{\"added\": {}}]', '9', '1');
INSERT INTO `django_admin_log` VALUES ('61', '2018-05-31 12:11:57.876500', '11', 'Linux系统基础5周入门精讲:(第4章)第4章·第一关一大波命令及特殊字符知识考试题讲解', '1', '[{\"added\": {}}]', '9', '1');
INSERT INTO `django_admin_log` VALUES ('62', '2018-05-31 14:38:32.826400', '3', 'Linux系统基础5周入门精讲', '1', '[{\"added\": {}}]', '11', '1');
INSERT INTO `django_admin_log` VALUES ('63', '2018-05-31 14:38:45.057400', '3', 'Linux系统基础5周入门精讲', '2', '[{\"changed\": {\"fields\": [\"order\"]}}]', '11', '1');
INSERT INTO `django_admin_log` VALUES ('64', '2018-05-31 15:05:11.904400', '1', 'Python开发21天入门必备(3天)100.0', '1', '[{\"added\": {}}]', '17', '1');
INSERT INTO `django_admin_log` VALUES ('65', '2018-05-31 15:05:44.974400', '2', 'Python开发21天入门必备(1个月)400.0', '1', '[{\"added\": {}}]', '17', '1');
INSERT INTO `django_admin_log` VALUES ('66', '2018-06-01 11:03:58.373900', '1', 'Python开发21天入门必备-Q：1.学完此课程后能达到什么水平？', '1', '[{\"added\": {}}]', '16', '1');
INSERT INTO `django_admin_log` VALUES ('67', '2018-06-01 11:04:46.669900', '2', 'Python开发21天入门必备-Q：2.学习过程中碰到疑问怎么办？', '1', '[{\"added\": {}}]', '16', '1');
INSERT INTO `django_admin_log` VALUES ('68', '2018-06-01 11:05:57.343900', '3', 'Linux系统基础5周入门精讲-Q：我是零基础，能学会吗？', '1', '[{\"added\": {}}]', '16', '1');
INSERT INTO `django_admin_log` VALUES ('69', '2018-06-01 11:06:38.222900', '4', 'Linux系统基础5周入门精讲-Q：需要学习多长时间？', '1', '[{\"added\": {}}]', '16', '1');
INSERT INTO `django_admin_log` VALUES ('70', '2018-06-01 11:40:28.991900', '1', 'tom', '1', '[{\"added\": {}}]', '20', '1');
INSERT INTO `django_admin_log` VALUES ('71', '2018-06-01 11:40:41.158900', '2', 'kitty', '1', '[{\"added\": {}}]', '20', '1');
INSERT INTO `django_admin_log` VALUES ('72', '2018-06-01 11:57:37.721900', '1', '大数据文摘作品', '1', '[{\"added\": {}}]', '22', '1');
INSERT INTO `django_admin_log` VALUES ('73', '2018-06-01 11:57:57.288900', '2', '文|财经无忌', '1', '[{\"added\": {}}]', '22', '1');
INSERT INTO `django_admin_log` VALUES ('74', '2018-06-01 11:58:20.980900', '3', '微信公众号', '1', '[{\"added\": {}}]', '22', '1');
INSERT INTO `django_admin_log` VALUES ('75', '2018-06-01 12:02:19.454900', '1', '大数据文摘作品-无人驾驶引发车祸，背锅的到底是人还是车？', '1', '[{\"added\": {}}]', '21', '1');
INSERT INTO `django_admin_log` VALUES ('76', '2018-06-01 12:04:00.382900', '2', '文|财经无忌-IT“民科”罗永浩', '1', '[{\"added\": {}}]', '21', '1');
INSERT INTO `django_admin_log` VALUES ('77', '2018-06-01 12:05:42.338900', '3', '微信公众号-程序员身上的异味，你会直接告诉他吗？', '1', '[{\"added\": {}}]', '21', '1');
INSERT INTO `django_admin_log` VALUES ('78', '2018-06-01 12:06:09.679900', '1', '大数据文摘作品-无人驾驶引发车祸，背锅的到底是人还是车？', '2', '[{\"changed\": {\"fields\": [\"content\"]}}]', '21', '1');
INSERT INTO `django_admin_log` VALUES ('79', '2018-06-01 12:06:30.162900', '2', '文|财经无忌-IT“民科”罗永浩', '2', '[{\"changed\": {\"fields\": [\"content\"]}}]', '21', '1');
INSERT INTO `django_admin_log` VALUES ('80', '2018-06-01 12:07:14.192900', '1', 'Collection object', '1', '[{\"added\": {}}]', '23', '1');
INSERT INTO `django_admin_log` VALUES ('81', '2018-06-01 12:07:23.310900', '2', 'Collection object', '1', '[{\"added\": {}}]', '23', '1');
INSERT INTO `django_admin_log` VALUES ('82', '2018-06-01 12:07:31.691900', '3', 'Collection object', '1', '[{\"added\": {}}]', '23', '1');
INSERT INTO `django_admin_log` VALUES ('83', '2018-06-01 12:07:47.632900', '4', 'Collection object', '1', '[{\"added\": {}}]', '23', '1');
INSERT INTO `django_admin_log` VALUES ('84', '2018-06-02 08:13:20.196200', '1', '无人车，无人车，一楼', '1', '[{\"added\": {}}]', '24', '1');
INSERT INTO `django_admin_log` VALUES ('85', '2018-06-02 08:13:43.087700', '2', '无人车，无人车，回复一楼', '1', '[{\"added\": {}}]', '24', '1');
INSERT INTO `django_admin_log` VALUES ('86', '2018-06-02 08:31:28.691700', '3', 'tom：---回复内容：文|财经无忌-IT“民科”罗永浩', '1', '[{\"added\": {}}]', '24', '1');
INSERT INTO `django_admin_log` VALUES ('87', '2018-06-02 08:31:50.460700', '4', 'kitty：---回复内容：文|财经无忌-IT“民科”罗永浩', '1', '[{\"added\": {}}]', '24', '1');
INSERT INTO `django_admin_log` VALUES ('88', '2018-06-02 08:32:15.904200', '5', 'tom：---回复内容：微信公众号-程序员身上的异味，你会直接告诉他吗？', '1', '[{\"added\": {}}]', '24', '1');
INSERT INTO `django_admin_log` VALUES ('89', '2018-06-02 08:32:35.159200', '6', 'kitty：---回复内容：None', '1', '[{\"added\": {}}]', '24', '1');
INSERT INTO `django_admin_log` VALUES ('90', '2018-06-02 08:32:50.411700', '6', 'kitty：---回复内容：微信公众号-程序员身上的异味，你会直接告诉他吗？', '2', '[{\"changed\": {\"fields\": [\"content_type\"]}}]', '24', '1');
INSERT INTO `django_admin_log` VALUES ('91', '2018-06-02 08:32:59.699700', '5', 'tom：---回复内容：微信公众号-程序员身上的异味，你会直接告诉他吗？', '2', '[{\"changed\": {\"fields\": [\"content\"]}}]', '24', '1');
INSERT INTO `django_admin_log` VALUES ('92', '2018-06-02 09:52:14.421200', '3', 'xiaoming', '1', '[{\"added\": {}}]', '20', '1');
INSERT INTO `django_admin_log` VALUES ('93', '2018-06-02 09:56:05.540700', '7', 'xiaoming：---回复内容：大数据文摘作品-无人驾驶引发车祸，背锅的到底是人还是车？', '1', '[{\"added\": {}}]', '24', '1');
INSERT INTO `django_admin_log` VALUES ('94', '2018-06-02 10:29:30.058200', '5', 'xiaoming --- 程序员身上的异味，你会直接告诉他吗？', '1', '[{\"added\": {}}]', '23', '1');
INSERT INTO `django_admin_log` VALUES ('95', '2018-06-02 10:29:35.223700', '6', 'xiaoming --- IT“民科”罗永浩', '1', '[{\"added\": {}}]', '23', '1');
INSERT INTO `django_admin_log` VALUES ('96', '2018-06-02 10:29:40.954700', '7', 'tom --- 程序员身上的异味，你会直接告诉他吗？', '1', '[{\"added\": {}}]', '23', '1');
INSERT INTO `django_admin_log` VALUES ('97', '2018-06-03 14:25:34.338200', '7', '用户ID：1 --- 文章ID：3', '3', '', '23', '1');

-- ----------------------------
-- Table structure for django_content_type
-- ----------------------------
DROP TABLE IF EXISTS `django_content_type`;
CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of django_content_type
-- ----------------------------
INSERT INTO `django_content_type` VALUES ('1', 'admin', 'logentry');
INSERT INTO `django_content_type` VALUES ('20', 'app01', 'account');
INSERT INTO `django_content_type` VALUES ('21', 'app01', 'article');
INSERT INTO `django_content_type` VALUES ('22', 'app01', 'articlesource');
INSERT INTO `django_content_type` VALUES ('23', 'app01', 'collection');
INSERT INTO `django_content_type` VALUES ('24', 'app01', 'comment');
INSERT INTO `django_content_type` VALUES ('7', 'app01', 'course');
INSERT INTO `django_content_type` VALUES ('8', 'app01', 'coursecategory');
INSERT INTO `django_content_type` VALUES ('9', 'app01', 'coursechapter');
INSERT INTO `django_content_type` VALUES ('10', 'app01', 'coursedetail');
INSERT INTO `django_content_type` VALUES ('11', 'app01', 'courseoutline');
INSERT INTO `django_content_type` VALUES ('12', 'app01', 'coursesection');
INSERT INTO `django_content_type` VALUES ('13', 'app01', 'coursesubcategory');
INSERT INTO `django_content_type` VALUES ('14', 'app01', 'degreecourse');
INSERT INTO `django_content_type` VALUES ('15', 'app01', 'homework');
INSERT INTO `django_content_type` VALUES ('16', 'app01', 'oftenaskedquestion');
INSERT INTO `django_content_type` VALUES ('17', 'app01', 'pricepolicy');
INSERT INTO `django_content_type` VALUES ('18', 'app01', 'scholarship');
INSERT INTO `django_content_type` VALUES ('19', 'app01', 'teacher');
INSERT INTO `django_content_type` VALUES ('25', 'app01', 'userauthtoken');
INSERT INTO `django_content_type` VALUES ('3', 'auth', 'group');
INSERT INTO `django_content_type` VALUES ('2', 'auth', 'permission');
INSERT INTO `django_content_type` VALUES ('4', 'auth', 'user');
INSERT INTO `django_content_type` VALUES ('5', 'contenttypes', 'contenttype');
INSERT INTO `django_content_type` VALUES ('6', 'sessions', 'session');

-- ----------------------------
-- Table structure for django_migrations
-- ----------------------------
DROP TABLE IF EXISTS `django_migrations`;
CREATE TABLE `django_migrations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of django_migrations
-- ----------------------------
INSERT INTO `django_migrations` VALUES ('1', 'contenttypes', '0001_initial', '2018-05-31 07:37:11.557300');
INSERT INTO `django_migrations` VALUES ('2', 'auth', '0001_initial', '2018-05-31 07:37:18.325300');
INSERT INTO `django_migrations` VALUES ('3', 'admin', '0001_initial', '2018-05-31 07:37:19.907300');
INSERT INTO `django_migrations` VALUES ('4', 'admin', '0002_logentry_remove_auto_add', '2018-05-31 07:37:20.046300');
INSERT INTO `django_migrations` VALUES ('5', 'contenttypes', '0002_remove_content_type_name', '2018-05-31 07:37:20.851300');
INSERT INTO `django_migrations` VALUES ('6', 'app01', '0001_initial', '2018-05-31 07:37:36.831300');
INSERT INTO `django_migrations` VALUES ('7', 'auth', '0002_alter_permission_name_max_length', '2018-05-31 07:37:37.339300');
INSERT INTO `django_migrations` VALUES ('8', 'auth', '0003_alter_user_email_max_length', '2018-05-31 07:37:37.835300');
INSERT INTO `django_migrations` VALUES ('9', 'auth', '0004_alter_user_username_opts', '2018-05-31 07:37:37.877300');
INSERT INTO `django_migrations` VALUES ('10', 'auth', '0005_alter_user_last_login_null', '2018-05-31 07:37:38.278300');
INSERT INTO `django_migrations` VALUES ('11', 'auth', '0006_require_contenttypes_0002', '2018-05-31 07:37:38.315300');
INSERT INTO `django_migrations` VALUES ('12', 'auth', '0007_alter_validators_add_error_messages', '2018-05-31 07:37:38.355300');
INSERT INTO `django_migrations` VALUES ('13', 'auth', '0008_alter_user_username_max_length', '2018-05-31 07:37:38.862300');
INSERT INTO `django_migrations` VALUES ('14', 'sessions', '0001_initial', '2018-05-31 07:37:39.468300');
INSERT INTO `django_migrations` VALUES ('15', 'app01', '0002_auto_20180601_1615', '2018-06-01 08:15:51.394400');
INSERT INTO `django_migrations` VALUES ('16', 'app01', '0003_auto_20180602_1645', '2018-06-02 08:45:54.829700');

-- ----------------------------
-- Table structure for django_session
-- ----------------------------
DROP TABLE IF EXISTS `django_session`;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of django_session
-- ----------------------------
INSERT INTO `django_session` VALUES ('jkngbjn55ss3conuesnm37cxhnvifput', 'ZmQ5MDJjMTUwMDAzM2Q0ZmZjNWZlOGRmNWU2NTUzYzQzZTM4YzMxNzp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJlZWFlYjdlMTA3Y2YwMTQ1MzA2Y2MzYTQ4ODJiMWMzYThhZDJiNzYzIn0=', '2018-06-14 08:42:57.266300');
