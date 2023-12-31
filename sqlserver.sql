USE [master]
GO
/****** Object:  Database [eBookStore]    Script Date: 8/7/2023 5:45:26 PM ******/
CREATE DATABASE [eBookStore]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'eBookStore', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\eBookStore.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'eBookStore_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\eBookStore_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [eBookStore] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [eBookStore].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [eBookStore] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [eBookStore] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [eBookStore] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [eBookStore] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [eBookStore] SET ARITHABORT OFF 
GO
ALTER DATABASE [eBookStore] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [eBookStore] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [eBookStore] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [eBookStore] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [eBookStore] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [eBookStore] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [eBookStore] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [eBookStore] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [eBookStore] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [eBookStore] SET  DISABLE_BROKER 
GO
ALTER DATABASE [eBookStore] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [eBookStore] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [eBookStore] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [eBookStore] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [eBookStore] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [eBookStore] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [eBookStore] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [eBookStore] SET RECOVERY FULL 
GO
ALTER DATABASE [eBookStore] SET  MULTI_USER 
GO
ALTER DATABASE [eBookStore] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [eBookStore] SET DB_CHAINING OFF 
GO
ALTER DATABASE [eBookStore] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [eBookStore] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [eBookStore] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [eBookStore] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'eBookStore', N'ON'
GO
ALTER DATABASE [eBookStore] SET QUERY_STORE = OFF
GO
USE [eBookStore]
GO
/****** Object:  Table [dbo].[account]    Script Date: 8/7/2023 5:45:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[account](
	[account_id] [int] IDENTITY(1,1) NOT NULL,
	[account_user] [varchar](400) NULL,
	[account_pass] [varchar](400) NULL,
	[isAdmin] [bit] NULL,
 CONSTRAINT [pk_account] PRIMARY KEY CLUSTERED 
(
	[account_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[book]    Script Date: 8/7/2023 5:45:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[book](
	[book_id] [int] IDENTITY(1,1) NOT NULL,
	[book_name] [nvarchar](max) NULL,
	[book_img] [varchar](max) NULL,
	[book_price] [money] NULL,
	[book_quantity] [int] NULL,
	[book_desc] [nvarchar](max) NULL,
	[author] [nvarchar](max) NULL,
	[category_id] [int] NULL,
 CONSTRAINT [pk_book] PRIMARY KEY CLUSTERED 
(
	[book_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[category]    Script Date: 8/7/2023 5:45:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[category](
	[category_id] [int] NOT NULL,
	[category_name] [nvarchar](400) NULL,
 CONSTRAINT [pk_category] PRIMARY KEY CLUSTERED 
(
	[category_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[order]    Script Date: 8/7/2023 5:45:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[order](
	[order_id] [int] IDENTITY(1,1) NOT NULL,
	[order_date] [datetime] NOT NULL,
	[account_id] [int] NOT NULL,
	[total_money] [money] NULL,
 CONSTRAINT [pk_order] PRIMARY KEY CLUSTERED 
(
	[order_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[order_line]    Script Date: 8/7/2023 5:45:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[order_line](
	[order_id] [int] NOT NULL,
	[book_id] [int] NOT NULL,
	[quantity] [int] NOT NULL,
	[price] [money] NOT NULL
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[account] ON 

INSERT [dbo].[account] ([account_id], [account_user], [account_pass], [isAdmin]) VALUES (1, N'admin1', N'123', 1)
INSERT [dbo].[account] ([account_id], [account_user], [account_pass], [isAdmin]) VALUES (2, N'manh', N'123', 1)
INSERT [dbo].[account] ([account_id], [account_user], [account_pass], [isAdmin]) VALUES (3, N'guest1', N'123456', 0)
INSERT [dbo].[account] ([account_id], [account_user], [account_pass], [isAdmin]) VALUES (4, N'test', N'123456', 0)
INSERT [dbo].[account] ([account_id], [account_user], [account_pass], [isAdmin]) VALUES (5, N'test2', N'123456', 0)
SET IDENTITY_INSERT [dbo].[account] OFF
GO
SET IDENTITY_INSERT [dbo].[book] ON 

INSERT [dbo].[book] ([book_id], [book_name], [book_img], [book_price], [book_quantity], [book_desc], [author], [category_id]) VALUES (1, N'ONG CON CHĂM CHỈ - TÔ MÀU THẾ GIỚI ĐỘNG VẬT', N'http://minhkhai.vn/hinhlon/8935227349163.jpg', 16000.0000, 1117, N'Tô màu là một trong những hoạt động ưa thích của các bé đang trong độ tuổi mầm non thích khám phá thế giới. Tô màu không những giúp các bé rèn luyện đôi tay khéo léo, đức tính kiên trì mà còn có thể bồi dưỡng cho bé khả năng nhận biết màu sắc, phát triển óc sáng tạo.

Mỗi khi hoàn thành một bức tranh tô màu, bé sẽ dễ dàng khắc sâu hình ảnh thế giới xung quanh hình thành nên quan niệm thẩm mỹ về thế giới quan.', N'Nguyệt Giang', 1)
INSERT [dbo].[book] ([book_id], [book_name], [book_img], [book_price], [book_quantity], [book_desc], [author], [category_id]) VALUES (2, N'DÁN HÌNH TRANG PHỤC CÔNG CHÚA 1 - CÔNG CHÚA TINH NGHỊCH', N'http://minhkhai.vn/hinhlon/8935212360968.jpg', 65000.0000, 87, N'Tập sách gồm nhiều hình dán xinh xắn khác nhau giúp bé thỏa sức sáng tạo ra các tác phẩm tuyệt đẹp.

Các nàng công chúa qua đôi tay khéo léo cùng trí tưởng tượng phong phú của các bạn nhỏ sẽ dần được khoác lên mình những bộ trang phục xinh xắn, lộng lẫy, trang sức cầu kỳ, cùng kiểu tóc ngộ nghĩnh…"', N'Lâm Dung', 1)
INSERT [dbo].[book] ([book_id], [book_name], [book_img], [book_price], [book_quantity], [book_desc], [author], [category_id]) VALUES (3, N'Bộ sách luyện thi ETS 2023 LC&RC', N'http://hanoibookstore.com/storage/1-41-800x800.jpg', 299000.0000, 58, N'Bộ sách ETS, bộ sách do YBM độc quyền xuất bản với ETS (viết tắt của Educational Testing Service), đơn vị tổ chức thi, quản lý bài thi và cung cấp chứng chỉ. Sách hiện đang là nguồn tài liệu mà bất kỳ ai đã luyện thi TOEIC thành công kiểm tra có thể bỏ qua. ETS 2023 được biên soạn một cách toàn diện, bám sát cấu trúc của đề thi TOEIC thật nhằm hỗ trợ học viên tiếp cận và làm quen với kỳ thi TOEIC chính thống', N'ETS', 2)
INSERT [dbo].[book] ([book_id], [book_name], [book_img], [book_price], [book_quantity], [book_desc], [author], [category_id]) VALUES (4, N'Spring Boot Persistence Best Practices ( sách đen trắng)', N'http://hanoibookstore.com/storage/spring-boot-persistence-best-practices-sach-den-trang-800x800.jpg', 328000.0000, 18, N'This book is a collection of developer code recipes and best practices for persisting data using Spring, particularly Spring Boot.', N'Apress', 3)
INSERT [dbo].[book] ([book_id], [book_name], [book_img], [book_price], [book_quantity], [book_desc], [author], [category_id]) VALUES (5, N'Bộ Cambridge English IELTS từ 8 – 16 (Bản đẹp + Giải chi tiết)', N'http://hanoibookstore.com/storage/8-16-800x800.jpg', 210000.0000, 70, N'Bộ Cambridge IELTS từ 8 – 16 (Bản đẹp + Giải chi tiết) là bộ sách do NXB Cambridge phát hành giúp bạn ôn luyện IELTS một cách hiệu quả nhất.', N'Cambridge', 2)
INSERT [dbo].[book] ([book_id], [book_name], [book_img], [book_price], [book_quantity], [book_desc], [author], [category_id]) VALUES (7, N'(BC) KINH TẾ HỌC - KHÁI LƯỢC NHỮNG TƯ TƯỞNG LỚN', N'http://www.minhkhai.vn/hinhlon/8936203363265.jpg', 360000.0000, 123, N'Điều gì xảy ra trong giai đoạn khủng hoảng kinh tế? Tiền tệ vận hành ra sao? Vì sao chúng ta phải đóng thuế? Kinh tế học ảnh hưởng đến từng khía cạnh của đời sống của chúng ta, từ việc đi làm đến cách tiêu tiền – và các ý tưởng kinh tế lớn vẫn đang tiếp tục định hình thế giới ngày nay.

KINH TẾ HỌC - KHÁI LƯỢC NHỮNG TƯ TƯỞNG LỚN được viết với văn phong đơn giản kèm theo các biểu đồ giải thích ngắn gọn, dễ hiểu các lí thuyết quan trọng. Ngoài ra còn có các câu trích dẫn kinh điển dễ nhớ và các hình minh họa dí dỏm, mang lại niềm hứng thú khi tìm hiểu về kinh tế học.', N'DK.', 4)
INSERT [dbo].[book] ([book_id], [book_name], [book_img], [book_price], [book_quantity], [book_desc], [author], [category_id]) VALUES (9, N'NGỮ PHÁP IELTS (ESSENTIAL GRAMMAR FOR IELTS - WRITING)', N'http://minhkhai.vn/hinhlon/9786048469320.jpg', 96000.0000, 100, N'Sách gồm hai phần:

- Phần 1: 5 bài học ngữ pháp căn bản cho người thi IELTS. Phần này sẽ giúp bạn hiểu rõ các đơn vị ngữ pháp trong tiếng Anh, các thành phần câu, từ loại, các loại câu, v.v. Ngoài ra, còn có các bài tập tổng hợp để giúp bạn thực hành và củng cớ kiến thức ngữ pháp đã học được.

- Phần 2: 30 chủ đề ngữ pháp thường gặp trong bài thi IELTS. Phần này giúp bạn ôn lại các chủ đề ngữ pháp thường gặp trong bài thi IELTS, như cách dùng các thì, các dạng mệnh lệnh, các loại động từ, trạng từ, dạng bị động, nghĩa vụ và sự cho phép, khả năng, lời khuyên, các loại câu điều kiện, v.v. Phần này còn bao gồm rất nhiều bài kiểm tra đọc hiểu và bài tập thực hành tương tự như các bài tập thường gặp trong bài thi IELTS, giúp bạn làm quen cũng như tự tin khi làm bài thi thật.', N'Xuân Lan', 2)
INSERT [dbo].[book] ([book_id], [book_name], [book_img], [book_price], [book_quantity], [book_desc], [author], [category_id]) VALUES (10, N'CÁCH DÙNG CÁC THÌ TIẾNG ANH VÀ ĐỘNG TỪ BẤT QUY TẮC', N'http://minhkhai.vn/hinhlon/8931805006152.jpg', 15000.0000, 90, N'Trong cuốn sách này, tác giả giới thiệu đến các bạn Bảng động từ bất quy tắc gồm các động từ thông dụng nhất. Các động từ được sắp xếp theo thứ tự Alphabet và có phiên âm rõ ràng. Các bạn có thể sử dụng để học hoặc tra cứu khi cần. Phần Hai của cuốn sách là Công thức và cách sử dụng các thì trong tiếng Anh. Phần ý nghĩa của từng thì được tóm tắt một cách đầy đủ và súc tích nhất để thuận lợi cho việc học tập của bạn.', N'Chính Bình', 2)
INSERT [dbo].[book] ([book_id], [book_name], [book_img], [book_price], [book_quantity], [book_desc], [author], [category_id]) VALUES (11, N'	HỌC TIỀN TỐ, CĂN TỐ, HẬU TỐ TIẾNG ANH BẰNG SƠ ĐỒ TƯ DUY', N'http://minhkhai.vn/hinhlon/9786043779172.jpg', 295000.0000, 123, N'Tiền tố trong tiếng Anh sẽ được chèn thêm vào trước từ gốc để làm biến đổi nghĩa của từ. Trong “gia đình tiền tố”  những từ có hàm nghĩa phủ định là các thành viên đặc biệt nhất đồng thời cũng có rất nhiều thành viên cá biệt ít gặp khác nữa. Cùng tìm hiểu ý nghĩa và cách sử dụng của các tiền tố thông dụng thường gặp qua bảng dưới đây nhé!', N'Editorial', 2)
INSERT [dbo].[book] ([book_id], [book_name], [book_img], [book_price], [book_quantity], [book_desc], [author], [category_id]) VALUES (12, N'SOLUTION SELLING - ĐỪNG BÁN SẢN PHẨM, HÃY BÁN GIẢI PHÁP', N'http://minhkhai.vn/hinhlon/8935251420272.jpg', 165000.0000, 90, N'Hầu hết doanh nghiệp và người bán hàng đều mở đầu bằng những đặc tính của sản phẩm hoặc dịch vụ mà họ cung cấp. Và người tiêu dùng đã, đang và sẽ tiếp tục bị "những đặc tính" này làm cho chán nản, bối rối rồi rơi vào trạng thái phản kháng.

Chúng ta có thể giải quyết vấn đề này theo cách có lợi cho mình. Nếu muốn tạo sự khác biệt cho bản thân, sản phẩm, dịch vụ và doanh nghiệp, bạn phải học cách trở nên khác biệt trong phương thức bán hàng. Mục đích chính của Solution Selling là giúp bạn có được sự khác biệt đó.

Cuốn sách dành cho những người muốn thay đổi, táo bạo, có tầm nhìn, cho các nhà điều hành và nhân viên bán hàng, những người hiểu rằng mối quan tâm của bản thân và của doanh nghiệp phải phù hợp với mối quan tâm của người mua – phải tạo ra người mua. Cuốn sách dành cho những ai muốn học hỏi phương thức Solution Selling và muốn bước chân vào những "sàn đấu" rộng lớn hơn của thương trường với vinh dự là người tạo ra quyền lực cho khách hàng.', N'Michael T Bosworth.', 5)
INSERT [dbo].[book] ([book_id], [book_name], [book_img], [book_price], [book_quantity], [book_desc], [author], [category_id]) VALUES (13, N'TỰ TIN GIAO TIẾP', N'http://minhkhai.vn/hinhlon/8935325013058.jpg', 120000.0000, 100, N'Nhiều người cho rằng nhất định phải có một chủ đề hay ho thú vị, hoặc là ít nhất phải tìm được một chủ đề chúng, hoặc là để đối phương dẫn dắt mình thì mới có thể trò chuyện. Thực tế chưa chắc là vậy. Nguyên nhân là bởi nhiều bạn thiếu tự tin, hướng nội, thích sống khép kín, hằng ngày thiếu cơ hội tiếp xúc với người khác, từng bị bắt nạt, hoặc từng vấp phải một số trắc trở trong quá trình trưởng thành, gây ra ảnh hưởng tiêu cực trong giao tiếp, khiến bản thân sợ hãi việc giao tiếp ở các mức độ khác nhau. Đặc biệt là khi phải tham gia một vài hoạt động, hoặc là phải nói chuyện với người khác, họ thường không biết nên nói gì, nói như thế nào.

Vậy điều gì đã ngăn họ trò chuyện với thế giới bên ngoài?

Người thiếu tự tin thường sẽ nói rằng, “Tôi sợ nói sai”. Nhưng càng sợ sẽ càng không dám nói, càng không dám nói thì càng không biết nói.

Cách duy nhất để nâng cao sự tự tin là can đảm làm những việc bản thân tự ti. Muốn ăn nói bớt vụng về, trò chuyện được suôn sẻ thì phải tích cực luyện tập, giống như luyện nói tiếng Anh vậy, càng nói không hay thì càng phải hay nói. Đừng lo lắng khi bản thân có cảm giác tự ti. Điều cốt yếu là trau dồi bản thân bằng phương pháp học tập đạt hiệu quả cao, tìm thấy ưu thế thiên phú của bản thân, chuyển hóa chúng thành động lực, tăng thêm cảm giác ưu việt, từ đó xóa bỏ tâm lý tự ti.

 ', N'Nghênh Nhận', 5)
INSERT [dbo].[book] ([book_id], [book_name], [book_img], [book_price], [book_quantity], [book_desc], [author], [category_id]) VALUES (14, N'HÀNH TRANG HỌC TRÒ - TỰ KHÍCH LỆ BẢN THÂN', N'http://minhkhai.vn/hinhlon/8935074130891.jpg', 74000.0000, 120, N'Cuộc sống không phải lúc nào cũng như ý, hãy dũng cảm đối diện với thực tế. Các em sẽ trưởng thành từ những khó khăn, chứ không nhất thiết trưởng thành nhờ thành công. Học cách mạnh mẽ trước áp lực, tiếp nhận sự so sánh với người khác để tiến bộ. Nỗ lực mỗi ngày, rồi các em sẽ có được cuộc sống thành công của chính mình.

Vì thế, mỗi người nên tự khẳng định bản thân mình, trước khi người khác khẳng định về mình.

Trong TỰ KHÍCH LỆ BẢN THÂN, tác giả Lưu Dung sẽ chia sẻ những thông điệp, bài học giàu ý nghĩa, truyền cảm hứng giúp các em thanh thiếu niên mạnh mẽ đứng vững trước áp lực cuộc sống, tự quyết định hướng đi cuộc đời cho một tương lai tốt đẹp ở phía trước', N'Lưu Dung', 5)
INSERT [dbo].[book] ([book_id], [book_name], [book_img], [book_price], [book_quantity], [book_desc], [author], [category_id]) VALUES (15, N'ĐỪNG TỨC GIẬN SỐ PHẬN', N'http://minhkhai.vn/hinhlon/9786049793196.jpg', 135000.0000, 90, N'“Đừng tức giận số phận” xoay quanh hai nhân vật Hùng và Vân. Họ có quan hệ tình cảm trong nhiều năm. Một buổi tối bình thường như bao buổi tối bình thường khác, Hùng đưa ra lời đề nghị “tạm thời chia tay” vì lý do anh sẽ tu nghiệp ở Nhật Bản. Sững sờ và bất chấp, Vân đề nghị kết hôn. Cố muốn rời khỏi Việt Nam, muốn xóa bỏ đi những ký ức đen tối thuở thiếu thời. Nhưng Hùng sau đó lại thay đổi kế hoạch, thay vì tiếp tục học lên cao anh lại tham gia các dự án kéo dài hàng tháng trời. Vân buộc phải ở lại Việt Nam một mình trong nỗi oán hận và cam chịu.

Vân có nhan sắc, danh phận và cả tiền bạc. Nhưng trong phút giây tức giận cô đã đánh cược lá bài số phận của mình, khiến cả cô và Hùng rơi vào trong vòng xoáy nghiệt ngã của hôn nhân, ngoại tình và thậm chí là cả bạo lực.

Giải thoát hay sửa chữa lỗi lầm, hàn gắn hôn nhân, Vân và Hùng đều đang lưỡng lự. Vậy lối thoát nào dành cho họ?', N'Lâm Phương Lan', 6)
INSERT [dbo].[book] ([book_id], [book_name], [book_img], [book_price], [book_quantity], [book_desc], [author], [category_id]) VALUES (16, N'CÔNG CHÚA ĐỒNG XUÂN (QUYỂN THƯỢNG)', N'http://minhkhai.vn/hinhlon/8935069922111.jpg', 155000.0000, 119, N'CÔNG CHÚA ĐỒNG XUÂN theo dòng lịch sử kể lại những chính biến kinh hoàng, với xương sống là việc thực dân Pháp dần chiếm nước ta, biến nước ta thành 1 nước bị đô hộ, triều đình nhà Nguyễn mất dần quyền lực và trở thành con rối trong tay quyền thần, Pháp súy. Khá rõ ràng và kiên quyết, không ít đau tiếc ngậm ngùi, tiểu thuyết đưa ra quan điểm của tác giả về một sự “lỡ vận” của đất nước, khi quốc sách sai lầm, triều đình do dự quá lâu không nghe theo hiến từ kiến quốc của các trí thức quan lại có tầm nhìn tiến bộ (về việc canh tân đất nước, củng cố quốc phòng, mở rộng giao thương, hòa hoãn để hạn chế thương vong chiến ). Quốc sách cố chấp và bạc nhược đã khiến các vua Nguyễn dần đi vào ngõ cụt, cắt đất dâng dần cho Pháp, chịu nhiều chiến phí; nhiều cuộc nổi loạn và binh biến diễn ra liên miên, đặc biệt là xung đột với dân Đạo, làm rối ren và suy kiệt đất nước. Có thể nói qua tiểu thuyết Công chúa Đồng Xuân, người đọc có dịp nhìn lại đầy đủ và thấu đáo sử Việt thời đầu Pháp thuộc, từ đó nhìn thời hiện đại một cách “biện chứng” hơn.

Vấn đề lịch sử quan trọng và dữ dội đó, qua ngòi bút tài hoa của nữ nhà văn xứ Huế Trần Thùy Mai, được gói trong câu chuyện về một nàng công chúa. Đó là công chúa Gia Phúc, con gái của vua Thiệu Trị, nàng công chúa xinh đẹp của kinh thành Huế. Người am hiểu sử liệu triều Nguyễn sẽ biết ngay đến bà và tai tiếng “hòa gian” của bà với chính người anh ruột cùng cha khác mẹ của mình. Vụ tai tiếng đó, cùng với án thông dâm của vương phi họ Tống với con trai là Mỹ Đường, cũng như nghi án vua Tự Đức là con trai của Trương Đăng Quế và Từ Dụ thái hậu, là những nghi án lớn nhất triều Nguyễn. Và như ở cuốn tiểu thuyết trước, tác giả đưa ra câu chuyện của mình để chiêu tuyết cho nàng công chúa tội nghiệp, với cái nhìn nhân hậu, thấu suốt, đầy thuyết phục. Ngoài ra, tác giả chủ ý đặc tả các nhân vật nữ trong thành nội ở một khía cạnh khác, thật hơn, “đời” hơn, với những trang tả tình tả sex táo bạo đầy bất ngờ. Bên cạnh diễn tiến sục sôi của mạch chính trị, câu chuyện về một “Thị Màu cung đình” xinh đẹp, phóng khoáng và đầy sức xuân nơi cung cấm nghiêm cẩn hà khắc, với cuộc đời đầy ắp thăng trầm, giữa bao chính sự rối tung, làm cho cuốn tiểu thuyết hứa hẹn hấp dẫn từ đầu đến cuối.', N'Trần Thùy Mai', 6)
INSERT [dbo].[book] ([book_id], [book_name], [book_img], [book_price], [book_quantity], [book_desc], [author], [category_id]) VALUES (17, N'NHỮNG KHÁN GIẢ NGỒI TRONG BÓNG TỐI', N'http://minhkhai.vn/hinhlon/8935244892031.jpg', 95000.0000, 149, N'Văn chương có sẵn một ngăn kéo nguyên liệu khổng lồ cho những sáng tạo phái sinh. Ngay cả những bậc thầy kể chuyện đôi khi cũng lấy ra từ đó thành phẩm có sẵn để tiếp tục đục đẽo. Franz Kafka viết Sự thật về Sancho Panza với các nhân vật bất tử của Cervantes, chỉ là ở đây, Don Quixote trở thành con quỉ ám của Sancho Panza. Và rồi những Odysseus, Penelope, Telemachus, Circe, Achilles của Homer từ gần ba ngàn năm trước vẫn liên tục được Margaret Atwood, Louis Glück, Madeline Miller - những tác giả của thế kỉ 21 - phủi lớp bụi quá khứ và thêm “chòm râu” của thời hiện đại.

Như thế, văn chương có thể trải qua vô lượng kiếp sống, liên tục sinh nghĩa, liên tục thở đều kể cả khi tác giả đã thành người thiên cổ. Đó cũng là lí do cho sự ra đời của Những khán giả ngồi trong bóng tối - một tập hợp những nhân vật quen thuộc của văn học Việt Nam, hiện ra dưới diện mạo mới, góc nhìn mới cùng những suy tư mới.', N'Hiền Trang', 6)
INSERT [dbo].[book] ([book_id], [book_name], [book_img], [book_price], [book_quantity], [book_desc], [author], [category_id]) VALUES (18, N'HOÀNG LÊ NHẤT THỐNG CHÍ', N'http://minhkhai.vn/hinhlon/9786043940329.jpg', 120000.0000, 119, N'HOÀNG LÊ NHẤT THỐNG CHÍ được viết bằng chữ Hán ghi chép về sự thống nhất của vương triều nhà Lê vào thời điểm Tây Sơn diệt Trịnh, trả lại Bắc Hà cho vua Lê.

Đây là một tiểu thuyết chương hồi lịch sử. Tác phẩm phản ánh cuộc tranh chấp quyền lực giữa các tập đoàn phong kiến thời Lê mạt và phong trào Tây Sơn. Nhóm tác giả đã phản ánh rất sinh động mâu thuẫn gay gắt giữa các giai cấp thống trị trong xã hội phong kiến với biết bao mưu mô, chức tước đã được các thế lực bày ra nhằm hãm hại nhau trong một thời kỳ lịch sử đen tối.

HOÀNG LÊ NHẤT THỐNG CHÍ là tác phẩm văn xuôi đầu tiên có quy mô lớn của một bộ sử thi. Tác phẩm có giá trị cả về mặt văn học và sử học.', N'Ngô Gia Văn Phái', 6)
INSERT [dbo].[book] ([book_id], [book_name], [book_img], [book_price], [book_quantity], [book_desc], [author], [category_id]) VALUES (19, N'DU KÍ VÒNG QUANH NƯỚC Ý - NGÀN KÌ QUAN', N'http://minhkhai.vn/hinhlon/8935244893625.jpg', 165000.0000, 100, N'Các bạn đọc Gặm Nhấm thân mến,

Hãy cài dây an toàn và chuẩn bị sẵn sàng nào: một chuyến đi tuyệt diệu đang chờ đón chúng ta. Lên đường cùng chúng tôi nhé!

Đấy là một buổi sáng mùa hạ đẹp trời, tôi - Geronimo Stilton - đang ngồi trên máy bay, sẵn sàng cho một kì nghỉ thư thái với gia đình. Nhưng… đấy không hẳn là một kì nghỉ, mà còn là khởi đầu của một chuyến đi đáng nhớ vô cùng! Mời các bạn cùng tham gia vào chuyến phiêu lưu kì thú băng qua các vùng đất và tìm hiểu nền văn hoá của nước Ý: Một đất nước của NGÀN KÌ QUAN!', N'Geronimo Stilton', 7)
INSERT [dbo].[book] ([book_id], [book_name], [book_img], [book_price], [book_quantity], [book_desc], [author], [category_id]) VALUES (20, N'TINH THẦN VĂN HOÁ TRUNG QUỐC', N'http://minhkhai.vn/hinhlon/9786043964363.jpg', 180000.0000, 60, N'Cuốn sách gồm 12 chương, phân tích, trình bày tinh thần cơ bản của văn hóa Trung Quốc; sự khác biệt cơ bản giữa hai nền văn hoá Trung - Tây; kết cấu hệ thống của văn hoá Trung Quốc truyền thống; triết học, khoa học, nghệ thuật truyền thống Trung Quốc; thiếu sót nghiêm trọng của văn hoá Trung Quốc truyền thống; những tranh luận văn hoá từ thế kỷ XVI đến nay. Cuối cùng nêu rõ chủ trương văn hoá “lý luận về sáng tạo một cách tổng hợp” của Trung Quốc.', N'Trương Đại Niên – Trình Nghi Sơn', 7)
INSERT [dbo].[book] ([book_id], [book_name], [book_img], [book_price], [book_quantity], [book_desc], [author], [category_id]) VALUES (21, N'NẾP CŨ - LÀNG XÓM VIỆT NAM', N'http://minhkhai.vn/hinhlon/8934974185994.jpg', 200000.0000, 98, N'Với bộ sách Nếp cũ gồm: Con người Việt Nam; Tín ngưỡng Việt Nam; Làng xóm Việt Nam; Hộ hè đình đám của tác giả Toan Ánh, Nhà xuất bản Trẻ mong được cung cấp cho người đọc những hiểu biết cần thiết về cội nguồn của dân tộc, về những phong tục, tập quán, lễ nghĩa phong hóa xưa nay của ông cha ta.

Biết những điều tốt đẹp, nhận chân giá trị đích thực những gì thuộc về văn hóa cổ truyền, những cái hay, cái lạ của ông cha từ thời mở nước và giữ nước đặng gìn giữ những vốn quý hay, lạ, hợp lẽ đời, để đối nhân xử thế đầy nhân hậu, yêu thương và đồng cảm giữa người với người trên quê hương Việt Nam.

Tác phẩm NẾP CŨ - LÀNG XÓM VIỆT NAM của tác giả Toan Ánh cung cấp hiểu biết về tổ chức làng xóm xưa của Việt Nam, từ cổng làng, đình làng, đường làng, cây đa đầu làng, lũy tre làng, cánh đồng làng, chợ làng... Những hình ảnh này có thể đã dần dần mất đi, lớp trẻ ngày nay có thể không còn được nhìn thấy nữa nhưng việc lưu giữ những hình ảnh, kiến thức về những ký ức đã tạo nên tâm thức, con người Việt Nam là vô cùng cần thiết và rất trân quý. Và NẾP CŨ - LÀNG XÓM VIỆT NAM đã làm một việc sưu tầm và lưu giữ lại những giá trị xa xưa đó.', N'Toan Ánh', 7)
INSERT [dbo].[book] ([book_id], [book_name], [book_img], [book_price], [book_quantity], [book_desc], [author], [category_id]) VALUES (22, N'NẾP CŨ - HỘI HÈ ĐÌNH ĐÁM', N'http://minhkhai.vn/hinhlon/8934974186007.jpg', 290000.0000, 120, N'Với bộ sách Nếp cũ gồm: Con người Việt Nam; Tín ngưỡng Việt Nam; Làng xóm Việt Nam; Hộ hè đình đám của tác giả Toan Ánh, Nhà xuất bản Trẻ mong được cung cấp cho người đọc những hiểu biết cần thiết về cội nguồn của dân tộc, về những phong tục, tập quán, lễ nghĩa phong hóa xưa nay của ông cha ta.

Biết những điều tốt đẹp, nhận chân giá trị đích thực những gì thuộc về văn hóa cổ truyền, những cái hay, cái lạ của ông cha từ thời mở nước và giữ nước đặng gìn giữ những vốn quý hay, lạ, hợp lẽ đời, để đối nhân xử thế đầy nhân hậu, yêu thương và đồng cảm giữa người với người trên quê hương Việt Nam.

Với tác phẩm NẾP CŨ - HỘI HÈ ĐÌNH ĐÁM, tác giả đã đưa chúng ta đến với những hội hè đình đám mang đậm dân tộc tính. Những hội hè đình đám đã từng mua vui cho người dân, đã từng chứng tỏ ý niệm thiêng liêng tôn giáo của người dân qua nghi lễ, đã từng nêu cao lòng biết ơn của người dân đối với các bậc anh hùng đất nước cũng như đối với các vị thần linh, nhất là các vị Thành hoàng đã che chở phù hộ cho dân mỗi xã, và nhất là đã từng là những dịp để người dân ôn lại lễ nghi, nhớ lại phong tục. NẾP CŨ - HỘI HÈ ĐÌNH ĐÁM là một tác phẩm biên khảo giá trị trong việc giữ gìn truyền thống, nét đẹp văn hóa của dân tộc Việt Nam với những lễ nghi, phong tục tự ngàn đời mà tổ tiên đã để lại cho con cháu.', N'Toan Ánh', 7)
SET IDENTITY_INSERT [dbo].[book] OFF
GO
INSERT [dbo].[category] ([category_id], [category_name]) VALUES (1, N'Sách Thiếu nhi')
INSERT [dbo].[category] ([category_id], [category_name]) VALUES (2, N'Sách Tiếng Anh')
INSERT [dbo].[category] ([category_id], [category_name]) VALUES (3, N'Sách IT')
INSERT [dbo].[category] ([category_id], [category_name]) VALUES (4, N'Sách Kinh tế')
INSERT [dbo].[category] ([category_id], [category_name]) VALUES (5, N'Sách rèn luyện')
INSERT [dbo].[category] ([category_id], [category_name]) VALUES (6, N'Sách Văn học')
INSERT [dbo].[category] ([category_id], [category_name]) VALUES (7, N'Văn hóa - Nghệ thuật')
GO
SET IDENTITY_INSERT [dbo].[order] ON 

INSERT [dbo].[order] ([order_id], [order_date], [account_id], [total_money]) VALUES (2, CAST(N'2023-08-01T08:05:03.303' AS DateTime), 3, 1319000.0000)
INSERT [dbo].[order] ([order_id], [order_date], [account_id], [total_money]) VALUES (3, CAST(N'2023-08-01T16:17:25.090' AS DateTime), 4, 113000.0000)
INSERT [dbo].[order] ([order_id], [order_date], [account_id], [total_money]) VALUES (4, CAST(N'2023-08-01T16:17:58.790' AS DateTime), 4, 1254000.0000)
INSERT [dbo].[order] ([order_id], [order_date], [account_id], [total_money]) VALUES (5, CAST(N'2023-08-03T09:32:58.890' AS DateTime), 5, 770000.0000)
INSERT [dbo].[order] ([order_id], [order_date], [account_id], [total_money]) VALUES (1005, CAST(N'2023-08-05T08:37:50.067' AS DateTime), 4, 16000.0000)
INSERT [dbo].[order] ([order_id], [order_date], [account_id], [total_money]) VALUES (1006, CAST(N'2023-08-05T08:39:20.333' AS DateTime), 4, 65000.0000)
INSERT [dbo].[order] ([order_id], [order_date], [account_id], [total_money]) VALUES (1007, CAST(N'2023-08-05T09:43:19.500' AS DateTime), 1, 97000.0000)
SET IDENTITY_INSERT [dbo].[order] OFF
GO
INSERT [dbo].[order_line] ([order_id], [book_id], [quantity], [price]) VALUES (2, 3, 2, 299000.0000)
INSERT [dbo].[order_line] ([order_id], [book_id], [quantity], [price]) VALUES (2, 4, 2, 328000.0000)
INSERT [dbo].[order_line] ([order_id], [book_id], [quantity], [price]) VALUES (2, 2, 1, 65000.0000)
INSERT [dbo].[order_line] ([order_id], [book_id], [quantity], [price]) VALUES (3, 1, 3, 16000.0000)
INSERT [dbo].[order_line] ([order_id], [book_id], [quantity], [price]) VALUES (3, 2, 1, 65000.0000)
INSERT [dbo].[order_line] ([order_id], [book_id], [quantity], [price]) VALUES (4, 3, 2, 299000.0000)
INSERT [dbo].[order_line] ([order_id], [book_id], [quantity], [price]) VALUES (4, 4, 2, 328000.0000)
INSERT [dbo].[order_line] ([order_id], [book_id], [quantity], [price]) VALUES (5, 17, 1, 95000.0000)
INSERT [dbo].[order_line] ([order_id], [book_id], [quantity], [price]) VALUES (5, 18, 1, 120000.0000)
INSERT [dbo].[order_line] ([order_id], [book_id], [quantity], [price]) VALUES (5, 16, 1, 155000.0000)
INSERT [dbo].[order_line] ([order_id], [book_id], [quantity], [price]) VALUES (5, 21, 2, 200000.0000)
INSERT [dbo].[order_line] ([order_id], [book_id], [quantity], [price]) VALUES (1005, 1, 1, 16000.0000)
INSERT [dbo].[order_line] ([order_id], [book_id], [quantity], [price]) VALUES (1006, 2, 1, 65000.0000)
INSERT [dbo].[order_line] ([order_id], [book_id], [quantity], [price]) VALUES (1007, 1, 2, 16000.0000)
INSERT [dbo].[order_line] ([order_id], [book_id], [quantity], [price]) VALUES (1007, 2, 1, 65000.0000)
GO
ALTER TABLE [dbo].[book]  WITH CHECK ADD  CONSTRAINT [fk_book_category] FOREIGN KEY([category_id])
REFERENCES [dbo].[category] ([category_id])
GO
ALTER TABLE [dbo].[book] CHECK CONSTRAINT [fk_book_category]
GO
ALTER TABLE [dbo].[order]  WITH CHECK ADD  CONSTRAINT [fk_account] FOREIGN KEY([account_id])
REFERENCES [dbo].[account] ([account_id])
GO
ALTER TABLE [dbo].[order] CHECK CONSTRAINT [fk_account]
GO
ALTER TABLE [dbo].[order_line]  WITH CHECK ADD  CONSTRAINT [fk_book] FOREIGN KEY([book_id])
REFERENCES [dbo].[book] ([book_id])
GO
ALTER TABLE [dbo].[order_line] CHECK CONSTRAINT [fk_book]
GO
ALTER TABLE [dbo].[order_line]  WITH CHECK ADD  CONSTRAINT [fk_order] FOREIGN KEY([order_id])
REFERENCES [dbo].[order] ([order_id])
GO
ALTER TABLE [dbo].[order_line] CHECK CONSTRAINT [fk_order]
GO
USE [master]
GO
ALTER DATABASE [eBookStore] SET  READ_WRITE 
GO
