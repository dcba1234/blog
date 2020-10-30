-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th10 30, 2020 lúc 06:05 AM
-- Phiên bản máy phục vụ: 10.4.11-MariaDB
-- Phiên bản PHP: 7.2.29

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `blog`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `category`
--

CREATE TABLE `category` (
  `Id` int(11) NOT NULL,
  `Title` varchar(100) DEFAULT NULL,
  `Is_Active` tinyint(1) DEFAULT NULL,
  `Created` datetime DEFAULT NULL,
  `Created_By` varchar(100) DEFAULT NULL,
  `Modified` datetime DEFAULT NULL,
  `Modified_By` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `category`
--

INSERT INTO `category` (`Id`, `Title`, `Is_Active`, `Created`, `Created_By`, `Modified`, `Modified_By`) VALUES
(1, 'Hot', 1, '2020-10-03 16:00:00', 'thanhnnt', '2020-10-03 03:00:00', 'thanhnnt'),
(2, 'Báo mới', 1, '2020-10-25 04:48:17', 'thanhnnt', '2020-10-25 04:50:55', 'thanhnnt'),
(13, 'Xã Hội', 1, '2020-10-30 12:46:10', 'thanhnnt', '2020-10-30 12:46:10', 'thanhnnt'),
(14, 'Thể Thao', 1, '2020-10-30 12:46:54', 'thanhnnt', '2020-10-30 12:46:54', 'thanhnnt');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `comment`
--

CREATE TABLE `comment` (
  `Id` int(11) NOT NULL,
  `Account` varchar(100) DEFAULT NULL,
  `Post_Slug` varchar(100) DEFAULT NULL,
  `Content` text DEFAULT NULL,
  `Parent_Id` int(11) DEFAULT NULL,
  `Is_Active` tinyint(1) DEFAULT NULL,
  `Created` date DEFAULT NULL,
  `Created_By` varchar(100) DEFAULT NULL,
  `Modified` date DEFAULT NULL,
  `Modified_By` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `comment`
--

INSERT INTO `comment` (`Id`, `Account`, `Post_Slug`, `Content`, `Parent_Id`, `Is_Active`, `Created`, `Created_By`, `Modified`, `Modified_By`) VALUES
(1, 'thanhnnt2', 'Bang-rung,-vuot-20-điem-sat-lo-đe-cuu-ho-nan-nhan-bi-vui-lap-o-Tra-Van-1603993681187', 'Test comment 1', NULL, 1, '2020-10-07', NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `crawl_history`
--

CREATE TABLE `crawl_history` (
  `Id` int(11) NOT NULL,
  `Date` datetime DEFAULT NULL,
  `Account` varchar(100) DEFAULT NULL,
  `Setting_Page_Id` int(11) DEFAULT NULL,
  `Web_Data` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `master_country`
--

CREATE TABLE `master_country` (
  `Id` int(11) NOT NULL,
  `Title` varchar(255) NOT NULL,
  `GMT` int(11) NOT NULL,
  `Code` varchar(100) NOT NULL,
  `Is_Active` tinyint(1) NOT NULL,
  `Created` datetime DEFAULT NULL,
  `Created_By` varchar(100) DEFAULT NULL,
  `Modified` datetime DEFAULT NULL,
  `Modified_By` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `master_country`
--

INSERT INTO `master_country` (`Id`, `Title`, `GMT`, `Code`, `Is_Active`, `Created`, `Created_By`, `Modified`, `Modified_By`) VALUES
(1, 'Việt Nam', 7, 'VN', 1, '2020-10-03 16:00:00', '1', '2020-10-03 14:30:00', '1'),
(2, 'Singapore', 0, '', 1, '2020-10-25 05:17:34', 'thanhnnt', '2020-10-25 05:17:34', 'thanhnnt'),
(3, 'aaádasd', 0, '', 1, '2020-10-25 05:17:38', 'thanhnnt', '2020-10-25 05:17:42', 'thanhnnt');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `master_gender`
--

CREATE TABLE `master_gender` (
  `Id` int(11) NOT NULL,
  `Title` varchar(255) NOT NULL,
  `Is_Active` tinyint(1) NOT NULL,
  `Created` datetime DEFAULT NULL,
  `Created_By` varchar(100) DEFAULT NULL,
  `Modified` datetime DEFAULT NULL,
  `Modified_By` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `master_gender`
--

INSERT INTO `master_gender` (`Id`, `Title`, `Is_Active`, `Created`, `Created_By`, `Modified`, `Modified_By`) VALUES
(1, 'Female', 1, '2020-10-03 16:00:00', '1', '2020-10-25 05:07:20', 'thanhnnt'),
(2, 'Male', 1, '2020-10-25 05:07:11', 'thanhnnt', '2020-10-25 05:07:49', 'thanhnnt'),
(3, 'Báo ', 1, '2020-10-26 12:46:06', 'thanhnnt', '2020-10-26 12:46:06', 'thanhnnt');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `notification`
--

CREATE TABLE `notification` (
  `Id` int(11) NOT NULL,
  `Title` varchar(100) DEFAULT NULL,
  `Account` varchar(100) DEFAULT NULL,
  `Link_To` varchar(100) DEFAULT NULL,
  `Content` text DEFAULT NULL,
  `Is_Active` tinyint(1) DEFAULT NULL,
  `Created` datetime DEFAULT NULL,
  `Created_By` varchar(100) DEFAULT NULL,
  `Modified` datetime DEFAULT NULL,
  `Modified_By` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `notification`
--

INSERT INTO `notification` (`Id`, `Title`, `Account`, `Link_To`, `Content`, `Is_Active`, `Created`, `Created_By`, `Modified`, `Modified_By`) VALUES
(1, 'The Article \'Đòan người lặng lẽ dưới mưa\' has been reported with reason violent', 'thanhnnt', '/report?slug=Đoan-nguoi-lang-le-duoi-mua,-tien-đua-Thieu-tuong-Nguyen-Van-Man-ve-đat-me-160355633152', '', 0, '2020-10-27 00:30:08', 'thanhnnt', '2020-10-27 00:30:08', 'thanhnnt');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `post`
--

CREATE TABLE `post` (
  `Id` int(11) NOT NULL,
  `Title` varchar(100) DEFAULT NULL,
  `Slug` varchar(100) DEFAULT NULL,
  `Summary` varchar(500) DEFAULT NULL,
  `Publish_Date` datetime DEFAULT NULL,
  `Is_Draft` tinyint(1) DEFAULT NULL,
  `Category_Id` int(11) DEFAULT NULL,
  `Source_Id` int(11) NOT NULL,
  `Content` text DEFAULT NULL,
  `Read_Time` int(11) DEFAULT NULL,
  `Is_Active` tinyint(1) DEFAULT NULL,
  `Created` datetime DEFAULT NULL,
  `Created_By` varchar(100) DEFAULT NULL,
  `Modified` datetime DEFAULT NULL,
  `Modified_By` varchar(100) DEFAULT NULL,
  `Avatar` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `post`
--

INSERT INTO `post` (`Id`, `Title`, `Slug`, `Summary`, `Publish_Date`, `Is_Draft`, `Category_Id`, `Source_Id`, `Content`, `Read_Time`, `Is_Active`, `Created`, `Created_By`, `Modified`, `Modified_By`, `Avatar`) VALUES
(3, 'Bão số 9 vừa tan, không khí lạnh lại gây mưa lớn ở bắc miền Trung', 'Thong-tin-ve-lu-quet-1603472598396', 'Bão số 9 vừa tan thì không khí lạnh từ phía bắc tràn xuống kết hợp với hoàn lưu bão sẽ gây ra mưa lớn từ Nghệ An đến Quảng Bình từ đêm nay 28.10 đến hết ngày 31.10.', '2020-10-24 12:03:18', NULL, 1, 4, '<p>ádascascsacasc</p><p><strong>s</strong></p><p><strong>scscsc</strong></p><p><strong>sc</strong></p><blockquote><p><strong>sscscs</strong></p><p>&nbsp;</p></blockquote>', 9, 1, NULL, 'thanhnnt', NULL, NULL, 'https://image.thanhnien.vn/660/uploaded/phanhau/tno/mualon_chry.jpg'),
(4, 'Đoàn người lặng lẽ dưới mưa, tiễn đưa Thiếu tướng Nguyễn Văn Man về đất mẹ', 'Đoan-nguoi-lang-le-duoi-mua,-tien-đua-Thieu-tuong-Nguyen-Van-Man-ve-đat-me-1603556331524', 'Rất đông người dân Quảng Bình đã đội mưa đến viếng, tiễn đưa Thiếu tướng Nguyễn Văn Man về đất mẹ. Ông đã hi sinh khi thực hiện nhiệm vụ cứu hộ, cứu nạn ở Thủy điện Rào Trăng 3.', '2020-10-24 11:18:51', NULL, 1, 4, '<figure class=\"image align-center\"><img title=\"Đoàn người lặng lẽ dưới mưa, tiễn đưa Thiếu tướng Nguyễn Văn Man về đất mẹ - 1\" src=\"https://icdn.dantri.com.vn/thumb_w/640/2020/10/20/jpg-0025-1603186651149.jpg\" alt=\"Đoàn người lặng lẽ dưới mưa, tiễn đưa Thiếu tướng Nguyễn Văn Man về đất mẹ - 1\">\n<figcaption>\n<p>Trưa 20/10, con đường nhỏ dẫn vào nhà của Thiếu tướng, Liệt sỹ Nguyễn Văn Man, nguyên Phó Tư lệnh Quân khu 4, tại phường Nam Lý, TP. Đồng Hới (Quảng Bình) chật kín người.</p>\n</figcaption>\n</figure>\n<figure class=\"image align-center\"><img title=\"Đoàn người lặng lẽ dưới mưa, tiễn đưa Thiếu tướng Nguyễn Văn Man về đất mẹ - 2\" src=\"https://icdn.dantri.com.vn/thumb_w/640/2020/10/20/jpg-0048-1603186645496.jpg\" alt=\"Đoàn người lặng lẽ dưới mưa, tiễn đưa Thiếu tướng Nguyễn Văn Man về đất mẹ - 2\">\n<figcaption>\n<p>Mặc dù trời mưa rất to nhưng đoàn người vẫn lặng lẽ, đứng chật kín trước căn nhà của gia đình Thiếu tướng Nguyễn Văn Man để chờ đợi, tiễn đưa ông về nơi an nghỉ cuối cùng, cũng như chia sẻ những mất mát đối với gia đình.</p>\n</figcaption>\n</figure>\n<figure class=\"image align-center\"><img title=\"Đoàn người lặng lẽ dưới mưa, tiễn đưa Thiếu tướng Nguyễn Văn Man về đất mẹ - 3\" src=\"https://icdn.dantri.com.vn/thumb_w/640/2020/10/20/jpg-0044-1603186646292.jpg\" alt=\"Đoàn người lặng lẽ dưới mưa, tiễn đưa Thiếu tướng Nguyễn Văn Man về đất mẹ - 3\">\n<figcaption>\n<p>Đại diện nhiều ban ngành địa phương, lực lượng vũ trang, đồng đội cũng đã đến tiễn đưa, vĩnh biệt Thiếu tướng, Liệt sỹ Nguyễn Văn Man, người con dũng cảm của Tổ quốc Việt Nam đã hy sinh khi làm nhiệm vụ tìm kiếm, cứu nạn tại khu vực Nhà máy Thủy điện Rào Trăng 3.</p>\n</figcaption>\n</figure>\n<figure class=\"image align-center\"><img title=\"Đoàn người lặng lẽ dưới mưa, tiễn đưa Thiếu tướng Nguyễn Văn Man về đất mẹ - 4\" src=\"https://icdn.dantri.com.vn/thumb_w/640/2020/10/20/jpg-0034-1603188009036.jpg\" alt=\"Đoàn người lặng lẽ dưới mưa, tiễn đưa Thiếu tướng Nguyễn Văn Man về đất mẹ - 4\"></figure>\n<figure class=\"image align-center\"><img title=\"Đoàn người lặng lẽ dưới mưa, tiễn đưa Thiếu tướng Nguyễn Văn Man về đất mẹ - 5\" src=\"https://icdn.dantri.com.vn/thumb_w/640/2020/10/20/jpg-0037-1603188082691.jpg\" alt=\"Đoàn người lặng lẽ dưới mưa, tiễn đưa Thiếu tướng Nguyễn Văn Man về đất mẹ - 5\">\n<figcaption>\n<p>Tại lễ tang, người thân, đồng đội và rất nhiều người dân địa phương đã không thể kìm nổi niềm thương xót đối với Thiếu tướng Nguyễn Văn Man.</p>\n</figcaption>\n</figure>\n<figure class=\"image align-center\"><img title=\"Đoàn người lặng lẽ dưới mưa, tiễn đưa Thiếu tướng Nguyễn Văn Man về đất mẹ - 6\" src=\"https://icdn.dantri.com.vn/thumb_w/640/2020/10/20/jpg-0057-1603186636466.jpg\" alt=\"Đoàn người lặng lẽ dưới mưa, tiễn đưa Thiếu tướng Nguyễn Văn Man về đất mẹ - 6\"></figure>\n<figure class=\"image align-center\"><img title=\"Đoàn người lặng lẽ dưới mưa, tiễn đưa Thiếu tướng Nguyễn Văn Man về đất mẹ - 7\" src=\"https://icdn.dantri.com.vn/thumb_w/640/2020/10/20/jpg-0062-1603186641103.jpg\" alt=\"Đoàn người lặng lẽ dưới mưa, tiễn đưa Thiếu tướng Nguyễn Văn Man về đất mẹ - 7\">\n<figcaption>\n<p>Đúng 13h30, linh cữu của Thiếu tướng, Liệt sỹ Nguyễn Văn Man được đưa lên xe.</p>\n</figcaption>\n</figure>\n<figure class=\"image align-center\"><img title=\"Đoàn người lặng lẽ dưới mưa, tiễn đưa Thiếu tướng Nguyễn Văn Man về đất mẹ - 8\" src=\"https://icdn.dantri.com.vn/thumb_w/640/2020/10/20/jpg-0077-1603186649837.jpg\" alt=\"Đoàn người lặng lẽ dưới mưa, tiễn đưa Thiếu tướng Nguyễn Văn Man về đất mẹ - 8\">\n<figcaption>\n<p>Đoàn xe quân sự đưa Thiếu tướng, Liệt sỹ Nguyễn Văn Man về nơi an nghỉ tại nghĩa trang thuộc phường Bắc Lý, thành phố Đồng Hới.</p>\n</figcaption>\n</figure>\n<figure class=\"image align-center\"><img title=\"Đoàn người lặng lẽ dưới mưa, tiễn đưa Thiếu tướng Nguyễn Văn Man về đất mẹ - 9\" src=\"https://icdn.dantri.com.vn/thumb_w/640/2020/10/20/jpg-0092-1603186650689.jpg\" alt=\"Đoàn người lặng lẽ dưới mưa, tiễn đưa Thiếu tướng Nguyễn Văn Man về đất mẹ - 9\">\n<figcaption>\n<p>Giữa trời mưa, dòng người lặng lẽ, theo sau xe chở linh cữu,&nbsp; nước mắt hòa vào nỗi đau trước sự ra đi đột ngột của Thiếu tướng, Liệt sĩ Nguyễn Văn Man.</p>\n</figcaption>\n</figure>\n<p>Trước đó, ngày 18/10, lễ viếng, lễ truy điệu Thiếu tướng Nguyễn Văn Man cùng 12 cán bộ, chiến sĩ hi sinh trên đường đi cứu hộ thuỷ điện Rào Trăng 3 cũng đã được tổ chức tại Nhà tang lễ bệnh viện Quân y tại&nbsp;TP Huế. Sau lễ viếng và truy điệu, các liệt sĩ đã được đưa về quê nhà để tổ chức lễ an táng.</p>\n<figure class=\"image align-center\"><img title=\"Đoàn người lặng lẽ dưới mưa, tiễn đưa Thiếu tướng Nguyễn Văn Man về đất mẹ - 10\" src=\"https://icdn.dantri.com.vn/thumb_w/640/2020/10/16/images-680320-bc-manchollt-2016-1602813965851.jpg\" alt=\"Đoàn người lặng lẽ dưới mưa, tiễn đưa Thiếu tướng Nguyễn Văn Man về đất mẹ - 10\">\n<figcaption>\n<p>Tướng Man được biết đến là một người hiền lành, chan hòa, gần gũi trong cuộc sống. Ông luôn xông xáo, đi đầu và không ngại hiểm nguy, bản lĩnh, ý chí quyết tâm, dám nghĩ, dám làm, dám chịu trách nhiệm, một lòng vì nước, vì dân, luôn đồng hành, gắn bó với người dân vùng lũ.</p>\n</figcaption>\n</figure>\n<p>Thiếu tướng Nguyễn Văn Man (SN 1966), ở phường Nam Lý, TP Đồng Hới, tỉnh Quảng Bình. Ông là Phó tư lệnh Quân khu 4, đại biểu Quốc hội khóa XIV, nhiệm kỳ 2016-2021 thuộc Đoàn đại biểu Quốc hội tỉnh Quảng Bình; Ủy viên Ủy ban Quốc phòng và An ninh của Quốc hội khóa XIV.</p>\n<p>Trước năm 2015, ông Nguyễn Văn Man là Phó chỉ huy trưởng Bộ chỉ huy Quân sự tỉnh Quảng Bình. Tiếp đó đến tháng 11/2015, ông được phân công giữ chức Chỉ huy trưởng Bộ chỉ huy Quân sự tỉnh Quảng Bình. Sau nhiều năm công tác và gắn bó với Quảng Bình, đến tháng 5/2019, ông Nguyễn Văn Man được bổ nhiệm giữ chức Phó tư lệnh Quân khu 4 và được phong hàm Thiếu tướng vào tháng 6/2020.</p>\n<p>Ngày 12/10, ngay khi nghe tin các công nhân Thuỷ điện Rào Trăng 3 (Phong Điền, Thừa Thiên - Huế) gặp nạn do lũ lụt, Thiếu tướng Nguyễn Văn Man đã cùng đoàn công tác lên đường vào địa bàn xảy ra tai nạn.</p>\n<p>Đoàn công tác đã băng rừng, đi bộ hơn 10 km, gần đến điểm xảy ra tai nạn thì trời tối. Thiếu tướng cùng đoàn công tác nghỉ chân trong trạm kiểm lâm 67. Khoảng 24h cùng ngày, bất ngờ đất đá đổ xuống đè lên tòa nhà đoàn đang nghỉ, trong đó chỉ có 8 người thoát khỏi. Đến 19h20 tối ngày 15/10, lực lượng cứu hộ, cứu nạn đã tìm thấy toàn bộ thi thể của 13, cán bộ chiến sĩ mất tích.</p>\n<p><strong>Tiến Thành</strong></p>\n            <div></div>', 321, 1, '2020-10-24 11:18:51', 'thanhnnt', '2020-10-24 11:18:51', 'thanhnnt', 'https://icdn.dantri.com.vn/thumb_w/640/2020/10/20/jpg-0025-1603186651149.jpg'),
(6, 'Hêlllooo', 'Helllooo-1603617239781', 'abc', '2020-10-25 04:13:59', NULL, 1, 4, '<p>abc</p>', 1, 0, '2020-10-25 04:13:59', 'thanhnnt', '2020-10-25 04:13:59', 'thanhnnt', ''),
(7, 'Băng rừng, vượt 20 điểm sạt lở để cứu hộ nạn nhân bị vùi lấp ở Trà Vân', 'Bang-rung,-vuot-20-điem-sat-lo-đe-cuu-ho-nan-nhan-bi-vui-lap-o-Tra-Van-1603993681187', 'Trong ngày 29/10, các lực lượng chức năng đã đi bộ băng rừng, vượt 20 điểm sạt lở, cùng lực lượng tại chỗ thực hiện cứu hộ, cứu nạn ở Trà Vân.', '2020-10-30 12:48:01', NULL, 13, 4, '<figure class=\"video\"><video poster=\"https://icdn.dantri.com.vn/thumb-video/2020/10/29/vuot-20-diem-sat-lo-1603975406277/0_00_42.jpg\" width=\"1920\" height=\"1080\"></video>\n<figcaption>\n<p>Băng rừng, vượt 20 điểm sạt lở để cứu hộ nạn nhân bị vùi lấp ở Trà Vân</p>\n</figcaption>\n</figure>\n<p>Vụ sạt lở núi tại nóc Ông Sinh, xã Trà Vân, huyện Nam Trà My xảy ra vào hồi 13h ngày 28/10 khiến 8 người bị đất đá vùi lấp tử vong, 12 người bị thương. Toàn bộ đều là đồng bào người dân tộc Cơ Tu.</p>\n<figure class=\"image align-center\"><img title=\"Băng rừng, vượt 20 điểm sạt lở để cứu hộ nạn nhân bị vùi lấp ở Trà Vân - 1\" src=\"https://icdn.dantri.com.vn/thumb_w/640/2020/10/29/vuot-20-diem-sat-lo-giai-cuu-tra-van-6-1603971637202.jpg\" alt=\"Băng rừng, vượt 20 điểm sạt lở để cứu hộ nạn nhân bị vùi lấp ở Trà Vân - 1\">\n<figcaption>\n<p>Một căn nhà của người dân bị đất đá trên đồi cao xói lở, vùi lấp gây thiệt hại người và tài sản ở xã Trà Vân.</p>\n</figcaption>\n</figure>\n<p>Trao đổi với Dân trí, ông Hồ Văn Huyện, Chủ tịch UBND xã Trà Vân cho biết: \"Đề phòng bão số 9, chính quyền địa phương đã thông báo đến các khu dân cư. Tuy nhiên, người dân đang ở yên trong nhà tránh trú bão, thì bất ngờ sạt lở núi giữa lúc trời mưa to, đất đá ập xuống nóc Ông Sinh, vùi lấp 5/8 nhà của các hộ dân\".</p>\n<p>Hậu quả để lại rất nặng nề, 8 người của 3 hộ dân tử nạn. 12 người được cứu sống khỏi lớp đất đá vùi lấp. Trong ngày 29/10, cả xã đã tập trung toàn bộ lực lượng cùng lực lượng các ban, ngành của huyện tiến hành cứu hộ, cứu nạn khẩn cấp.</p>\n<figure class=\"image align-center\"><img title=\"Băng rừng, vượt 20 điểm sạt lở để cứu hộ nạn nhân bị vùi lấp ở Trà Vân - 2\" src=\"https://icdn.dantri.com.vn/thumb_w/640/2020/10/29/vuot-20-diem-sat-lo-giai-cuu-tra-van-4-1603971637072.jpg\" alt=\"Băng rừng, vượt 20 điểm sạt lở để cứu hộ nạn nhân bị vùi lấp ở Trà Vân - 2\">\n<figcaption>\n<p>Lực lượng chức năng đang tổ chức ứng cứu các điểm sạt lở.</p>\n</figcaption>\n</figure>\n<figure class=\"image align-center\"><img title=\"Băng rừng, vượt 20 điểm sạt lở để cứu hộ nạn nhân bị vùi lấp ở Trà Vân - 3\" src=\"https://icdn.dantri.com.vn/thumb_w/640/2020/10/29/vuot-20-diem-sat-lo-giai-cuu-tra-van-2-1603971637263.jpg\" alt=\"Băng rừng, vượt 20 điểm sạt lở để cứu hộ nạn nhân bị vùi lấp ở Trà Vân - 3\">\n<figcaption>\n<p>Lực lượng chức năng sử dụng xe ủi, san lấp các đoạn đường sạt lở&nbsp;</p>\n</figcaption>\n</figure>\n<p>Các lực lượng dân quân, công an xã Trà Vân, các ban, ngành chức năng huyện Nam Trà My đã nỗ lực băng rừng, lội bộ qua 20 điểm sạt lở trong ngày 29/10 để cứu hộ, cứu nạn. Đường từ Tắc Pỏ, thị trấn trung tâm huyện Nam Trà My, đến nóc Ông Sinh có 7km, nhưng có đến 20 điểm sạt lở, gây nhiều khó khăn cho đoàn cứu hộ.</p>\n<figure class=\"image align-center\"><img title=\"Băng rừng, vượt 20 điểm sạt lở để cứu hộ nạn nhân bị vùi lấp ở Trà Vân - 4\" src=\"https://icdn.dantri.com.vn/thumb_w/640/2020/10/29/vuot-20-diem-sat-lo-giai-cuu-tra-van-9-1603971637028.jpg\" alt=\"Băng rừng, vượt 20 điểm sạt lở để cứu hộ nạn nhân bị vùi lấp ở Trà Vân - 4\">\n<figcaption>\n<p>8 người tử nạn là người nhà của 3 hộ gia đình ở nóc Ông Sinh. Những người bị thương nặng được khiêng bộ về trung tâm y tế huyện Nam Trà My để cứu chữa. Những trường hợp bị thương nhẹ được lực lượng y tế tại chỗ điều trị.</p>\n</figcaption>\n</figure>\n<p><strong>An Sơn - Đặng Châu</strong></p>\n            <div></div>', 168, 1, '2020-10-30 12:48:01', 'thanhnnt', '2020-10-30 12:48:01', 'thanhnnt', 'https://icdn.dantri.com.vn/thumb_w/640/2020/10/29/vuot-20-diem-sat-lo-giai-cuu-tra-van-6-1603971637202.jpg'),
(8, 'Bờ biển sạt lở nghiêm trọng, nhiều hàng quán đổ sập', 'Bo-bien-sat-lo-nghiem-trong,-nhieu-hang-quan-đo-sap-1603994676174', 'Ảnh hưởng của bão số 9, sóng lớn cùng với mưa đã khiến nhiều tuyến đê, kè biển tại tỉnh Quảng Trị bị sạt lở, hư hại nghiêm trọng, nhiều nhà dân bị đổ sập, tốc mái.', '2020-10-30 01:04:36', NULL, 13, 4, '<p>Tại xã Gio Hải, huyện Gio Linh, tuyến đê biển dài 5,8km bị sóng lớn làm sạt lở, ăn sâu vào đất liền 20m, hư hại nặng.</p>\n<figure class=\"image align-center\"><img title=\"Bờ biển sạt lở nghiêm trọng, nhiều hàng quán đổ sập - 1\" src=\"https://icdn.dantri.com.vn/thumb_w/640/2020/10/29/img-3098-1603959792061.jpg\" alt=\"Bờ biển sạt lở nghiêm trọng, nhiều hàng quán đổ sập - 1\">\n<figcaption>\n<p>Bờ biển bị sóng lớn gây sạt lở nghiêm trọng.</p>\n</figcaption>\n</figure>\n<p>Ngoài ra, có 9/18 ngôi nhà và quán ăn của người dân tại bãi tắm xã Gio Hải bị đổ sập trên 50%.</p>\n<figure class=\"image align-center\"><img title=\"Bờ biển sạt lở nghiêm trọng, nhiều hàng quán đổ sập - 2\" src=\"https://icdn.dantri.com.vn/thumb_w/640/2020/10/29/sat-lo-bien-3-1603960461301.jpeg\" alt=\"Bờ biển sạt lở nghiêm trọng, nhiều hàng quán đổ sập - 2\"></figure>\n<figure class=\"image align-center\"><img title=\"Bờ biển sạt lở nghiêm trọng, nhiều hàng quán đổ sập - 3\" src=\"https://icdn.dantri.com.vn/thumb_w/640/2020/10/29/img-3097-1603959791961.jpg\" alt=\"Bờ biển sạt lở nghiêm trọng, nhiều hàng quán đổ sập - 3\">\n<figcaption>\n<p>Sóng đánh sụt cát, sập cả những khối bê tông&nbsp;</p>\n</figcaption>\n</figure>\n<p>Trước đó, để phòng tránh cơn bão số 9 chính quyền đã tiến hành di dời toàn bộ dân sống tại bãi tắm và khoảng 800 nhân khẩu trên địa bàn xã đến các nhà kiên cố tránh bão nên không có thiệt hại về người.</p>\n<p>Ông Hồ Xuân Thùy - Phó Chủ tịch UBND xã Gio Hải cho biết, xã đã vận động, yêu cầu người dân không được ra khơi, đồng thời thực hiện chằng chống nhà cửa cẩn thận, không được đi ra ngoài khi bão đổ bộ. Bên cạnh đó, đối với những hộ dân sống tại khu vực xung yếu, tập trung lực lượng di dời bà con đến nơi an toàn để tránh trú bão.</p>\n<p>Hiện nay, xã đang tiến hành thống kê thiệt hại cũng như cắt cử lực lượng hỗ trợ bà con khắc phục thiệt hại sau bão…</p>\n<p>Tại bãi biển xã Trung Giang, huyện Gio Linh, bão số 9 cũng khiến tuyến rừng phòng hộ bằng phi lao dài 7km bị sóng biển làm xói lở, bật gốc, cuốn trôi.</p>\n<p>Tuyến đê cát của xã cũng bị xói lở ăn sâu vào đất liền từ 2-5 m. Ngoài ra, sóng biển còn làm gần 10m đường bê tông nông thôn nối liền ra bờ biển bị gãy sập.</p>\n<figure class=\"image align-center\"><img title=\"Bờ biển sạt lở nghiêm trọng, nhiều hàng quán đổ sập - 4\" src=\"https://icdn.dantri.com.vn/thumb_w/640/2020/10/29/sat-lo-bien-6-1603960208153.jpeg\" alt=\"Bờ biển sạt lở nghiêm trọng, nhiều hàng quán đổ sập - 4\">\n<figcaption>\n<p>Bờ biển bị lấn sâu hàng chục mét.</p>\n</figcaption>\n</figure>\n<figure class=\"image align-center\"><img title=\"Bờ biển sạt lở nghiêm trọng, nhiều hàng quán đổ sập - 5\" src=\"https://icdn.dantri.com.vn/thumb_w/640/2020/10/29/qt-21603942275898-1603960233832.jpeg\" alt=\"Bờ biển sạt lở nghiêm trọng, nhiều hàng quán đổ sập - 5\">\n<figcaption>\n<p>Một số nhà quán của người dân bị hư hại hoàn toàn.</p>\n</figcaption>\n</figure>\n<figure class=\"image align-center\"><img title=\"Bờ biển sạt lở nghiêm trọng, nhiều hàng quán đổ sập - 6\" src=\"https://icdn.dantri.com.vn/thumb_w/640/2020/10/29/sat-lo-bien-7-1603960134147.jpeg\" alt=\"Bờ biển sạt lở nghiêm trọng, nhiều hàng quán đổ sập - 6\"></figure>\n<figure class=\"image align-center\"><img title=\"Bờ biển sạt lở nghiêm trọng, nhiều hàng quán đổ sập - 7\" src=\"https://icdn.dantri.com.vn/thumb_w/640/2020/10/29/sat-lo-bien-8-1603960427935.jpeg\" alt=\"Bờ biển sạt lở nghiêm trọng, nhiều hàng quán đổ sập - 7\">\n<figcaption>\n<p>Cả dãy hàng quán của người dân tại bãi tắm Gio Hải bị sập, hư hại.</p>\n</figcaption>\n</figure>\n<p>Mưa to trong ngày và tối 28/10 đã khiến tỉnh Quảng Trị chịu nhiều thiệt hại. Tình trạng ngập lụt tái diễn tại Triệu Phong, Hải Lăng, thị xã Quảng Trị.</p>\n<p><strong>Đăng Đức</strong></p>\n            <div></div>', 186, 1, '2020-10-30 01:04:36', 'thanhnnt', '2020-10-30 01:04:36', 'thanhnnt', 'https://icdn.dantri.com.vn/thumb_w/640/2020/10/29/img-3098-1603959792061.jpg'),
(9, 'Những mái nhà chưa thể “lành” sau cuồng phong!', 'Nhung-mai-nha-chua-the-“lanh”-sau-cuong-phong!-1603995155086', 'Cuồng phong Molave đi qua để lại những hoang tàn. Hàng chục ngàn ngôi nhà trống hoác. Nỗi kinh hoàng đã đi qua nhưng đằng sau là lo toan kéo dài.', '2020-10-30 01:12:35', NULL, 13, 4, '<p>Cuồng phong Molave đi qua, những con đường ven biển Bình Sơn (tỉnh Quảng Ngãi) lạo xạo tiếng ngói vỡ. Nắng chói chang rọi thẳng vào những ngôi nhà trống hoác. Hàng chục ngàn mái nhà chưa thể “lành”.</p>\n<p>Sống bên bờ biển xã Bình Hải, hơn 77 năm qua, ông Dương Văn Năm đã đối mặt với hàng chục cơn bão. Tất cả đều dữ dội nhưng Molave là khủng khiếp nhất.</p>\n<p>“Gần hết đời người mới trải qua những giây phút kinh hoàng như thế. Gió dữ dội, sóng biển lại hùa với cuồng phong quật đổ mọi thứ gần bờ. Nhà bay mái, xưởng gỗ tan hoang. Mất hết”, ông Năm nén tiếng thở dài.</p>\n<figure class=\"image align-center\"><img title=\"Những mái nhà chưa thể “lành” sau cuồng phong! - 1\" src=\"https://icdn.dantri.com.vn/thumb_w/640/2020/10/29/hinh-1-1603960302770.jpg\" alt=\"Những mái nhà chưa thể “lành” sau cuồng phong! - 1\">\n<figcaption>\n<p>Ông Năm thẩn thờ khi nhà bay mái, xưởng sản xuất tan hoang</p>\n</figcaption>\n</figure>\n<p>Ông Năm đứng bất động giữa nhà xưởng tan hoang. Ông đang nghĩ về những ngày sắp đến. Thiệt hại gần 100 triệu đồng khiến ông lão rối bời.</p>\n<p>“Sóng gió quá kinh hoàng, may sao mọi người vẫn bình an. Còn người là may mắn rồi cháu”, ông lão nói như an ủi chính mình.</p>\n<figure class=\"image align-center\"><img title=\"Những mái nhà chưa thể “lành” sau cuồng phong! - 2\" src=\"https://icdn.dantri.com.vn/thumb_w/640/2020/10/29/quangngaitanhoang-1603960712037.jpg\" alt=\"Những mái nhà chưa thể “lành” sau cuồng phong! - 2\">\n<figcaption>\n<p>Hàng chục ngàn căn nhà tan hoang sau trận bão</p>\n</figcaption>\n</figure>\n<p>Cuồng phong quét qua Quảng Ngãi giật sập 165 căn nhà, cuốn bay mái trên 87.000 căn nhà khác. Cây ngã đổ la liệt, hạ tầng điện, viễn thông thiệt hại nặng. Đến chiều 29/10, nhiều nơi tại Quảng Ngãi vẫn ngổn ngang. Hàng chục ngàn ngôi nhà vẫn chưa được “vá” xong.</p>\n<p>Ông Đỗ Đô Thành ở xã Bình Thuận cũng chưa sửa xong nhà. Lượm lặt một vài miếng tôn&nbsp;còn lành lặn, ông và con trai gác tạm che mưa. Cần nhất lúc này là gia cố lại bờ kè đã xói lở. Ông lo đến đêm sóng dữ lại vào.</p>\n<p>Một thời ngang dọc trên biển, sóng gió nào cũng trải qua, thế nhưng ông Đô vẫn thốt lên kinh hoàng khi nói về cơn bão hai đêm trước.</p>\n<p>Ngồi ở nhà tránh bão tập trung, lòng ông như lửa đốt. Căn nhà kiên cố vẫn rung lên sau từng cơn gió giật. Ngoài cửa sổ, ngói, tôn bay tơi bời. Ông lo cho căn nhà nằm sát mép biển. Ở đó không chỉ có gió mà còn sóng. Những con sóng đủ sức cuốn phăng bờ kè có những tảng đá một người ôm.</p>\n<figure class=\"image align-center\"><img title=\"Những mái nhà chưa thể “lành” sau cuồng phong! - 3\" src=\"https://icdn.dantri.com.vn/thumb_w/640/2020/10/29/hinh-3-1603960311433.jpg\" alt=\"Những mái nhà chưa thể “lành” sau cuồng phong! - 3\">\n<figcaption>\n<p>Căn nhà của ông Đô may mắn vẫn còn sau siêu bão, nhưng nỗi lo toan vẫn mãi kéo dài bởi ngoài kia đã có cơn bão mới</p>\n</figcaption>\n</figure>\n<p>Tan bão, tất cả hối hả về nhà. Dọc đường, nhìn những trụ điện bê tông bị gió quật ngã, ông Đô nghĩ nhà mình cũng không còn.</p>\n<p>Trời thương, ông Đô cười giữa những lo toan. Ông vui là bởi ngôi nhà vẫn còn, chỉ mất mái. Vui đó rồi tâm trạng ông chùng xuống, bởi đài báo ngoài kia lại có cơn bão mới.</p>\n<p>“Năm nào cũng bão, triều cường. Năm nay bão dữ nhất nhưng may nhà vẫn còn. Bão miết vầy không biết chừng nào sẽ trắng tay”, ông Đô thở dài.</p>\n<p>Molave, nỗi kinh hoàng nhất đã qua. Nhưng những “vết thương” của người dân vùng bão liệu có kịp lành trước những cơn bão mới?</p>\n<p><strong>Quốc Triều</strong></p>\n            <div></div>', 175, 1, '2020-10-30 01:12:35', 'thanhnnt', '2020-10-30 01:12:35', 'thanhnnt', 'https://icdn.dantri.com.vn/thumb_w/640/2020/10/29/hinh-1-1603960302770.jpg'),
(10, '“Cậu bé vàng” piano tự hào khi quốc kỳ Việt Nam tung bay tại các cuộc thi', '“Cau-be-vang”-piano-tu-hao-khi-quoc-ky-Viet-Nam-tung-bay-tai-cac-cuoc-thi-1604023493819', 'Võ Minh Quang là cái tên được xướng lên tại nhiều lễ khen thưởng, các cuộc thi từ cấp trường tới cấp quốc gia, quốc tế, đặc biệt là trong lĩnh vực âm nhạc nghệ thuật.', '2020-10-30 09:04:53', NULL, 1, 4, '<p><strong>Thành tích nổi bật của pianist 14 tuổi</strong></p>\n<p><span>Võ Minh Quang (sinh năm 2006) tiếp cận và rèn luyện với đàn organ từ khi lên 5 tuổi rưỡi và với piano từ năm 7 tuổi. Năm </span>9 tuổi, em được tuyển thẳng vào Học viện Âm nhạc Quốc gia Hà Nội (HVANQGVN), khi em đồng thời đạt giải Nhất và giải Đặc biệt của Festival do HVANQGVN tổ chức.</p>\n<p>Cũng trong mùa hè năm 9 tuổi, Quang liên tiếp giành 5 giải Nhất và giải Đặc biệt về trình diễn piano tại Việt Nam, Thái Lan và Trung Quốc. Từ đó đến nay, \"cậu bé vàng\" piano giành thêm gần 20 giải Nhất, 10 giải Nhì và 4 giải Đặc biệt ở khắp các cuộc thi trong và ngoài nước, gần đây nhất có thể kể tới Giải đặc biệt (Grandprix) bảng 13-17 tuổi cuộc thi 2020 Atlanta Festival Academy Competition ngay tháng 6/2020 tại Mỹ.</p>\n<figure class=\"image align-center\"><img title=\"“Cậu bé vàng” piano tự hào khi quốc kỳ Việt Nam tung bay tại các cuộc thi - 1\" src=\"https://icdn.dantri.com.vn/thumb_w/640/2020/10/26/tin-7-docx-1603729182596.jpeg\" alt=\"“Cậu bé vàng” piano tự hào khi quốc kỳ Việt Nam tung bay tại các cuộc thi - 1\">\n<figcaption>\n<p>Hình ảnh Quang&nbsp; đang biểu diễn cùng dàn nhạc Klpac Orchestra - Kuala Lumpur - Malaysia trong gala concert khi em dành giải nhất bản nghệ sĩ trẻ 18-29 tuổi.</p>\n</figcaption>\n</figure>\n<p><span>Những thành tích nổi bật nhất của pianist Minh Quang</span> có thể kể tới là: giải Nhất bảng 17-19 tuổi tháng 6/2020; giải Nhất bảng 14-16 tuổi tháng 06/2019, giải Nhất bảng 11-13 tuổi tháng 6/2018 cuộc thi tài năng trẻ Châu Á và Châu Đại Dương - The Rising Talents of the Asia &amp; Oceania International Music Competition in London; giải Nhất bảng độc tấu Piano lứa tuổi 10 -13 tuổi - Cuộc thi Âm nhạc Mùa thu do Bộ Văn hoá, Thể thao và Du lịch tổ chức tại Việt Nam 12/2019; giải Nhất bảng Concerto và giải Nhì bảng solo piano lứa tuổi 18-29 cuộc thi Putra International Piano Competition tại Malaysia 9/2019, Biểu diễn cùng dàn nhạc Klpac Orchestra - Kuala Lumpur- Malaysia...</p>\n<p>Bên cạnh đó, Quang cũng đã 5 lần đạt giải Nhất cuộc thi Piano tại Thái Lan như: giải Nhất bảng 18-24 tuổi cuộc thi Chopin Competition lần thứ 5 tại Thái Lan tháng 7/2019; giải Nhất bảng 13-17 tuổi – Cuộc thi Mozart quốc tế lần thứ 8 tại Thailand tháng 7/2018, giải Nhất bảng 13-17 tuổi cuộc thi Chopin Competition lần thứ 4 tại Thái Lan tháng 11/2017, giải Nhất bảng 10-13 tuổi cuộc thi Chopin Competition lần thứ 3 tại Thái Lan tháng 11/2016; giải Nhất bảng 7-9 tuổi cuộc thi Cuộc thi piano quốc tế Mozart lần thứ 5 của Thailand tháng 7/2015...</p>\n<p>Võ Minh Quang còn là học viên đầu tiên, học viên nhỏ tuổi nhất của Việt Nam đồng thời đạt xuất sắc hai bằng Diploma Licentiate of Trinity College London (Trinity, Vương quốc Anh, tháng 7/2019) và MuSa - Licentiate of Australian Music Examinations Board (GAME, Australia, tháng 8/2019).</p>\n<p>Bên cạnh đó, tài năng piano nhỏ tuổi này cũng có rất nhiều kinh nghiệm biểu diễn, nhận được nhiều bằng khen, giải thưởng cũng như học bổng trong nước và quốc tế cho chuyên ngành piano <span>tiêu biểu như: Học bổng Toyota Scholarship for Vietnamese Young Music Talents, học bổng piano tại Hungary, học bổng Đặng Thái Sơn; Giải thưởng “Ngôi sao hy vọng” của Hội Nhạc sĩ Việt Nam; Cúp gương mặt nghệ sỹ năm 2019 do Cục nghệ thuật biểu diễn trao tặng 1/2020; Gương mặt trẻ triển vọng lĩnh vực nghệ thuật của Việt Nam trong 2 năm liên tiếp 2018 - 2019...</span></p>\n<p><span>Mới đây, Quang vinh dự là đại biểu cháu ngoan Bác Hồ toàn quốc giai đoạn 2015-2020, là 1 trong 63 em nhận Bằng khen “Đã có thành tích tiêu biểu xuất sắc trong công tác đội và phong trào thiếu nhi, là đại biểu tham dự ĐH cháu ngoan Bác Hồ toàn quốc lần thứ IX năm 2020” của bộ trưởng Bộ GD&amp;ĐT 9/2020.</span></p>\n<p><strong>Tự hào Việt Nam sánh vai cùng nước bạn, quốc kỳ tung bay</strong></p>\n<figure class=\"image align-center\"><img title=\"“Cậu bé vàng” piano tự hào khi quốc kỳ Việt Nam tung bay tại các cuộc thi - 2\" src=\"https://icdn.dantri.com.vn/thumb_w/640/2020/10/26/tin-7-docx-1603729182691.jpeg\" alt=\"“Cậu bé vàng” piano tự hào khi quốc kỳ Việt Nam tung bay tại các cuộc thi - 2\">\n<figcaption>\n<p>Minh Quang 5 lần đạt đạt giải nhất ở các bảng thi khác nhau tại Thái Lan</p>\n</figcaption>\n</figure>\n<p><span>Minh Quang tự biết chữ qua việc xem tivi khi em được 22 tháng tuổi, hơn 4 tuổi đã biết đọc sách truyện thiếu nhi dù gia đình không định hướng, cũng không dạy em học trước.</span></p>\n<p><span>Mong muốn lớn nhất của người làm mẹ như chị Hà đối với con là: “Cũng như bao bậc cha mẹ khác, tôi rất muốn các con của mình luôn được vui vẻ, thành công trên chính đam mê và năng lực tiềm ẩn mà các con có, các con yêu thích, chọn lựa.</span></p>\n<p><span>Tôi thường khích lệ con chăm chỉ luyện tập, đọc sách trau dồi kiến thức, rèn rũa bản thân phấn đấu trở thành một con người, một nghệ sĩ thực thụ. Ngoài việc chú trọng chăm lo từng bữa ăn, giấc ngủ cho con, tôi luôn xếp lịch duy trì các hoạt động ngoại khóa cho con như bơi và đá bóng, vẽ tranh vào cuối tuần, tham gia các hoạt động ngoại khóa cùng đoàn đội, bạn bè trong lớp, bạn bè đồng trang lứa của con...\".</span></p>\n<p><span>Dù sinh ra trong một gia đình “ngoại đạo trong lĩnh vực âm nhạc” nhưng Quang đã bén duyên với âm nhạc và biến đam mê này thành “vùng đất màu mỡ” để được phát huy những tiềm lực vốn có, biến nó thành điểm mạnh của chính mình. </span></p>\n<p><span>Từ hậu phương vững chắc của gia đình, từ sự chăm chút dạy bảo đầy tâm huyết của thầy cô, Minh Quang tự tin và luôn sẵn sàng chinh phục ánh hào quang trên sân khấu.&nbsp;</span></p>\n<p><span>Bước ra sân chơi quốc tế, Quang ước muốn được đem một phần nét đẹp nghệ thuật Việt Nam tới với khán giả ngoài nước. Quang kể: “Mỗi lần được đi thi là một lần vui bởi&nbsp; em được đi máy bay, như cảm giác được đi trên bức tranh bông trắng khổng lồ. </span></p>\n<p><span>Em được ăn nhiều món ngon mới, ở khách sạn, được thả đam mê và ước vọng thông qua từng bản nhạc, được mang lá cờ Việt Nam đến với bạn bè thế giới và em còn được mang cúp và tiền thưởng về nữa <em>(cười)</em>”.</span></p>\n<figure class=\"image align-center\"><img title=\"“Cậu bé vàng” piano tự hào khi quốc kỳ Việt Nam tung bay tại các cuộc thi - 3\" src=\"https://icdn.dantri.com.vn/thumb_w/640/2020/10/26/tin-7-docx-1603729182648.jpeg\" alt=\"“Cậu bé vàng” piano tự hào khi quốc kỳ Việt Nam tung bay tại các cuộc thi - 3\">\n<figcaption>\n<p>Hình ảnh Quang bên mẹ và TS Đào Trọng Tuyên, thầy giáo của mình trong lễ nhận học bổng Đặng Thái Sơn. Em cũng là đại diện duy nhất của khoa piano HVANQGVN biểu diễn trong đêm gala concert cùng các học sinh sinh viên quốc tế.</p>\n</figcaption>\n</figure>\n<p><span>“Mỗi khi được nghe \"Võ Minh Quang from Việt Nam\" được xướng lên tim em muốn nổ tung vì hạnh phúc xen lẫn sự hãnh diện, tự hào nho nhỏ. Em vui lắm vì những nỗ lực của thầy trò, sự chăm chút đồng hành của mẹ đã được khẳng định bằng chút thành công nhất định ấy cũng như được mang tên gọi Việt Nam sánh vai cùng nước bạn, ngắm quốc kỳ tung bay phấp phới”. Đôi lời chia sẻ của pianist trẻ&nbsp; khi được xướng tên trong các kỳ thi quốc tế.</span></p>\n<p><span>Ghi danh trong danh sách học sinh của cả trường THCS Giảng Võ và Học viện Âm nhạc quốc gia, dù khá vất vả trong việc sắp xếp thời gian biểu tại cả 2 trường nhưng Minh Quang vẫn luôn có kết quả học tập tốt ở Trường THCS Giảng Võ từ năm lớp 6 đến giờ. Đồng thời em cũng là học sinh xuất sắc của khoa piano, là học sinh lớp tài năng của HVANQGVN.</span></p>\n<p><strong>Phan Thùy Linh</strong></p>\n            <div></div>', 374, 1, '2020-10-30 09:04:53', 'thanhnnt', '2020-10-30 09:04:53', 'thanhnnt', 'https://icdn.dantri.com.vn/thumb_w/640/2020/10/26/tin-7-docx-1603729182596.jpeg'),
(11, 'Cựu nữ sinh Ngoại thương đẹp dịu dàng bên cúc họa mi đầu mùa', 'Cuu-nu-sinh-Ngoai-thuong-đep-diu-dang-ben-cuc-hoa-mi-đau-mua-1604023520688', 'Chử Bảo Ngọc (sinh năm 1998, Phú Thọ) là cựu sinh viên trường ĐH Ngoại thương Hà Nội. Mới đây Ngọc Chử nhận được nhiều lời ngợi khen trong những khoảnh khắc nhẹ nhàng bên cúc họa mi đầu mùa.', '2020-10-30 09:05:20', NULL, 1, 4, '<figure class=\"image\"><img title=\"Cựu nữ sinh Ngoại thương đẹp dịu dàng bên cúc họa mi đầu mùa - 1\" src=\"https://icdn.dantri.com.vn/thumb_w/640/2020/10/28/cuu-nu-sinh-ngoai-thuong-dep-diu-dang-ben-cuc-hoa-mi-dau-muadocx-1603883279151.jpeg\" alt=\"Cựu nữ sinh Ngoại thương đẹp dịu dàng bên cúc họa mi đầu mùa - 1\">\n<figcaption>Bảo Ngọc trở nên nổi tiếng trên mạng xã hội nhờ vẻ ngoài đẹp trong veo như nắng mai, cùng nụ cười tươi “đốn tim” người đối diện.</figcaption>\n</figure>\n<figure class=\"image\"><img title=\"Cựu nữ sinh Ngoại thương đẹp dịu dàng bên cúc họa mi đầu mùa - 2\" src=\"https://icdn.dantri.com.vn/thumb_w/640/2020/10/28/cuu-nu-sinh-ngoai-thuong-dep-diu-dang-ben-cuc-hoa-mi-dau-muadocx-1603883279389.jpeg\" alt=\"Cựu nữ sinh Ngoại thương đẹp dịu dàng bên cúc họa mi đầu mùa - 2\">\n<figcaption>\n<p>Cô chia sẻ: “Hầu như mỗi năm đến các mùa hoa mình đều rất thích đi chụp ảnh. Mình cảm thấy thư giãn đầu óc, mọi muộn phiền đời thường cũng tan biến hết khi nhìn thấy hoa. Nhưng mình cũng cảm thấy bản thân không phù hợp với việc theo đuổi nghệ thuật”.</p>\n</figcaption>\n</figure>\n<figure class=\"image\"><img title=\"Cựu nữ sinh Ngoại thương đẹp dịu dàng bên cúc họa mi đầu mùa - 3\" src=\"https://icdn.dantri.com.vn/thumb_w/640/2020/10/28/cuu-nu-sinh-ngoai-thuong-dep-diu-dang-ben-cuc-hoa-mi-dau-muadocx-1603883279443.jpeg\" alt=\"Cựu nữ sinh Ngoại thương đẹp dịu dàng bên cúc họa mi đầu mùa - 3\">\n<figcaption>Trong học tập hay công việc, Bảo Ngọc luôn nghiêm túc và cố gắng hoàn thành những mục tiêu đã đề ra. Còn ngoài đời thường Ngọc vui vẻ, hòa đồng, cô quan niệm rằng nụ cười là động lực xua tan hết những muộn phiền, mệt mỏi.</figcaption>\n</figure>\n<figure class=\"image\"><img title=\"Cựu nữ sinh Ngoại thương đẹp dịu dàng bên cúc họa mi đầu mùa - 4\" src=\"https://icdn.dantri.com.vn/thumb_w/640/2020/10/28/cuu-nu-sinh-ngoai-thuong-dep-diu-dang-ben-cuc-hoa-mi-dau-muadocx-1603883279492.jpeg\" alt=\"Cựu nữ sinh Ngoại thương đẹp dịu dàng bên cúc họa mi đầu mùa - 4\">\n<figcaption>\n<p>Mặc dù sở hữu lợi thế về ngoại hình nhưng cựu nữ sinh ĐH Ngoại thương Hà Nội cho biết, bản thân không phù hợp với lĩnh vực nghệ thuật. Bảo Ngọc mong muốn trong tương lai sẽ trở thành một người phụ nữ giỏi giang, quyền lực và mạnh mẽ.</p>\n</figcaption>\n</figure>\n<figure class=\"image\"><img title=\"Cựu nữ sinh Ngoại thương đẹp dịu dàng bên cúc họa mi đầu mùa - 5\" src=\"https://icdn.dantri.com.vn/thumb_w/640/2020/10/28/cuu-nu-sinh-ngoai-thuong-dep-diu-dang-ben-cuc-hoa-mi-dau-muadocx-1603883279550.jpeg\" alt=\"Cựu nữ sinh Ngoại thương đẹp dịu dàng bên cúc họa mi đầu mùa - 5\">\n<figcaption>Dù không theo đuổi con đường nghệ thuật nhưng Bảo Ngọc cũng thường đi chụp ảnh để lưu giữ những khoảnh khắc đáng nhớ của tuổi thanh xuân. Ngọc cảm thấy hài lòng với những trải nghiệm của chính mình.</figcaption>\n</figure>\n<figure class=\"image\"><img title=\"Cựu nữ sinh Ngoại thương đẹp dịu dàng bên cúc họa mi đầu mùa - 6\" src=\"https://icdn.dantri.com.vn/thumb_w/640/2020/10/28/cuu-nu-sinh-ngoai-thuong-dep-diu-dang-ben-cuc-hoa-mi-dau-muadocx-1603883279608.jpeg\" alt=\"Cựu nữ sinh Ngoại thương đẹp dịu dàng bên cúc họa mi đầu mùa - 6\">\n<figcaption>\n<p>Trong các mối quan hệ, kể cả tình yêu hay tình bạn, Bảo Ngọc đều đề cao sự chân thành, thẳng thắn và biết lắng nghe để thấu hiểu cho nhau. Cô được mọi người xung quanh yêu quý nhờ tình cách hòa đồng, thân thiện, biết cách lắng nghe và thấu hiểu.</p>\n</figcaption>\n</figure>\n<figure class=\"image\"><img title=\"Cựu nữ sinh Ngoại thương đẹp dịu dàng bên cúc họa mi đầu mùa - 7\" src=\"https://icdn.dantri.com.vn/thumb_w/640/2020/10/28/cuu-nu-sinh-ngoai-thuong-dep-diu-dang-ben-cuc-hoa-mi-dau-muadocx-1603883279686.jpeg\" alt=\"Cựu nữ sinh Ngoại thương đẹp dịu dàng bên cúc họa mi đầu mùa - 7\">\n<figcaption>Ngoài thời gian dành cho công việc, Bảo Ngọc thích gặp gỡ bạn bè, cũng như có thể khám phá thêm những miền đất mới. Với Ngọc, những chuyến xê dịch giúp cô mở rộng vốn sống, biết được nhiều điều thú vị và tiếp xúc với những con người mới.</figcaption>\n</figure>\n<figure class=\"image\"><img title=\"Cựu nữ sinh Ngoại thương đẹp dịu dàng bên cúc họa mi đầu mùa - 8\" src=\"https://icdn.dantri.com.vn/thumb_w/640/2020/10/28/cuu-nu-sinh-ngoai-thuong-dep-diu-dang-ben-cuc-hoa-mi-dau-muadocx-1603883279757.jpeg\" alt=\"Cựu nữ sinh Ngoại thương đẹp dịu dàng bên cúc họa mi đầu mùa - 8\">\n<figcaption>Bộ ảnh bên cúc họa mi đầu mùa của Bảo Ngọc nhận được nhiều lời tán dương có cánh từ phía cư dân mạng. Cúc họa mi cũng là loài hoa mà Bảo Ngọc rất yêu thích.</figcaption>\n</figure>\n<figure class=\"image\"><img title=\"Cựu nữ sinh Ngoại thương đẹp dịu dàng bên cúc họa mi đầu mùa - 9\" src=\"https://icdn.dantri.com.vn/thumb_w/640/2020/10/28/cuu-nu-sinh-ngoai-thuong-dep-diu-dang-ben-cuc-hoa-mi-dau-muadocx-1603883279835.jpeg\" alt=\"Cựu nữ sinh Ngoại thương đẹp dịu dàng bên cúc họa mi đầu mùa - 9\">\n<figcaption>Khoảnh khắc khiến bao chàng “nguyện trao tim”.</figcaption>\n</figure>\n<p><strong>Tuệ Nhi</strong></p>\n<p><em>Ảnh:</em><strong> Lương Minh Quang</strong></p>\n            <div></div>', 250, 1, '2020-10-30 09:05:20', 'thanhnnt', '2020-10-30 09:05:20', 'thanhnnt', 'https://icdn.dantri.com.vn/thumb_w/640/2020/10/28/cuu-nu-sinh-ngoai-thuong-dep-diu-dang-ben-cuc-hoa-mi-dau-muadocx-1603883279151.jpeg'),
(12, 'Nữ sinh ĐH Ngoại thương năng động, trong trẻo như nắng mai', 'Nu-sinh-ĐH-Ngoai-thuong-nang-đong,-trong-treo-nhu-nang-mai-1604023650598', 'Nguyễn Linh An (sinh năm 2000, Hà Nội) hiện đang là sinh viên năm 3, ngành Luật Thương mại Quốc tế, ĐH Ngoại thương. Cô gái này sở hữu nhan sắc xinh xắn, trong trẻo như nắng mai.', '2020-10-30 09:07:30', NULL, 1, 4, '<p>Chia sẻ về việc lựa chọn ngành học, Linh An cho biết: “Ngành luật là ngành em yêu thích và cũng là ngành em đặt mục tiêu từ lúc thi đại học.</p>\n<p>Em muốn theo học để có thêm có kiến thức chung về luật pháp cũng như có thêm nghiệp vụ trong Luật Thương mại Quốc tế, để có thể áp dụng các công việc sau này”.&nbsp;</p>\n<figure class=\"image\"><img title=\"Nữ sinh ĐH Ngoại thương năng động, trong trẻo như nắng mai - 1\" src=\"https://icdn.dantri.com.vn/thumb_w/640/2020/10/27/nu-sinh-dh-ngoai-thuong-vua-xinh-xan-lai-nang-dongdocx-1603786151007.jpeg\" alt=\"Nữ sinh ĐH Ngoại thương năng động, trong trẻo như nắng mai - 1\">\n<figcaption>Nguyễn Linh An hiện đang là sinh viên ngành Luật Thương mại Quốc tế, ĐH Ngoại thương.</figcaption>\n</figure>\n<figure class=\"image\"><img title=\"Nữ sinh ĐH Ngoại thương năng động, trong trẻo như nắng mai - 2\" src=\"https://icdn.dantri.com.vn/thumb_w/640/2020/10/27/nu-sinh-dh-ngoai-thuong-vua-xinh-xan-lai-nang-dongdocx-1603786151467.jpeg\" alt=\"Nữ sinh ĐH Ngoại thương năng động, trong trẻo như nắng mai - 2\">\n<figcaption>An sở hữu nhan sắc xinh xắn, trong trẻo như nắng mai.</figcaption>\n</figure>\n<p>Kể từ khi bước chân vào môi trường giảng đường, Linh An hăng say tham gia các hoạt động chung, phát triển tốt các kỹ năng cần thiết. Với cô gái này, bước ngoặt lớn có lẽ là việc em đã từ bỏ các công việc cũ của năm nhất như trợ giảng, gia sư để theo đuổi nhiếp ảnh. Dù gặp phải những khó khăn nhất định, nhưng đến nay, Linh An cảm thấy hài lòng với quyết định của mình.&nbsp;</p>\n<p>“Em mong muốn bản thân được làm chính mình, làm công việc mình yêu thích và gặt hái được nhiều thành công trong lĩnh vực đó. Hiện tại, em đã có tiệm ảnh nhỏ tự thành lập. Tiệm ảnh đã và đang hoạt động khá tốt”, cô tâm sự.</p>\n<p>Tất nhiên Linh An vẫn ưu tiên việc học và các hoạt động ở trường. Hiện, Linh An đang là đại sứ chương trình F-Debate.&nbsp;</p>\n<figure class=\"image\"><img title=\"Nữ sinh ĐH Ngoại thương năng động, trong trẻo như nắng mai - 3\" src=\"https://icdn.dantri.com.vn/thumb_w/640/2020/10/27/nu-sinh-dh-ngoai-thuong-vua-xinh-xan-lai-nang-dongdocx-1603786151527.jpeg\" alt=\"Nữ sinh ĐH Ngoại thương năng động, trong trẻo như nắng mai - 3\">\n<figcaption>Linh An cũng năng nổ trong các hoạt động chung.</figcaption>\n</figure>\n<figure class=\"image\"><img title=\"Nữ sinh ĐH Ngoại thương năng động, trong trẻo như nắng mai - 4\" src=\"https://icdn.dantri.com.vn/thumb_w/640/2020/10/27/nu-sinh-dh-ngoai-thuong-vua-xinh-xan-lai-nang-dongdocx-1603786151595.jpeg\" alt=\"Nữ sinh ĐH Ngoại thương năng động, trong trẻo như nắng mai - 4\">\n<figcaption>Với An, việc tham gia hoạt động tập thể là một trong những cách để rèn luyện, hoàn thiện bản thân mỗi ngày.</figcaption>\n</figure>\n<figure class=\"image\"><img title=\"Nữ sinh ĐH Ngoại thương năng động, trong trẻo như nắng mai - 5\" src=\"https://icdn.dantri.com.vn/thumb_w/640/2020/10/27/nu-sinh-dh-ngoai-thuong-vua-xinh-xan-lai-nang-dongdocx-1603786151645.jpeg\" alt=\"Nữ sinh ĐH Ngoại thương năng động, trong trẻo như nắng mai - 5\">\n<figcaption>Linh An cảm thấy hài lòng với cuộc sống hiện tại.</figcaption>\n</figure>\n<p>Nữ sinh xinh xắn này chia sẻ: “Chương trình F-Debate là 1 sân chơi có quy mô lớn dành cho các em học sinh cấp 3 toàn quốc do trường Đại học Ngoại Thương tổ chức. Điều đặc biệt của cuộc thi này là tất cả phải sử dụng bằng tiếng Anh.</p>\n<p>Tại đây các em sẽ được mở rộng kiến thức về tranh biện, rèn luyện các kỹ năng làm việc nhóm, suy luận logic và có các cơ hội được trải nghiệm môi trường ĐH Ngoại thương, giao lưu với anh chị sinh viên ưu tú và giảng viên của trường.&nbsp;</p>\n<p>Là một đại sứ của chương trình, em có vai trò quan trọng trong việc kết nối giữa Ban tổ chức và các thí sinh. Em sẽ đại diện và mang lại hình ảnh đẹp của cuộc thi tới tất cả mọi người xung quanh”.</p>\n<figure class=\"image\"><img title=\"Nữ sinh ĐH Ngoại thương năng động, trong trẻo như nắng mai - 6\" src=\"https://icdn.dantri.com.vn/thumb_w/640/2020/10/27/nu-sinh-dh-ngoai-thuong-vua-xinh-xan-lai-nang-dongdocx-1603786151688.jpeg\" alt=\"Nữ sinh ĐH Ngoại thương năng động, trong trẻo như nắng mai - 6\">\n<figcaption>An thích làm phó nháy hơn là làm người mẫu ảnh.</figcaption>\n</figure>\n<p>Linh An luôn làm việc một cách nghiêm túc và thực hiện theo kế hoạch đã đề ra. Khi làm việc, An muốn lan toả năng lượng tích cực đến với mọi người để hoàn thiện công việc một cách thoải mái nhất. Đó cũng là lý do cô gái này luôn nhận được thiện cảm dễ mến từ mọi người.&nbsp;</p>\n<p>Cũng theo quan điểm của nữ sinh 10X, thông minh giúp em có sự suy luận logic, dễ dàng đưa ra các quyết định đúng đắn trong cuộc sống và đó cũng là một điểm mạnh. Tuy nhiên nếu vừa thông minh vừa xinh đẹp thì ắt hẳn đó là một lợi thế vô cùng lớn.</p>\n<p>Chính vì vậy, Linh An luôn cố gắng trau dồi kiến thức để nâng cao trí tuệ cũng như rèn luyện sự thông minh nhưng vẫn không quên chăm chút cho bản thân trở nên xinh đẹp hơn.</p>\n<figure class=\"image\"><img title=\"Nữ sinh ĐH Ngoại thương năng động, trong trẻo như nắng mai - 7\" src=\"https://icdn.dantri.com.vn/thumb_w/640/2020/10/27/nu-sinh-dh-ngoai-thuong-vua-xinh-xan-lai-nang-dongdocx-1603786151749.jpeg\" alt=\"Nữ sinh ĐH Ngoại thương năng động, trong trẻo như nắng mai - 7\">\n<figcaption>Linh An luôn cố gắng đặt ra mục tiêu cho cuộc đời mình.</figcaption>\n</figure>\n<p>Được nhiều người chú ý giúp cho công việc của Linh An có phần thuận lợi và trở nên dễ dàng hơn. “Tuy nhiên, những điều khiến em phiền toái đó là rất nhiều nơi đã sử dụng tràn lan hình ảnh của em nhằm mục đích thương mại mà không liên hệ tới em. Có một số trường hợp còn giả mạo em để bán hàng, lừa đảo”, An nói.&nbsp;</p>\n<figure class=\"image\"><img title=\"Nữ sinh ĐH Ngoại thương năng động, trong trẻo như nắng mai - 8\" src=\"https://icdn.dantri.com.vn/thumb_w/640/2020/10/27/nu-sinh-dh-ngoai-thuong-vua-xinh-xan-lai-nang-dongdocx-1603786151801.jpeg\" alt=\"Nữ sinh ĐH Ngoại thương năng động, trong trẻo như nắng mai - 8\"></figure>\n<p><strong>Tuệ Nhi</strong></p>\n<p><em>Ảnh: NVCC</em></p>\n            <div></div>', 299, 1, '2020-10-30 09:07:30', 'thanhnnt', '2020-10-30 09:07:30', 'thanhnnt', 'https://icdn.dantri.com.vn/thumb_w/640/2020/10/27/nu-sinh-dh-ngoai-thuong-vua-xinh-xan-lai-nang-dongdocx-1603786151007.jpeg'),
(13, '3 trong số 26 ngư dân vụ chìm tàu được tàu nước ngoài cứu sống', '3-trong-so-26-ngu-dan-vu-chim-tau-đuoc-tau-nuoc-ngoai-cuu-song-1604025432671', '3 ngư dân tỉnh Bình Định bị chìm tàu trên đường đi tránh bão ở vùng biển Khánh Hòa đã được một tàu nước ngoài cứu sống.', '2020-10-30 09:37:12', NULL, 13, 4, '<p>Sáng 30/10, ông Hồ Đắc Chương, Chi cục trưởng Chi cục Thủy lợi - Chánh Văn phòng Ban chỉ huy PCTT&amp;TKCN tỉnh Bình Định xác nhận 3 ngư dân tỉnh này bị chìm tàu trên đường đi tránh bão ở vùng biển Khánh Hòa đã được một tàu nước ngoài cứu vớt. Hiện sức khỏe của 3 ngư dân này tạm thời ổn định sau nhiều ngày trên biển.</p>\n<figure class=\"image align-center\"><img title=\"3 trong số 26 ngư dân vụ chìm tàu được tàu nước ngoài cứu sống  - 1\" src=\"https://icdn.dantri.com.vn/thumb_w/640/2020/10/30/3-1604017308797.jpg\" alt=\"3 trong số 26 ngư dân vụ chìm tàu được tàu nước ngoài cứu sống  - 1\">\n<figcaption>Chị Huỳnh Thị Phương (40 tuổi, vợ của thuyền trưởng Võ Ngọc Đô khóc nghẹn khi trao đổi với phóng viên.</figcaption>\n</figure>\n<p>Theo thông tin ban đầu, gần 18h ngày 29/10, thuyền trưởng tàu M/V Fortune Iris gọi điện thoại đến Đài thông tin duyên hải Nha Trang thông báo đã cứu được 3 thuyền viên từ tàu BĐ 97469 TS gồm: Lê Minh Don (20 tuổi), Phan Quốc Quy (35 tuổi), Võ Văn Hoài (35 tuổi). Hiện sức khỏe của 3 ngư dân này tạm thời ổn định.</p>\n<p>Thông qua thuyền trưởng tàu M/V Fortune Iris, Đài Thông tin duyên hải Nha Trang liên lạc được với anh Lê Minh Don. Ngư dân này cho biết trong 14 thuyền viên của tàu BĐ 97469 TS hiện có 4 người mất tích không rõ thông tin, 2 người chết khi tàu vừa chìm, còn lại 5 thuyền viên đã mất trên biển do kiệt sức.</p>\n<p>Ông Chương cho biết thêm, hiện các cơ quan chức năng của Việt Nam đang liên lạc, làm việc với tàu M/V Fortune Iris và đã tiếp nhận 3 ngư dân được cứu sống.</p>\n<p>Phó Chủ tịch UNND thị xã Hoài Nhơn (Bình Định), Nguyễn Chí Công cũng xác nhận thông tin trên, đồng thời đã chỉ đạo phường, xã cùng gia đình vào Nhà Trang để đón các ngư dân trở về.&nbsp;</p>\n<p>Như <em>Dân trí</em> đã thông tin, chiều 27/10, đang trên tàu đi tránh bão số 9, tàu BĐ 97469 TS do ông Võ Ngọc Đô (ở xã Hoài Hải, thị xã Hoài Nhơn, Bình Định) làm thuyền trưởng bị phá nước, chìm trên vùng biển cách TP Nha Trang (Khánh Hòa) 172 hải lý theo hướng Đông, cách đảo Song Tử Tây khoảng 140 hải lý theo hướng tây bắc. Trên tàu cá này có 14 ngư dân Bình Định. Khi tàu cá bị chìm, vùng biển trên có gió mạnh cấp 7, giật cấp 10 do bão số 9.</p>\n<p>Cũng trong chiều 27/10, trên đường chạy vào vịnh Cam Ranh (Khánh Hòa) để tránh bão số 9, tàu cá BĐ 96388 TS do Lê Vạn (ở phường Hoài Thanh, thị xã Hoài Nhơn) làm chủ ủy quyền cho ông Nguyễn Văn Minh (ở phường Tam Quan Nam, thị xã Hoài Nhơn) làm thuyền trưởng. Tàu cá này cũng bị phá nước, chìm trên vùng biển cách TP Cam Ranh khoảng 130 hải lý về phía biển đông. Khi bị nạn, trên tàu có 12 ngư dân. Sau đó, tàu cá BĐ 98658 TS đang ở gần đó tiếp cận được tàu BĐ 96388 TS bị nạn nhưng không tìm thấy 12 ngư dân trên tàu.</p>\n<p>Trong những ngày qua, các tàu kiểm ngư cùng máy bay của Quân chủng Hải quân tổ chức tìm kiếm các ngư dân Bình Định mất tích trên vùng biển Khánh Hòa.</p>\n<p><strong>Doãn Công</strong></p>\n            <div></div>', 146, 1, '2020-10-30 09:37:12', 'thanhnnt', '2020-10-30 09:37:12', 'thanhnnt', 'https://icdn.dantri.com.vn/thumb_w/640/2020/10/30/3-1604017308797.jpg'),
(14, 'Thủ tướng đăng đàn trong phiên chất vấn “đặc biệt”', 'Thu-tuong-đang-đan-trong-phien-chat-van-“đac-biet”-1604025546121', 'Theo chương trình dự kiến, Thủ tướng Nguyễn Xuân Phúc có khoảng 2 giờ đăng đàn, trực tiếp trả lời chất vấn \"chốt\" lại toàn bộ nhiệm kỳ Quốc hội khoá XIV.', '2020-10-30 09:39:06', NULL, 13, 4, '<p>Chương trình cụ thể, các phiên họp chất vấn và trả lời chất vấn tại kỳ họp thứ 10 sẽ diễn ra trong cả ngày 6, 9/11 và sáng 10/11/2020 với tổng lượng thời gian 2,5 ngày.</p>\n<figure class=\"image align-center\"><img title=\"Thủ tướng đăng đàn trong phiên chất vấn “đặc biệt” - 1\" src=\"https://icdn.dantri.com.vn/thumb_w/640/2020/10/30/thu-tuong-1-1604021809397.jpg\" alt=\"Thủ tướng đăng đàn trong phiên chất vấn “đặc biệt” - 1\">\n<figcaption>Thủ tướng Nguyễn Xuân Phúc tại một phiên trả lời chất vấn trước Quốc hội.</figcaption>\n</figure>\n<p>Sáng 6/11, sau khi nghe Chủ tịch Quốc hội phát biểu mở đầu phiên chất vấn, Quốc hội sẽ dành 60 phút nghe Phó Thủ tướng Thường trực Chính phủ Trương Hòa Bình, Chánh án TAND tối cao Nguyễn Hoà Bình, Viện trưởng VKSND tối cao Lê Minh Trí trình bày báo cáo việc thực hiện các nghị quyết của Quốc hội về giám sát chuyên đề và chất vấn trong nhiệm kỳ khóa XIV và một số nghị quyết trong nhiệm kỳ khóa XIII.</p>\n<p>Sau đó Tổng Thư ký Quốc hội - Chủ nhiệm Văn phòng Quốc hội Nguyễn Hạnh Phúc sẽ có báo cáo tổng hợp ý kiến thẩm tra của Hội đồng Dân tộc, các Ủy ban về việc thực hiện các nghị quyết nói trên.</p>\n<p>Từ 9h50 (sau khi giải lao 20phút), đại biểu Quốc hội chất vấn các thành viên Chính phủ, Chánh án TAND tối cao, Viện trưởng VKSND tối cao về việc thực hiện các nghị quyết nói trên của Quốc hội. Việc này tiếp tục diễn ra đến 9h sáng 10/11.</p>\n<p>Đây sẽ là phiên chất vấn để đánh giá kết quả nhiệm kỳ khoá XIV, nhìn nhận lại việc thực hiện lời hứa của Chính phủ, các tư lệnh ngành, lĩnh vực, kết quả thực hiện các nghị quyết giám sát chuyên đề và nghị quyết chất vấn, trả lời chất vấn của Quốc hội từ những kỳ họp đầu tiên và cả những nghị quyết được chuyển giao từ Quốc hội khóa trước.</p>\n<p>Trong một phiên chất vấn “mở”, bất kỳ thành viên Chính phủ, Bộ trưởng, Trưởng ngành nào cũng có thể “lên ghế nóng”, cũng phải sẵn sàng trả lời chất vấn của đại biểu Quốc hội. Sau đó, Quốc hội sẽ có nghị quyết để chuyển cho Quốc hội khóa sau tiếp tục giám sát, chất vấn.</p>\n<p>Tổng thư ký Quốc hội Nguyễn Hạnh Phúc nhận định: “Quốc hội sẽ giám sát đến cùng những vấn đề đã chỉ ra. Kỳ họp này chắc chắn nội dung chất vấn sẽ rất sôi động”.</p>\n<p>Trong 2,5 ngày, thời gian dành cho Thủ tướng Chính phủ Nguyễn Xuân Phúc phát biểu làm rõ thêm một số vấn đề liên quan thuộc trách nhiệm của Chính phủ và trực tiếp trả lời chất vấn của đại biểu Quốc hội là từ 9h đến 11h15 (giải lao từ 9h30-9h50).</p>\n<p>Kỳ họp thứ 8 (tháng 11/2019), người đứng đầu Chính phủ sau khi trình bày báo cáo đã dành 60 phút trả lời trực tiếp chất vấn của đại biểu Quốc hội.</p>\n<p>Khi đó, đại biểu Tô Văn Tám đặt vấn đề: tái cơ cấu nền kinh tế, đổi mới mô hình kinh tế tăng trưởng giai đoạn vừa qua đã đạt được một số kết quả nhưng vẫn chậm, sức cạnh tranh của nền kinh tế doanh nghiệp và sản phẩm vẫn còn yếu so với các nước, Việt Nam có rất ít những doanh nghiệp lớn có khả năng cạnh tranh quốc tế. Chất vấn của đại biểu Tám với Thủ tướng là: còn hơn 1 năm nữa là hết nhiệm kỳ, Thủ tướng dự kiến sẽ có giải pháp đột phá gì để cải thiện thực trạng trên?</p>\n<p>Trả lời câu hỏi này, Thủ tướng cho rằng phải tiếp tục đẩy mạnh tái cơ cấu nền kinh tế, chuyển đổi mô hình tăng trưởng tốt hơn nữa, làm nền tảng cho sự phát triển.</p>\n<p>Thủ tướng cũng nhắc đến yêu cầu phải làm tốt xây dựng thể chế, tháo gỡ điểm nghẽn về nguồn nhân lực, đặc biệt là hạ tầng chất lượng cao. Việc cần làm, theo Thủ tướng là tạo môi trường thuận lợi để phát triển kinh tế, tái cơ cấu nền kinh tế. Trong đó Nhà nước tạo thuận lợi về thủ tục gia nhập thị trường, rút khỏi thị trường, Nhà nước can thiệp thị trường bằng công cụ kinh tế chứ không bao cấp cho sự yếu kém, không bao cấp tràn lan.</p>\n<p>Thủ tướng khẳng định, nhà nước phải có biện pháp mạnh hơn nữa tốt hơn nữa để quá trình tái cơ cấu diễn ra nhanh hơn.</p>\n<p><strong>Phương Thảo </strong></p>', 192, 1, '2020-10-30 09:39:06', 'thanhnnt', '2020-10-30 09:39:06', 'thanhnnt', 'https://icdn.dantri.com.vn/thumb_w/640/2020/10/30/thu-tuong-1-1604021809397.jpg');
INSERT INTO `post` (`Id`, `Title`, `Slug`, `Summary`, `Publish_Date`, `Is_Draft`, `Category_Id`, `Source_Id`, `Content`, `Read_Time`, `Is_Active`, `Created`, `Created_By`, `Modified`, `Modified_By`, `Avatar`) VALUES
(15, 'Băng rừng, vượt 20 điểm sạt lở để cứu hộ nạn nhân bị vùi lấp ở Trà Vân', 'Bang-rung,-vuot-20-điem-sat-lo-đe-cuu-ho-nan-nhan-bi-vui-lap-o-Tra-Van-1604025919124', 'Trong ngày 29/10, các lực lượng chức năng đã đi bộ băng rừng, vượt 20 điểm sạt lở, cùng lực lượng tại chỗ thực hiện cứu hộ, cứu nạn ở Trà Vân.', '2020-10-30 09:45:19', NULL, 2, 4, '<p><span><strong>Điều bí ẩn về ngôi đền thờ \"thần chó\" giữa trung tâm Hà Nội</strong></span></p>\n<p><em><span>Nằm trên một hòn đảo nhỏ ở phía Tây Bắc hồ Trúc Bạch (quận Ba Đình - Hà Nội), đền Thủy Trung Tiên (còn gọi là đền Cẩu Nhi) từ xa xưa đã gắn liền với văn hóa tâm linh thờ Thần Chó của người Việt. &nbsp;</span></em></p>\n<figure class=\"video\"><video poster=\"https://icdn.dantri.com.vn/thumb-video/2020/10/29/dsc-3468-1603979377682/0_00_26.jpg\" width=\"1920\" height=\"1080\"></video>\n<figcaption>Điều bí ẩn về ngôi đền thờ \"thần chó\" giữa trung tâm Hà Nội</figcaption>\n</figure>\n<figure class=\"image align-overflow\"><img title=\"Bí ẩn về ngôi đền thờ thần chó giữa trung tâm Hà Nội - 1\" src=\"https://icdn.dantri.com.vn/2020/10/29/den-thuy-trung-tien-1603974674509.jpg\" alt=\"Bí ẩn về ngôi đền thờ thần chó giữa trung tâm Hà Nội - 1\"></figure>\n<p><span>Đền Thủy Trung Tiên nằm trên một đảo nhỏ ở góc hồ Trúc Bạch. Đền còn có tên khác là đền Cẩu Nhi. Đền được xây dựng từ thời nhà Lý, gắn với truyền thuyết 2 mẹ con chú chó hóa thần. Đây cũng là đền thờ Thần Chó độc đáo nhất tại Việt Nam.&nbsp;</span></p>\n<figure class=\"image align-overflow\"><img title=\"Bí ẩn về ngôi đền thờ thần chó giữa trung tâm Hà Nội - 2\" src=\"https://icdn.dantri.com.vn/2020/10/29/den-thuy-trung-tien-2-1603974675634.jpg\" alt=\"Bí ẩn về ngôi đền thờ thần chó giữa trung tâm Hà Nội - 2\">\n<figcaption>\n<p>Tượng chó con bằng đá đặt ngay tại đầu cầu đá ở lối vào đền.&nbsp;</p>\n</figcaption>\n</figure>\n\n<p>Đền Cẩu Nhi gắn với sự tích vua Lý Công Uẩn lên ngôi và dời đô về Thăng Long.</p>\n<p>Theo một tích xưa truyền lại, nơi đây do vua Lý Công Uẩn cho xây để thờ cặp chó mẹ - chó con thành thần. Chó con khi sinh ra, trên lông có những vết đốm ghép lại thành chữ \"Thiên tử\" ứng với việc vua Lý Công Uẩn lên ngôi.</p>\n<p>Năm 1980, ngôi đền cũ bị dỡ bỏ để làm sân chơi, nhà kho. Sau đó, nơi đây từng có thời gian được sử dụng làm quán giải khát. Dự án phục dựng đền được thành phố phê duyệt năm 2014, đến năm 2015 thì triển khai thực hiện.&nbsp;</p>\n<p>Tuy nhiên, khi đền được khánh thành Ban Quản lý quyết định đặt tên mới cho&nbsp;đền là đền Thủy Trung Tiên&nbsp;chứ không còn gọi là&nbsp;Cẩu Nhi như trước.</p>\n<figure class=\"image align-overflow\"><img title=\"Bí ẩn về ngôi đền thờ thần chó giữa trung tâm Hà Nội - 3\" src=\"https://icdn.dantri.com.vn/2020/10/29/den-thuy-trung-tien-4-1603974674737.jpg\" alt=\"Bí ẩn về ngôi đền thờ thần chó giữa trung tâm Hà Nội - 3\"></figure>\n<p>Đền được xây hình chữ nhật, nằm thơ mộng tại một đảo nhỏ trên hồ Trúc Bạch, gần cuối đường Thanh Niên, xung quanh đền có nhiều cây xanh cổ thụ bao bọc. Mái đền uốn cong, ngói đền là loại ngói vẩy cá theo kiến trúc đền chùa truyền thống.</p>\n<figure class=\"image align-overflow\"><img title=\"Bí ẩn về ngôi đền thờ thần chó giữa trung tâm Hà Nội - 4\" src=\"https://icdn.dantri.com.vn/2020/10/29/den-thuy-trung-tien-5-1603974674784.jpg\" alt=\"Bí ẩn về ngôi đền thờ thần chó giữa trung tâm Hà Nội - 4\"></figure>\n<p>Ngày nay đền Thủy Trung Tiên thờ Mẫu Thoải và là một địa điểm tâm linh độc đáo trong quần thể thắng cảnh Hồ Tây - hồ Trúc Bạch.</p>\n<figure class=\"image align-overflow\"><img title=\"Bí ẩn về ngôi đền thờ thần chó giữa trung tâm Hà Nội - 5\" src=\"https://icdn.dantri.com.vn/2020/10/29/den-thuy-trung-tien-11-1603974676385.jpg\" alt=\"Bí ẩn về ngôi đền thờ thần chó giữa trung tâm Hà Nội - 5\"></figure>\n<figure class=\"image align-overflow\"><img title=\"Bí ẩn về ngôi đền thờ thần chó giữa trung tâm Hà Nội - 6\" src=\"https://icdn.dantri.com.vn/2020/10/29/den-thuy-trung-tien-16-1603974671531.jpg\" alt=\"Bí ẩn về ngôi đền thờ thần chó giữa trung tâm Hà Nội - 6\"></figure>\n<p>Đặc biệt, toàn bộ tượng, chông, chân nến… trong đền đều được chế tác bởi các nghệ nhân làng đúc đồng Ngũ Xã nổi tiếng bên hồ Trúc Bạch.</p>\n<div class=\"photo-grid align-overflow\">\n<div class=\"photo-row\">\n<figure class=\"image\"><img class=\"image-thumb\" title=\"Bí ẩn về ngôi đền thờ thần chó giữa trung tâm Hà Nội - 7\" src=\"https://icdn.dantri.com.vn/thumb_w/660/2020/10/29/den-thuy-trung-tien-12-1603974676410.jpg\" alt=\"Bí ẩn về ngôi đền thờ thần chó giữa trung tâm Hà Nội - 7\"></figure>\n<figure class=\"image\"><img class=\"image-thumb\" title=\"Bí ẩn về ngôi đền thờ thần chó giữa trung tâm Hà Nội - 8\" src=\"https://icdn.dantri.com.vn/thumb_w/660/2020/10/29/den-thuy-trung-tien-9-1603974676382.jpg\" alt=\"Bí ẩn về ngôi đền thờ thần chó giữa trung tâm Hà Nội - 8\"></figure>\n</div>\n<div class=\"photo-row\">\n<figure class=\"image\"><img class=\"image-thumb\" title=\"Bí ẩn về ngôi đền thờ thần chó giữa trung tâm Hà Nội - 9\" src=\"https://icdn.dantri.com.vn/thumb_w/660/2020/10/29/den-thuy-trung-tien-15-1603974676119.jpg\" alt=\"Bí ẩn về ngôi đền thờ thần chó giữa trung tâm Hà Nội - 9\"></figure>\n<figure class=\"image\"><img class=\"image-thumb\" title=\"Bí ẩn về ngôi đền thờ thần chó giữa trung tâm Hà Nội - 10\" src=\"https://icdn.dantri.com.vn/thumb_w/660/2020/10/29/den-thuy-trung-tien-14-1603974676092.jpg\" alt=\"Bí ẩn về ngôi đền thờ thần chó giữa trung tâm Hà Nội - 10\"></figure>\n</div>\n</div>\n<p>Nội thất bên trong đền cầu kì, sắc sảo thể hiện trên từng nét uốn lượn chạm khắc.</p>\n<figure class=\"image align-overflow\"><img title=\"Bí ẩn về ngôi đền thờ thần chó giữa trung tâm Hà Nội - 11\" src=\"https://icdn.dantri.com.vn/2020/10/29/den-thuy-trung-tien-13-1603974675902.jpg\" alt=\"Bí ẩn về ngôi đền thờ thần chó giữa trung tâm Hà Nội - 11\"></figure>\n<figure class=\"image align-overflow\"><img title=\"Bí ẩn về ngôi đền thờ thần chó giữa trung tâm Hà Nội - 12\" src=\"https://icdn.dantri.com.vn/2020/10/29/den-thuy-trung-tien-10-1603974675938.jpg\" alt=\"Bí ẩn về ngôi đền thờ thần chó giữa trung tâm Hà Nội - 12\"></figure>\n<p>Nằm ở vị trí đẹp trong quần thể thắng cảnh Hồ Tây - Trúc Bạch, đền thu hút khá nhiều du khách trong và ngoài nước ghé thăm.</p>\n<figure class=\"image align-overflow\"><img title=\"Bí ẩn về ngôi đền thờ thần chó giữa trung tâm Hà Nội - 13\" src=\"https://icdn.dantri.com.vn/2020/10/29/den-thuy-trung-tien-7-1603974675486.jpg\" alt=\"Bí ẩn về ngôi đền thờ thần chó giữa trung tâm Hà Nội - 13\"></figure>\n<p>Tháng 8-2017, đền Thủy Trung Tiên chính thức được khánh thành sau thời gian tôn tạo và được xếp hạng di tích lịch sử cấp thành phố.</p>\n<figure class=\"image align-overflow\"><img title=\"Bí ẩn về ngôi đền thờ thần chó giữa trung tâm Hà Nội - 14\" src=\"https://icdn.dantri.com.vn/2020/10/29/den-thuy-trung-tien-6-1603974674831.jpg\" alt=\"Bí ẩn về ngôi đền thờ thần chó giữa trung tâm Hà Nội - 14\"></figure>\n<figure class=\"image align-overflow\"><img title=\"Bí ẩn về ngôi đền thờ thần chó giữa trung tâm Hà Nội - 15\" src=\"https://icdn.dantri.com.vn/2020/10/29/den-thuy-trung-tien-17-1603974674764.jpg\" alt=\"Bí ẩn về ngôi đền thờ thần chó giữa trung tâm Hà Nội - 15\"></figure>\n<p>Đền được nối với bờ bằng cây cầu đá bắc qua mặt hồ Trúc Bạch. Cầu dài 18m gồm năm nhịp, mỗi nhịp dài 3,6m, rộng 2,25m</p>\n<p><strong>Toàn Vũ</strong></p>', 343, 1, '2020-10-30 09:45:19', 'thanhnnt', '2020-10-30 09:45:19', 'thanhnnt', 'https://icdn.dantri.com.vn/2020/10/29/den-thuy-trung-tien-1603974674509.jpg'),
(16, 'Loạt \"ma quỷ\" kinh dị tràn xuống phố hóa trang ở Hà Nội dịp Halloween', 'Loat-\"ma-quy\"-kinh-di-tran-xuong-pho-hoa-trang-o-Ha-Noi-dip-Halloween-1604025931617', 'Khác với màu sắc đỏ vàng của những món đồ chơi trung thu truyền thống, phố Hàng Mã những ngày gần đây “khoác lên bộ áo ma mị” mang đặc trưng của lễ Halloween.', '2020-10-30 09:45:31', NULL, 2, 4, '<figure class=\"video\"><video poster=\"https://icdn.dantri.com.vn/thumb-video/2020/10/30/hang-ma-ma-mi-truoc-le-halloween-1604019568530/0_01_43.jpg\" width=\"1920\" height=\"1080\"></video>\n<figcaption>Loạt \"ma quỷ\" kinh dị tràn xuống phố hóa trang ở Hà Nội dịp Halloween</figcaption>\n</figure>\n<figure class=\"image\"><img title=\"Loạt ma quỷ kinh dị tràn xuống phố hóa trang ở Hà Nội dịp Halloween - 1\" src=\"https://icdn.dantri.com.vn/thumb_w/640/2020/10/30/hang-ma-ma-mi-truoc-le-halloweendocx-1604017688832.jpeg\" alt=\"Loạt ma quỷ kinh dị tràn xuống phố hóa trang ở Hà Nội dịp Halloween - 1\">\n<figcaption>\n<p>Phố Hàng Mã là con phố bán đồ Halloween lớn nhất ở Hà Nội. Sát lễ hội hóa trang, con phố luôn tấp nập người đến mua hàng.</p>\n</figcaption>\n</figure>\n<figure class=\"image\"><img title=\"Loạt ma quỷ kinh dị tràn xuống phố hóa trang ở Hà Nội dịp Halloween - 2\" src=\"https://icdn.dantri.com.vn/thumb_w/640/2020/10/30/hang-ma-ma-mi-truoc-le-halloweendocx-1604017689276.jpeg\" alt=\"Loạt ma quỷ kinh dị tràn xuống phố hóa trang ở Hà Nội dịp Halloween - 2\">\n<figcaption>\n<p>Các cửa hàng với đủ loại đồ chơi, trang phục đặc trưng của lễ Halloween khiến con phố nổi tiếng ở thủ đô trở nên đầy ma mị, cuốn hút.</p>\n</figcaption>\n</figure>\n<figure class=\"image\"><img title=\"Loạt ma quỷ kinh dị tràn xuống phố hóa trang ở Hà Nội dịp Halloween - 3\" src=\"https://icdn.dantri.com.vn/thumb_w/640/2020/10/30/hang-ma-ma-mi-truoc-le-halloweendocx-1604017689465.jpeg\" alt=\"Loạt ma quỷ kinh dị tràn xuống phố hóa trang ở Hà Nội dịp Halloween - 3\">\n<figcaption>Các cửa hàng được trang trí bắt mắt theo từng chủ đề của từng ngày lễ. Với lễ hội hoá trang diễn ra thường niên vào ngày 31/10, không thể thiếu bí ngô, mũ áo phù thuỷ,...</figcaption>\n</figure>\n<figure class=\"image\"><img title=\"Loạt ma quỷ kinh dị tràn xuống phố hóa trang ở Hà Nội dịp Halloween - 4\" src=\"https://icdn.dantri.com.vn/thumb_w/640/2020/10/30/hang-ma-ma-mi-truoc-le-halloweendocx-1604017689572.jpeg\" alt=\"Loạt ma quỷ kinh dị tràn xuống phố hóa trang ở Hà Nội dịp Halloween - 4\">\n<figcaption>\n<p>Đèn bí ngô là một trong những mặt hàng phổ biến mà mọi cửa hàng trên phố Hàng Mã đều có.</p>\n</figcaption>\n</figure>\n<figure class=\"image\"><img title=\"Loạt ma quỷ kinh dị tràn xuống phố hóa trang ở Hà Nội dịp Halloween - 5\" src=\"https://icdn.dantri.com.vn/thumb_w/640/2020/10/30/hang-ma-ma-mi-truoc-le-halloweendocx-1604017689768.jpeg\" alt=\"Loạt ma quỷ kinh dị tràn xuống phố hóa trang ở Hà Nội dịp Halloween - 5\">\n<figcaption>\n<p>“Giá dao động chỉ vài chục nghìn đến trăm nghìn với đủ các mẫu mã như có đèn, không đèn, tròn hoặc méo nên đèn bí ngô khá dễ bán. Đồng thời, đây cũng là một trong những đặc trưng vốn có của lễ Halloween.”, một người bán hàng chia sẻ.</p>\n</figcaption>\n</figure>\n<figure class=\"image\"><img title=\"Loạt ma quỷ kinh dị tràn xuống phố hóa trang ở Hà Nội dịp Halloween - 6\" src=\"https://icdn.dantri.com.vn/thumb_w/640/2020/10/30/hang-ma-ma-mi-truoc-le-halloweendocx-1604017689902.jpeg\" alt=\"Loạt ma quỷ kinh dị tràn xuống phố hóa trang ở Hà Nội dịp Halloween - 6\">\n<figcaption>Đây là lần đầu tiền bé Đỗ Tú Anh (3 tuổi, nhà ở Yên Phụ) được chị Bùi Kim Thuỷ cho đi chơi ở Hàng Mã mua đồ chuẩn bị đón lễ hội hoá trang. Bé tỏ ra rất thích thú với các món đồ chơi ở cửa hàng, đặc biệt là đèn bí ngô.</figcaption>\n</figure>\n<figure class=\"image\"><img title=\"Loạt ma quỷ kinh dị tràn xuống phố hóa trang ở Hà Nội dịp Halloween - 7\" src=\"https://icdn.dantri.com.vn/thumb_w/640/2020/10/30/hang-ma-ma-mi-truoc-le-halloweendocx-1604017690197.jpeg\" alt=\"Loạt ma quỷ kinh dị tràn xuống phố hóa trang ở Hà Nội dịp Halloween - 7\">\n<figcaption>Bảo Hân cùng hai em sinh đôi của mình là Song Nhi và Song Ngư ngộ nghĩnh, đáng yêu trong bộ trang phục phù thuỷ.</figcaption>\n</figure>\n<figure class=\"image\"><img title=\"Loạt ma quỷ kinh dị tràn xuống phố hóa trang ở Hà Nội dịp Halloween - 8\" src=\"https://icdn.dantri.com.vn/thumb_w/640/2020/10/30/hang-ma-ma-mi-truoc-le-halloweendocx-1604017690287.jpeg\" alt=\"Loạt ma quỷ kinh dị tràn xuống phố hóa trang ở Hà Nội dịp Halloween - 8\">\n<figcaption>\n<p>Đây vừa là nơi tham quan, vừa là địa điểm vui chơi của các em nhỏ.</p>\n</figcaption>\n</figure>\n<figure class=\"image\"><img title=\"Loạt ma quỷ kinh dị tràn xuống phố hóa trang ở Hà Nội dịp Halloween - 9\" src=\"https://icdn.dantri.com.vn/thumb_w/640/2020/10/30/hang-ma-ma-mi-truoc-le-halloweendocx-1604017690471.jpeg\" alt=\"Loạt ma quỷ kinh dị tràn xuống phố hóa trang ở Hà Nội dịp Halloween - 9\">\n<figcaption>“Mình không hiểu nhiều về lễ Halloween lắm vì đây không phải lễ truyền thống ở Việt Nam. Tuy nhiên, những năm gần đây, lễ Halloween đã dần phổ biến và mọi người đi chơi đón lễ nhiều hơn. Mọi năm trên Hàng Mã có bán rất nhiều mặt hàng về ngày lễ nên mình hay lên đây chơi và mua sắm cho có không khí.”, bạn Thu Giang (Hà Nội) chia sẻ.</figcaption>\n</figure>\n<figure class=\"image\"><img title=\"Loạt ma quỷ kinh dị tràn xuống phố hóa trang ở Hà Nội dịp Halloween - 10\" src=\"https://icdn.dantri.com.vn/thumb_w/640/2020/10/30/hang-ma-ma-mi-truoc-le-halloweendocx-1604017690556.jpeg\" alt=\"Loạt ma quỷ kinh dị tràn xuống phố hóa trang ở Hà Nội dịp Halloween - 10\">\n<figcaption></figcaption>\n</figure>\n<figure class=\"image\"><img title=\"Loạt ma quỷ kinh dị tràn xuống phố hóa trang ở Hà Nội dịp Halloween - 11\" src=\"https://icdn.dantri.com.vn/thumb_w/640/2020/10/30/hang-ma-ma-mi-truoc-le-halloweendocx-1604017690797.jpeg\" alt=\"Loạt ma quỷ kinh dị tràn xuống phố hóa trang ở Hà Nội dịp Halloween - 11\">\n<figcaption>\n<p>Bên cạnh các mặt hàng đơn giản, nhiều sản phẩm kinh dị như mặt nạ, mô hình xác chết, chân người chảy máu, bia mộ,... khiến không ít khách hàng giật mình khi nhìn thấy.</p>\n</figcaption>\n</figure>\n<figure class=\"image\"><img title=\"Loạt ma quỷ kinh dị tràn xuống phố hóa trang ở Hà Nội dịp Halloween - 12\" src=\"https://icdn.dantri.com.vn/thumb_w/640/2020/10/30/hang-ma-ma-mi-truoc-le-halloweendocx-1604017691221.jpeg\" alt=\"Loạt ma quỷ kinh dị tràn xuống phố hóa trang ở Hà Nội dịp Halloween - 12\">\n<figcaption>Một mô hình ma quỷ có giá tới 3 triệu đồng.</figcaption>\n</figure>\n<figure class=\"image align-center\"><img title=\"Loạt ma quỷ kinh dị tràn xuống phố hóa trang ở Hà Nội dịp Halloween - 13\" src=\"https://icdn.dantri.com.vn/thumb_w/640/2020/10/30/anh-20-1604019669678.jpg\" alt=\"Loạt ma quỷ kinh dị tràn xuống phố hóa trang ở Hà Nội dịp Halloween - 13\"></figure>\n<figure class=\"image\"><img title=\"Loạt ma quỷ kinh dị tràn xuống phố hóa trang ở Hà Nội dịp Halloween - 14\" src=\"https://icdn.dantri.com.vn/thumb_w/640/2020/10/30/hang-ma-ma-mi-truoc-le-halloweendocx-1604017691299.jpeg\" alt=\"Loạt ma quỷ kinh dị tràn xuống phố hóa trang ở Hà Nội dịp Halloween - 14\">\n<figcaption>\n<p>Một số người bán hàng còn tự trang trí cho mình như người phụ nữ đeo kẹp tóc có hình con dao xuyên qua đầu và người đàn ông mặc trang phục kỹ sĩ cầm giáo và khiên cổ xưa để thu hút sự chú ý của người đi đường.</p>\n</figcaption>\n</figure>\n<figure class=\"image\"><img title=\"Loạt ma quỷ kinh dị tràn xuống phố hóa trang ở Hà Nội dịp Halloween - 15\" src=\"https://icdn.dantri.com.vn/thumb_w/640/2020/10/30/hang-ma-ma-mi-truoc-le-halloweendocx-1604017691458.jpeg\" alt=\"Loạt ma quỷ kinh dị tràn xuống phố hóa trang ở Hà Nội dịp Halloween - 15\">\n<figcaption>Hàng Mã tràn ngập không khí ma mị khi ngày hội hoá trang chỉ còn chưa đầy 1 tuần nữa là diễn ra.</figcaption>\n</figure>\n<p><strong>Vũ Đức Anh</strong></p>\n            <div></div>', 369, 1, '2020-10-30 09:45:31', 'thanhnnt', '2020-10-30 09:45:31', 'thanhnnt', 'https://icdn.dantri.com.vn/thumb_w/640/2020/10/30/hang-ma-ma-mi-truoc-le-halloweendocx-1604017688832.jpeg'),
(17, 'Nơi du khách đổ xô mua vé 10 USD vào cửa để đào kim cương', 'Noi-du-khach-đo-xo-mua-ve-10-USD-vao-cua-đe-đao-kim-cuong-1604025941043', 'Với niềm hi vọng sẽ \"đổi đời\" nếu may mắn kiếm được những viên đá quý tại các khu mỏ, nhiều người Mỹ đổ xô tới các bãi đá để kiếm tìm.', '2020-10-30 09:45:41', NULL, 2, 4, '<figure class=\"video\"><video poster=\"https://icdn.dantri.com.vn/thumb-video/2020/10/29/y-2-matecom-herkimer-diamond-mines-tour-360-p-1603946002048/0_00_00.jpg\" width=\"640\" height=\"360\"></video>\n<figcaption>Theo chân du khách kiếm tìm đá quý trong khu mỏ ở Mỹ</figcaption>\n</figure>\n<p><strong>Đổ xô tới các khu mỏ kiếm đá quý</strong></p>\n<p>Đá mặt trăng ở Montana, thạch anh tím và ngọc lục bảo ở bắc Carolina, ngọc hồng lựu ở ngoại ô New York (Mỹ). Tại những mỏ đá quý trả tiền trên khắp nước Mỹ, chỉ cần bỏ tiền mua vé vào cửa khoảng 10 USD/ngày (khoảng 230 nghìn đồng), du khách có thể dành cả buổi đục đẽo tìm kiếm những viên đá quý, với hi vọng đổi đời.</p>\n<figure class=\"image\"><img title=\"Nơi du khách đổ xô mua vé 10 USD vào cửa để đào kim cương - 1\" src=\"https://icdn.dantri.com.vn/thumb_w/640/2020/10/29/do-xo-di-dao-kim-cuong-de-tim-kiem-van-maydocx-1603945859857.jpeg\" alt=\"Nơi du khách đổ xô mua vé 10 USD vào cửa để đào kim cương - 1\">\n<figcaption>Du khách tìm kiếm đá quý trong khu mỏ Herkimer Diamond Mines</figcaption>\n</figure>\n<p>Tại khu mỏ có tên Herkimer Diamond Mines ở New York thường thu hút rất đông du khách. Họ tới tìm kiếm tinh thể thạch anh, thường gọi là kim cương Herkimer. Đương nhiên, giá vé vào cửa ở đây cao hơn nơi khác - khoảng 14 USD/người (320 nghìn đồng), bao gồm cả dịch vụ cho thuê búa đập đá.</p>\n<p>Thường thì 20 % khách hàng đến với mỏ Herkimer Diamond Mines là du khách quốc tế. Nhưng kể từ khi Covid-19 bùng phát, du lịch bị ảnh hưởng đã làm trì hoãn \"mùa đào bới\" kéo dài từ tháng 4 tới tháng 11 năm nay. Chủ sở hữu mỏ, cô Renée Scialdo Shevat, tỏ rõ sự lo lắng về việc doanh thu thua lỗ.</p>\n<p>Nhưng cuối mùa hè vừa qua, bà chủ mỏ lại quan tâm nhiều hơn tới việc \"làm thế nào để hạn chế đám đông tụ tập\". Những người tới đào bới tìm kiếm kim cương đủ mọi lứa tuổi, do sở thích tìm kiếm đá quý tăng lên nhanh chóng. Điều này thậm chí thúc đẩy một số mỏ vốn đã đóng cửa, như mỏ Ruggles ở thành phố Grafton, bang Illinois, đã mở cửa trở lại.</p>\n<figure class=\"image\"><img title=\"Nơi du khách đổ xô mua vé 10 USD vào cửa để đào kim cương - 2\" src=\"https://icdn.dantri.com.vn/thumb_w/640/2020/10/29/do-xo-di-dao-kim-cuong-de-tim-kiem-van-maydocx-1603945859939.jpeg\" alt=\"Nơi du khách đổ xô mua vé 10 USD vào cửa để đào kim cương - 2\">\n<figcaption>Việc đào bới không hề đơn giản</figcaption>\n</figure>\n<p>Từ năm 1963 đến 2016, mỏ Ruggles liên tục đón tiếp khách du lịch và những người có sở thích tìm tiếm thạch anh hồng cùng nhiều loại đá quý khác. Năm 2016 nơi này đóng cửa và rồi được chủ mới mua lại với kế hoạch biến mỏ đá cũ thành điểm hút khách du lịch.</p>\n<p>Không chỉ đơn giản là sở thích, do công việc bị ảnh hưởng vì Covid-19, Frank, 22 tuổi và Kyndall Stallings, 27 tuổi, đến từ thành phố Charleston, lên kế hoạch tìm đá quý để kiếm tiền. Đến nay, cả hai đã biến việc đào bới thành công việc toàn thời gian. Từ giữa tháng 4, họ bán đồ đạc và rong ruổi tới các mỏ đá khắp nước Mỹ.</p>\n<p>\"Bỏ ra 50 USD mỗi ngày, nếu chăm chỉ đào bới, bạn có thể may mắn kiếm được viên pha lê trị giá 2.000 USD, 3.000 USD hay thậm chí là 5.000 USD\", Frank cho biết.</p>\n<p>Trước đó, tại khu mỏ pha lê ở Arkansas, cặp đôi kiếm được viên thạch anh nhỏ và bán lại với giá 1.500 USD. Để tiết kiệm tiền, họ đã cắm trại ngay gần khu mỏ.</p>\n<p>\"Dù mới bắt đầu nhưng chúng tôi cảm nhận được viễn cảnh tốt đẹp ở lĩnh vực này\", Kyndall bày tỏ sự lạc quan.</p>\n<p><strong>Tham vọng của những \"thợ mỏ\"</strong></p>\n<p>Về lý thuyết, một thợ mỏ có thể kiếm được 10.000 USD khi bán các mẫu đá tìm được. Một tinh thể được nhập thủ công trong nước có thể đắt vài lần giá nhập khẩu từ khu mỏ ở nước ngoài. Người bán đôi khi sẽ tính giá cao hơn nếu họ tỷ mỉ ghi hình cảnh đào bới của mình và chia sẻ lên mạng xã hội.</p>\n<figure class=\"image\"><img title=\"Nơi du khách đổ xô mua vé 10 USD vào cửa để đào kim cương - 3\" src=\"https://icdn.dantri.com.vn/thumb_w/640/2020/10/29/do-xo-di-dao-kim-cuong-de-tim-kiem-van-maydocx-1603945859974.jpeg\" alt=\"Nơi du khách đổ xô mua vé 10 USD vào cửa để đào kim cương - 3\">\n<figcaption>Những mẩu đá quý tìm thấy. Ảnh minh họa</figcaption>\n</figure>\n<p>Một trong những \"ông hoàng\" của mô hình kinh doanh này là Bryan Major, còn được gọi là \"Người thu thập pha lê\". Anh đã đăng video đào viên pha lê đầu tiên của mình lên Youtube cách đây 9 năm.</p>\n<p>Muốn tạo dựng sự nghiệp đào đá quý không đồng nghĩa với việc phải sống như du mục mọi lúc mọi nơi. Cặp đôi Patrick (32 tuổi) và Samantha Krug (30 tuổi) cho biết, họ đào vàng vài lần một tuần. Họ bắt đầu công việc từ khi học đại học, với mục tiêu săn những viên kim cương Herkimer đắt giá. Sau mỗi trận mưa, nếu may mắn, người ta có thể thấy chúng lộ thiên trên mặt đất với nhiều dạng kích thước khác nhau.</p>\n<figure class=\"image\"><img title=\"Nơi du khách đổ xô mua vé 10 USD vào cửa để đào kim cương - 4\" src=\"https://icdn.dantri.com.vn/thumb_w/640/2020/10/29/do-xo-di-dao-kim-cuong-de-tim-kiem-van-maydocx-1603945860024.jpeg\" alt=\"Nơi du khách đổ xô mua vé 10 USD vào cửa để đào kim cương - 4\">\n<figcaption>Những người thợ tìm kiếm cơ hội đổi đời</figcaption>\n</figure>\n<p>Các góc cạnh càng rõ ràng sắc nét, kim cương Herkimer càng có giá trị. Chúng được sử dụng phổ biến trong các nghi lễ chứa bệnh, làm đồ trang sức. Được biết, trong vòng 2 năm từ 2017 - 2019, nhu cầu mua bán kim cương và pha lê ở Mỹ tăng gấp đôi.</p>\n<p>\"Việc đào đá quý không dễ dàng, đòi hỏi cả sức chịu đựng và kiến thức, chứ không thể đào bừa\", ông Ron Murray, một trong số những người hành nghề tự do, khẳng định.</p>\n<p><strong>Quốc Việt</strong></p>\n<p>Theo <em>Times/ Herkimer Diamond Mines</em></p>\n            <div></div>', 281, 1, '2020-10-30 09:45:41', 'thanhnnt', '2020-10-30 09:45:41', 'thanhnnt', 'https://icdn.dantri.com.vn/thumb_w/640/2020/10/29/do-xo-di-dao-kim-cuong-de-tim-kiem-van-maydocx-1603945859857.jpeg'),
(18, 'Nơi du khách đổ xô mua vé 10 USD vào cửa để đào kim cương', 'Noi-du-khach-đo-xo-mua-ve-10-USD-vao-cua-đe-đao-kim-cuong-1604025953763', 'Với niềm hi vọng sẽ \"đổi đời\" nếu may mắn kiếm được những viên đá quý tại các khu mỏ, nhiều người Mỹ đổ xô tới các bãi đá để kiếm tìm.', '2020-10-30 09:45:53', NULL, 2, 4, '<p><strong><span>Quán bánh canh \"siêu đông\" ở HN: Sợi bánh đi máy bay ngàn cây số mỗi ngày </span></strong></p>\n<p><strong><em>Khách ngồi kín trong nhà, tràn ra cả vỉa hè... là hình ảnh không lạ tại quán bánh canh ghẹ trên đường Quang Trung (Hà Nội).</em></strong></p>\n<figure class=\"video\"><video poster=\"https://icdn.dantri.com.vn/thumb-video/2020/10/28/dsc-2789-1603851894737/0_00_00.jpg\" width=\"1920\" height=\"1080\"></video>\n<figcaption>\n<p>Quán bánh canh \"siêu đông\" ở HN: Sợi bánh đi máy bay ngàn cây số</p>\n</figcaption>\n</figure>\n<p>Đây là quán bánh canh ghẹ đầu tiên tại Hà Nội. Mức giá bánh canh ghẹ ở đây dao động từ 60 - 80 ngàn đồng/bát. So với những món ăn trưa truyền thống tại phố cổ Hà Nội như bún cá, phở bò, bún chả... mức giá bánh canh ghẹ cũng cao hơn 20 - 30 ngàn đồng.</p>\n<p>Thế nhưng, quán bánh canh này vẫn “hết vèo” vài trăm bát/ngày, thậm chí lúc đỉnh điểm lên tới... 1000 bát.</p>\n<div class=\"photo-grid align-overflow\">\n<div class=\"photo-row\">\n<figure class=\"image\"><img class=\"image-thumb\" title=\"Quán bánh canh siêu đông ở HN: Sợi bánh đi máy bay ngàn cây số - 1\" src=\"https://icdn.dantri.com.vn/thumb_w/660/2020/10/24/banh-canh-ghe-22-1603508993168.jpg\" alt=\"Quán bánh canh siêu đông ở HN: Sợi bánh đi máy bay ngàn cây số - 1\"></figure>\n<figure class=\"image\"><img class=\"image-thumb\" title=\"Quán bánh canh siêu đông ở HN: Sợi bánh đi máy bay ngàn cây số - 2\" src=\"https://icdn.dantri.com.vn/thumb_w/660/2020/10/24/banh-canh-ghe-23-1603508993487.jpg\" alt=\"Quán bánh canh siêu đông ở HN: Sợi bánh đi máy bay ngàn cây số - 2\"></figure>\n</div>\n</div>\n<p><strong> 6 năm đưa sợi bánh ra Hà Nội bằng máy bay mỗi ngày</strong></p>\n<p>Theo tiết lộ của chị Hoàng Bích Hường - chủ quán, thứ nguyên liệu “tốn công” nhất trong mỗi bát bánh canh ghẹ... lại chính là sợi bánh. Khác với bún, phở, mì hay bánh đa... vốn là đặc trưng của Hà Nội và các tỉnh phía Bắc, sợi bánh canh ngon nhất phải là sợi bánh được làm từ gạo miền Tây.</p>\n<p>Kể từ khi mở quán vào tháng 11/2014, đến nay, sợi bánh canh quán chị Hường vẫn đều đặn “đi máy bay” từ TP Hồ Chí Minh ra Hà Nội mỗi ngày.&nbsp;</p>\n<figure class=\"image align-overflow\"><img title=\"Quán bánh canh siêu đông ở HN: Sợi bánh đi máy bay ngàn cây số - 3\" src=\"https://icdn.dantri.com.vn/2020/10/24/banh-canh-ghe-19-1603508992085.jpg\" alt=\"Quán bánh canh siêu đông ở HN: Sợi bánh đi máy bay ngàn cây số - 3\"></figure>\n<p>“Đây là đơn hàng tươi nên chi phí vận chuyển máy bay rất lớn, có khi ra đến Hà Nội, giá sợi bánh tính ra lên tới 30-40 ngàn đồng/kg, trong khi mỗi kg sợi bánh chỉ làm được 3-4 bát bánh canh thành phẩm”, chị Hường chia sẻ.</p>\n<p>Khi đưa món bánh canh ra Hà Nội, chị Hường cũng lặn lội tới nhiều gia đình làm bún phở có tiếng tại làng bún Phú Đô để đặt sợi bánh canh, nhưng chưa lần nào thành công. “Sợi bánh canh có phần tương tự giống bánh bột lọc, màu trong, dai, giòn. Mình từng đặt hàng tại nhiều đơn vị sản xuất ngay Hà Nội mà đều thất bại. Bát bánh canh ghẹ từ sợi bánh đó không đủ ngon, chất lượng”, chị Hường cho biết.</p>\n<p>Việc vận chuyển sợi bánh bằng máy bay khiến nhiều khi, quán không chủ động được nguồn hàng. Có những ngày máy bay trễ giờ, quán phải đóng cửa buổi sáng. \"Sợi bánh phải tươi, không thể để dự trữ vài ngày được. Có ngày đến đầu giờ chiều sợi bánh mới đến nơi, ngày đó coi như... quán lỗ, vì giờ cao điểm nhất là bữa trưa thì lại không có hàng”, chị cho biết thêm.</p>\n<div class=\"photo-grid align-overflow\">\n<div class=\"photo-row\">\n<figure class=\"image\"><img class=\"image-thumb\" title=\"Quán bánh canh siêu đông ở HN: Sợi bánh đi máy bay ngàn cây số - 4\" src=\"https://icdn.dantri.com.vn/thumb_w/660/2020/10/24/banh-canh-ghe-4-1603508771154.jpg\" alt=\"Quán bánh canh siêu đông ở HN: Sợi bánh đi máy bay ngàn cây số - 4\"></figure>\n</div>\n</div>\n<p><strong>Tiết trời sang thu, trăm bát \"đi êm ru\" mỗi ngày</strong></p>\n<p>Bánh canh là món ăn xuất phát từ các tỉnh phía Nam nhưng hiện nay xuất hiện ở khắp mọi tỉnh thành trên dải đất hình chữ S. Bánh canh làm từ bột năng hoặc bột gạo, sợi bánh to, ăn dai dai, giòn giòn, khác hẳn bún hay phở. Nước dùng của món bánh canh sệt sệt, sánh đặc, nóng hôi hổi. Người ta có bánh canh tôm, bánh canh sườn chả... nhưng có lẽ nổi tiếng hơn cả là bánh canh ghẹ.</p>\n<p>Cũng vì mê món ăn nổi tiếng đất Sài thành này mà 6 năm trước, chị Hường lặn lội vào tận thành phố Hồ Chí Minh, đến theo học cách làm bánh canh của một gia đình làm bánh canh gia truyền đã mấy chục năm.</p>\n<p>\"Sau khi học được món bánh canh ghẹ của cụ bà, mình mang về Hà Nội và mất thêm vài tháng để thử nghiệm sao cho mùi vị hợp với khẩu vị người bắc hơn, chứ không đơn thuần áp dụng y nguyên công thức đó được. Mình phải giảm bớt vị ngọt, vị cay, tăng vị đậm đà, mặn hơn\", chị Hường chia sẻ.</p>\n<p>Thời điểm chị Hường mở quán bánh canh ghẹ - tại Hà Nội chưa có nơi nào phục vụ món ăn này.</p>\n<div class=\"photo-grid align-overflow\">\n<div class=\"photo-row\">\n<figure class=\"image\"><img class=\"image-thumb\" title=\"Quán bánh canh siêu đông ở HN: Sợi bánh đi máy bay ngàn cây số - 5\" src=\"https://icdn.dantri.com.vn/thumb_w/660/2020/10/24/banh-canh-ghe-11-1603508992942.jpg\" alt=\"Quán bánh canh siêu đông ở HN: Sợi bánh đi máy bay ngàn cây số - 5\"></figure>\n<figure class=\"image\"><img class=\"image-thumb\" title=\"Quán bánh canh siêu đông ở HN: Sợi bánh đi máy bay ngàn cây số - 6\" src=\"https://icdn.dantri.com.vn/thumb_w/660/2020/10/24/banh-canh-ghe-15-1603508993234.jpg\" alt=\"Quán bánh canh siêu đông ở HN: Sợi bánh đi máy bay ngàn cây số - 6\"></figure>\n</div>\n</div>\n<p>Nồi nước dùng của món bánh canh ghẹ phải ninh từ 18 - 24 tiếng nên tại căn bếp luôn có nồi nước dùng \"trực chiến\" 24/24. Nước dùng cũng chính là điều tạo nên sự khác biệt của quán so với nhiều nơi khác. \"Có thể nói, nước dùng chính là niềm tự hào của mình đối với món ăn này, đó cũng là tâm huyết của mình sau thời gian dài thử nghiệm\", chị Hường chia sẻ.</p>\n<p>Từ 4 - 5 giờ sáng, chị Hường và nhân viên bắt đầu chế biến sơ các nguyên liệu: trần ghẹ, luộc tôm, luộc thịt, bóc ghẹ, tôm, bóc trứng cút... Nguồn hải sản như tôm, ghẹ được chị Hường lựa chọn kì công từ Vũng Tàu và Quảng Ninh.</p>\n<p>Việc nhúng sợi bánh canh cũng chẳng ít công phu. Sợi bánh canh phải nhúng trong nước sôi lâu hơn so với bún, phở. Nhưng lâu quá thì nát, nhanh quá thì cứng... nên đầu bếp phải đảm bảo thời gian nhúng và nhiệt độ nước chuẩn chỉnh.</p>\n<figure class=\"image align-center\"><img title=\"Quán bánh canh siêu đông ở HN: Sợi bánh đi máy bay ngàn cây số - 7\" src=\"https://icdn.dantri.com.vn/2020/10/28/dsc-278900020406-still-001-1603852246576.jpg\" alt=\"Quán bánh canh siêu đông ở HN: Sợi bánh đi máy bay ngàn cây số - 7\"></figure>\n<div class=\"photo-grid align-overflow\">\n<div class=\"photo-row\">\n<figure class=\"image\"><img class=\"image-thumb\" title=\"Quán bánh canh siêu đông ở HN: Sợi bánh đi máy bay ngàn cây số - 8\" src=\"https://icdn.dantri.com.vn/thumb_w/660/2020/10/24/banh-canh-ghe-6-1603508992296.jpg\" alt=\"Quán bánh canh siêu đông ở HN: Sợi bánh đi máy bay ngàn cây số - 8\"></figure>\n<figure class=\"image\"><img class=\"image-thumb\" title=\"Quán bánh canh siêu đông ở HN: Sợi bánh đi máy bay ngàn cây số - 9\" src=\"https://icdn.dantri.com.vn/thumb_w/660/2020/10/24/banh-canh-ghe-7-1603508993062.jpg\" alt=\"Quán bánh canh siêu đông ở HN: Sợi bánh đi máy bay ngàn cây số - 9\"></figure>\n</div>\n</div>\n<figure class=\"image align-overflow\"><img title=\"Quán bánh canh siêu đông ở HN: Sợi bánh đi máy bay ngàn cây số - 10\" src=\"https://icdn.dantri.com.vn/2020/10/24/banh-canh-ghe-5-1603508992071.jpg\" alt=\"Quán bánh canh siêu đông ở HN: Sợi bánh đi máy bay ngàn cây số - 10\"></figure>\n<p>Là món ăn nóng hổi nên thời điểm tiết trời se lạnh, chuyển mình sang thu chính là lúc quán bánh canh ghẹ của chị Hường đắt khách nhất trong năm.&nbsp;</p>\n<p>\"Mình ăn ở đây cũng hơn 3 năm rồi. Món ăn vừa miệng, chất lượng so với giá thành. Bạn không thể chỉ chi 30 - 40 ngàn mà đòi có bát bánh canh hải sản với nào tôm, nào ghẹ được...</p>\n<p>Mình từng sinh sống nhiều năm ở Sài Gòn nên quen với món ăn này rồi. Về Hà Nội, từng thử vài nơi nhưng không đâu thấy ngon miệng bằng bánh canh ghẹ ở đây\", anh Trịnh Vĩnh Thành một \"khách ruột\" của quán chia sẻ. \"Nhưng thường mình hay đi giữa buổi vì vào đúng bữa trưa thì nhiều hôm xếp hàng hết hơi luôn\", anh cho biết thêm.</p>\n<div class=\"photo-grid align-overflow\">\n<div class=\"photo-row\">\n<figure class=\"image\"><img class=\"image-thumb\" title=\"Quán bánh canh siêu đông ở HN: Sợi bánh đi máy bay ngàn cây số - 11\" src=\"https://icdn.dantri.com.vn/thumb_w/660/2020/10/24/banh-canh-ghe-24-1603508993480.jpg\" alt=\"Quán bánh canh siêu đông ở HN: Sợi bánh đi máy bay ngàn cây số - 11\"></figure>\n<figure class=\"image\"><img class=\"image-thumb\" title=\"Quán bánh canh siêu đông ở HN: Sợi bánh đi máy bay ngàn cây số - 12\" src=\"https://icdn.dantri.com.vn/thumb_w/660/2020/10/24/banh-canh-ghe-25-1603508993465.jpg\" alt=\"Quán bánh canh siêu đông ở HN: Sợi bánh đi máy bay ngàn cây số - 12\"></figure>\n</div>\n<div class=\"photo-row\">\n<figure class=\"image\"><img class=\"image-thumb\" title=\"Quán bánh canh siêu đông ở HN: Sợi bánh đi máy bay ngàn cây số - 13\" src=\"https://icdn.dantri.com.vn/thumb_w/660/2020/10/24/banh-canh-ghe-17-1603508993403.jpg\" alt=\"Quán bánh canh siêu đông ở HN: Sợi bánh đi máy bay ngàn cây số - 13\"></figure>\n</div>\n</div>\n<p>Sau 6 năm mở cửa, quán bánh canh ghẹ của chị Hường không chỉ \"ghi điểm\" với thực khách trong nước mà còn là địa chỉ ưa thích của du khách nước ngoài. Quán từng nhận được nhiều đánh giá tích cực từ các trang ẩm thực - du lịch quốc tế.</p>\n<p><strong>Toàn Vũ</strong></p>', 480, 1, '2020-10-30 09:45:53', 'thanhnnt', '2020-10-30 09:45:53', 'thanhnnt', 'https://icdn.dantri.com.vn/thumb_w/660/2020/10/24/banh-canh-ghe-22-1603508993168.jpg'),
(19, 'Đi ăn buffet, thực khách bị phạt 200 ngàn đồng vì để thừa... 2,9 lạng rau', 'Đi-an-buffet,-thuc-khach-bi-phat-200-ngan-đong-vi-đe-thua...-2,9-lang-rau-1604025967389', 'Chị Nguyễn Minh Huệ “bị phạt 200 ngàn đồng vì để thừa 2,9 lạng rau” sau khi dùng bữa tại một nhà hàng lẩu buffet nằm trên đường Yên Bái, quận Hải Châu, thành phố Đà Nẵng.', '2020-10-30 09:46:07', NULL, 2, 4, '<p>Theo đó, tối 21/10, chị Huệ cùng người bạn đến quán và chọn buffet lẩu Hồng Kông giá 299 ngàn đồng/suất. Trước khi dùng bữa, chị Huệ có đọc thông tin trên menu đồ ăn của quán:“Phạt 100 ngàn đồng nếu thừa 150g đồ ăn”.</p>\n<p>“Trước đây mình chưa gặp quán buffet nào ghi rõ quy định phạt khi thừa đồ ăn như vậy nhưng bản thân mình khi đi ăn đã xác định ăn vừa đủ thay vì lãng phí. Đến quán này, đọc được thông tin trên menu thì bọn mình càng có ý thức gọi đồ cho hợp lý”, chị Huệ chia sẻ với <em>PV báo Dân trí</em>.</p>\n<p>Chị Huệ cho biết, lần đầu, quán phục vụ cho bàn chị Huệ 2 đĩa thịt bò và một phần tôm, còn lại là các loại rau, nấm. Sau khi dùng hết thịt và tôm, chị gọi thêm đồ nhưng quản lý cửa hàng liên tục hỏi: “Chị có ăn hết không?” và yêu cầu khách ăn hết thực phẩm trên bàn ăn mới có thể gọi thêm đồ.</p>\n<p>“Thật lòng, lúc đó trong nồi chỉ còn lại rau, nấm mà quản lý không chịu phục vụ khiến mình bức xúc. Sau đó rất lâu, quán mới phục vụ thêm đồ nhưng quản lý vẫn tiếp tục có thái độ khó chịu”, chị Huệ cho hay.</p>\n<figure class=\"image\"><img title=\"Đi ăn buffet, thực khách bị phạt 200 ngàn đồng vì để thừa... 2,9 lạng rau - 1\" src=\"https://icdn.dantri.com.vn/thumb_w/640/2020/10/23/di-an-buffet-bi-nha-hang-phat-200-ngan-dong-vi-de-thua-29-lang-rau-thuc-khach-keu-troidocx-1603460123985.jpeg\" alt=\"Đi ăn buffet, thực khách bị phạt 200 ngàn đồng vì để thừa... 2,9 lạng rau - 1\"></figure>\n<p>Bữa tối của chị Huệ kết thúc sau đó không lâu do chị và người bạn cảm thấy không hài lòng về cách phục vụ tại quán ăn này.</p>\n<p>Khi tính tiền, nhân viên cửa hàng gọi quản lý lên. Người quản lý này cho biết: Chị Huệ phải nộp phạt vì không ăn hết thức ăn đã gọi. Chị Huệ ngạc nhiên và hỏi lại: “Mình không ăn hết cái gì vậy chị” thì quản lý chỉ vào đĩa rau còn dư trên bàn. Nói xong, quản lý rời đi còn nhân viên đem cân đến để cân lượng rau còn dư. Nhân viên yêu cầu chị Huệ thanh toán tiền phạt 200 ngàn đồng vì để dư... 292 gram rau và bắp.</p>\n<p>Chị Huệ cũng chia sẻ rõ, chị và người bạn không hề gọi thêm rau mà chỉ gọi đồ ăn như thịt, tôm… nhưng nhân viên vẫn phục rau, bắp. Hai chị dù rất bức xúc với thái độ phục vụ và làm việc của quản lý nhà hàng nhưng vẫn chấp nhận nộp phạt theo yêu cầu.</p>\n<figure class=\"image\"><img title=\"Đi ăn buffet, thực khách bị phạt 200 ngàn đồng vì để thừa... 2,9 lạng rau - 2\" src=\"https://icdn.dantri.com.vn/thumb_w/640/2020/10/23/di-an-buffet-bi-nha-hang-phat-200-ngan-dong-vi-de-thua-29-lang-rau-thuc-khach-keu-troidocx-1603460124342.jpeg\" alt=\"Đi ăn buffet, thực khách bị phạt 200 ngàn đồng vì để thừa... 2,9 lạng rau - 2\">\n<figcaption>Hình ảnh bàn ăn của chị Huệ sau khi kết thúc bữa ăn.</figcaption>\n</figure>\n<p>Ngay sau khi chia sẻ câu chuyện này trên mạng xã hội, chị Huệ đã nhận được hàng ngàn lượt tương tác của cộng đồng mạng. Nhiều bình luận bày tỏ bức xúc với thái độ phục vụ của nhà hàng.</p>\n<p>“Hiện nhiều quán ăn buffet đã áp dụng quy định phạt khi khách để thừa quá nhiều đồ ăn nhằm tránh tình trạng lãng phí, nhưng quán này phạt khách vì dư 292 gram rau thì quá vô lý. Nhìn số lượng đĩa trên bàn cũng có thể thấy, hai vị khách ăn không nhiều, họ cũng không để dư thừa thịt, cá…”, tài khoản Hoàng Hằng chia sẻ.</p>\n<p>“Khách hàng bỏ 299 ngàn đồng cho 1 suất ăn là không hề ít. Không nhất thiết mỗi lần khách gọi đồ, quản lý lại lặp đi lặp lại câu hỏi “Chị có ăn hết không?”.</p>\n<p>Câu hỏi này vừa thiếu tế nhị (nếu không muốn nói là vô duyên) vừa thể hiện tinh thần phục vụ không tích cực từ nhà hàng. Quản lý chính là bộ mặt, đại diện cho nhà hàng. Nếu xử lý phạt khi khách để thừa thãi tôm, thịt, cá… thì hợp lý còn phạt 200 ngàn cho chưa tới 3 lạng rau thì mình không chấp nhận được”, tài khoản Ngân Hà khẳng định.</p>\n<p>Nhiều cư dân mạng cho rằng, việc các quán buffet hiện nay có quy định phạt khách hàng nếu phung phí thức ăn là hoàn toàn hợp lý. Quy định này vốn đã xuất hiện phổ biến ở các nước phát triển từ lâu.</p>\n<p>“Nhà hàng đã có quy định công khai nên việc xử phạt không có gì là đáng lên án. Tuy nhiên, cách phục vụ trong quá trình ăn, cách nhắc nhở khách hàng hay xử lý nếu khách hàng để dư thừa thức ăn cần phải hợp lý”, tài khoản Thuỳ Trang chia sẻ.</p>\n<p>Chia sẻ với <em>PV báo Dân trí</em>, chị Minh Huệ cho biết, bản thân chị muốn nhận được lời xin lỗi và giải thích từ quản lý nhà hàng về thái độ phục vụ, xử lý phạt với khách hàng.</p>\n<p>Ngay tại nhà hàng, chị yêu cầu được gặp chủ nhà hàng nhưng quản lý không hồi đáp, người này rời đi và giao cho nhân viên thực hiện trao đổi với khách. “Nếu đồ ăn không nhiều, không ngon miệng nhưng thái độ phục vụ tốt thì mình vẫn vui vẻ ra về nhưng trong trường hợp này, mình không nhận được cả hai. Đây là một trải nghiệm quá tệ. Bản thân mình cảm thấy bị coi thường”, chị Huệ nói.</p>\n<p>Sau đó, người bạn của chị Huệ đã chủ động nhắn tin cho chủ nhà hàng này để thông tin về sự việc. Chủ nhà hàng đã nhắn tin xin lỗi chị Huệ và cho rằng nguyên nhân sự việc là do anh này chưa đào tạo tốt nhân viên.</p>\n<p><em>PV báo Dân trí</em> đã liên hệ với đại diện cửa hàng này nhưng chưa nhận được phản hồi.&nbsp;Hiện nhà hàng này đang nhận được rất nhiều đánh giá kém đến từ thực khách qua các ứng dụng.</p>\n<p><strong>Hương Thảo</strong></p>\n            <div></div>', 261, 1, '2020-10-30 09:46:07', 'thanhnnt', '2020-10-30 09:46:07', 'thanhnnt', 'https://icdn.dantri.com.vn/thumb_w/640/2020/10/23/di-an-buffet-bi-nha-hang-phat-200-ngan-dong-vi-de-thua-29-lang-rau-thuc-khach-keu-troidocx-1603460123985.jpeg'),
(20, 'Lãnh đạo Muangthong bất ngờ “bật đèn xanh” để Văn Lâm sang châu Âu', 'Lanh-đao-Muangthong-bat-ngo-“bat-đen-xanh”-đe-Van-Lam-sang-chau-Au-1604026037036', 'Ban giám đốc CLB Muangthong United bất ngờ cho biết sẽ để cho thủ môn Đặng Văn Lâm sang châu Âu thi đấu, nếu họ nhận được lời đề nghị hợp lý từ cựu lục địa.', '2020-10-30 09:47:17', NULL, 14, 4, '<p>Đặng Văn Lâm đang là thủ môn số 1 của CLB Muangthong United, anh luôn chơi cực hay trong tất cả các trận đã qua của đội này tại giải Thai-League. Trước đó, có thông tin cho rằng thủ môn của đội tuyển Việt Nam được CLB TPHCM quan tâm, nhưng phía Muangthong một lần nữa cho hay chưa nhận được lời đề nghị từ đội bóng thành phố.</p>\n<p>Giám đốc điều hành (GĐĐH) CLB Muangthong United, ông Ranarit Suwacha nói: <em>“Hiện tại, chưa hề có bất kỳ đội bóng nào tại Việt Nam liên hệ với chúng tôi về vấn đề chuyển nhượng Đặng Văn Lâm”.</em></p>\n<figure class=\"image align-center\"><img title=\"Lãnh đạo Muangthong bất ngờ “bật đèn xanh” để Văn Lâm sang châu Âu - 1\" src=\"https://icdn.dantri.com.vn/thumb_w/640/2020/10/26/dang-van-lam-1261020-1603717578247.jpg\" alt=\"Lãnh đạo Muangthong bất ngờ “bật đèn xanh” để Văn Lâm sang châu Âu - 1\">\n<figcaption>CLB Muangthong United ủng hộ Đăng Văn Lâm sang châu Âu thi đấu</figcaption>\n</figure>\n<p><em>“Đặng Văn Lâm là thủ môn rất giỏi, anh ấy đã chứng minh rằng anh ấy là thủ thành số 1 của khu vực Đông Nam Á, và luôn là vị trí quan trọng hàng đầu ở Muangthong” </em>– vị GĐĐH của đội bóng đang thi đấu tại giải Thai-League nói thêm.</p>\n<p>Không mấy hào hứng với chuyện Đặng Văn Lâm có thể trở lại thi đấu tại giải V-League, nhưng Ban giám đốc Muangthong lại sẵn sàng để cho thủ thành này sang châu Âu, nếu như họ nhận được lời đề nghị hợp lý từ các đối tác tại “lục địa già”.</p>\n<figure class=\"image align-center\"><img title=\"Lãnh đạo Muangthong bất ngờ “bật đèn xanh” để Văn Lâm sang châu Âu - 2\" src=\"https://icdn.dantri.com.vn/thumb_w/640/2020/10/30/dang-van-lamchau-au-291020-1603990905850.jpeg\" alt=\"Lãnh đạo Muangthong bất ngờ “bật đèn xanh” để Văn Lâm sang châu Âu - 2\">\n<figcaption>Thủ thành Việt kiều này đang là một trong những cái tên được quan tâm hàng đầu đối với giới bóng đá Thái Lan</figcaption>\n</figure>\n<p>GĐĐH của Muangthong United, Ranarit Suwacha – nói: <em>“Chúng tôi không hề nghi ngờ rằng Đặng Văn Lâm đủ năng lực thi đấu tại châu Âu, vì anh ấy từng chơi bóng tại đó trước đây”.</em>&nbsp;</p>\n<p><em>“Nếu có cơ hội chúng tôi sẵn sàng để cho anh ấy trở lại châu Âu một lần nữa. Muangthong United sẽ ủng hộ Đặng Văn Lâm trở lại châu Âu, khi có lời đề nghị thích hợp”</em> – vẫn là lời vị GĐĐH CLB Muangthong United.&nbsp;</p>\n<p>Trước khi sang Thái Lan thi đấu cho Muangthong, Đặng Văn Lâm từng chơi cho CLB Hải Phòng và HA Gia Lai tại giải V-League. Trước nữa, anh được đào tạo tại Nga, từng thi đấu cho một số đội bóng trẻ ở Moscow (Nga).</p>\n<p><strong>Thiện Nhân</strong></p>\n            <div></div>', 129, 1, '2020-10-30 09:47:17', 'thanhnnt', '2020-10-30 09:47:17', 'thanhnnt', 'https://icdn.dantri.com.vn/thumb_w/640/2020/10/26/dang-van-lam-1261020-1603717578247.jpg'),
(21, 'Cơ thủ Đình Nại dẫn đầu lượt đi chung kết giải bi-a thế giới', 'Co-thu-Đinh-Nai-dan-đau-luot-đi-chung-ket-giai-bi-a-the-gioi-1604026161957', 'Cơ thủ Ngô Đình Nại đã xuất sắc vượt qua dàn siêu sao ở trận đấu lượt đi thuộc vòng chung kết bi-a carom 3 băng trực tuyến thế giới để dẫn đầu bảng xếp hạng.', '2020-10-30 09:49:21', NULL, 14, 4, '<p>Tối ngày 29/10, trận chung kết lượt đi giải carom 3 băng trực tuyến thế giới “10x4 OneCarom Challenge lần 2 - 2020” chính thức diễn ra. Đây là trận đấu mà Ngô Đình Nại là cơ thủ người Việt duy nhất góp mặt và phải đối đầu với 3 ngôi sao trong làng bi-a thế giới gồm “Vua World Cup” Torbjorn Blomdahl (hạng 3), “Phù thủy” Semih Sayginer (hạng 11), ngôi sao người Hàn Quốc Choi Sung Won (hạng 18), trong khi Đình Nại chỉ xếp thứ 25 trên bảng xếp hạng.</p>\n<figure class=\"video\"><video poster=\"https://icdn.dantri.com.vn/thumb-video/2020/10/30/dinh-nai-ap-dao-dan-sieu-sao-o-chung-ket-bia-the-gioi-ghi-mua-diem-1604025455536/0_02_35.jpg\" width=\"1280\" height=\"720\"></video>\n<figcaption>Đình Nại dẫn đầu lượt đi vòng chung kết giải bi-a thế giới</figcaption>\n</figure>\n<p>Thể thức thi đấu ở vòng chung kết giải “10x4 OneCarom Challenge lần 2 - 2020” được chia làm hai lượt đấu diễn ra trong 2 ngày. Mỗi lượt đấu, 4 cơ thủ sẽ cùng so tài với nhau theo thể thức đề pa cộng dồn điểm trong 10 lượt cơ. Sau khi kết thúc 2 lượt trận, cơ thủ nào có tổng điểm số cao nhất sẽ giành chức vô địch.</p>\n<figure class=\"image align-center\"><img title=\"Cơ thủ Đình Nại dẫn đầu lượt đi chung kết giải bi-a thế giới - 1\" src=\"https://icdn.dantri.com.vn/thumb_w/640/2020/10/30/dinh-nai-2-1604025121618.jpg\" alt=\"Cơ thủ Đình Nại dẫn đầu lượt đi chung kết giải bi-a thế giới - 1\">\n<figcaption>\n<p>Ngô Đình Nại thi đấu xuất sắc để dẫn đầu lượt đi với 46 điểm</p>\n</figcaption>\n</figure>\n<p>Ở trận đấu lượt đi này, trong một ngày thi đấu thăng hoa, Đình Nại đã làm các đối thủ ngỡ ngàng khi liên tục ghi nhiều series điểm ấn tượng. Ngay ở lượt cơ đầu tiên, tay cơ của Việt Nam đi đề pa được 9 điểm để vươn lên dẫn đầu.</p>\n<p>Nhưng với hai series 8 và 5 điểm, tay cơ người Hàn Quốc Choi Sung Won vượt qua Đình Nại và chiếm vị trí số 1. Liền sau đó, Đình Nại đáp trả bằng cú đánh ghi 10 điểm ở lượt cơ thứ 4 để tái lập thế dẫn đầu.</p>\n<p>Chưa dừng lại đó, “Vua cơ điên làng bi-a Việt” còn tung tiếp hai đường cơ lần lượt ghi 6 và 9 điểm để dập tắt hy vọng bám đuổi của siêu sao người Hàn Quốc cũng như hai đối thủ còn lại. Thế trận này được Đình Nại giữ nguyên cho đến hết giờ.</p>\n<figure class=\"image align-center\"><img title=\"Cơ thủ Đình Nại dẫn đầu lượt đi chung kết giải bi-a thế giới - 2\" src=\"https://icdn.dantri.com.vn/thumb_w/640/2020/10/30/choi-1604025158879.jpg\" alt=\"Cơ thủ Đình Nại dẫn đầu lượt đi chung kết giải bi-a thế giới - 2\">\n<figcaption>\n<p>Tay cơ người Hàn Quốc Choi Sung Won xếp thứ nhì với 34 điểm</p>\n</figcaption>\n</figure>\n<p>Sau 10 lượt cơ, Đình Nại tạm thời dẫn đầu với 46 điểm và đang là ứng viên số 1 cho chức vô địch. Cũng có một ngày thi đấu rất hay đạt chỉ số trung bình 3,4 điểm/lượt cơ, Choi Sung Won tạm xếp sau với 34 điểm. Không thể hiện được quá nhiều và có đến 4 đường cơ chỉ ghi được 1 điểm, hai siêu sao Torbjorn Blomdahl và Semih Sayginer hiện đang có cùng 27 điểm.</p>\n<p>Trận đấu lượt về và cũng là trận chiến cuối cùng để tìm ra nhà vô địch của giải đấu sẽ diễn ra ngày hôm nay vào lúc 20h ngày 30/10.</p>\n<p><strong>Sông Lam</strong></p>\n            <div></div>', 155, 1, '2020-10-30 09:49:21', 'thanhnnt', '2020-10-30 09:49:21', 'thanhnnt', 'https://icdn.dantri.com.vn/thumb_w/640/2020/10/30/dinh-nai-2-1604025121618.jpg');
INSERT INTO `post` (`Id`, `Title`, `Slug`, `Summary`, `Publish_Date`, `Is_Draft`, `Category_Id`, `Source_Id`, `Content`, `Read_Time`, `Is_Active`, `Created`, `Created_By`, `Modified`, `Modified_By`, `Avatar`) VALUES
(22, 'Cơ thủ Đình Nại dẫn đầu lượt đi chung kết giải bi-a thế giới', 'Co-thu-Đinh-Nai-dan-đau-luot-đi-chung-ket-giai-bi-a-the-gioi-1604026179070', 'Cơ thủ Ngô Đình Nại đã xuất sắc vượt qua dàn siêu sao ở trận đấu lượt đi thuộc vòng chung kết bi-a carom 3 băng trực tuyến thế giới để dẫn đầu bảng xếp hạng.', '2020-10-30 09:49:39', NULL, 14, 4, '<figure class=\"image align-overflow\"><img title=\"Quang Hải, Quế Ngọc Hải phản ứng cực gắt, gây sức ép trọng tài - 1\" src=\"https://icdn.dantri.com.vn/2020/10/30/viettel-ha-noi-son-tung-20-1604019763111.jpg\" alt=\"Quang Hải, Quế Ngọc Hải phản ứng cực gắt, gây sức ép trọng tài - 1\">\n<figcaption>\n<p>Phút 68, Bùi Tiến Dũng thất thế sau pha bám đuổi với Rimario đã buộc phải phạm lỗi với ngoại binh này sau pha kéo áo lộ liễu. (Ảnh: Sơn Tùng)</p>\n</figcaption>\n</figure>\n<figure class=\"image align-overflow\"><img title=\"Quang Hải, Quế Ngọc Hải phản ứng cực gắt, gây sức ép trọng tài - 2\" src=\"https://icdn.dantri.com.vn/2020/10/30/viettel-ha-noi-77-tuan-mark-1604019762058.jpg\" alt=\"Quang Hải, Quế Ngọc Hải phản ứng cực gắt, gây sức ép trọng tài - 2\">\n<figcaption>\n<p>Sau pha phạm lỗi của Tiến Dũng, ngoại binh của CLB Hà Nội đã không giữ được bình tĩnh và đã có pha vung cùi chỏ với số 4 của CLB Viettel. Trọng tài Nguyễn Ngọc Châu đã không ngần ngại rút thẻ vàng cho Rimario. (Ảnh: Tiến Tuấn)</p>\n</figcaption>\n</figure>\n<figure class=\"image align-overflow\"><img title=\"Quang Hải, Quế Ngọc Hải phản ứng cực gắt, gây sức ép trọng tài - 3\" src=\"https://icdn.dantri.com.vn/2020/10/30/viettel-ha-noi-87-tuan-mark-1-1604019762226.jpg\" alt=\"Quang Hải, Quế Ngọc Hải phản ứng cực gắt, gây sức ép trọng tài - 3\">\n<figcaption>\n<p>Một quyết định khiến Rimario tỏ ra bất bình khi anh cho rằng thẻ vàng cũng nên dành cho Bùi Tiến Dũng sau tình huống phạm lỗi trước đó. (Ảnh: Tiến Tuấn)</p>\n</figcaption>\n</figure>\n<figure class=\"image align-overflow\"><img title=\"Quang Hải, Quế Ngọc Hải phản ứng cực gắt, gây sức ép trọng tài - 4\" src=\"https://icdn.dantri.com.vn/2020/10/30/viettel-ha-noi-78-tuan-mark-1604019760827.jpg\" alt=\"Quang Hải, Quế Ngọc Hải phản ứng cực gắt, gây sức ép trọng tài - 4\">\n<figcaption>\n<p>Tiền đạo Quang Hải cũng phản ứng cực gắt giơ hai ngón tay, đòi trọng tài rút thẻ đỏ ngay trước mặt người đàn anh tại ĐTQG. (Ảnh: TIến Tuấn)</p>\n</figcaption>\n</figure>\n<figure class=\"image align-overflow\"><img title=\"Quang Hải, Quế Ngọc Hải phản ứng cực gắt, gây sức ép trọng tài - 5\" src=\"https://icdn.dantri.com.vn/2020/10/30/viettel-vs-hanoi-do-linh-35-1604019817059.jpg\" alt=\"Quang Hải, Quế Ngọc Hải phản ứng cực gắt, gây sức ép trọng tài - 5\">\n<figcaption>\n<p>Trước đó, Bùi Tiến Dũng đã phải nhận một thẻ vàng ở hiệp 1 sau pha phạm lỗi với Văn Quyết. (Ảnh: Đỗ Linh)</p>\n</figcaption>\n</figure>\n<figure class=\"image align-overflow\"><img title=\"Quang Hải, Quế Ngọc Hải phản ứng cực gắt, gây sức ép trọng tài - 6\" src=\"https://icdn.dantri.com.vn/2020/10/30/viettel-vs-hanoi-do-linh-36-1603992357542.jpg\" alt=\"Quang Hải, Quế Ngọc Hải phản ứng cực gắt, gây sức ép trọng tài - 6\">\n<figcaption>\n<p>Tình huống trọng tài Châu rút thẻ vàng dành tặng Bùi Tiến Dũng ở hiệp 1. (Ảnh: Đỗ Linh)</p>\n</figcaption>\n</figure>\n<figure class=\"image align-overflow\"><img title=\"Quang Hải, Quế Ngọc Hải phản ứng cực gắt, gây sức ép trọng tài - 7\" src=\"https://icdn.dantri.com.vn/2020/10/30/viettel-vs-hanoi-do-linh-84-1604022277864.jpg\" alt=\"Quang Hải, Quế Ngọc Hải phản ứng cực gắt, gây sức ép trọng tài - 7\">\n<figcaption>\n<p>Xứng đáng là một trận derby, cầu thủ cả hai đội liên tục có những pha bóng nảy lửa và xảy ra nhiều tình huống phạm lỗi. (Ảnh: Đỗ Linh)</p>\n</figcaption>\n</figure>\n<figure class=\"image align-overflow\"><img title=\"Quang Hải, Quế Ngọc Hải phản ứng cực gắt, gây sức ép trọng tài - 8\" src=\"https://icdn.dantri.com.vn/2020/10/30/viettel-vs-hanoi-do-linh-50-1604022389782.jpg\" alt=\"Quang Hải, Quế Ngọc Hải phản ứng cực gắt, gây sức ép trọng tài - 8\">\n<figcaption>\n<p>Những cầu thủ đầy kỹ thuật như Quang Hải cũng là điểm đến của các tình huống phạm lỗi. (Ảnh: Đỗ Linh)</p>\n</figcaption>\n</figure>\n<figure class=\"image align-overflow\"><img title=\"Quang Hải, Quế Ngọc Hải phản ứng cực gắt, gây sức ép trọng tài - 9\" src=\"https://icdn.dantri.com.vn/2020/10/30/viettel-vs-hanoi-do-linh-92-1604022661008.jpg\" alt=\"Quang Hải, Quế Ngọc Hải phản ứng cực gắt, gây sức ép trọng tài - 9\">\n<figcaption>\n<p>Khi hiệp đấu đang ở những phút bù giờ, điểm nóng trên sân dồn về tình huống Rimario ngã trong vòng cấm sau tình huống va chạm với thủ môn Nguyên Mạnh. Quế Ngọc Hải ngay lập tức tỏ ra bất bình sau pha bóng nhằm kiếm penalty ở những phút nhạy cảm. (Ảnh: Đỗ Linh)</p>\n</figcaption>\n</figure>\n<figure class=\"image align-overflow\"><img title=\"Quang Hải, Quế Ngọc Hải phản ứng cực gắt, gây sức ép trọng tài - 10\" src=\"https://icdn.dantri.com.vn/2020/10/30/viettel-vs-hanoi-do-linh-93-1604022660835.jpg\" alt=\"Quang Hải, Quế Ngọc Hải phản ứng cực gắt, gây sức ép trọng tài - 10\">\n<figcaption>\n<p>Thành Chung đã phải vào can thiệp trước phản ứng rất gắt của Hải Quế. Tuy nhiên không có một hình phạt nào được trọng tài Châu đưa ra. (Ảnh: Đỗ Linh)</p>\n</figcaption>\n</figure>\n<figure class=\"image align-overflow\"><img title=\"Quang Hải, Quế Ngọc Hải phản ứng cực gắt, gây sức ép trọng tài - 11\" src=\"https://icdn.dantri.com.vn/2020/10/30/viettel-vs-hanoi-do-linh-89-1603991332941.jpg\" alt=\"Quang Hải, Quế Ngọc Hải phản ứng cực gắt, gây sức ép trọng tài - 11\">\n<figcaption>\n<p>Trận cầu nảy lửa đã khép lại không bàn thắng, kết quả này đã đẩy CLB Hà Nội xuống vị trí thứ 3 và đánh mất lợi thế trong cuộc đua tới chức vô địch LS V-League 2020.</p>\n</figcaption>\n</figure>', 263, 1, '2020-10-30 09:49:39', 'thanhnnt', '2020-10-30 09:49:39', 'thanhnnt', 'https://icdn.dantri.com.vn/2020/10/30/viettel-ha-noi-son-tung-20-1604019763111.jpg'),
(23, 'Tottenham thua sốc, Filip Nguyễn thủng lưới tới 5 lần ở Europa League', 'Tottenham-thua-soc,-Filip-Nguyen-thung-luoi-toi-5-lan-o-Europa-League-1604026192873', 'Ở lượt trận Europa League đêm qua, AC Milan, Arsenal đã thắng lớn. Trong khi đó, Tottenham đã bất ngờ thua sốc trước “tí hon”, còn Slovan Liberec của Filip Nguyễn đã thảm bại 1-5.', '2020-10-30 09:49:52', NULL, 14, 4, '<p>Tottenham đang trải qua chuỗi trận vô cùng thăng hoa trong thời gian qua. Chính điều đó khiến nhiều người tin rằng Spurs sẽ dễ dàng có chiến thắng trên sân của Bỉ, Royal Antwerp ở lượt trận thứ 2 vòng bảng Europa League.</p>\n<figure class=\"image align-center\"><img title=\"Tottenham thua sốc, Filip Nguyễn thủng lưới tới 5 lần ở Europa League - 1\" src=\"https://icdn.dantri.com.vn/thumb_w/640/2020/10/30/antwerp-20-tottenham-20291020-a-1604017945767.jpg\" alt=\"Tottenham thua sốc, Filip Nguyễn thủng lưới tới 5 lần ở Europa League - 1\">\n<figcaption>\n<p>Tottenham bất ngờ thua sốc trước Royal Antwerp</p>\n</figcaption>\n</figure>\n<p>Thế nhưng, điều ít ai ngờ tới đã xảy ra. Sau 90 phút thi đấu, đoàn quân của HLV Mourinho đã thi đấu thất vọng và hứng chịu thất bại với tỷ số 0-1 trước đội chủ nhà.</p>\n<p>Ở trận đấu này, Tottenham có tới 9 sự thay đổi so với chiến thắng trước Burnley ở Premier League. Hàng loạt cầu thủ dự bị như Bale, Alli, Vinicius, Bergwijn và Lo Celso được đá chính.</p>\n<p>Dù vậy, trái ngược với sự thăng hoa trong trận đấu mở màn gặp LASK, Tottenham lại tỏ ra khá bế tắc trước Royal Antwerp. Đội bóng Bỉ đã chấp nhận bỏ mặt trận tấn công, để phòng ngự với số đông. Điều này làm hàng công của Spurs không thể hiện được nhiều.</p>\n<p>Trong thế trận ấy, “Gà trống” đã tự thua bởi sai lầm cá nhân. Phút 29, Ben Davies lóng ngóng để mất bóng. Mbokani không bỏ qua “món quà” này. Anh thực hiện đường chuyền cho Lior Refaelov dễ dàng hạ gục Hugo Lloris trong thế trống trải.</p>\n<p>Sang hiệp 2, HLV Mourinho đã tung hàng loạt ngôi sao như Lamela, Moura, Hojbjerg và Son Heung-Min, Harry Kane vào sân. Thế nhưng, họ vẫn không tài nào xuyên thủng lưới được CLB Bỉ. Trận đấu kết thúc với tỷ số 1-0 nghiêng về Royal Antwerp.</p>\n<p>Với kết quả này, Tottenham chỉ có được 3 điểm sau 2 trận và xếp thứ 2 bảng J. Đứng đầu bảng là Royal Antwerp, đội đã giành được 6 điểm tuyệt đối.</p>\n<p>Trái ngược với sự thất vọng của Tottenham, Arsenal đã có chiến thắng tưng bừng trước đại diện của CH Ailen, Dundalk. Bất chấp việc HLV Arteta tung ra sân nhiều “kép phụ” nhưng “Pháo thủ” vẫn quá vượt trội so với đối thủ.</p>\n<figure class=\"image align-center\"><img title=\"Tottenham thua sốc, Filip Nguyễn thủng lưới tới 5 lần ở Europa League - 2\" src=\"https://icdn.dantri.com.vn/thumb_w/640/2020/10/30/350184228893371-nketiahleftopenedthescoringfor-arsenalafteranerrorfroma-11604008368794-1604018008000.jpg\" alt=\"Tottenham thua sốc, Filip Nguyễn thủng lưới tới 5 lần ở Europa League - 2\">\n<figcaption>\n<p>Arsenal thắng lớn trước Dundalk</p>\n</figcaption>\n</figure>\n<p>Tuy nhiên, Arsenal không phải dễ dàng để xuyên thủng lưới đối thủ yếu hơn. Họ phải đợi tới phút 42 mới có được bàn thắng từ sai lầm của đối thủ. Thủ thành Gary Rogers đã đấm bóng trúng người đồng đội, bóng bật ra tới vị trí của Nketiah. Cầu thủ này đã không bỏ qua “món quà từ trên trời rơi xuống” để mở tỷ số.</p>\n<p>Có được bàn thắng mở tỷ số, đội bóng chủ sân Emirates mới dễ chơi hơn. Chỉ 2 phút sau, tài năng trẻ Willock đã ghi bàn thắng thứ 2 cho Arsenal. Và khi hiệp 2 mới bắt đầu được chưa đầy 1 phút, Nicolas Pepe đã ấn định chiến thắng 3-0 cho “Pháo thủ” với pha cứa lòng tuyệt đẹp.</p>\n<p>Một đội bóng Anh khác là Leicester City cũng có chung niềm vui với Arsenal khi vượt qua đại diện Hy Lạp là AEK Athens với tỷ số 2-0. Cũng như Arsenal, Leicester City đã giành được 6 điểm sau 2 trận.</p>\n<p>AC Milan tiếp tục chuỗi trận toàn thắng ấn tượng từ đầu mùa khi vùi dập Sparta Praha với tỷ số 3-0. Đây tiếp tục là trận đấu miễn chê của Rossoneri, ngoại trừ tình huống Ibrahimovic đá hỏng phạt đền. Trong khi đó, Napoli đã đứng dậy sau thất bại bất ngờ trước AZ Alkmaar ở trận mở màn bằng chiến thắng 1-0 ngay trên sân Real Sociedad.</p>\n<figure class=\"image align-center\"><img title=\"Tottenham thua sốc, Filip Nguyễn thủng lưới tới 5 lần ở Europa League - 3\" src=\"https://icdn.dantri.com.vn/thumb_w/640/2020/10/30/20201029-t-192130-z-887539907-up-1-egat-1-hrtz-6-rtrmadp-3-soccereuroparsbsllreport-1604018027858.jpg\" alt=\"Tottenham thua sốc, Filip Nguyễn thủng lưới tới 5 lần ở Europa League - 3\">\n<figcaption>\n<p>Filip Nguyễn vào lưới nhặt bóng tới 5 lần trong trận gặp Sao đỏ Belgrade</p>\n</figcaption>\n</figure>\n<p>Ở trận đấu đáng chú ý khác, Slovan Liberec của Filip Nguyễn đã không còn gây bất ngờ ở lượt đấu này (sau khi thắng Genk ở lượt mở màn) khi đối đầu với Sao đỏ Belgrade. Sau 90 phút thi đấu, Filip Nguyễn đã vào lưới nhặt bóng tới 5 lần.</p>\n<p>Đây là trận đấu mà CLB của CH Séc không thể hiện được tinh thần thi đấu mạnh mẽ trên đất Serbia. Ngay từ phút thứ 7, họ đã phải vào lưới nhặt bóng sau tình huống dứt điểm của Ben Nabouhane. Sau đó, tới phút 21, chính Ben Nabouhane là người đã nâng tỷ số lên 2-0 cho Sao đỏ Belgrade.</p>\n<p>Dù Matoušek đã rút ngắn tỷ số xuống còn 1-2 ở cuối hiệp 1 nhưng sang hiệp 2, Filip Nguyễn đã phải vào lưới nhặt bóng tới 3 lần. Trận thua đậm 1-5 này đã kết thúc chuỗi trận thăng hoa với 4 trận toàn thắng liên tiếp của Slovan Liberec. Đây là lần đầu tiên kể từ tháng 1/2018, Slovan Liberec mới thủng lưới nhiều tới vậy.</p>\n<p><strong>H.Long</strong></p>\n            <div></div>', 256, 1, '2020-10-30 09:49:52', 'thanhnnt', '2020-10-30 09:49:52', 'thanhnnt', 'https://icdn.dantri.com.vn/thumb_w/640/2020/10/30/antwerp-20-tottenham-20291020-a-1604017945767.jpg'),
(24, 'Barcelona hạ gục Juventus: Tôn vinh “chữ ký của thập kỷ”', 'Barcelona-ha-guc-Juventus:-Ton-vinh-“chu-ky-cua-thap-ky”-1604026229619', 'Pedri vẫn là cái tên xa lạ với nhiều người hâm mộ nhưng tờ Marca đã sớm gọi cầu thủ này là “chữ ký của thập kỷ”. Màn trình diễn Pedri trước Juventus đã cho thấy hình ảnh của Iniesta mới.', '2020-10-30 09:50:29', NULL, 14, 4, '<p>Trước thềm mùa giải, HLV Ronald Koeman đã nhấn mạnh về “cuộc cách mạng trẻ” ở Barcelona. Sự xuất hiện của nhiều ngôi sao trẻ như Ansu Fati, Pedri hay Trincao đã khiến ông ruồng rẫy ngôi sao kỳ cựu như Luis Suarez.</p>\n<figure class=\"image align-center\"><img title=\"Barcelona hạ gục Juventus: Tôn vinh “chữ ký của thập kỷ” - 1\" src=\"https://icdn.dantri.com.vn/thumb_w/640/2020/10/29/12293327480-1603978550785.jpg\" alt=\"Barcelona hạ gục Juventus: Tôn vinh “chữ ký của thập kỷ” - 1\">\n<figcaption>\n<p>Pedri thi đấu vô cùng tự tin trước Barcelona</p>\n</figcaption>\n</figure>\n<p>Nhưng để đặt niềm tin vào giới trẻ, thứ cần thiết nhất là niềm tin. Ronald Koeman đã cho thấy điều đó. Ở trận Siêu kinh điển, ông đã để Pedri mới 17 tuổi đá chính. Chẳng có gì bất ngờ nếu như Pedri là một trong những gương mặt tệ nhất của Barcelona.</p>\n<p>Dù vậy, niềm tin vào thế hệ trẻ của Ronald Koeman là có thừa, giống như cái cách ông vực dậy bóng đá Hà Lan dựa trên gương mặt “búng ra sữa”. Tới trận gặp Juventus, ông đã đưa ra quyết định mạo hiểm, đó là tiếp tục sử dụng Pedri (dù Ansu Fati đã được nghỉ).</p>\n<p>Ở trận Siêu kinh điển, Pedri được bố trí ở bên hàng lang cánh phải. Ngoài nhiệm vụ tấn công, ngôi sao trẻ này còn phải ngăn chặn những pha leo biên của Mendy và đồng thời áp sát từ tuyến đầu ở cánh trái của Real Madrid (cánh phải Barcelona). Thế nhưng, đó là trận đấu mà Pedri gần như mất hút, kém trong cả nhiệm vụ tấn công lẫn phòng ngự từ xa.</p>\n<p>Sang tới trận gặp Juventus, nhiệm vụ của Pedri vẫn không thay đổi. Chỉ khá là anh chuyển từ cánh phải sang cánh trái, với nhiệm vụ ngăn chặn Juan Cuadrado. Dù vậy, lần này, Pedri đã thay đổi hoàn toàn bộ mặt.</p>\n<figure class=\"image align-center\"><img title=\"Barcelona hạ gục Juventus: Tôn vinh “chữ ký của thập kỷ” - 2\" src=\"https://icdn.dantri.com.vn/thumb_w/640/2020/10/29/11731471173147-pedrijuancuadradobarcelonajuventus-2020-scaled-1603978634935.jpg\" alt=\"Barcelona hạ gục Juventus: Tôn vinh “chữ ký của thập kỷ” - 2\">\n<figcaption>\n<p>Hình ảnh của Iniesta mới đang dần sống dậy ở Nou Camp</p>\n</figcaption>\n</figure>\n<p>Sẽ thật bất ngờ nếu như biết rằng Pedri chính là một trong những cầu thủ có chỉ số phòng ngự tốt nhất Barcelona với 3 cú tắc bóng thành công (cao nhất Barcelona) và 1 lần đánh chặn thành công.</p>\n<p>Bản đồ nhiệt cũng chỉ ra rằng, ở trận gặp Juventus, Pedri thi đấu giống như tiền vệ cánh trái hơn là tiền đạo. Khu vực hoạt động của Pedri không chỉ ở phần sân đối thủ, mà còn khá đậm ở sân nhà cũng như giữa sân.</p>\n<p>Nhưng tất nhiên, những chỉ số phòng ngự chưa bao giờ để đánh giá về ngôi sao tấn công. Thay vào đó, nó chỉ cho thấy sự tích cực của cầu thủ này. Ở Pedri, người ta nhìn thấy nhiều yếu tố của “nghệ sĩ” hơn rất nhiều so với “công nhân” phòng ngự.</p>\n<p>Chứng kiến lối chơi của Pedri, nhiều người đã nhớ về hình ảnh của Iniesta, đặc biệt ở lối rê bóng. Pedri có xu hướng hạ thấp trọng tâm khi thực hiện những pha rê bóng. Cái cách mà ngôi sao 17 tuổi này thường sử dụng những đòn vặn sườn đối thủ, bằng những kỹ năng khó hay khả năng xoay sở cực tốt trong không gian hẹp là hiện thân của “San Andres”.</p>\n<p>Cũng Pedri từng thừa nhận rằng thần tượng lớn nhất của đời mình chính là Iniesta. Do đó, việc cầu thủ trẻ này mang dáng dấp của thần tượng cũng không phải là điều dễ hiểu.</p>\n<p>Có yếu tố tác động khác lớn tới lối chơi của các cầu thủ trẻ chính là tâm lý. Khác hẳn với tâm lý nặng nề ở trận gặp Real Madrid, Pedri đã có trận đấu thoải mái hơn rất nhiều. Nếu cần minh chứng cho thấy sự tự tin của “măng non” 17 tuổi này, hãy cứ nhìn cái cách mà anh tăng tốc vượt qua Dybala, rồi xoay compa khi Rabiot áp sát.</p>\n<figure class=\"image align-center\"><img title=\"Barcelona hạ gục Juventus: Tôn vinh “chữ ký của thập kỷ” - 3\" src=\"https://icdn.dantri.com.vn/thumb_w/640/2020/10/29/1282740430-1603978677574.jpg\" alt=\"Barcelona hạ gục Juventus: Tôn vinh “chữ ký của thập kỷ” - 3\">\n<figcaption>\n<p>Pedri không chỉ thi đấu tốt trong tấn công mà còn năng nổ phòng ngự</p>\n</figcaption>\n</figure>\n<p>Sự tự tin ấy chính là hiệu ứng được lan tỏa trong cả đội. Trong trận gặp Juventus, Pedri thực hiện thành công 4/5 lần rê bóng, Dembele vượt qua đối thủ 5/8 lần, còn Messi rê bóng thành công 6/7 lần. Những con số ấy khác hoàn toàn với trận đấu với Real Madrid cách đây vài ngày.</p>\n<p>Nói vậy để thấy, để thực hiện “cách mạng trẻ”, việc đầu tiên HLV Ronald Koeman cần làm chính là tạo nên sự tự tin và tránh tâm lý sợ hãi, áp lực. Những người trẻ luôn lại ra những điều không giới hạn, chỉ cần một điểm tựa.</p>\n<p>Sau trận đấu với Juventus, tờ Marca đã gọi Pedri là “bản hợp đồng thập kỷ” của Barcelona. Bởi lẽ, số tiền Los Blaugrana chỉ ra chiêu mộ cầu thủ 17 tuổi từ Las Palmas chỉ là 5 triệu euro, chưa bằng số lẻ của rất nhiều “bom tấn” ở CLB.</p>\n<p>Nhưng giờ đây, khi các “bom tấn” lần lượt hóa “bom xịt” thì những ngôi sao trẻ lại giống như hạt giống, chuẩn bị nảy mầm để tạo nên thế hệ ngôi sao mới cho Barcelona.</p>\n<p><strong>H.Long</strong></p>\n            <div></div>', 249, 1, '2020-10-30 09:50:29', 'thanhnnt', '2020-10-30 09:50:29', 'thanhnnt', 'https://icdn.dantri.com.vn/thumb_w/640/2020/10/29/12293327480-1603978550785.jpg');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `post_interaction`
--

CREATE TABLE `post_interaction` (
  `Id` int(11) NOT NULL,
  `Account` varchar(100) DEFAULT NULL,
  `Post_Status` varchar(100) DEFAULT NULL,
  `Post_Slug` varchar(100) NOT NULL,
  `Is_Report` tinyint(1) DEFAULT NULL,
  `Reason_Report_Id` int(11) DEFAULT NULL,
  `Reason_Report_Other` varchar(255) DEFAULT NULL,
  `Is_Active` tinyint(1) DEFAULT NULL,
  `Created` datetime DEFAULT NULL,
  `Created_By` varchar(100) DEFAULT NULL,
  `Modified` datetime DEFAULT NULL,
  `Modified_By` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `post_interaction`
--

INSERT INTO `post_interaction` (`Id`, `Account`, `Post_Status`, `Post_Slug`, `Is_Report`, `Reason_Report_Id`, `Reason_Report_Other`, `Is_Active`, `Created`, `Created_By`, `Modified`, `Modified_By`) VALUES
(1, NULL, NULL, 'Đoan-nguoi-lang-le-duoi-mua,-tien-đua-Thieu-tuong-Nguyen-Van-Man-ve-đat-me-1603556331524', 1, 34, 'no', 1, '2020-10-03 00:00:00', 'thanhnnt', '2020-10-08 00:00:00', 'thanhnnt'),
(2, NULL, NULL, 'Thong-tin-ve-lu-quet-1603472598396', 1, 34, 'no', 1, '2020-10-03 00:00:00', 'thanhnnt', '2020-10-08 00:00:00', 'thanhnnt'),
(3, NULL, NULL, 'Thong-tin-ve-lu-quet-1603472598396', 1, 34, 'no', 1, '2020-05-12 00:00:00', 'thanhnnt2', '2020-10-08 00:00:00', 'thanhnnt2');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `post_tag`
--

CREATE TABLE `post_tag` (
  `Id` int(11) NOT NULL,
  `Post_Slug` varchar(100) DEFAULT NULL,
  `Tag` varchar(100) DEFAULT NULL,
  `Is_Active` tinyint(1) DEFAULT NULL,
  `Created` datetime DEFAULT NULL,
  `Created_By` varchar(100) DEFAULT NULL,
  `Modified` datetime DEFAULT NULL,
  `Modified_By` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `post_tag`
--

INSERT INTO `post_tag` (`Id`, `Post_Slug`, `Tag`, `Is_Active`, `Created`, `Created_By`, `Modified`, `Modified_By`) VALUES
(8, 'Đoan-nguoi-lang-le-duoi-mua,-tien-đua-Thieu-tuong-Nguyen-Van-Man-ve-đat-me-1603556331524', 'Tang lễ', NULL, NULL, NULL, NULL, NULL),
(9, 'Helllooo-1603617239781', 'lũ', NULL, NULL, NULL, NULL, NULL),
(10, 'Thong-tin-ve-lu-quet-1603472598396', 'lũ quét', 1, NULL, NULL, NULL, NULL),
(11, 'Bang-rung,-vuot-20-điem-sat-lo-đe-cuu-ho-nan-nhan-bi-vui-lap-o-Tra-Van-1603993681187', 'lũ', NULL, NULL, NULL, NULL, NULL),
(13, 'Bo-bien-sat-lo-nghiem-trong,-nhieu-hang-quan-đo-sap-1603994676174', 'lũ quét', 1, NULL, NULL, NULL, NULL),
(16, 'Bang-rung,-vuot-20-điem-sat-lo-đe-cuu-ho-nan-nhan-bi-vui-lap-o-Tra-Van-1603993681187', 'sạt lở', 1, NULL, NULL, NULL, NULL),
(17, '“Cau-be-vang”-piano-tu-hao-khi-quoc-ky-Viet-Nam-tung-bay-tai-cac-cuoc-thi-1604023493819', 'piano', NULL, NULL, NULL, NULL, NULL),
(18, 'Cuu-nu-sinh-Ngoai-thuong-đep-diu-dang-ben-cuc-hoa-mi-đau-mua-1604023520688', 'piano', NULL, NULL, NULL, NULL, NULL),
(19, 'Nu-sinh-ĐH-Ngoai-thuong-nang-đong,-trong-treo-nhu-nang-mai-1604023650598', 'đại học', NULL, NULL, NULL, NULL, NULL),
(20, 'Nu-sinh-ĐH-Ngoai-thuong-nang-đong,-trong-treo-nhu-nang-mai-1604023650598', 'nữ sinh', NULL, NULL, NULL, NULL, NULL),
(21, 'Nu-sinh-ĐH-Ngoai-thuong-nang-đong,-trong-treo-nhu-nang-mai-1604023650598', 'đẹp', NULL, NULL, NULL, NULL, NULL),
(22, '3-trong-so-26-ngu-dan-vu-chim-tau-đuoc-tau-nuoc-ngoai-cuu-song-1604025432671', 'chìm tàu', NULL, NULL, NULL, NULL, NULL),
(23, 'Thu-tuong-đang-đan-trong-phien-chat-van-“đac-biet”-1604025546121', 'chìm tàu', NULL, NULL, NULL, NULL, NULL),
(24, 'Bang-rung,-vuot-20-điem-sat-lo-đe-cuu-ho-nan-nhan-bi-vui-lap-o-Tra-Van-1604025919124', 'Hà nội', NULL, NULL, NULL, NULL, NULL),
(25, 'Loat-\"ma-quy\"-kinh-di-tran-xuong-pho-hoa-trang-o-Ha-Noi-dip-Halloween-1604025931617', 'Hà nội', NULL, NULL, NULL, NULL, NULL),
(26, 'Noi-du-khach-đo-xo-mua-ve-10-USD-vao-cua-đe-đao-kim-cuong-1604025941043', 'Hà nội', NULL, NULL, NULL, NULL, NULL),
(27, 'Noi-du-khach-đo-xo-mua-ve-10-USD-vao-cua-đe-đao-kim-cuong-1604025953763', 'Hà nội', NULL, NULL, NULL, NULL, NULL),
(28, 'Đi-an-buffet,-thuc-khach-bi-phat-200-ngan-đong-vi-đe-thua...-2,9-lang-rau-1604025967389', 'Hà nội', NULL, NULL, NULL, NULL, NULL),
(29, 'Lanh-đao-Muangthong-bat-ngo-“bat-đen-xanh”-đe-Van-Lam-sang-chau-Au-1604026037036', 'Hà nội', NULL, NULL, NULL, NULL, NULL),
(30, 'Co-thu-Đinh-Nai-dan-đau-luot-đi-chung-ket-giai-bi-a-the-gioi-1604026161957', 'bi-a', NULL, NULL, NULL, NULL, NULL),
(31, 'Co-thu-Đinh-Nai-dan-đau-luot-đi-chung-ket-giai-bi-a-the-gioi-1604026179070', 'bóng đá', NULL, NULL, NULL, NULL, NULL),
(32, 'Tottenham-thua-soc,-Filip-Nguyen-thung-luoi-toi-5-lan-o-Europa-League-1604026192873', 'bóng đá', NULL, NULL, NULL, NULL, NULL),
(33, 'Barcelona-ha-guc-Juventus:-Ton-vinh-“chu-ky-cua-thap-ky”-1604026229619', 'bóng đá', NULL, NULL, NULL, NULL, NULL),
(34, 'Barcelona-ha-guc-Juventus:-Ton-vinh-“chu-ky-cua-thap-ky”-1604026229619', 'barca', NULL, NULL, NULL, NULL, NULL),
(35, 'Barcelona-ha-guc-Juventus:-Ton-vinh-“chu-ky-cua-thap-ky”-1604026229619', 'messi', NULL, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `reason_report`
--

CREATE TABLE `reason_report` (
  `Id` int(11) NOT NULL,
  `Reason` varchar(100) DEFAULT NULL,
  `Is_Active` tinyint(1) DEFAULT NULL,
  `Created` datetime DEFAULT NULL,
  `Created_By` varchar(100) DEFAULT NULL,
  `Modified` datetime DEFAULT NULL,
  `Modified_By` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `reason_report`
--

INSERT INTO `reason_report` (`Id`, `Reason`, `Is_Active`, `Created`, `Created_By`, `Modified`, `Modified_By`) VALUES
(34, 'violence', 1, NULL, NULL, NULL, NULL),
(36, 'spam', 1, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `recently_view_posts`
--

CREATE TABLE `recently_view_posts` (
  `Id` int(11) NOT NULL,
  `Account` varchar(100) DEFAULT NULL,
  `Post_Slug` varchar(100) NOT NULL,
  `Read_Time` int(11) DEFAULT NULL,
  `Lastest_Position` varchar(100) DEFAULT NULL,
  `Is_Active` tinyint(1) DEFAULT NULL,
  `Created` datetime DEFAULT NULL,
  `Created_By` varchar(100) DEFAULT NULL,
  `Modified` datetime DEFAULT NULL,
  `Modified_By` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `search_history`
--

CREATE TABLE `search_history` (
  `Id` int(11) NOT NULL,
  `Account` varchar(100) DEFAULT NULL,
  `keyword` varchar(255) DEFAULT NULL,
  `Is_Active` tinyint(1) DEFAULT NULL,
  `Created` date DEFAULT NULL,
  `Created_By` int(11) DEFAULT NULL,
  `Modified` date DEFAULT NULL,
  `Modified_By` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `setting_element`
--

CREATE TABLE `setting_element` (
  `Id` int(11) NOT NULL,
  `Title` varchar(100) DEFAULT NULL,
  `Selector` varchar(100) DEFAULT NULL,
  `Post_Property` varchar(100) DEFAULT NULL,
  `Setting_Page_Id` int(11) DEFAULT NULL,
  `Order` int(11) DEFAULT NULL,
  `Is_Active` tinyint(1) DEFAULT NULL,
  `Created` datetime DEFAULT NULL,
  `Created_By` varchar(100) DEFAULT NULL,
  `Modified` datetime DEFAULT NULL,
  `Modified_By` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `setting_element`
--

INSERT INTO `setting_element` (`Id`, `Title`, `Selector`, `Post_Property`, `Setting_Page_Id`, `Order`, `Is_Active`, `Created`, `Created_By`, `Modified`, `Modified_By`) VALUES
(3, 'Nội dung', '.body', 'content', 40, NULL, 1, '2020-10-13 23:10:12', 'thanhnnt', '2020-10-20 23:10:12', 'thanhnnt'),
(15, NULL, 'têt', 'content', 55, NULL, 1, NULL, NULL, NULL, NULL),
(16, NULL, '.dt-news__title', 'title', 51, NULL, 1, NULL, NULL, NULL, NULL),
(17, NULL, '.dt-news__content', 'content', 51, NULL, 1, NULL, NULL, NULL, NULL),
(18, NULL, '.dt-news__sapo', 'summary', 51, NULL, 1, NULL, NULL, NULL, NULL),
(29, NULL, '.dt-news__title', 'title', 62, NULL, 1, NULL, NULL, NULL, NULL),
(30, NULL, '.dt-news__sapo h2', 'summary', 62, NULL, 1, NULL, NULL, NULL, NULL),
(31, NULL, '.dt-news__content', 'content', 62, NULL, 1, NULL, NULL, NULL, NULL),
(32, NULL, '.dt-news__content img', 'avatar', 62, NULL, 1, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `setting_page`
--

CREATE TABLE `setting_page` (
  `Id` int(11) NOT NULL,
  `Title` varchar(100) DEFAULT NULL,
  `Web_Id` int(11) DEFAULT NULL,
  `Url` text DEFAULT NULL,
  `Is_Active` tinyint(1) DEFAULT NULL,
  `Created` datetime DEFAULT NULL,
  `Created_By` varchar(100) DEFAULT NULL,
  `Modified` datetime DEFAULT NULL,
  `Modified_By` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `setting_page`
--

INSERT INTO `setting_page` (`Id`, `Title`, `Web_Id`, `Url`, `Is_Active`, `Created`, `Created_By`, `Modified`, `Modified_By`) VALUES
(1, 'Thành phố Hà Nội đánh bay covid', 4, 'https://dantri.com.vn/xa-hoi/bo-chinh-tri-thong-nhat-tra-vinh-co-3-pho-bi-thu-tinh-uy-20201007182158631.htm', 1, '2020-10-08 16:16:22', 'thanhnnt', '2020-10-14 06:40:51', 'thanhnnt'),
(2, 'Tin test', 4, 'https://dantri.com.vn/xa-hoi/bo-chinh-tri-thong-nhat-tra-vinh-co-3-pho-bi-thu-tinh-uy-20201007182158631.htm', 0, '2020-10-08 16:16:22', 'thanhnnt', '2020-10-20 23:28:05', 'thanhnnt'),
(3, 'test 2', 4, 'https://dantri.com.vn/xa-hoi/bo-chinh-tri-thong-nhat-tra-vinh-co-3-pho-bi-thu-tinh-uy-20201007182158631.htm', 0, '2020-10-03 16:00:00', 'thanhnnt', '2020-10-20 23:28:05', 'thanhnnt'),
(4, 'test 3', 4, 'https://dantri.com.vn/xa-hoi/bo-chinh-tri-thong-nhat-tra-vinh-co-3-pho-bi-thu-tinh-uy-20201007182158631.htm', 0, '2020-10-03 16:00:00', 'thanhnnt', '2020-10-20 23:28:05', 'thanhnnt'),
(5, 'Tình hình tết năm nay', 4, 'https://dantri.com.vn/xa-hoi/bo-chinh-tri-thong-nhat-tra-vinh-co-3-pho-bi-thu-tinh-uy-20201007182158631.htm', 1, '2020-10-03 16:00:00', 'thanhnnt', '2020-10-14 06:39:39', 'thanhnnt'),
(6, 'test 6', 4, 'https://dantri.com.vn/xa-hoi/bo-chinh-tri-thong-nhat-tra-vinh-co-3-pho-bi-thu-tinh-uy-20201007182158631.htm', 0, '2020-10-03 16:00:00', 'thanhnnt', '2020-10-20 23:28:05', 'thanhnnt'),
(7, 'test 6', 4, 'https://dantri.com.vn/xa-hoi/bo-chinh-tri-thong-nhat-tra-vinh-co-3-pho-bi-thu-tinh-uy-20201007182158631.htm', 0, '2020-10-03 16:00:00', 'thanhnnt', '2020-10-20 23:28:05', 'thanhnnt'),
(8, 'test 6', 4, 'https://dantri.com.vn/xa-hoi/bo-chinh-tri-thong-nhat-tra-vinh-co-3-pho-bi-thu-tinh-uy-20201007182158631.htm', 0, '2020-10-03 16:00:00', 'thanhnnt', '2020-10-20 23:28:05', 'thanhnnt'),
(9, 'test 6', 4, 'https://dantri.com.vn/xa-hoi/bo-chinh-tri-thong-nhat-tra-vinh-co-3-pho-bi-thu-tinh-uy-20201007182158631.htm', 0, '2020-10-03 16:00:00', 'thanhnnt', '2020-10-20 23:28:05', 'thanhnnt'),
(10, 'test 6', 4, 'https://dantri.com.vn/xa-hoi/bo-chinh-tri-thong-nhat-tra-vinh-co-3-pho-bi-thu-tinh-uy-20201007182158631.htm', 0, '2020-10-03 16:00:00', 'thanhnnt', '2020-10-20 23:28:05', 'thanhnnt'),
(11, 'test 6', 4, 'https://dantri.com.vn/xa-hoi/bo-chinh-tri-thong-nhat-tra-vinh-co-3-pho-bi-thu-tinh-uy-20201007182158631.htm', 0, '2020-10-03 16:00:00', 'thanhnnt', '2020-10-20 23:28:05', 'thanhnnt'),
(12, 'test 6', 4, 'https://dantri.com.vn/xa-hoi/bo-chinh-tri-thong-nhat-tra-vinh-co-3-pho-bi-thu-tinh-uy-20201007182158631.htm', 0, '2020-10-03 16:00:00', 'thanhnnt', '2020-10-20 23:28:05', 'thanhnnt'),
(13, 'Vận động viên đạt huy chương vàng', 4, 'https://dantri.com.vn/xa-hoi/bo-chinh-tri-thong-nhat-tra-vinh-co-3-pho-bi-thu-tinh-uy-20201007182158631.htm', 1, '2020-10-03 16:00:00', 'thanhnnt', '2020-10-14 06:39:50', 'thanhnnt'),
(14, 'Developer Thành vẫn chưa hoàn thành đồ án ', 4, 'https://dantri.com.vn/xa-hoi/bo-chinh-tri-thong-nhat-tra-vinh-co-3-pho-bi-thu-tinh-uy-20201007182158631.htm', 1, '2020-10-03 16:00:00', 'thanhnnt', '2020-10-14 06:40:27', 'thanhnnt'),
(15, 'Bão số  1', 4, 'https://dantri.com.vn/xa-hoi/bo-chinh-tri-thong-nhat-tra-vinh-co-3-pho-bi-thu-tinh-uy-20201007182158631.htm', 1, '2020-10-03 16:00:00', 'thanhnnt', '2020-10-14 06:41:06', 'thanhnnt'),
(16, 'test 6', 4, 'https://dantri.com.vn/xa-hoi/bo-chinh-tri-thong-nhat-tra-vinh-co-3-pho-bi-thu-tinh-uy-20201007182158631.htm', 1, '2020-10-03 16:00:00', 'thanhnnt', '2020-10-20 23:28:05', 'thanhnnt'),
(17, 'test 6', 4, 'https://dantri.com.vn/xa-hoi/bo-chinh-tri-thong-nhat-tra-vinh-co-3-pho-bi-thu-tinh-uy-20201007182158631.htm', 1, '2020-10-03 16:00:00', 'thanhnnt', '2020-10-20 23:28:05', 'thanhnnt'),
(18, 'test 6', 4, 'https://dantri.com.vn/xa-hoi/bo-chinh-tri-thong-nhat-tra-vinh-co-3-pho-bi-thu-tinh-uy-20201007182158631.htm', 1, '2020-10-03 16:00:00', 'thanhnnt', '2020-10-20 23:28:05', 'thanhnnt'),
(19, 'test 6', 4, 'https://dantri.com.vn/xa-hoi/bo-chinh-tri-thong-nhat-tra-vinh-co-3-pho-bi-thu-tinh-uy-20201007182158631.htm', 1, '2020-10-03 16:00:00', 'thanhnnt', '2020-10-20 23:28:05', 'thanhnnt'),
(20, 'test 6', 4, 'https://dantri.com.vn/xa-hoi/bo-chinh-tri-thong-nhat-tra-vinh-co-3-pho-bi-thu-tinh-uy-20201007182158631.htm', 1, '2020-10-03 16:00:00', 'thanhnnt', '2020-10-20 23:28:05', 'thanhnnt'),
(21, 'test 6', 4, 'https://dantri.com.vn/xa-hoi/bo-chinh-tri-thong-nhat-tra-vinh-co-3-pho-bi-thu-tinh-uy-20201007182158631.htm', 1, '2020-10-03 16:00:00', 'thanhnnt', '2020-10-20 23:28:05', 'thanhnnt'),
(22, 'test 6', 4, 'https://dantri.com.vn/xa-hoi/bo-chinh-tri-thong-nhat-tra-vinh-co-3-pho-bi-thu-tinh-uy-20201007182158631.htm', 1, '2020-10-03 16:00:00', 'thanhnnt', '2020-10-20 23:28:05', 'thanhnnt'),
(23, 'test 6', 4, 'https://dantri.com.vn/xa-hoi/bo-chinh-tri-thong-nhat-tra-vinh-co-3-pho-bi-thu-tinh-uy-20201007182158631.htm', 1, '2020-10-03 16:00:00', 'thanhnnt', '2020-10-20 23:28:05', 'thanhnnt'),
(24, 'test 6', 4, 'https://dantri.com.vn/xa-hoi/bo-chinh-tri-thong-nhat-tra-vinh-co-3-pho-bi-thu-tinh-uy-20201007182158631.htm', 1, '2020-10-03 16:00:00', 'thanhnnt', '2020-10-20 23:28:05', 'thanhnnt'),
(25, 'test 6', 4, 'https://dantri.com.vn/xa-hoi/bo-chinh-tri-thong-nhat-tra-vinh-co-3-pho-bi-thu-tinh-uy-20201007182158631.htm', 1, '2020-10-03 16:00:00', 'thanhnnt', '2020-10-20 23:28:05', 'thanhnnt'),
(26, 'test 6', 4, 'https://dantri.com.vn/xa-hoi/bo-chinh-tri-thong-nhat-tra-vinh-co-3-pho-bi-thu-tinh-uy-20201007182158631.htm', 1, '2020-10-03 16:00:00', 'thanhnnt', '2020-10-20 23:28:05', 'thanhnnt'),
(27, 'test 6', 4, 'https://dantri.com.vn/xa-hoi/bo-chinh-tri-thong-nhat-tra-vinh-co-3-pho-bi-thu-tinh-uy-20201007182158631.htm', 1, '2020-10-03 16:00:00', 'thanhnnt', '2020-10-20 23:28:05', 'thanhnnt'),
(28, 'test 6', 4, 'https://dantri.com.vn/xa-hoi/bo-chinh-tri-thong-nhat-tra-vinh-co-3-pho-bi-thu-tinh-uy-20201007182158631.htm', 1, '2020-10-03 16:00:00', 'thanhnnt', '2020-10-20 23:28:05', 'thanhnnt'),
(29, 'test 6', 4, 'https://dantri.com.vn/xa-hoi/bo-chinh-tri-thong-nhat-tra-vinh-co-3-pho-bi-thu-tinh-uy-20201007182158631.htm', 1, '2020-10-03 16:00:00', 'thanhnnt', '2020-10-20 23:28:05', 'thanhnnt'),
(30, 'test 6', 4, 'https://dantri.com.vn/xa-hoi/bo-chinh-tri-thong-nhat-tra-vinh-co-3-pho-bi-thu-tinh-uy-20201007182158631.htm', 1, '2020-10-03 16:00:00', 'thanhnnt', '2020-10-20 23:28:05', 'thanhnnt'),
(31, 'test 6', 4, 'https://dantri.com.vn/xa-hoi/bo-chinh-tri-thong-nhat-tra-vinh-co-3-pho-bi-thu-tinh-uy-20201007182158631.htm', 1, '2020-10-03 16:00:00', 'thanhnnt', '2020-10-20 23:28:05', 'thanhnnt'),
(32, 'test 6', 4, 'https://dantri.com.vn/xa-hoi/bo-chinh-tri-thong-nhat-tra-vinh-co-3-pho-bi-thu-tinh-uy-20201007182158631.htm', 1, '2020-10-03 16:00:00', 'thanhnnt', '2020-10-20 23:28:05', 'thanhnnt'),
(33, 'test 6', 4, 'https://dantri.com.vn/xa-hoi/bo-chinh-tri-thong-nhat-tra-vinh-co-3-pho-bi-thu-tinh-uy-20201007182158631.htm', 1, '2020-10-03 16:00:00', 'thanhnnt', '2020-10-20 23:28:05', 'thanhnnt'),
(34, 'test 6', 4, 'https://dantri.com.vn/xa-hoi/bo-chinh-tri-thong-nhat-tra-vinh-co-3-pho-bi-thu-tinh-uy-20201007182158631.htm', 1, '2020-10-03 16:00:00', 'thanhnnt', '2020-10-20 23:28:05', 'thanhnnt'),
(35, 'test 6', 4, 'https://dantri.com.vn/xa-hoi/bo-chinh-tri-thong-nhat-tra-vinh-co-3-pho-bi-thu-tinh-uy-20201007182158631.htm', 1, '2020-10-03 16:00:00', 'thanhnnt', '2020-10-20 23:28:05', 'thanhnnt'),
(36, 'test 6', 4, 'https://dantri.com.vn/xa-hoi/bo-chinh-tri-thong-nhat-tra-vinh-co-3-pho-bi-thu-tinh-uy-20201007182158631.htm', 1, '2020-10-03 16:00:00', 'thanhnnt', '2020-10-20 23:28:05', 'thanhnnt'),
(37, 'test 6', 4, 'https://dantri.com.vn/xa-hoi/bo-chinh-tri-thong-nhat-tra-vinh-co-3-pho-bi-thu-tinh-uy-20201007182158631.htm', 1, '2020-10-03 16:00:00', 'thanhnnt', '2020-10-20 23:28:05', 'thanhnnt'),
(38, 'test 6', 4, 'https://dantri.com.vn/xa-hoi/bo-chinh-tri-thong-nhat-tra-vinh-co-3-pho-bi-thu-tinh-uy-20201007182158631.htm', 1, '2020-10-03 16:00:00', 'thanhnnt', '2020-10-20 23:28:05', 'thanhnnt'),
(39, 'test 6', 4, 'https://dantri.com.vn/xa-hoi/bo-chinh-tri-thong-nhat-tra-vinh-co-3-pho-bi-thu-tinh-uy-20201007182158631.htm', 1, '2020-10-03 16:00:00', 'thanhnnt', '2020-10-20 23:28:05', 'thanhnnt'),
(40, 'test', 4, 'https://tienthanh.info', NULL, NULL, NULL, '2020-10-12 10:52:29', 'thanhnnt'),
(41, 'test', 4, 'https://tienthanh.info', NULL, NULL, NULL, '2020-10-12 10:53:01', 'thanhnnt'),
(42, 'tin test 2', 4, 'ădasdsad', NULL, NULL, NULL, '2020-10-12 10:53:52', 'thanhnnt'),
(43, '123', 4, '123123', NULL, NULL, NULL, '2020-10-12 10:54:37', 'thanhnnt'),
(44, 'Test Thanh', 4, 'ấdasdasd', 1, NULL, NULL, '2020-10-12 10:59:24', 'thanhnnt'),
(45, 'test333', 4, 'sdsd', 1, NULL, NULL, '2020-10-12 10:59:40', 'thanhnnt'),
(46, '1231', 4, '123123', 1, NULL, NULL, '2020-10-12 11:00:15', 'thanhnnt'),
(47, '1231', 4, '123123rrrr', 1, NULL, NULL, '2020-10-12 11:00:20', 'thanhnnt'),
(48, '234', 4, '23423423', 1, NULL, NULL, '2020-10-12 11:16:54', 'thanhnnt'),
(49, 'Tin test2222', 4, 'https://dantri.com.vn/xa-hoi/bo-chinh-tri-thong-nhat-tra-vinh-co-3-pho-bi-thu-tinh-uy-20201007182158631.htm', 0, '2020-10-12 11:51:43', 'thanhnnt', '2020-10-12 11:51:43', 'thanhnnt'),
(50, 'Thời tiết đêm 30', 4, 'https://dantri.com.vn/xa-hoi/bo-chinh-tri-thong-nhat-tra-vinh-co-3-pho-bi-thu-tinh-uy-20201007182158631.htm', 1, '2020-10-12 11:52:41', 'thanhnnt', '2020-10-14 06:39:31', 'thanhnnt'),
(51, 'Thành', 4, 'https://dantri.com.vn/xa-hoi/doan-nguoi-lang-le-duoi-mua-tien-dua-thieu-tuong-nguyen-van-man-ve-dat-me-20201020171155791.htm', 1, '2020-10-12 11:55:18', 'thanhnnt', '2020-10-24 11:18:26', 'thanhnnt'),
(52, 'Thông tin iphone 12', 4, 'https://dantri.com.vn/xa-hoi/bo-chinh-tri-thong-nhat-tra-vinh-co-3-pho-bi-thu-tinh-uy-20201007182158631.htm', 1, '2020-10-12 11:52:47', 'thanhnnt', '2020-10-14 06:39:20', 'thanhnnt'),
(53, 'Bộ chính trị ', 4, 'https://dantri.com.vn/xa-hoi/bo-chinh-tri-thong-nhat-tra-vinh-co-3-pho-bi-thu-tinh-uy-20201007182158631.htm', 1, '2020-10-12 11:53:48', 'thanhnnt', '2020-10-14 06:39:12', 'thanhnnt'),
(54, 'Tin về lũ', 4, 'https://dantri.com.vn/xa-hoi/bo-chinh-tri-thong-nhat-tra-vinh-co-3-pho-bi-thu-tinh-uy-20201007182158631.htm', 1, '2020-10-12 11:55:15', 'thanhnnt', '2020-10-14 06:38:33', 'thanhnnt'),
(55, '123', 4, 'qưe', 1, '2020-10-20 10:34:12', 'thanhnnt', '2020-10-20 11:37:10', 'thanhnnt'),
(56, '234', 4, '324234', 0, '2020-10-25 04:03:06', 'thanhnnt', '2020-10-25 04:03:06', 'thanhnnt'),
(57, '234', 4, '234', 1, '2020-10-25 04:06:40', 'thanhnnt', '2020-10-25 04:06:40', 'thanhnnt'),
(58, 'sad', 4, 'ádasd', 1, '2020-10-25 04:06:54', 'thanhnnt', '2020-10-25 04:06:54', 'thanhnnt'),
(59, 'sdf', 4, 'sdf', 1, '2020-10-25 04:07:11', 'thanhnnt', '2020-10-25 04:07:11', 'thanhnnt'),
(60, '234', 4, '23423', 1, '2020-10-25 04:07:39', 'thanhnnt', '2020-10-25 04:07:39', 'thanhnnt'),
(61, '12', 4, '234234', 1, '2020-10-25 04:07:59', 'thanhnnt', '2020-10-25 04:07:59', 'thanhnnt'),
(62, 'Dân trí', 4, 'https://dantri.com.vn/xa-hoi/bang-rung-vuot-20-diem-sat-lo-de-cuu-ho-nan-nhan-bi-vui-lap-o-tra-van-20201029184759711.htm', 1, '2020-10-25 04:08:25', 'thanhnnt', '2020-10-30 12:47:32', 'thanhnnt'),
(63, 'abc', NULL, NULL, 1, '2020-10-25 04:42:00', 'thanhnnt', '2020-10-25 04:42:00', 'thanhnnt'),
(64, 'ádasd', NULL, 'sxsx', 1, '2020-10-26 12:47:50', 'thanhnnt', '2020-10-26 12:47:50', 'thanhnnt'),
(65, 'abc', NULL, 'âcsc', 1, '2020-10-26 12:53:09', 'thanhnnt', '2020-10-26 12:53:09', 'thanhnnt'),
(66, 'ưe', 5, 'ewdwed', 1, '2020-10-26 12:54:31', 'thanhnnt', '2020-10-26 12:54:31', 'thanhnnt');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `setting_web`
--

CREATE TABLE `setting_web` (
  `Id` int(11) NOT NULL,
  `Title` varchar(100) DEFAULT NULL,
  `Url` text DEFAULT NULL,
  `Note` varchar(1000) DEFAULT NULL,
  `Select_Mode` varchar(11) DEFAULT NULL,
  `Is_Active` tinyint(1) DEFAULT NULL,
  `Created` datetime DEFAULT NULL,
  `Created_By` varchar(100) DEFAULT NULL,
  `Modified` datetime DEFAULT NULL,
  `Modified_By` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `setting_web`
--

INSERT INTO `setting_web` (`Id`, `Title`, `Url`, `Note`, `Select_Mode`, `Is_Active`, `Created`, `Created_By`, `Modified`, `Modified_By`) VALUES
(1, 'Báo mới', 'https://baomoi.com', 'Trang chủ của báo mới, mang lại những tin tức chủ yếu là về thời sự, an ninh thế giới cũng như an ninh đất nước.\r\n\r\n', 'PARTIAL', 1, '2020-10-03 16:00:00', 'thanhnnt', '2020-10-03 03:00:00', 'thanhnnt'),
(2, 'zing new', 'https://zingnews.vn/', 'Trang chủ của zing', 'PARTIAL', 1, '2020-10-03 16:00:00', 'thanhnnt', '2020-10-03 03:00:00', 'thanhnnt'),
(3, 'VNExpress', 'https://zingnews.vn/', 'Trang chủ của zing, đây là một đoạn text với độ dài trên 3 dòng để có thể kiểm tra được số lượng dòng có thể. đủ dòng chưa nhỉ, có vẻ chư addur', 'PARTIAL', 1, '2020-10-03 16:00:00', 'thanhnnt', '2020-10-03 03:00:00', 'thanhnnt'),
(4, 'Báo dân trí', 'https://dantri.com.vn/', 'Data đúng', NULL, 1, '2020-10-07 23:27:20', 'thanhnnt', '2020-10-28 23:27:20', 'thanhnnt'),
(5, 'ã', 'ác', 'âcsc', NULL, 1, '2020-10-26 12:54:17', 'thanhnnt', '2020-10-26 12:54:17', 'thanhnnt');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `tag`
--

CREATE TABLE `tag` (
  `Id` int(11) NOT NULL,
  `Tag` varchar(100) DEFAULT NULL,
  `Post_Count` int(11) DEFAULT NULL,
  `Is_Active` tinyint(1) DEFAULT NULL,
  `Created` datetime DEFAULT NULL,
  `Created_By` varchar(100) DEFAULT NULL,
  `Modified` datetime DEFAULT NULL,
  `Modified_By` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `tag`
--

INSERT INTO `tag` (`Id`, `Tag`, `Post_Count`, `Is_Active`, `Created`, `Created_By`, `Modified`, `Modified_By`) VALUES
(1, 'Lũ ', 4, 1, '2020-10-08 23:31:50', 'thanhnnt', '2020-10-20 23:31:50', 'thanhnnt'),
(2, 'sóng thần', 5, NULL, NULL, NULL, NULL, NULL),
(3, 'động đất', 5, NULL, NULL, NULL, NULL, NULL),
(4, 'lũ quét', 5, NULL, NULL, NULL, NULL, NULL),
(5, 'mất nhà', 5, NULL, NULL, NULL, NULL, NULL),
(6, 'người dân', 0, NULL, NULL, NULL, NULL, NULL),
(7, 'Tang lễ', 0, NULL, NULL, NULL, NULL, NULL),
(8, 'sạt lở', 0, NULL, NULL, NULL, NULL, NULL),
(9, 'piano', 4, NULL, NULL, NULL, NULL, NULL),
(10, 'đại học', 0, NULL, NULL, NULL, NULL, NULL),
(11, 'nữ sinh', 0, NULL, NULL, NULL, NULL, NULL),
(12, 'đẹp', 0, NULL, NULL, NULL, NULL, NULL),
(13, 'chìm tàu', 1, NULL, NULL, NULL, NULL, NULL),
(14, 'Hà nội', 5, NULL, NULL, NULL, NULL, NULL),
(15, 'bi-a', 0, NULL, NULL, NULL, NULL, NULL),
(16, 'bóng đá', 2, NULL, NULL, NULL, NULL, NULL),
(17, 'barca', 0, NULL, NULL, NULL, NULL, NULL),
(18, 'messi', 0, NULL, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `Account` varchar(100) NOT NULL,
  `First_Name` varchar(100) DEFAULT NULL,
  `Last_Name` varchar(100) DEFAULT NULL,
  `Email` varchar(100) DEFAULT NULL,
  `Password` varchar(100) DEFAULT NULL,
  `Telephone` varchar(100) DEFAULT NULL,
  `Date_Of_Birth` datetime DEFAULT NULL,
  `Introduce` varchar(500) DEFAULT NULL,
  `Avatar` text DEFAULT NULL,
  `Role` varchar(11) DEFAULT NULL,
  `Country_Id` int(11) DEFAULT NULL,
  `Gender_Id` int(11) DEFAULT NULL,
  `Last_Login` datetime DEFAULT NULL,
  `Is_Active` tinyint(1) DEFAULT NULL,
  `Created` datetime DEFAULT NULL,
  `Created_By` varchar(100) DEFAULT NULL,
  `Modified` datetime DEFAULT NULL,
  `Modified_By` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `user`
--

INSERT INTO `user` (`id`, `Account`, `First_Name`, `Last_Name`, `Email`, `Password`, `Telephone`, `Date_Of_Birth`, `Introduce`, `Avatar`, `Role`, `Country_Id`, `Gender_Id`, `Last_Login`, `Is_Active`, `Created`, `Created_By`, `Modified`, `Modified_By`) VALUES
(1, 'thanhnnt', 'Nguyễn', 'Thành', 'tienthanh2181998@gmail.com', 'thanhthanh12', '0902930834', '2020-10-16 20:42:03', 'Tôi là thành ', NULL, 'ADMIN', 1, 1, NULL, 1, '2020-10-02 20:42:03', '1', '2020-10-13 20:42:03', '1'),
(1, 'thanhnnt2', 'Nguyễn', 'Thành', 'tienthanh2181998@gmail.com', 'thanhthanh12', '0902930834', '2020-10-16 20:42:03', 'Tôi là thành ', NULL, '', 1, 1, NULL, 1, '2020-10-02 20:42:03', '1', '2020-10-13 20:42:03', '1'),
(0, 'thanhnnt3', NULL, NULL, NULL, 'thanhthanh12', NULL, NULL, NULL, NULL, 'user', NULL, NULL, NULL, 1, '2020-10-29 01:20:39', 'thanhnnt', '2020-10-29 01:20:39', 'thanhnnt'),
(0, 'thanhnnt4', 'sa', 'sdf', NULL, 'thanhthanh12', NULL, NULL, NULL, NULL, 'user', NULL, NULL, NULL, 1, '2020-10-29 01:25:35', 'thanhnnt', '2020-10-29 01:25:35', 'thanhnnt'),
(0, 'thanhnnt5', 'êf', 'êf', NULL, 'thanhthanh12', NULL, NULL, NULL, NULL, 'user', NULL, NULL, NULL, 1, '2020-10-29 01:39:42', 'thanhnnt', '2020-10-29 01:39:42', 'thanhnnt');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `web_follow`
--

CREATE TABLE `web_follow` (
  `Id` int(11) NOT NULL,
  `Account` varchar(100) DEFAULT NULL,
  `Setting_Web_Id` int(11) DEFAULT NULL,
  `Is_Active` tinyint(1) DEFAULT NULL,
  `Created` date DEFAULT NULL,
  `Created_By` int(11) DEFAULT NULL,
  `Modified` date DEFAULT NULL,
  `Modified_By` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`Id`);

--
-- Chỉ mục cho bảng `comment`
--
ALTER TABLE `comment`
  ADD PRIMARY KEY (`Id`),
  ADD KEY `Post_Slug` (`Post_Slug`),
  ADD KEY `Account` (`Account`);

--
-- Chỉ mục cho bảng `crawl_history`
--
ALTER TABLE `crawl_history`
  ADD PRIMARY KEY (`Id`),
  ADD KEY `Setting_Page_Id` (`Setting_Page_Id`),
  ADD KEY `Account` (`Account`);

--
-- Chỉ mục cho bảng `master_country`
--
ALTER TABLE `master_country`
  ADD PRIMARY KEY (`Id`);

--
-- Chỉ mục cho bảng `master_gender`
--
ALTER TABLE `master_gender`
  ADD PRIMARY KEY (`Id`);

--
-- Chỉ mục cho bảng `notification`
--
ALTER TABLE `notification`
  ADD PRIMARY KEY (`Id`),
  ADD KEY `Account` (`Account`);

--
-- Chỉ mục cho bảng `post`
--
ALTER TABLE `post`
  ADD PRIMARY KEY (`Id`),
  ADD KEY `Slug` (`Slug`),
  ADD KEY `Category_Id` (`Category_Id`),
  ADD KEY `Source_Id` (`Source_Id`);

--
-- Chỉ mục cho bảng `post_interaction`
--
ALTER TABLE `post_interaction`
  ADD PRIMARY KEY (`Id`),
  ADD KEY `Reason_Report_Id` (`Reason_Report_Id`),
  ADD KEY `Account` (`Account`),
  ADD KEY `Post_Slug` (`Post_Slug`);

--
-- Chỉ mục cho bảng `post_tag`
--
ALTER TABLE `post_tag`
  ADD PRIMARY KEY (`Id`),
  ADD KEY `Post_Slug` (`Post_Slug`),
  ADD KEY `Tag` (`Tag`);

--
-- Chỉ mục cho bảng `reason_report`
--
ALTER TABLE `reason_report`
  ADD PRIMARY KEY (`Id`);

--
-- Chỉ mục cho bảng `recently_view_posts`
--
ALTER TABLE `recently_view_posts`
  ADD PRIMARY KEY (`Id`),
  ADD KEY `Post_Slug` (`Post_Slug`),
  ADD KEY `Account` (`Account`);

--
-- Chỉ mục cho bảng `search_history`
--
ALTER TABLE `search_history`
  ADD PRIMARY KEY (`Id`),
  ADD KEY `Account` (`Account`);

--
-- Chỉ mục cho bảng `setting_element`
--
ALTER TABLE `setting_element`
  ADD PRIMARY KEY (`Id`),
  ADD KEY `Setting_Page_Id` (`Setting_Page_Id`);

--
-- Chỉ mục cho bảng `setting_page`
--
ALTER TABLE `setting_page`
  ADD PRIMARY KEY (`Id`),
  ADD KEY `Web_Id` (`Web_Id`);

--
-- Chỉ mục cho bảng `setting_web`
--
ALTER TABLE `setting_web`
  ADD PRIMARY KEY (`Id`);

--
-- Chỉ mục cho bảng `tag`
--
ALTER TABLE `tag`
  ADD PRIMARY KEY (`Id`),
  ADD UNIQUE KEY `Tag` (`Tag`);

--
-- Chỉ mục cho bảng `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`Account`),
  ADD KEY `Country_Id` (`Country_Id`),
  ADD KEY `Gender_Id` (`Gender_Id`);

--
-- Chỉ mục cho bảng `web_follow`
--
ALTER TABLE `web_follow`
  ADD PRIMARY KEY (`Id`),
  ADD KEY `Setting_Web_Id` (`Setting_Web_Id`),
  ADD KEY `Account` (`Account`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `category`
--
ALTER TABLE `category`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT cho bảng `comment`
--
ALTER TABLE `comment`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT cho bảng `crawl_history`
--
ALTER TABLE `crawl_history`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `master_country`
--
ALTER TABLE `master_country`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT cho bảng `master_gender`
--
ALTER TABLE `master_gender`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT cho bảng `notification`
--
ALTER TABLE `notification`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT cho bảng `post`
--
ALTER TABLE `post`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT cho bảng `post_interaction`
--
ALTER TABLE `post_interaction`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT cho bảng `post_tag`
--
ALTER TABLE `post_tag`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;

--
-- AUTO_INCREMENT cho bảng `reason_report`
--
ALTER TABLE `reason_report`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;

--
-- AUTO_INCREMENT cho bảng `recently_view_posts`
--
ALTER TABLE `recently_view_posts`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `search_history`
--
ALTER TABLE `search_history`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `setting_element`
--
ALTER TABLE `setting_element`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- AUTO_INCREMENT cho bảng `setting_page`
--
ALTER TABLE `setting_page`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=67;

--
-- AUTO_INCREMENT cho bảng `setting_web`
--
ALTER TABLE `setting_web`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT cho bảng `tag`
--
ALTER TABLE `tag`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT cho bảng `web_follow`
--
ALTER TABLE `web_follow`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Các ràng buộc cho các bảng đã đổ
--

--
-- Các ràng buộc cho bảng `comment`
--
ALTER TABLE `comment`
  ADD CONSTRAINT `comment_ibfk_1` FOREIGN KEY (`Post_Slug`) REFERENCES `post` (`Slug`),
  ADD CONSTRAINT `comment_ibfk_2` FOREIGN KEY (`Account`) REFERENCES `user` (`Account`);

--
-- Các ràng buộc cho bảng `crawl_history`
--
ALTER TABLE `crawl_history`
  ADD CONSTRAINT `crawl_history_ibfk_1` FOREIGN KEY (`Account`) REFERENCES `user` (`Account`),
  ADD CONSTRAINT `crawl_history_ibfk_2` FOREIGN KEY (`Setting_Page_Id`) REFERENCES `setting_page` (`Id`);

--
-- Các ràng buộc cho bảng `notification`
--
ALTER TABLE `notification`
  ADD CONSTRAINT `notification_ibfk_1` FOREIGN KEY (`Account`) REFERENCES `user` (`Account`);

--
-- Các ràng buộc cho bảng `post`
--
ALTER TABLE `post`
  ADD CONSTRAINT `post_ibfk_1` FOREIGN KEY (`Category_Id`) REFERENCES `category` (`Id`),
  ADD CONSTRAINT `post_ibfk_2` FOREIGN KEY (`Source_Id`) REFERENCES `setting_web` (`Id`);

--
-- Các ràng buộc cho bảng `post_interaction`
--
ALTER TABLE `post_interaction`
  ADD CONSTRAINT `post_interaction_ibfk_1` FOREIGN KEY (`Reason_Report_Id`) REFERENCES `reason_report` (`Id`),
  ADD CONSTRAINT `post_interaction_ibfk_2` FOREIGN KEY (`Account`) REFERENCES `user` (`Account`),
  ADD CONSTRAINT `post_interaction_ibfk_3` FOREIGN KEY (`Post_Slug`) REFERENCES `post` (`Slug`);

--
-- Các ràng buộc cho bảng `post_tag`
--
ALTER TABLE `post_tag`
  ADD CONSTRAINT `post_tag_ibfk_1` FOREIGN KEY (`Post_Slug`) REFERENCES `post` (`Slug`),
  ADD CONSTRAINT `post_tag_ibfk_2` FOREIGN KEY (`Tag`) REFERENCES `tag` (`Tag`);

--
-- Các ràng buộc cho bảng `recently_view_posts`
--
ALTER TABLE `recently_view_posts`
  ADD CONSTRAINT `recently_view_posts_ibfk_1` FOREIGN KEY (`Post_Slug`) REFERENCES `post` (`Slug`),
  ADD CONSTRAINT `recently_view_posts_ibfk_2` FOREIGN KEY (`Account`) REFERENCES `user` (`Account`);

--
-- Các ràng buộc cho bảng `search_history`
--
ALTER TABLE `search_history`
  ADD CONSTRAINT `search_history_ibfk_1` FOREIGN KEY (`Account`) REFERENCES `user` (`Account`);

--
-- Các ràng buộc cho bảng `setting_element`
--
ALTER TABLE `setting_element`
  ADD CONSTRAINT `setting_element_ibfk_1` FOREIGN KEY (`Setting_Page_Id`) REFERENCES `setting_page` (`Id`);

--
-- Các ràng buộc cho bảng `setting_page`
--
ALTER TABLE `setting_page`
  ADD CONSTRAINT `setting_page_ibfk_1` FOREIGN KEY (`Web_Id`) REFERENCES `setting_web` (`Id`);

--
-- Các ràng buộc cho bảng `user`
--
ALTER TABLE `user`
  ADD CONSTRAINT `user_ibfk_1` FOREIGN KEY (`Country_Id`) REFERENCES `master_country` (`Id`),
  ADD CONSTRAINT `user_ibfk_2` FOREIGN KEY (`Gender_Id`) REFERENCES `master_gender` (`Id`);

--
-- Các ràng buộc cho bảng `web_follow`
--
ALTER TABLE `web_follow`
  ADD CONSTRAINT `web_follow_ibfk_1` FOREIGN KEY (`Account`) REFERENCES `user` (`Account`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
