#设置客户端连接服务器端编码
SET NAMES UTF8;
#丢弃数据库，如果存在
DROP DATABASE IF EXISTS prog;
#创建数据库，设置存储的编码
CREATE DATABASE prog CHARSET=UTF8;
#进入创建的数据库
use prog;

-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- 主机： w.rdc.sae.sina.com.cn:3306
-- 生成日期： 2020-01-02 16:52:38
-- 服务器版本： 5.7.24-27-log
-- PHP 版本： 7.0.33-0ubuntu0.16.04.5

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- 数据库： `app_progmydemo`
--
CREATE DATABASE IF NOT EXISTS `app_progmydemo` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `app_progmydemo`;

-- --------------------------------------------------------

--
-- 表的结构 `pc_detail`
--

CREATE TABLE `pc_detail` (
  `d_id` int(11) NOT NULL,
  `d_title` varchar(32) NOT NULL,
  `d_hvtitle` varchar(128) DEFAULT NULL,
  `d_teacher` varchar(20) NOT NULL,
  `grade` varchar(2) NOT NULL,
  `d_img` varchar(128) NOT NULL,
  `d_json` varchar(128) NOT NULL,
  `d_click` int(11) NOT NULL DEFAULT '0',
  `status` varchar(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `pc_detail`
--

INSERT INTO `pc_detail` (`d_id`, `d_title`, `d_hvtitle`, `d_teacher`, `grade`, `d_img`, `d_json`, `d_click`, `status`) VALUES
(1, 'vue.js', '优秀的前端工程师都要掌握一门后端语言，从vue到node，前后端通吃，提高前端工程师的竞争力', 'laowang', '高级', 'img/list/vuejs.png', '/json/vue.json', 386, '1'),
(2, 'Vue全家桶实战 从零独立开发企业级小米电商系统', '全栈项目涉及方方面面，全栈入门之后，如何整合各种热门技术，应用到商业项目中，便成为接下来你要去攻克的方向', 'tom', '初级', 'img/list/vuemi.png', '/json/vue.json', 471, '1'),
(3, '零基础学vue', '一站式掌握小程序生态，打造站内零基础精通小程序的最佳路径', 'dongdong', '高级', 'img/list/vue0.png', '/json/vue.json', 19, '1'),
(4, 'vue从入门到放弃', '本路线从Node.js基础到热门框架应用，从理解到实战一步到位', 'taotao', '高级', 'img/list/vuerumen.png', '/json/vue.json', 370, '1'),
(5, 'vue深入浅出', '拒绝枯燥乏味的知识，通俗易懂的帮你理清思绪，透彻讲解原理，串联每个知识点', 'ranran', '中级', 'img/list/vuechu.png', '/json/vue.json', 84, '1'),
(6, 'vue核心', '深度学习 远不止就业 秒思维JS++，一站式劣实[VueJS]技术', 'aliang', '中级', 'img/list/vuehe.png', '/json/vue.json', 118, '1'),
(7, 'vue.js源码解析', '路线专为想学Vue却无从下手的人群设计，以实际项目为例，逐层深入，学透Vue。', '爱德华', '中级', 'img/list/vueyuan.png', '/json/vue.json', 84, '1'),
(8, '前端页面冲刺 京东金融Vue组件化实战', '优秀的前端工程师都要掌握一门后端语言，从vue到node，前后端通吃，提高前端工程师的竞争力', '提姆', '初级', 'img/list/vuedong.png', '/json/vue.json', 182, '1'),
(9, 'Vue2.5开发去哪儿网App 从零基础入门到实战项目', '路线从零起步玩转React.js开发，从基础劣实到企业级项目实战，直到源码全覆盖。', 'exo', '初级', 'img/list/vuequna.png', '/json/vue.json', 224, '1'),
(10, 'Vue全家桶+SSR+Koa2全栈开发美团网', 'SSR（服务器渲染）是全栈开发的一个高级知识点，也是一个难点。让你从0搭建工作流，培养你的架构思维。', 'tbody', '初级', 'img/list/vuemei.png', '/json/vue.json', 248, '1'),
(11, 'Vue与React高级框架开发', '从React.js基础入手，学习全栈技能，上手全栈项目，路线清晰，不走弯路。', 'dongdong', '高级', 'img/list/vuerecat.png', '/json/vue.json', 108, '1'),
(12, 'vue-cli全集', '数组对象的解构赋值，字符串的扩展，set与map数据结构，说透es6，学会let', 'ahua', '初级', 'img/list/vue-cli.png', '/json/vue.json', 146, '1'),
(13, 'vue2.5入门', '验证码点击倒计时，实现定位显示，封装Header组件等，一套专门为Vue基础的同学精心准备的移动端实战教程', 'linlin', '初级', 'img/list/vuerumen.png', '/json/vue.json', 52, '1'),
(14, 'axios在vue中的使用', 'JS高级进阶专题+ES6专题+Node.js专题等，九大名师倾囊相助', '涛哥', '高级', 'img/list/vueaxios.png', '/json/vue.json', 509, '1'),
(15, 'vuex基础入门', '讲解微信商城小程序界面设计和程序设计所涉及的所有知识点', 'dongdong', '初级', 'img/list/vuexru.png', '/json/vue.json', 300, '1'),
(16, 'Vue Element+Node.js开发企业通用管理后台系统', '使用webpack快速构建SPA应用，快速构建多页面应用，手把手带你从头实现webpack', 'dongdong', '高级', 'img/list/vuehou.png', '/json/vue.json', 606, '1'),
(17, '初识HTML+CSS', '优秀的前端工程师都要掌握一门后端语言，从vue到node，前后端通吃，提高前端工程师的竞争力', 'junjun', '中级', 'img/list/html+css.png', '/json/html.json', 754, '1'),
(18, '从 psd 到 html', '本课程从最基本的概念开始讲起，步步深入，带领大家学习HTML、CSS样式基础知识，了解各种常用标签的意义以及基本用法', 'ranran', '高级', 'img/list/html.png', '/json/html.json', 102, '1'),
(19, '重拾CSS的乐趣', '爱前端的很多人也是喜欢那种所见即所得带来的成就感，这是一门很基础的活，不光是埋头写代码。本课用了一个很简单的 psd 案例来介绍切图的基本流程和遇到问题处理，加深对标签及css 规范的应用', '峰峰', '初级', 'img/list/csschong.png', '/json/css.json', 98, '1'),
(20, 'CSS Sprite雪碧图应用', '本课程分析了CSS Sprite雪碧图的实现原理，详细讲解制作方法，实现完整效果，让你快速掌握CSS', 'ranran', '初级', 'img/list/cssxue.png', '/json/css.json', 88, '1'),
(21, 'CSS深入理解之z-index', '同时还将介绍CSS中非常基础且重要的元素层叠表现的概念、元素的层叠顺序，以及z-index、还有其他CSS', 'miss', '初级', 'img/list/cssz-index.png', '/json/css.json', 443, '1'),
(22, 'CSS动画实用技巧', 'CSS想必大家都用过，那么你可知道使用CSS还可以实现一些有意思的动画效果？', '亮仔', '高级', 'img/list/cssshi.png', '/json/css.json', 1, '1'),
(23, 'CSS深入理解之float浮动', '本课程使用css设计领域最经典的例子禅意花园来学习css实战，36个设计让您彻底了解css的方方面面。', '社会王', '中级', 'img/list/cssfloat.png', '/json/css.json', 66, '1'),
(24, 'CSS深入理解之vertical-align', '本课程将带领大家深入的理解CSS中的属性vertical-align所支持的各类属性值们，会简单介绍下', 'ayang', '高级', 'img/list/cssalign.png', '/json/css.json', 251, '1'),
(25, 'css定位 position', '本课程将深入讲解CSS中的border属性，深入介绍border-color之间的关系，以及border', 'ranran', '高级', 'img/list/cssposition.png', '/json/css.json', 427, '1'),
(26, 'CSS深入理解之overflow', 'overflow看上去其貌不扬，其中蕴含的知识点还是很多的。有很多鲜为人知的特性表现，本课程就将带你走入overflow的世界，为你打开另外一扇学习之窗。', 'zhongzi', '高级', 'img/list/cssover.png', '/json/css.json', 50, '1');

-- --------------------------------------------------------

--
-- 表的结构 `pc_index_carousel`
--

CREATE TABLE `pc_index_carousel` (
  `co_id` int(11) NOT NULL,
  `title` varchar(128) NOT NULL,
  `img` varchar(128) NOT NULL,
  `d_id` int(11) NOT NULL,
  `c_time` varchar(40) NOT NULL,
  `status` varchar(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `pc_index_carousel`
--

INSERT INTO `pc_index_carousel` (`co_id`, `title`, `img`, `d_id`, `c_time`, `status`) VALUES
(1, 'vue核心', 'img/carousel/vuehe.png', 6, '', '1'),
(2, 'Vue2.5开发去哪儿网App 从零基础入门到实践项目', 'img/carousel/quna.png', 9, '', '1'),
(3, 'Vue Element+Node.js开发企业通用管理后台系统', 'img/carousel/houtai.png', 16, '', '1'),
(4, '前端面试项目冲刺 京东金融Vue组件化实战', 'img/carousel/jingdong.png', 8, '', '1'),
(5, 'Vue全家桶+SSR+Koa2全栈开发美团网', 'img/carousel/mei.png', 10, '', '1'),
(6, 'Vue全家桶实战 从零独立开发企业级小米电商系统', 'img/carousel/mi.png', 2, '', '0');

-- --------------------------------------------------------

--
-- 表的结构 `pc_index_text`
--

CREATE TABLE `pc_index_text` (
  `c_id` int(11) NOT NULL,
  `c_title` varchar(128) NOT NULL,
  `grade` varchar(2) NOT NULL,
  `img` varchar(128) NOT NULL,
  `people` varchar(5) NOT NULL,
  `price` varchar(5) NOT NULL,
  `d_id` int(11) NOT NULL,
  `status` varchar(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `pc_index_text`
--

INSERT INTO `pc_index_text` (`c_id`, `c_title`, `grade`, `img`, `people`, `price`, `d_id`, `status`) VALUES
(1, 'Vue全家桶实战 从零独立开发企业级小米电商系统  ', '初级', 'img/list/vuemi.png', '150', '199', 2, '1'),
(2, 'vue.js', '高级', 'img/list/vuejs.png', '320', '200', 1, '1'),
(3, 'vue深入浅出', '中级', 'img/list/vuechu.png', '103', '210', 5, '1'),
(4, '前端页面冲刺 京东金融Vue组件化实战', '初级', 'img/list/vuedong.png', '310', '399', 8, '1'),
(5, '初识HTML+CSS', '中级', 'img/list/html+css.png', '108', '299', 17, '1'),
(6, 'vuex基础入门', '初级', 'img/list/vuexru.png', '206', '180', 15, '1'),
(7, 'CSS Sprite雪碧图应用', '初级', 'img/list/cssxue.png', '80', '119', 20, '1'),
(8, 'CSS动画实用技巧', '高级', 'img/list/cssshi.png', '69', '199', 22, '1'),
(9, '从 psd 到 html', '高级', 'img/list/html.png', '120', '200', 18, '1'),
(10, 'CSS深入理解之vertical-align', '高级', 'img/list/cssalign.png', '207', '299', 24, '1'),
(11, 'vue-cli全集', '初级', 'img/list/vue-cli.png', '253', '399', 12, '1'),
(12, 'vue2.5入门', '初级', 'img/list/vuerumen.png', '89', '260', 13, '1'),
(13, 'axios在vue中的使用', '高级', 'img/list/vueaxios.png', '95', '299', 14, '1'),
(14, 'Vue2.5开发去哪儿网App 从零基础入门到实战项目', '初级', 'img/list/vuequna.png', '165', '389', 9, '1'),
(15, 'css定位 position', '高级', 'img/list/cssposition.png', '231', '288', 25, '1');

-- --------------------------------------------------------

--
-- 表的结构 `pc_quan`
--

CREATE TABLE `pc_quan` (
  `q_id` int(11) NOT NULL,
  `uname` varchar(32) DEFAULT NULL,
  `phone` char(11) NOT NULL,
  `img` varchar(128) DEFAULT NULL,
  `q_title` varchar(128) NOT NULL,
  `q_text` varchar(368) NOT NULL,
  `q_zan` varchar(9999) DEFAULT '0',
  `q_time` varchar(32) NOT NULL,
  `q_lan` int(11) NOT NULL DEFAULT '0',
  `q_ping` int(11) NOT NULL DEFAULT '0',
  `uid` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `pc_quan`
--

INSERT INTO `pc_quan` (`q_id`, `uname`, `phone`, `img`, `q_title`, `q_text`, `q_zan`, `q_time`, `q_lan`, `q_ping`, `uid`) VALUES
(1, 'huihui', '17638140394', 'img/head/pang.png', 'vue.js真香', '这是一门前端全栈课程，课程中采用了许多新的技术，结合包括Vue2.5、Koa2、MongoDB、Redis等多种前后端技术完成了美团网的开发。课程从新技术的基础讲解入手，通过细致的项目开发过程，带你开发一个美团网PC网页版，同学们通过这门课程的学习可以掌握更全面的项目架构，迅速提升，达到高级工程师的水平。', '0,4,5', '1577245043897', 669, 1, 5),
(2, 'taotao', '15039071094', 'img/head/tao.png', 'HTML也很香', '简介：本课程从最基本的概念开始讲起，步步深入，带领大家学习HTML、CSS样式基础知识，了解各种常用标签的意义以及基本用法，后半部分教程主要讲解CSS样式代码添加，为后面的案例课程打下基础', '0,4,2,5', '1577246863720', 4, 0, 2),
(5, 'huihui', '17638140394', 'img/head/pang.png', 'wo槽', 'vue真是太香了', '0,2,5,4', '1577256446193', 1, 0, 0),
(6, 'huihui', '17638140394', 'img/head/pang.png', 'css才是最棒的', 'css值得你的拥有', '0,4,1,5,3,2', '1577256499341', 3, 0, 5),
(7, NULL, '13523873162', NULL, 'fdsafdfaf', 'adfdfadfdgagafdfa', '0,4,5,2,10', '1577256694219', 7, 0, 7),
(8, NULL, '13523873162', NULL, 'wo嘞个去', '哈哈哈哈哈哈哈哈哈哈哈', '0,4,3,5,2,10', '1577258440458', 0, 0, 7),
(9, 'huihui', '17638140394', 'img/head/pang.png', 'vue.js真香', '这是一门前端全栈课程，课程中采用了许多新的技术，结合包括Vue2.5、Koa2、MongoDB、Redis等多种前后端技术完成了美团网的开发。课程从新技术的基础讲解入手，通过细致的项目开发过程，带你开发一个美团网PC网页版，同学们通过这门课程的学习可以掌握更全面的项目架构，迅速提升，达到高级工程师的水平。', '0,4,3,1,10,5', '1577245043897', 666, 0, 5),
(11, 'huihui', '17638140394', 'img/head/pang.png', 'huihui', 'shddklafd', '0,4,1,3,5,10', '1577266226568', 1, 0, 5),
(12, 'yongyong', '16639231421', 'img/head/yong.png', 'fdfhdfa', 'fasdfjdlf;a\'fdfjd;fdfd\ndshfjsalfhd\ndafhld', '0,5,2,1,10', '1577320352298', 0, 0, 3),
(13, 'huihui', '17638140394', 'img/head/pang.png', 'sfdkha', 'fhakfladfhdlf', '0,5,2,1,10', '1577320775054', 2, 0, 5),
(14, 'taotao', '15039071094', 'img/head/tao.png', '123', '12333333', '0,5,2,1,9,10', '1577359658901', 0, 0, 2),
(15, 'fangfang', '15639248146', 'img/head/fang.png', '学习前端哪家强，郑州科创找锡阳', '桌前一电脑，白了少年头，\n旁边一壶酒 ，撒手键盘放开走！！！', '0,5,2,1,10,14', '1577359882255', 5, 2, 1),
(16, NULL, '18739132287', NULL, '涛涛', '涛涛', '0,9,2,1,10,5', '1577363885648', 8, 0, 9),
(17, 'huihui', '17638140394', 'img/head/pang.png', '我有孤独和烈酒', '喝酒，谈心聊代码', '0,1,10,4,11,5', '1577375118826', 92, 6, 5),
(18, 'huihui', '17638140394', 'img/head/pang.png', 'ewrfss', 'fdfas', '0,5', '1577515032048', 0, 0, 5),
(19, 'huihui', '17638140394', 'img/head/pang.png', 'ceshi', '123456765432', '0,5', '1577515127021', 0, 0, 5),
(20, 'huihui1', '18749202391', NULL, '测试', '测试', '0,5', '1577515186504', 0, 0, 11),
(21, 'huihui', '17638140394', 'img/head/pang.png', '你好，世界', 'hellow horld', '0,14,5', '1577515813390', 3, 1, 5);

-- --------------------------------------------------------

--
-- 表的结构 `pc_quan_ping`
--

CREATE TABLE `pc_quan_ping` (
  `p_id` int(11) NOT NULL,
  `p_uname` varchar(32) DEFAULT NULL,
  `p_phone` char(11) NOT NULL,
  `p_img` varchar(128) DEFAULT NULL,
  `p_text` varchar(365) NOT NULL,
  `p_zan` varchar(9999) NOT NULL DEFAULT '0',
  `q_id` int(11) NOT NULL,
  `p_time` varchar(32) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `pc_quan_ping`
--

INSERT INTO `pc_quan_ping` (`p_id`, `p_uname`, `p_phone`, `p_img`, `p_text`, `p_zan`, `q_id`, `p_time`) VALUES
(1, NULL, '18839509421', NULL, '你好啊', '0', 17, '1577447708712'),
(2, 'huihui', '17638140394', 'img/head/pang.png', 'hellow world', '0', 17, '1577448589282'),
(3, 'yangyang', '15037177040', 'img/head/yang.png', '你好世界', '0', 17, '1577450833170'),
(4, NULL, '18749202391', NULL, 'hellow world', '0', 17, '1577512563325'),
(5, '123', '18111111111', NULL, '11111111111', '0', 17, '1577512755564'),
(6, '123', '18111111111', NULL, 'q q q qq q ', '0', 15, '1577512773724'),
(7, '123', '18111111111', NULL, '11111111111', '0', 17, '1577512755564'),
(8, '123', '18111111111', NULL, 'q q q qq q ', '0', 15, '1577512773724'),
(9, 'huihui', '17638140394', 'img/head/pang.png', '是的', '0', 1, '1577600828080'),
(10, NULL, '18134487801', NULL, '二维', '0', 21, '1577754665408');

-- --------------------------------------------------------

--
-- 表的结构 `pc_user`
--

CREATE TABLE `pc_user` (
  `uid` int(11) NOT NULL,
  `uname` varchar(16) DEFAULT NULL,
  `upwd` varchar(16) NOT NULL,
  `sex` varchar(1) DEFAULT NULL,
  `phone` varchar(11) NOT NULL,
  `birthday` varchar(14) DEFAULT NULL,
  `usign` varchar(128) DEFAULT NULL,
  `avatar` varchar(256) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `pc_user`
--

INSERT INTO `pc_user` (`uid`, `uname`, `upwd`, `sex`, `phone`, `birthday`, `usign`, `avatar`) VALUES
(1, 'fangfang', '123456', '0', '15639248146', '1996-10-04', '人非要经历一番不同平时的劫难才能脱胎换骨,成为真正能解决问题的人', 'img/head/fang.png'),
(2, 'taotao', '123456', '1', '15039071094', '1997-05-17', '即使赚得了全世界,却失去了自己,又有什么意义呢?', 'img/head/tao.png'),
(3, 'yongyong', '123456', '1', '16639231421', '1997-08-15', '生活比电影狠多了,从来不给弱者安排大逆转的情节', 'img/head/yong.png'),
(4, 'yangyang', '123456', '0', '15037177040', '1998-04-11', '务须咬牙厉志,蓄其气而长其志,切不可恭然自馁也', 'img/head/yang.png'),
(5, 'huihui', '123456', '1', '17638140394', '1997-2-25', '每一发奋努力的背后,必有加倍的赏赐', 'img/head/pang.png'),
(7, NULL, '123456', NULL, '13523873162', NULL, NULL, NULL),
(8, NULL, '123456', NULL, '15638530630', NULL, NULL, NULL),
(9, NULL, 'woaini123.', NULL, '18739132287', NULL, NULL, NULL),
(10, NULL, '1915714210', NULL, '18839509421', NULL, NULL, NULL),
(11, 'huihui1', '123456', '1', '18749202391', '1967-12-1', '6666', NULL),
(12, NULL, '123456', NULL, '14726660426', NULL, NULL, NULL),
(13, '123', 'abc12346', '1', '18111111111', '1915-2-1', 'ggggggggggggggggggggg', NULL),
(14, NULL, '123456', NULL, '18134487801', NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- 表的结构 `pc_user_collect`
--

CREATE TABLE `pc_user_collect` (
  `c_id` int(11) NOT NULL,
  `c_order` varchar(128) NOT NULL,
  `c_class` varchar(128) NOT NULL,
  `c_video` int(11) NOT NULL,
  `c_add` varchar(128) NOT NULL,
  `c_img` varchar(128) NOT NULL,
  `uid` int(11) NOT NULL,
  `d_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `pc_user_history`
--

CREATE TABLE `pc_user_history` (
  `h_id` int(11) NOT NULL,
  `h_title` varchar(128) NOT NULL,
  `h_oder` varchar(128) NOT NULL,
  `h_class` varchar(128) NOT NULL,
  `h_video` varchar(3) NOT NULL,
  `h_add` varchar(128) NOT NULL,
  `h_img` varchar(128) NOT NULL,
  `h_time` varchar(20) NOT NULL,
  `uid` int(11) NOT NULL,
  `d_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `pc_user_history`
--

INSERT INTO `pc_user_history` (`h_id`, `h_title`, `h_oder`, `h_class`, `h_video`, `h_add`, `h_img`, `h_time`, `uid`, `d_id`) VALUES
(1, 'Vue全家桶实战 从零独立开发企业级小米电商系统', '第2章 Vue基础知识', '2-1 概述&脚手架', '2', 'video.mp4', 'img/list/vuemi.png', '1577418330610', 5, 2),
(2, 'CSS深入理解之vertical-align', '第5章 CSS效果', '5-1 box-shadow', '20', 'videos.mp4', 'img/list/cssalign.png', '1577418289259', 5, 24),
(3, 'Vue Element+Node.js开发企业通用管理后台系统', '第1章 课程导学', '1-1 课程导学', '1', 'videos.mp4', 'img/list/vuehou.png', '1577418272976', 5, 16),
(4, 'vue核心', '第3章 Koa2基础知识', '3-3 Koa中间件', '14', 'video.mp4', 'img/list/vuehe.png', '1577417831590', 5, 6),
(5, 'axios在vue中的使用', '第2章 Vue基础知识', '2-10 Vuex基础用例（2）', '11', 'videos.mp4', 'img/list/vueaxios.png', '1577418294375', 5, 14),
(6, 'Vue2.5开发去哪儿网App 从零基础入门到实战项目', '第2章 Vue基础知识', '2-2 模板语法（1）', '3', 'videos.mp4', 'img/list/vuequna.png', '1577368217939', 1, 9),
(7, 'Vue Element+Node.js开发企业通用管理后台系统', '第2章 Vue基础知识', '2-1 概述&脚手架', '2', 'video.mp4', 'img/list/vuehou.png', '1577103472668', 7, 16),
(8, 'vue核心', '第1章 课程导学', '1-1 课程导学', '1', 'videos.mp4', 'img/list/vuehe.png', '1577104128159', 7, 6),
(9, 'vue深入浅出', '第2章 Vue基础知识', '2-3 模板语法（2）', '4', 'video.mp4', 'img/list/vuechu.png', '1577362717044', 5, 5),
(10, 'vue2.5入门', '第1章 课程导学', '1-1 课程导学', '1', 'videos.mp4', 'img/list/vuerumen.png', '1577418291613', 5, 13),
(11, '前端页面冲刺 京东金融Vue组件化实战', '第1章 课程导学', '1-1 课程导学', '1', 'videos.mp4', 'img/list/vuedong.png', '1577362529260', 5, 8),
(12, 'Vue全家桶+SSR+Koa2全栈开发美团网', '第2章 Vue基础知识', '2-5 事件', '6', 'video.mp4', 'img/list/vuemei.png', '1577418304938', 5, 10),
(13, 'Vue2.5开发去哪儿网App 从零基础入门到实战项目', '第7章 开发美团网首页', '7-3 首页搜索', '28', 'videos.mp4', 'img/list/vuequna.png', '1577418312392', 5, 9),
(14, '初识HTML+CSS', '第1章 Html介绍', '1-1 代码初体验，制作我的第一个网页', '1', 'videos.mp4', 'img/list/html+css.png', '1577178557361', 8, 17),
(15, '初识HTML+CSS', '第5章 与浏览者交互，表单标签', '5-1 使用表单标签,与用户交互', '20', 'video.mp4', 'img/list/html+css.png', '1577754873199', 5, 17),
(16, 'Vue全家桶实战 从零独立开发企业级小米电商系统', '第2章 Vue基础知识', '2-4 样式与遍历', '5', 'videos.mp4', 'img/list/vuemi.png', '1577360302774', 1, 2),
(17, '初识HTML+CSS', '第6章 开始学习CSS，为网页添加样式', '6-1 认识CSS样式', '24', 'video.mp4', 'img/list/html+css.png', '1577444281599', 1, 17),
(18, 'Vue全家桶实战 从零独立开发企业级小米电商系统', '第1章 课程导学', '1-1 课程导学', '1', 'videos.mp4', 'img/list/vuemi.png', '1577411668517', 2, 2),
(19, 'Vue全家桶+SSR+Koa2全栈开发美团网', '第1章 课程导学', '1-1 课程导学', '1', 'videos.mp4', 'img/list/vuemei.png', '1577363905945', 9, 10),
(20, 'vue核心', '第5章 Nuxt.js基础知识', '5-4 Nuxt.js基础（4）', '23', 'video.mp4', 'img/list/vuehe.png', '1577367561019', 1, 6),
(21, 'vue-cli全集', '第1章 课程导学', '1-1 课程导学', '1', 'videos.mp4', 'img/list/vue-cli.png', '1577367577188', 1, 12),
(22, 'Vue全家桶实战 从零独立开发企业级小米电商系统', '第6章 实战准备', '6-1 环境准备与项目安装', '24', 'videos.mp4', 'img/list/vuemi.png', '1577447556081', 10, 2),
(23, '初识HTML+CSS', '第1章 Html介绍', '1-1 代码初体验，制作我的第一个网页', '1', 'videos.mp4', 'img/list/html+css.png', '1577447576758', 10, 17),
(24, 'Vue Element+Node.js开发企业通用管理后台系统', '第2章 Vue基础知识', '2-3 模板语法（2）', '4', 'video.mp4', 'img/list/vuehou.png', '1577512669246', 12, 16),
(25, 'Vue Element+Node.js开发企业通用管理后台系统', '第2章 Vue基础知识', '2-10 Vuex基础用例（2）', '11', 'videos.mp4', 'img/list/vuehou.png', '1577512744820', 11, 16),
(26, 'vue深入浅出', '第3章 Koa2基础知识', '3-1 Koa-generator', '12', 'video.mp4', 'img/list/vuechu.png', '1577540454335', 1, 5);

--
-- 转储表的索引
--

--
-- 表的索引 `pc_detail`
--
ALTER TABLE `pc_detail`
  ADD PRIMARY KEY (`d_id`);

--
-- 表的索引 `pc_index_carousel`
--
ALTER TABLE `pc_index_carousel`
  ADD PRIMARY KEY (`co_id`);

--
-- 表的索引 `pc_index_text`
--
ALTER TABLE `pc_index_text`
  ADD PRIMARY KEY (`c_id`);

--
-- 表的索引 `pc_quan`
--
ALTER TABLE `pc_quan`
  ADD PRIMARY KEY (`q_id`);

--
-- 表的索引 `pc_quan_ping`
--
ALTER TABLE `pc_quan_ping`
  ADD PRIMARY KEY (`p_id`);

--
-- 表的索引 `pc_user`
--
ALTER TABLE `pc_user`
  ADD PRIMARY KEY (`uid`);

--
-- 表的索引 `pc_user_collect`
--
ALTER TABLE `pc_user_collect`
  ADD PRIMARY KEY (`c_id`);

--
-- 表的索引 `pc_user_history`
--
ALTER TABLE `pc_user_history`
  ADD PRIMARY KEY (`h_id`);

--
-- 在导出的表使用AUTO_INCREMENT
--

--
-- 使用表AUTO_INCREMENT `pc_detail`
--
ALTER TABLE `pc_detail`
  MODIFY `d_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- 使用表AUTO_INCREMENT `pc_index_carousel`
--
ALTER TABLE `pc_index_carousel`
  MODIFY `co_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- 使用表AUTO_INCREMENT `pc_index_text`
--
ALTER TABLE `pc_index_text`
  MODIFY `c_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- 使用表AUTO_INCREMENT `pc_quan`
--
ALTER TABLE `pc_quan`
  MODIFY `q_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- 使用表AUTO_INCREMENT `pc_quan_ping`
--
ALTER TABLE `pc_quan_ping`
  MODIFY `p_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- 使用表AUTO_INCREMENT `pc_user`
--
ALTER TABLE `pc_user`
  MODIFY `uid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- 使用表AUTO_INCREMENT `pc_user_collect`
--
ALTER TABLE `pc_user_collect`
  MODIFY `c_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `pc_user_history`
--
ALTER TABLE `pc_user_history`
  MODIFY `h_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
