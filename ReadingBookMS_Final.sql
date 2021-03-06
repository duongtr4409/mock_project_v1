CREATE DATABASE ReadingBookMS
GO
USE ReadingBookMS
GO

 
-- DROP TABLE
DROP TABLE dbo.Contain
DROP TABLE dbo.BookCase
DROP TABLE dbo.tbl_User
DROP TABLE dbo.tbl_Book
DROP TABLE dbo.tbl_Role
GO
/*
IF NOT EXISTS(SELECT * FROM INFORMATION_SCHEMA.TABLES
                WHERE TABLE_NAME = N'tbl_User')
*/
-- CREATE TABLE
CREATE TABLE tbl_Role(
	role_id int PRIMARY KEY IDENTITY(1,1),
	authority bit Default(0)
)
GO

CREATE TABLE dbo.tbl_User(
    id int IDENTITY(1,1) PRIMARY KEY,
    userName varchar(20) NOT NULL ,
    password varchar(30) NOT NULL,
    isAdmin bit DEFAULT(0),
    UNIQUE(userName)
)
GO

CREATE TABLE dbo.BookCase(
    book_case_id int PRIMARY KEY NOT NULL,
    book_case_name nvarchar(50),    
    FOREIGN KEY (book_case_id) REFERENCES tbl_User (id),
    UNIQUE(book_case_id)
)
GO

CREATE TABLE dbo.tbl_Book(
    book_id int PRIMARY KEY IDENTITY(1,1),
    bookTitle    nvarchar(100)    NOT NULL,
    author        nvarchar(100)    NOT NULL,
    brief        nvarchar(200),
    publisher    nvarchar(100)    NOT NULL,
    content        ntext    NOT NULL,
    category    nvarchar(100),
)
GO

CREATE TABLE dbo.Contain(
    book_case_id int NOT NULL, 
    book_id int NOT NULL,
    create_date date,
    CONSTRAINT pk_Contain PRIMARY KEY (book_case_id,book_id),
    FOREIGN KEY (book_case_id) REFERENCES BookCase (book_case_id),
    FOREIGN KEY (book_id) REFERENCES tbl_Book (book_id)
)
GO


-- ADD RECORD
INSERT INTO dbo.tbl_User
    VALUES('cuongtt12','ttcqhth1',''),
		  ('duongnv30','duongnv30',''),
		  ('hoannm','hoannm',''),
		  ('hoangdc1','hoangdc1',''),
		  ('sonph19','sonph19',''),
		  ('khaitv3','khaitv3',''),
		  ('longhh2','longhh2',''),
          ('admin','admin','1');
GO
/*
INSERT INTO dbo.tbl_Book( bookTitle , author, brief, publisher, content, category)
    VALUES(
    N'bookTitle'
    ,N'author'
    ,'brief'
    ,N'publisher'
    ,N'content'
    ,N'category');
GO
*/

INSERT INTO dbo.tbl_Book( bookTitle , author, brief, publisher, content, category)
    VALUES(
    N'YOU CAN WIN'
    ,N'Shiv Khera'
    ,''
    ,N'Nhà xuất bản tổng hợp TP.HCM'
    ,N'CHAPTER 1: IMPORTANCE OF ATTITUDE

Building a positive attitude
There was a man who made a living selling balloons at a fair. He had all colors of balloons, including red, yellow, blue, and green. Whenever business was slow, he would release a helium-filled balloon into the air and when the children saw it go up, they all wanted to buy one. They would come up to him, buy a balloon, and his sales would go up again. He continued this process all day. One day, he felt someone tugging at his jacket.
He turned around and saw a little boy who asked, "If you release a black balloon, would that also fly?" Moved by the boy`s concern, the man replied with empathy,
"Son, it is not the color of the balloon, it is what is inside that makes it go up."
The same thing applies to our lives. It is what is inside that counts. The thing inside of us that makes us go up is our attitude.
Have you ever wondered why some individuals, organizations, or countries are more successful than others?

	updating...'
    ,N'Sách tâm lý, kỹ năng sống');
GO

INSERT INTO dbo.tbl_Book( bookTitle , author, brief, publisher, content, category)
    VALUES(
    N'Tuổi Trẻ Đáng Giá Bao Nhiêu'
    ,N'Rosie Nguyễn'
    ,''
    ,N'Nhà xuất bản văn học'
    ,N'NẾU TÔI CÒN HAI MƯƠI

"Những thói quen tốt ta hình thành khi còn trẻ không tạo nên khác biệt nhỏ nào, đúng hơn, chúng tạo ra tất cả khác biệt." (Aristotle)

Không biết bao nhiêu lần tôi nghe những người trẻ quanh mình than buồn, chán, bảo không biết gì để làm. Và rồi không biết làm gì nên ta giết thời giờ với những thú vui nhỏ nhặt, rong chơi cho qua ngày đoạn tháng, ngủ vùi lười biếng hoặc chìm đắm vào yêu đương.

Nhưng khi đã đi qua gần hết thời đôi mươi, ngấp nghé ở ngưỡng ba mươi, nhìn lại tôi mới thấy tiếc nuối. Thấy bây giờ cuộc sống có quá nhiều cơ hội, nhiều điều phải làm, nhiều thứ để học, mà mình lại không có đủ thời gian cho ngần ấy thứ. Nghĩ nếu mà mình biết những điều này khi còn đi học, khi mình còn trẻ tuổi, chắc hẳn cuộc sống của mình sẽ khác, chắc mình sẽ bớt đi nhiều vật vã gian nan.

Ai có trải qua rồi mới hiểu, tuổi trẻ ngắn ngủi biết bao nhiêu. Thời gian một đi là không trở lại. Điều đáng quý nhất mà tuổi trẻ có được là thời gian, nhưng rất nhiều người trẻ không biết làm gì có ích với thời gian của họ. Trên thực tế, có rất nhiều điều để làm, khi người ta còn trẻ.

Nếu có thể quay ngược quá khứ, trở lại thời còn mười tám đôi mươi, tôi sẽ dành thời gian để:
1. Đầu tư cho sức khỏe

Chạy bộ, đi bơi, đánh bóng bàn, tập yoga, học võ... Luyện tập thể dục thể thao không nhất thiết phải là mua một đôi giày hàng hiệu giá hai ba triệu, mua bộ đồ giá mấy trăm nghìn, hay đăng ký thẻ thành viên trung tâm thể hình sang trọng phí vài chục triệu một năm. Giày Việt Nam chất lượng cao là đủ để chạy, vài chục nghìn đồng là có cái kính bơi. Chạy bộ trong công viên không tốn tiền, đi bơi thì chỉ mười mấy nghìn đồng một vé, các lớp học võ ở trung tâm thể thao quận huyện khoảng một hai trăm nghìn một tháng, chịu khó tìm kiếm thì quanh bạn sẽ có không ít câu lạc bộ rèn luyện sức khỏe miễn phí.

Luyện tập thể lực trước hết là đem lại một sức khỏe tốt, giúp tinh thần hưng phấn, đào thải chất độc bị hấp thụ từ môi trường sống ô nhiễm và thực phẩm độc hại. Một cơ thể lành mạnh là điều kiện tiên quyết để có một cuộc sống tốt. Thêm vào đó, tương tác trong những cộng đồng khác nhau giúp ta có nhiều mối quan hệ hơn, mở rộng tầm nhìn và quan điểm về cuộc đời.

2. Đọc sách

Phần lớn tri thức nhân loại đều nằm trong sách. Còn báo, tạp chí thường chỉ chứa thông tin, chưa kể báo mạng và mạng xã hội hiện nay đa phần là tin rác. Vậy mà ngày nay người ta đọc báo nhiều hơn đọc sách. Sự thật là sách giúp con người thay đổi cuộc đời. Những lúc tinh thần đi xuống, không muốn làm gì, tốt nhất là đọc sách. Vì sách không những nâng cao kiến thức mà còn tạo động lực thúc đẩy ta hành động tốt hơn.
Sách cũng không phải rẻ, nhất là với ví tiền mỏng manh của người trẻ. Nếu không có điều kiện mua sách giấy thì lên mạng tìm các trang web đọc ebook miễn phí như Sachvui.com . Nếu đã đọc ebook thì tốt nhất là tìm ebook nguyên bản tiếng Anh, vừa có kiến thức vừa tăng thêm vốn từ vựng, một công đôi việc. Chỉ cần một tuần đọc một quyển sách. Một năm nhìn lại, thấy kiến thức của mình đã dày hơn vài phần.

Điều công bằng nhất trong cuộc sống này là chúng ta đều có quyền lựa chọn và quyết định con đường mình sẽ đi. Bạn sẽ tuyệt vọng hay ở trên một con đường mới, bạn sẽ biến mình thành một kẻ thất bại thảm hại hay lột xác thành công chúa kiêu hãnh? Bạn sẽ là ai? Cuộc đời bạn sẽ như thế nào? Chẳng phải vì người đàn ông nào cả? trước hết là do bạn!
3. Học trực tuyến trên mạng.

	updating...'
    ,N'Sách tâm lý, kỹ năng sống');
GO

INSERT INTO dbo.tbl_Book( bookTitle , author, brief, publisher, content, category)
    VALUES(
    N'Đừng Lựa Chọn An Nhàn Khi Còn Trẻ'
    ,N'Cảnh Thiên'
    ,''
    ,N'Nhà xuất bản thế giới'
    ,N'Trong độ xuân xanh phơi phới ngày ấy, bạn không dám mạo hiểm, không dám nỗ lực để kiếm học bổng, không chịu tìm tòi những thử thách trong công việc, không phấn đấu hướng đến ước mơ của mình. Bạn mơ mộng rằng làm việc xong sẽ vào làm ở một công ty nổi tiếng, làm một thời gian sẽ thăng quan tiến chức. Mơ mộng rằng khởi nghiệp xong sẽ lập tức nhận được tiền đầu tư, cầm được tiền đầu tư là sẽ niêm yết trên sàn chứng khoán. Mơ mộng rằng muốn gì sẽ có đó, không thiếu tiền cũng chẳng thiếu tình, an hưởng những năm tháng êm đềm trong cuộc đời mình. Nhưng vì sao bạn lại nghĩ rằng bạn chẳng cần bỏ ra chút công sức nào, cuộc sống sẽ dâng đến tận miệng những thứ bạn muốn? Bạn cần phải hiểu rằng: Hấp tấp muốn mau chóng thành công rất dễ khiến chúng ta đi vào mê lộ. Thanh xuân là khoảng thời gian đẹp đẽ nhất trong đời, cũng là những năm tháng then chốt có thể quyết định tương lai của một người. Nếu bạn lựa chọn an nhàn trong 10 năm, tương lai sẽ buộc bạn phải vất vả trong 50 năm để bù đắp lại. Nếu bạn bươn chải vất vả trong 10 năm, thứ mà bạn chắc chắn có được là 50 năm hạnh phúc. Điều quý giá nhất không phải là tiền mà là tiền bạc. Thế nên, bạn à, đừng lựa chọn an nhàn khi còn trẻ.
    updating...'
    ,N'Sách kỹ năng sống');
GO

INSERT INTO dbo.tbl_Book( bookTitle , author, brief, publisher, content, category)
    VALUES(
    N'TÔI TƯ DUY, TÔI THÀNH ĐẠT'
    ,N'John C. Maxwell'
    ,''
    ,N'Nhà xuất bản lao động - xã hội'
    ,N'LỜI GIỚI THIỆU
Những người tư duy tốt luôn có rất nhiều mong muốn và đòi hỏi. Những người biết đặt câu hỏi làm thế nào luôn tìm được một công việc hợp lý, còn những người biết đặt câu hỏi tại sao thì luôn luôn trở thành những nhà lãnh đạo. Những người có tư duy tốt có thể giải quyết các vấn đề một cách hiệu quả,
họ luôn luôn dồi dào ý tưởng và luôn hy vọng về một tương lai tốt đẹp hơn. Những người có tư duy tốt hiếm khi trông chờ vào lòng thương xót của những kẻ tàn nhẫn, độc ác - những người tận dụng lợi thế của mình để ngược đãi người khác, những người như nhà độc tài Đức Quốc xã Adolf Hitler, người từng nói: “Thật may mắn cho người lãnh đạo ở những đất nước mà người dân không biết suy nghĩ.
Những người có tư duy tốt có thể tự chủ - ngay cả khi họ phải ở dưới chướng một nhà độc tài tàn bạo hay lâm vào tình cảnh tiến thoái lưỡng nan. Vì vậy, họ luôn là những người thành công trong cuộc sống.
Tôi đã nghiên cứu về những người thành đạt trong suốt 40 năm qua và dù mỗi người vươn tới thành công theo những cách khác nhau nhưng họ đều có một điểm chung: đó là cách họ tư duy! Đây cũng là điểm duy nhất phân biệt những người thành công và những người không thành công. Điều này cũng thật
may mắn vì chúng ta có thể tiếp thu và học hỏi cách tư duy của những người thành công. Nếu bạn thay đổi suy nghĩ, cuộc sống của bạn cũng sẽ đổi thay!

TẠI SAO BẠN NÊN THAY ĐỔI TƯ DUY?
Thật khó để có thể nói nhiều hơn về giá trị của việc thay đổi tư duy. Tư duy tốt có nhiều lợi ích đối
với bạn: thu nhập tốt hơn, giải quyết vấn đề một cách nhạy bén và nắm bắt các cơ hội nhanh hơn. Nó có thể đưa bạn lên một tầm cao mới trong công việc cũng như trong cuộc sống. Nó có thể thật sự thay đổi cuộc sống của bạn.
Trước hết, bạn nên biết một số điều về thay đổi tư duy:
1. Thay đổi tư duy không diễn ra một cách tự nhiên
Thật tiếc rằng, sự thay đổi tư duy không diễn ra một cách tự nhiên. Nó không tự nhiên tìm đến bạn mà
bạn phải đi tìm nó. Nếu bạn muốn có một tư duy tốt hơn, bạn phải rất cố gắng - và khi bạn đã có một
tư duy tốt, những ý tưởng tốt sẽ tự tìm đến với bạn. Số lượng những tư duy tốt đến với bạn vào một
thời điểm phụ thuộc rất nhiều vào những tư duy tốt mà bạn đã có.
2. Thay đổi tư duy là một việc rất khó khăn
Những người tin rằng tư duy là một việc rất dễ dàng thực ra là những người ít chịu tư duy. Nhà vật lý học đạt giải Nobel, Albert Einstein, một trong những người có tư duy lỗi lạc nhất đã nói: “Tư duy là việc rất khó khăn, vì vậy rất ít người chịu tư duy”. Bởi vì tư duy là một việc vô cùng khó khăn nên bạn
hãy làm mọi thứ để có thể cải thiện tư duy của mình.
3. Thay đổi tư duy là một việc rất đáng làm
Tác giả Napoleon Hill đã nói: “Số lượng vàng đã được khai phá từ trí não con người lớn hơn bất kì mỏ vàng nào trên thế giới”. Khi bạn dành thời gian để thay đổi tư duy, bạn đã có một lựa chọn đúng đắn. Những mỏ vàng rồi cũng cạn kiệt. Thị trường chứng khoán thì chao đảo liên miên. Đầu tư vào bất động sản cũng gặp phải rất nhiều trở ngại. Nhưng một trí óc với tư duy tốt sẽ như một mỏ kim cương không bao giờ cạn kiệt. Nó là vô giá.

	updating...'
    ,N'Sách kỹ năng sống, self-help');
GO

INSERT INTO dbo.tbl_Book( bookTitle , author, brief, publisher, content, category)
    VALUES(
    N'KHÁC BIỆT HAY LÀ CHẾT'
    ,N'JACK TROUT'
    ,''
    ,N'Nhà xuất bản Trẻ, TP.HCM'
    ,N'KHỞI ĐỀ
Hầu như trong suốt một đời làm việc của chúng tôi, tôi và các đồng sự của tôi đều luôn rao truyền về tầm quan trọng của việc "là khác biệt".
Trong cuốn Vị thế hoá (Positioning), là khác biệt có nghĩa là tự cá biệt hoá trong tâm trí của các đối tượng tiềm năng.
Trong cuốn Chiến cuộc Marketing (Marketing Warfare), là khác biệt có nghĩa là dùng một tư tưởng cá biệt hoá để bảo vệ, để tiến công, để đánh bọc hậu hay để trở thành một du kích, một "Che".
Trong cuốn 22 Quy luật Marketing bất biến (22 Immutable Laws of Marketing), là khác biệt có nghĩa là dùng một tư tưởng cá biệt hoá để xây dựng một thương hiệu.
Trong cuốn Đơn giản là Hoàn hảo (The Power of Simplicity), là khác biệt có nghĩa là thiết lập một chiến lược cá biệt hoá.
Là khác biệt hầu như luôn là trọng tâm của mọi việc mà chúng tôi đã làm trong suốt ba mươi năm vừa qua.
Bạn có thể cho rằng lúc này, thông điệp về việc "là khác biệt" của chúng tôi đã được loan truyền rộng rãi. Hầu như mọi người, ai ai cũng đang bận rộn xây dựng sự khác biệt trong các kế hoạch của họ. Không một ai không góp mặt với đời với một ý tưởng khác biệt trong đầu của anh ta, ông ta hay cô ta, bà ta. Có đúng như vậy không ?
Không hẳn như vậy.
Định ý của chúng tôi khi viết cuốn sách này là xét đến hai loại tổ chức. Một loại chưa hề bao giờ để tâm đến chuyện là khác biệt. Họ vào cuộc, mở ra những trận chiến với những yếu tố cạnh tranh như "chất lượng cao," "giá trị tốt" hay một điều cũ kỹ vẫn luôn có vẻ hấp dẫn - "sản phẩm tốt hơn." Họ tin tưởng vào những lợi thế cạnh tranh mà họ tự đặt ra cho mình là hơn hẳn mọi đối thủ nhưng rồi chính những gì họ tin tưởng này lại chính là những gì nhanh chóng loại họ ra khỏi cuộc chơi.
Họ tụ tập chung quanh họ với những "bậc thầy chuyên nghiệp," những người luôn miệng nói về chất lượng, về trao quyền, về việc định hướng vào khách hàng và vô vàn những hình thức lãnh đạo từ nghệ thuật đến phi nghệ thuật khác. Bất hạnh thay, mọi đối thủ của họ cũng được bao quanh bằng những "bậc thầy" tương tự. Không có gì là khác biệt.
Một loại các tổ chức khác, là những tổ chức hiểu được nhu cầu của việc là khác biệt. Nhưng rồi sau một vài nỗ lực phải nói là không đáng kể, họ đành phải chấp nhận là họ không thể và không biết làm sao để có thể tự khác biệt hoá. Họ đành phải chấp nhận là sản phẩm cũng như cách thức bán
hàng của họ quả là không khác biệt bao nhiêu với các đối thủ của họ.
Họ đành phải nhắm đến những phương pháp kích hoạt mãi lực vẫn được tin tưởng và áp dụng rộng rãi. Đáng buồn thay, họ vẫn không thể tạo thành sự khác biệt họ muốn có với cùng những phương cách và nhân tố tương tự như mọi đối thủ chung quanh họ.
Những tổ chức này cũng không gặt hái được bao nhiêu hỗ trợ từ những tên tuổi khoa bảng lớn. Ví dụ như Michael Porter của trường đại học Havard, người đã nói về nhu cầu của một Đề nghị Bán Độc quyền (USP, unique selling proposition) nhưng lại không thể nói chính xác là các công ty cần
phải làm những gì để đạt được cái Đề nghị Bán Độc quyền này. Ông Porter thực sự chỉ nói đến những gì bên lề như tính liên tiến chiến lược, vị thế chiến lược, thương mãi chiến lược và còn nhiều nữa cho tất cả những ai có thể trả chi phí cho những điều mà ông nói. Vẫn không có gì là khác biệt.
Sự hỗ trợ từ các công ty quảng cáo cũng không đem lại cho họ điều gì tốt hơn. Họ nói và nghe về những gì như tính dễ thương, tính đột phá v.v…
Đối với họ những thứ này có vẻ nghệ thuật hơn là kỹ thuật. Vẫn không có gì là khác biệt ở đây.
Cuốn sách này được viết ra là để thay đổi tất cả những quan điểm được nói đến ở trên. Nó vạch ra nhiều cách để bạn có thể tự mình là khác biệt và tránh khỏi sự cám dỗ của những gì có vẻ là khác biệt nhưng thực sự lại tương đồng.
Với cuốn sách này trong tay, các bạn sẽ ở trong một vị thế tốt hơn để phát triển vững vàng hơn trong môt thế giới đầy cạnh tranh, không hề khoan nhượng. Đây là một cuốn sách có thể tạo ra sự khác biệt cho công cuộc kinh doanh của bạn.
	updating...'
    ,N'Sách kỹ năng sống');
GO

INSERT INTO dbo.tbl_Book( bookTitle , author, brief, publisher, content, category)
    VALUES(
    N'Cổ học tinh hoa'
    ,N'Nguyễn Văn Ngọc, Trần Lê Nhân'
    ,''
    ,N'Nhà xuất bản Văn hóa thông tin'
    ,N'LỜI TỰA
"Có mới, nới cũ" thường tình vẫn thế. Tân học mỗi ngày một tiến, tất Cựu học phải lùi và có khi sợ rồi mai một đi mất.
Nhưng, Tân học mà hay, tất là Tân học có một nền tảng vững chắc. Nền tảng ấy tức là tinh hoa của Cựu học. Cựu học nước nhà là một thứ học trải qua bao nhiêu đời, đã làm cho ông cha ta phù thực được cương thường, chấn chỉnh được phong hóa, bảo tồn được quốc thể, duy trì được thế đạo nhân tâm, thật
không phải là một cái Học không có giá trị đáng khinh rẻ hay quên bỏ được. Vả chăng: "Tri kim, nhi bất tri cổ, vị chi manh cổ; tri cổ, nhi bất tri kim, vị tri lục trầm" ta đã biết truyện đời nay, ta lại cần phải học truyện đời xưa, ta ôn lại việc đời xưa mà ta rõ được việc đời nay, có như thế, thì cái Học của ta mới không đến nỗi khiếm khuyết. Vì, tuy chia làm cổ, kim, nhưng chẳng qua cũng chỉ là buổi sớm, buổi chiều trong một ngày của trời đất, kẻ học giả mà câu nệ thấp nhất, chỉ biết cổ không muốn biết kim, hay chỉ biết kim không muốn biết cổ, thì sao gọi là "bác cổ thông kim" được!
Cựu học của ta là gì? Cựu học của ta tức là Hán học nghĩa là một cái Học chung cho cả mấy dân tộc ở Á Đông đã chịu cái văn hóa của giống người Hán, tức là người Trung Hoa. Cựu học không phải là chỉ có Tứ Thư, Ngũ Kinh, xưa kia đa số quen dùng làm cái học cử nghiệp mà thôi. Ngoại giả, còn Bác gia chư tử thật là man mác rộng như bể, học thuyết đủ mọi mặt, lý tưởng rất xâu xa, muốn học cho tới nơi, phải mất bao nhiêu công phu, thời giờ mới được.
Nay, chúng tôi biên tập quyển sách nầy, không phải là muốn chuyên tâm nghiên cứu riêng một phái nào hay một nhà nào. Chúng tôi chỉ góp nhặt một đôi chút lý tưởng trong Cổ học gọi là để cho người đọc thiệp liệp qua được một ít tinh hoa của lối học cũ mà thôi. Nên chúng tôi mới lạm dụng bốn chữ "Cổ Học Tinh Hoa" làm nhan sách 

		updating...'
    ,N'Sách văn hóa');
GO

INSERT INTO dbo.tbl_Book( bookTitle , author, brief, publisher, content, category)
    VALUES(
    N'BIẾT HÀI LÒNG'
    ,N'LEO BABAUTA'
    ,'Là chính mình vui sống mà vẫn làm được việc'
    ,N'ecoBlader'
    ,N'Thỏa thuận
Đây không phải là quyển sách mà bạn xem
qua rồi để sang một bên. Sách cũng không
phải nói về các triết lí chung chung, hay
khuyên răn gì về cuộc sống cả. Và sách cũng
không phải dụ dỗ bạn tham gia một chương
trình nào hết. Vậy thì nó là gì?
Đây là một quyển sách hướng đến hành
động. Sách được viết để bạn:
Đọc trong 1 giờ. Không phải đọc sơ sơ
rồi bỏ đó, mà là đọc thực sự.
Biến phương pháp thành hành động.
Ngay lập tức.
Luyện tập kĩ năng hằng ngày, mỗi ngày ít phút thôi. Trong thời gian ngắn, bạn sẽ có các kĩ năng cơ bản giúp bản thân biết hài lòng, ít giận dữ và ít stress hơn trước nhiều.
Nghe khá hay nhỉ? Nếu bạn thích những thứ mà sách này sẽ mang lại, hãy thỏa thuận thế này:
Bạn sẽ làm 3 điều đã nói ở trên.
Bạn cũng đồng ý tắt hết mấy thứ linh
tinh trên laptop và cho bản thân mình 1
tiếng đồng hồ tập trung đọc sách.
Tôi đồng ý sẽ viết ngắn gọn để tiết
kiệm thời gian cho bạn, và sẽ hướng dẫn
bạn một vài kĩ năng thực sự hữu dụng.
Chỉ thế thôi. Tôi rất vui vì bạn đã đọc tới
đây. Cảm ơn bạn rất nhiều.

	updating...'
    ,N'Sách kỹ năng sống');
GO

INSERT INTO dbo.tbl_Book( bookTitle , author, brief, publisher, content, category)
    VALUES(
    N'NHÀ GIẢ KIM'
    ,N'Paulo Coelho'
    ,''
    ,N'Nhà xuất bản văn học'
    ,N'CHƯƠNG 1 - 8 -
VÀO TRUYỆN
Nhà luyện kim đan cầm lấy quyển sách mà một người trong đoàn lữ hành mang theo. Quyển sách đã cũ và long gáy nhưng ông vẫn đọc được tên tác giả : Oscar Wilde. Mở ra đọc, ông thấy có một câu chuyện về hoa thủy tiên. Dĩ nhiên, ông không lạ gì truyền thuyết về chàng Narziss xinh trai, ngày ngày soi mặt trên hồ nước để tự chiêm ngưỡng sắc đẹp của mình. Chàng say mê chính mình đến nỗi một ngày kia nghiêng quá đà, ngã xuống hồ và chết đuối. Thế là từ nơi đó mọc lên một bông hoa đẹp, mang tên chàng Narziss nọ. Nhưng Oscar Wilde không kết thúc câu chuyện như thế mà kể rằng sau khi chàng chết,
những nàng tiên trong rừng hiện ra, thấy hồ nước ngọt kia giờ đã biến thành một đầm lầy mặn vì nước mắt.
“Vì sao em khóc ?” – các nàng tiên hỏi. “Vì em thương tiếc chàng Narziss”, hồ nước đáp.
“Phải rồi. Các chị chẳng ngạc nhiên tí nào. Và tuy tất cả chúng ta đều theo đuổi chàng nhưng chỉ mình em được chiêm ngưỡng sắc đẹp tuyệt vời ấy”.
“Chàng xinh trai đến thế ư ?”, hồ nước ngơ ngác hỏi.
“Còn ai biết điều này rõ hơn là em chứ ?” – các nàng tiên ngạc nhiên – “ngày nào mà chàng chẳng cúi người soi mình trên mặt hồ”.
Nghe thế, hồ nước im lăng hồi lâu rồi mới đáp : “Đúng là em khóc chàng Narziss, nhưng em chưa bao giờ để ý rằng chàng đẹp trai đến thế. Em khóc chàng vì mỗi lần chàng soi người trên mặt hồ thì em mới thấy được sắc đẹp của chính em hiện lên rõ trong đôi mắt chàng”.
“Quả là một câu chuyện tuyệt vời”, nhà luyện kim đan nói

	updating...'
    ,N'Sách văn học');
GO

INSERT INTO dbo.tbl_Book( bookTitle , author, brief, publisher, content, category)
    VALUES(
    N'Con sư tử vàng của thầy Pháp Tạng'
    ,N'Thích Nhất Hạnh'
    ,''
    ,N'Nhà xuất bản Tôn giáo'
    ,N'Hoa Nghiêm Kim Sư Tử Chương
Kim Sư Tử Chương là một tác phẩm rất ngắn của thầy Pháp Tạng
nhưng bao hàm được giáo lý của Kinh Hoa Nghiêm. Trung Quốc có khoảng mười tông phái Phật giáo, trong đó có tông Hoa Nghiêm. Tất cả chúng ta đều phải nên tìm hiểu nội dung của mười tông phái đó.
Tông phái Hoa Nghiêm được thành lập dựa trên giáo lý của kinh Hoa Nghiêm, một kinh Đại Thừa và tông này đã xiển dương giáo lý duyên khởi tới mức tròn đầy.
Thầy Pháp Tạng là tổ thứ ba của tông Hoa Nghiêm, Pháp Tạng có nghĩa là kho tàng của chánh pháp. Tổ thứ hai là thầy Trí Nghiễm.
Trên thầy Trí Nghiễm là thầy Đỗ Thuận, sơ tổ của tông Hoa Nghiêm.
Sau tổ Pháp Tạng có tổ Trừng Quán và sau tổ Trừng Quán có tổ Tông Mật. Đó là năm vị tổ của tông Hoa Nghiêm gọi là Hoa Nghiêm Ngũ Tổ. Tông Hoa Nghiêm thừa hưởng nhiều giáo lý của các ngài Mã Minh và Long Thọ nên có khi người ta nhận hai ngài này là hai vị tổ đầu tiên, trước thầy Đỗ Thuận. Nhưng kỳ thật tông Hoa Nghiêm chỉ có năm vị tổ.
Các thầy ngày xưa rất giỏi. Thầy Nghĩa Tịnh đi Ấn Độ về và được vua Đường khuyến khích lập một trung tâm dịch thuật kinh điển từ tiếng Phạn ra chữ Hán. Thầy Huyền Trang cũng vậy. Sau chuyến đi Ấn Độ về hai thầy đều có viết hồi ký và đã thành lập những trung tâm dịch thuật để dịch kinh từ tiếng Phạn sang chữ Hán. Thầy Pháp Tạng có tham gia vào trung tâm dịch thuật của thầy Nghĩa Tịnh. Thầy Pháp Tạng đã dịch rất nhiều kinh ra chữ Hán như kinh Hoa Nghiêm, kinh
Lăng Già và hàng chục bộ kinh khác.
Thầy Pháp Tạng cũng là người gốc Khương Cư (Sogdian) như thầy Tăng Hội. Cha ông từ nước Khương Cư di cư qua Trung Quốc. Có thể gọi thầy là Khương Pháp Tạng như ta gọi thầy Tăng Hội là Khương Tăng Hội vậy. Thầy biết tiếng Tây Tạng, tiếng Phạn và các thứ tiếng
khác. Thầy rất thông minh.

	updating...'
    ,N'Sách tôn giáo');
GO

INSERT INTO dbo.tbl_Book( bookTitle , author, brief, publisher, content, category)
    VALUES(
    N'ĐỪNG ĐỢI ĐẾN KHI TỐT NGHIỆP ĐẠI HỌC'
    ,N'AlphaBook'
    ,'brief'
    ,N'AlphaBook'
    ,N'Lời giới thiệu
Các bạn sinh viên thân mến,
Các bạn đang được sống trong những tháng ngày “giàu có” nhất của cuộc đời.
Bạn có sức trẻ để lao mình vào thử thách.
Bạn có thời gian để nhởn nhơ thưởng ngoạn cuộc đời tươi đẹp.
Bạn có tự do để làm bất cứ điều gì mình muốn.
Và hơn hết, bạn có thừa cơ hội để tô vẽ cho tương lai của chính mình.
Vậy nhưng không phải bạn sinh viên nào cũng “giàu có” một-cách thông-minh.
Bạn có quá phung phí không khi:
Đốt sức trẻ vào những trận cày game thâu đêm
Tiêu thời gian vào ngủ nướng.
Dùng tự do vào những ngẫu hứng không đầu không cuối.
Và gửi tặng cả tương lai mình cho Thượng đế tô vẽ.
Bạn có quá ky cóp không khi:
Luôn tránh xa những thách thức.
Chia thời gian thành 3 phần: học, ăn, ngủ.
Không theo đuổi một đam mê nào.
Và tô vẽ tương lai theo màu mà ba mẹ thích.
Đừng đợi đến khi tốt nghiệp đại học sẽ giúp bạn sử dụng những năm tháng sinh viên của mình một cách thông minh nhất. Cuốn sách là tổng hợp những chia sẻ kinh nghiệm quý báu của các thế hệ sinh viên đi trước về các bước ngoặt lớn như lựa chọn chuyên ngành, học thêm hay làm thêm, học thạc sỹ hay đi làm ngay, đi làm nhà nước hay tư nhân… Cùng với đó là những lời khuyên hữu ích về phương pháp học tập, tư duy và phong cách sống. Từ những điều tưởng chừng như rất nhỏ nhặt như đánh bại bệnh trì hoãn, rèn luyện thể chất cho tới những bí kíp thiết thực như chọn sách thế nào, viết luận văn ra sao… - sẽ giúp bạn tránh được những “căn bệnh” muôn thuở
của sinh viên.

	updating...
'
    ,N'Sách kỹ năng sống, self-help');
GO

INSERT INTO dbo.tbl_Book( bookTitle , author, brief, publisher, content, category)
    VALUES(
    N'Cà phê cùng Tony'
    ,N'Tony buổi sáng'
    ,''
    ,N'Nhà xuất bản văn hóa thông tin'
    ,N'Phần I:
Chuyện của Tony
Chuyện Tony ở Harvard
Đại hạc Ha Vợt nhé, không phải Ha Vớt như 1 số người nói đâu nha. Ai nói Ha Vớt, Tony không có hài lòng. Chữ "Vợt" nghe nó có tính chất thể thao, còn Vớt nghe như đậu vớt, vớt vát, trục vớt....Vậy nên ngoài biệt danh Tony Tèo, Tony Phân, có thể nói thêm Tony Ha Vợt. Nghe cường tráng gì đâu.
Chuyện bắt đầu từ trung tuần tháng 8 năm 2007, giáo sư John
Quelch, phó hiệu trưởng trường kinh doanh Harvard Business
School ( HBS) có đến VN. Ông này là cây cao bóng cả về lĩnh vực thương hiệu. Ông thích thú với Nha Trang một cách đặc biệt ( chắc giống Yersin, vĩ nhân hay thích Nha Trang). Tony cũng có đi tắm bể hôm ấy. Thấy Tây đang bơi thì bu lại rèn luyện tiếng Anh. Tạt nước, lặn, cút, đắp lâu đài cát, búng tay tôm tép.... với ổng một hồi mới biết ổng là Prof John Quelch. Bon chen cuối cùng Tony cũng có 1 cái danh thiếp của ổng. Thế rồi quên béng mất, lúc đó VN đang sốt mọi thứ, từ
đất đến vàng, chứng khoán, làm gì cũng có tiền. Vung tiền ôm hết, Tony trở nên hết sức giàu có. Nghĩ mình đã bước 1 chân vào giới thượng lưu, chuẩn bị mua siêu xe dzớt Hồ Ngạc Hòa rồi trên tay Cường Đô Loa. Sau đó đâu được hơn năm thì bong bóng xẹp, Tony bị vứt chỏng chơ ra ngoài xã hội, nghèo khổ, rách rưới, tuy gương mặt hãy vẫn còn thanh tú. Bất chấp suy thoái hay khủng hoảng, gương mặt anh ấy vẫn đẹp 1 cách rạng rỡ... Biệt thự, siêu xe...dần dần bán hết, đến cái nhà trọ cũ kỹ cũng bị bà chủ vứt đồ ra đường, đuổi đi. Trong đống đồ vứt đó, rơi ra cái danh thiếp của giáo sư John Quelch.
1 đêm mưa buồn lạnh lẽo, Tony bèn chong đèn lấy ipad gửi meo cho ổng, nói giờ con rảnh quá hà, cho con qua hạc với. Đâu lúc sau ổng trả lời, nói ừa, qua hạc đi. Mình nói hẻm có tiền. Ổng nói thôi qua hạc miễn phí đi, tiền bạc gì, mày khách sáo quá. Cái mình xách đít qua Ha Vợt hạc.

	updating...'
    ,N'Sách văn học');
GO

INSERT INTO dbo.tbl_Book( bookTitle , author, brief, publisher, content, category)
    VALUES(
    N'Giết con chim nhại'
    ,N'Harper Lee'
    ,''
    ,N'Nhà xuất bản văn học'
    ,N'Chương 1
Khi sắp mười ba tuổi, anh trai Jem của tôi bị gãy ngay khuỷu tay. Khi lành lại, nỗi sợ không bao giờ có thể chơi bóng được nữa của Jem đã dịu bớt, anh ít nghĩ ngợi về thương tật của mình. Cánh tay trái của anh hơi ngắn hơn cánh tay phải; khi đứng hoặc đi, mu bàn tay anh cứ thẳng góc với thân mình, ngón cái song song với đùi. Anh hoàn toàn không quan tâm, miễn là anh còn chuyền và lốp bóng được.
Sau nhiều năm tháng trôi qua đủ để giúp chúng tôi nhìn lại, đôi khi chúng tôi bàn bạc về những sự kiện đưa đẩy đến tai nạn này. Tôi vẫn cho rằng tất cả là do nhà Ewell, nhưng Jem,
lớn tôi bốn tuổi, lại bảo chuyện này đã bắt đầu từ trước đó rất lâu. Anh nói chuyện đó bắt đầu vào mùa hè khi Dill đến chơi với chúng tôi, lúc Dill lần đầu mớm cho chúng tôi ý tưởng kéo được Bob Radley ra khỏi nhà.
Tôi nói nếu anh muốn có một cái nhìn bao quát về sự việc này, thì thực sự nó bắt đầu với Andrew Jackson. Nếu tướng Jackson không đẩy người Da đỏ Creek lên thượng nguồn thì
Simon Finch sẽ không bao giờ chèo thuyền đến Alabama, và liệu chúng tôi sẽ ở đâu nếu ông không làm việc đó? Chúng tôi đã quá lớn không thể dàn xếp một cuộc tranh cãi bằng nắm đấm, vì vậy chúng tôi hỏi ý kiến bố Atticus. Bố nói cả hai đứa tôi đều đúng. Là dân miền Nam, một số người trong gia tộc thấy xấu hổ vì chúng tôi chẳng có tổ tiên nào được lưu danh ở phía bên này hoặc bên kia trong trận Hasting. Chúng tôi chỉ có mỗi Simon Finch, một tay bào chế thuốc bẫy thú lấy lông gốc từ Cornwall, người chỉ để cho thói keo kiệt
vượt trội hơn so với lòng mộ đạo của mình. Ở Anh, Simon tức tối trước việc bách hại những người tự xưng là tín đồ phái Giám lý dưới tay các đạo hữu cấp tiến hơn của họ và vì Simon
cũng nhận mình là tín đồ Giám Lý nên ông ta tìm đường vượt Đại Tây Dương đến Philadelphia, sau đó đến Jamaica, rồi đến Mobile, và lên đến Saint Stephens. Luôn nghĩ đến
những phê phán của John Wesley về thói lắm lời trong việc mua bán, Simon kiếm tiền bằng việc hành nghề y, nhưng trong việc này ông ta không vui vì sợ mình bị cám dỗ phải làm những điều mà ông biết rằng không vì vinh quang của Chúa, như việc đeo vàng trên người và mặc quần áo đắt tiền. Vì thế Simon, sau khi quên đi châm ngôn của thầy giáo mình về việc sở hữu nô lệ, đã mua ba nô lệ và với sự trợ giúp của họ ông lập một trang trại trên bờ sông Alabama, cách Saint Stephens khoảng bốn mươi dặm về phía thượng nguồn. Ông chỉ trở lại Saint Stephens một lần, để tìm vợ, và ông đã cùng bà tạo dựng một dòng họ với nhiều con gái. Simon sống rất thọ và chết trong giàu có.

	updating...'
    ,N'Sách văn học');
GO

INSERT INTO dbo.tbl_Book( bookTitle , author, brief, publisher, content, category)
    VALUES(
    N'HẠT GIỐNG T M HỒN'
    ,N'Nguyễn Nhật Ánh'
    ,''
    ,N'Nhà xuất bản giáo dục'
    ,N'TRỞ VỀ
Một ngƣời lính trở về nhà đoàn tụ với gia đình sau nhiều năm tham chiến ở Việt Nam. Từ San Francisco anh gọi điện về thăm hỏi gia đình.
- Cha mẹ ơi, con đang trở về nhà đây. Nhƣng con có điều muốn xin phép cùng cha mẹ. Con muốn dẫn bạn cùng về nhà mình.
- Ồ được thôi con trai. Cha mẹ rất sẵn lòng đón tiếp bạn con.
- Nhưng có điều này cha me nên biết: anh ấy bị thương khá nặng trong chiến tranh, mất cả cánh tay và đôi chân.Anh ấy không còn chỗ nào để nƣơng tựa, vì vậy con muốn anh ấy về
sống cùng chúng ta.
- Cha mẹ rất tiếc khi nghe điều này, có thể chúng ta sẽ giúp anh ấy tìm dược chỗ trú ngụ.
- Ồ không, con muốn anh ấy ở cùng chúng ta kia.
- Con không biết con đang đòi hỏi điều gì đâu con trai. Một ngƣời tàn tật như vậy sẽ là một gánh nặng đè lên vai chúng ta. Chúng ta còn cuộc sống riêng tư của chúng ta nữa chứ, không thể để một điều như vậy chen vào cuộc sống của chúng ta được. Tốt hơn hết là con quay về nhà và quên anh chàng ấy đi. Anh ta chắc sẽ chóng tìm đƣợc cách tự kiếm sống thôi.
Nghe đến đó, ngƣời con trai gác máy. Vài ngày sau đó họ đột nhiên nhận đƣợc cú điện thoại từ cảnh sát San Francisco báo tin người con trai đã chết sau khi ngã từ một tòa nhà cao tầng.
Cảnh sát cho rằng đây là một vụ tự sát.
Người cha va mẹ đau buồn này vội vã bay đến San Francisco và đƣợc dẫn đến nhà táng thành phố để nhận xác con. Họ nhận ra anh ngay, nhưng họ cũng kinh hoàng nhận ra một điều khác
cùng lúc. Con trai họ chỉ còn lại một tay và một chân

CÀ PHÊ ... MUỐI
Họ ngồi cạnh nhau trong một quán cà phê xinh xắn. Anh căng thẳng đến độ không biết bắt đầu câu chuyện nhƣ thế nào. Cô gái cảm thấy rất khó chịu." Để mình về nhà còn hơn..." - Cô
nghĩ thầm. Bỗng nhiên, chàng trai gọi ngƣời bồi bàn đến và nói:" Vui lòng cho tôi thêm một tí muối vào ly cà phê nhé". Mọi người ngạc nhiên nhìn anh. Mặt đỏ bừng ngượng nghịu,
nhưng rồi anh vẫn uống ly cà phê ấy.
Cô gái tò mò hỏi:
-Tại sao anh lại có sở thích lạ lùng thế?
Anh trả lời :
- Khi còn là một đứa trẻ, tôi sống gần biển. Lúc ấy do thường chơi đùa trước sóng biển nên tôi có thể nếm được mùi vị của biển, cảm giá nó mặn và có vị chát. Mùi vị ly cà phê này cũng thế. Nó gợi cho tôi nhớ về tuổi thơ của mình, về ngôi nhà nhỏ bé bên bờ biển và tôi nhớ cha mẹ tôi - người suốt đời sống ở đấy - biết bao nhiêu!
Nói đến đây, đôi mắt anh đẫm nước mắt.
Cô gái vô cùng xúc động trước những cảm xúc chân thật tận đáy lòng chàng trai. Một người đàn ông như thế hẳn là người sống rất tình nghĩa và yêu quí, có trách nhiệm với gia đình. Cô bắt đầu kể về thời thơ ấu, gia đình, công việc ... của mình. Buổi trò chuyện thật tuyệt vời, và đó là sự khởi đầu tốt đẹp.
 Những lần hò hẹn sau, cô gái nhận ra chàng trai thật sự là ngƣời mà cô cần: anh có lòng khoan dung, trái tim nồng hậu, sự chân thành... Anh là người đàn ông tốt mà cô không thể để
vuột mất. Rồi mọi chuyện diễn ra hệt như một câu chuyện cổ tích có hậu: hoàng tử cưới công chúa, họ sống một cuộc đời hạnh phúc bên nhau. Và mỗi khi pha cà phê cho chồng, cô luôn
thêm vào một chút muối theo cách mà anh thích.
 40 năm sau... ngƣời đàn ông qua đời, để lại cho ngƣời vợ lá thư: " Em yêu quí, hãy tha thứ cho anh, cả cuộc đời anh đã nói dối em. Nhưng chỉ một việc duy nhất: ly cà phê muối. Em
còn nhớ lần đấu tiên hò hẹn của chúng mình ? Lúc ấy anh đã quá lúng túng, thật ra anh muốn thêm tí đường vào ly cà phê nhưng anh đã nói nhầm thành muối...Thật khó để thay đổi lời nói nên anh phải uống ly cà phê ấy. Nhưng anh không thể ngờ điều ấy đã bắt đầu cho mối qua hệ của chúng ta. Đã nhiều lần anh định nói sự thât ấy với em nhưng anh lại sợ mất em. Bây giờ anh không còn lo lắng điều gì nữa, anh muốn cho em biết sự thật: anh không thích uống cà phê muối, mùi vị của nó mới tệ làm sao... nhưng nhờ nó mà anh đã có em, anh đã tự hứa rằng anh sẽ không bao giờ nói dối với em bất cứ điều gì nữa, và suốt cuộc đời anh đã không vi phạm lời hứa ấy. Có em trong đời, đó là hạnh phúc lớn nhất của anh. Nếu có thể được sống thêm một lần nữa, anh sẽ vẫn muốn được biết em và có em làm vợ, thậm chí anh có phải uống cà phê muối...".
 Đôi mắt cô nhoè đi và lá thư ƣớt đẫm...
 Một ngày, có người hỏi cô: "Mùi vị của cà phê muối thế nào?".
 "Rất ngọt ngào, bạn ạ!" - Cô trả lời.
	updating...'
    ,N'Sách văn học');
GO

INSERT INTO dbo.tbl_Book( bookTitle , author, brief, publisher, content, category)
    VALUES(
    N'Chicken Soup for the Unsinkable Soul'
    ,N'Jack Canfield'
    ,''
    ,N'Nhà xuất bản tổng hợp TP. Hồ Chí Minh'
    ,N'Đừng lo quá, hãy cứ vui lên
TTO - Tại một buổi tiệc cách đây sáu năm, một người lạ mặt đã hỏi đứa con gái nhỏ Melissa của tôi: “Cháu mấy tuổi rồi?”.“Cháu hai tuổi ạ”, con bé trả lời. Người phụ nữ lạ mặt lại tiếp tục trêu ghẹo con bé: “Cháu có lập gia đình chưa đấy?”.
Melissa mỉm cười đáp trả: “Đương nhiên là chưa ạ”. Rồi con bé nghiêm mặt, giọng nói đầy trịnh trọng: “Nhưng mẹ cháu thì có gia đình rồi, bố cháu cũng vậy”.
Đứng cách đó một khoảng cách tương đối an toàn, tôi lén theo dõi cuộc chuyện trò của con gái mình với người phụ nữ lạ mặt, tự hỏi chẳng biết điều gì sẽ xảy ra. Liệu Melissa với
vốn từ đã khá của mình, có kể cho người phụ nữ kia rằng cha mẹ mình đã ly hôn? Hoặc tệ hơn, đứa con gái bé bỏng của tôi liệu có dám bày tỏ thái độ của nó bằng cách đấm vào mặt người phụ nữ ấy hay nó có khóc toáng lên không?
Nhưng không, tôi đã rất ngạc nhiên khi nghe con bé vui vẻ nói thêm: “Mẹ của cháu và bố của cháu đã cưới nhau đấy”. Nói rồi con bé lững chững đi đâu mất.
Hai mươi tháng trước đó, khi Melissa chỉ vừa mới được sáu tháng tuổi, chồng tôi đã bỏ rơi tôi như người ta bỏ một đôi giày đã sờn rách và thế vào chỗ tôi là cô bạn học chung hồi
phổ thông. Không một lời giải thích. Chỉ có sự quay lưng vô tình, lặng lẽ để rồi đi đến một kết cục bất ngờ cho cuộc hôn nhân bề ngoài trông có vẻ như rất hạnh phúc.

	updating...
'
    ,N'Sách văn học');
GO

INSERT INTO dbo.tbl_Book( bookTitle , author, brief, publisher, content, category)
    VALUES(
    N'Sống ở đời biết khi nào ta khôn'
    ,N'Y BAN'
    ,''
    ,N'Nhà xuất bản văn học'
    ,N'Công chúa mắt nai
Giao thông ở đây rất tệ. Người và phương tiện giao thông đi lại trên đường như kiến vỡ tổ. Chẳng hàng chẳng lối, mạnh ai người nấy đi, chen lấn nhau từng centimét, rồi ùn tắc, dí dị, xả khói khét lẹt, mặt người méo xẹo, đỏ gay, vàng
nghệ, ấm ức, tức tối, chửi rủa, khạc nhổ. Người ta đặt đèn xanh, đèn đỏ, đèn vàng và tăng cường công an ở các nút giao
thông để bắt những người vi phạm luật lệ. Một hôm, có một “công chúa” đi trên chiếc Piaggio màu vàng sành điệu. Áo
quần hàng hiệu, lông mi chuốt cong. Ở nhà, mọi người phải nhường cô mọi nhẽ. Ra đường, cô nàng rất ấm ức việc không ai chịu nhường đường cho mình. Nhưng thôi, đông người như thế, biết ai là ai mà ăn vạ được. Có điều mấy cái đèn đỏ kia
đừng có hòng bắt cô dừng lại. Cô vượt đèn đỏ. Một cảnh sát giao thông tuýt còi chặn cô lại. Cô cứ rú ga để phóng. Hai
cảnh sát rồi ba cảnh sát phối hợp giữ chặt xe và rút chìa khóa điện. Cô nàng cứ ngồi chễm chệ trên xe, mặc cho những
khẩu lệnh yêu cầu cô xuống xe, dắt lên vỉa hè. Cô nàng như điếc như câm, cứ một mực ngồi ngay ngắn trên yên xe, thậm chí còn rút nốt cái chân đang chống xuống đất vì xe đã được ba cảnh sát giữ chặt, không thể đổ được. Cô nàng tĩnh
tọa, lấy tay chống cằm, mắt nai chớp chớp. Hàng mi cong veo chập chờn như hai cánh bướm.

	updating...'
    ,N'Sách văn học');
GO

INSERT INTO dbo.tbl_Book( bookTitle , author, brief, publisher, content, category)
    VALUES(
    N'PHỎNG VẤN không hề đáng sợ - FEARLESS INTERVIEWING'
    ,N'MARKY STEIN'
    ,''
    ,N'Nhà xuất bản thành phố Hồ Chí Minh'
    ,N'Chắc chắn trong suốt cuộc đời đi làm của mình, bạn đã phải tham gia các buổi phỏng vấn tuyển dụng, thậm chí là nhiều lần. Cảm giác của bạn lúc đó ra sao? Lo lắng? Run rẩy? Bồn chồn? Có khi hơi sợ hãi? Tôi tin rằng bạn có đủ những cảm xúc đó và thường thì chúng rất khó quên.
Những lần đầu tiên dự phỏng vấn tuyển dụng của tôi là lúc vừa tốt nghiệp đại học và bắt đầu đi tìm việc làm. Mười năm đã qua nhưng tôi vẫn còn nhớ rất nhiều. Và có lúc vẫn tiếc, nếu là bây giờ thì mình đã hành xử khác.
Ngày nay, khi phải thường xuyên tổ chức tuyển dụng và phỏng
vấn các ứng viên đến dự tuyển vào các vị trí công việc mà công ty chúng tôi đang cần tuyển, cũng nhìn lại quá khứ của mình, tôi thấy có gì đó thôi thúc, muốn giúp cho các ứng viên thực hiện tốt những buổi phỏng vấn tìm việc của họ. Quan trọng nhất, tôi muốn tìm cách giúp cho các ứng viên bước vào buổi phỏng vấn một cách tự tin vì điều đó có lợi cho cả hai phía: người phỏng vấn và người được phỏng vấn.
Quyển sách mà bạn đang cầm trên tay là bản dịch tiếng Việt của quyển sách có tựa đề “Fearless Interviewing” của tác giả Marky Stein, một chuyên gia tư vấn nghề nghiệp và phát triển nghề nghiệp. Chúng tôi tạm chuyển tên quyển sác sang tiếng Việt là “Phỏng vấn − không hề đáng sợ”. Như tên gọi của nó, thông điệp của chúng tôi đến bạn đọc là hãy tự tin khi bước vào cuộc phỏng vấn, vì bạn hoàn toàn có đủ sự tự
tin cần thiết trong chính bản thân bạn và sự tự tin trong tình huống này là cực kì quan trọng. Thành công hay không trong một lần phỏng vấn tìm việc có thể làm thay đổi hoàn toàn con đường phát triển nghề nghiệp của một con người cụ thể. Tôi tin là bạn đồng ý với nhận xét đó.

	updating...
'
    ,N'Sách kỹ năng mềm');
GO

INSERT INTO dbo.tbl_Book( bookTitle , author, brief, publisher, content, category)
    VALUES(
    N'Hạnh phúc là điều có thật'
    ,N'NGUYỄN MINH TIẾN'
    ,''
    ,N'NHÀ XUẤT BẢN VĂN HÓA THÔNG TIN'
    ,N'Thời gian là vốn quý
Chúng ta thường cảm thấy mình thiếu thốn về món này,
món khác... nhưng rất ít khi cảm thấy mình thiếu thốn thời gian. Nói một cách chính xác hơn, sự quan tâm đến tính chất hạn chế của thời gian thật ra chỉ là vì chúng ta cảm thấy không có đủ để cho chúng ta làm được điều này điều nọ... Chúng ta rất hiếm khi hoặc không bao giờ thấy tiếc nuối thời gian chỉ vì đó là thời gian, là vốn liếng quý báu rất hạn chế mà cuộc đời ta có được.
Khi ta sinh ra, điều chắc chắn duy nhất mà ta có thể biết
được về tương lai của mình đó là ta sẽ chết. Dù là yểu mạng ở tuổi đôi mươi, hay sống thọ đến khi trăm tuổi như mong ước
của nhiều người, thì cuối cùng chúng ta đều phải chết. Và mỗi ngày chúng ta trải qua trong cuộc sống, có thể hiểu một cách hoàn toàn chính xác là mỗi một bước tiến gần hơn về điểm cuối cuộc đời.
Chúng ta không hề bi quan khi thừa nhận điều này, vì đó là
sự thật! Chính thái độ tránh né không đề cập đến sự thật này
mới là thái độ hèn nhát, bi quan. Chúng ta thừa nhận sự thật
này để thấy rõ một điều thực tế: thời gian được sống trên cõi đời này là đáng quý biết bao!
Chúng ta sẽ càng ý thức rõ hơn sự quý giá này khi nhớ rằng
chúng ta không hề được đảm bảo là mình sẽ còn sống được bao
lâu nữa. Tôi đã có lần chia tay với một người bạn thân, để rồi chỉ vài hôm sau nghe tin anh ta không còn nữa. Thật vậy, mạng sống quý giá này của ta có thể chấm dứt bất kỳ lúc nào. Nhưng điều kỳ lạ là hầu hết chúng ta đều không thường xuyên nhớ đến điều đó!
Sự quý giá của thời gian không phải là để giúp chúng ta có
thể làm được những điều này, điều nọ... Có quá nhiều những
điều này nọ như thế đủ để cho chúng ta quay cuồng trong suốt một đời, nhưng cuối cùng rồi chúng ta sẽ không mang theo
được gì cả! Vấn đề là chúng ta phải biết sống như thế nào để
xứng đáng với giá trị thời gian ấy. Chúng ta lao động như một phương tiện để nuôi sống, nhưng bản thân sự lao động sáng tạo cũng chính là cuộc sống của chúng ta. Ngược lại, những giá trị vật chất được tạo ra luôn luôn có những giới hạn tạm bợ của nó, và rõ ràng không thể là mục đích cuối cùng để chúng ta nhắm đến. Những giá trị vật chất ấy có thể giúp cho ta có cuộc sống thoải mái hơn, nhưng nếu chúng ta chỉ hoàn toàn phụ thuộc vào chúng, chúng ta sẽ phải trả giá đắt. Nghệ thuật sống chân chính là ý thức được giá trị quý báu của đời sống trong từng khoảnh khắc tươi đẹp của cuộc đời.

	updating...
'
    ,N'Sách văn học');
GO

INSERT INTO dbo.tbl_Book( bookTitle , author, brief, publisher, content, category)
    VALUES(
    N'CHIẾC XE LEXUS VÀ C Y OLIU'
    ,N'Thomas L.Friedman'
    ,''
    ,N'Alphabook'
    ,N'LỜI MỞ ĐẦU: THẾ GIỚI 10 NĂM TUỔI
Thật bực mình - chúng ta không có việc gì để làm ở Nga hay châu Á. Chúng ta chỉ có thể kinh doanh cỏn con trong phạm vi quốc gia để cố gắng tăng trưởng nhưng chúng ta bị ngăn cản bởi cách mà các chính phủ điều hành quốc gia.
- Douglas Hanson, Giám đốc điều hành công ty Rocky Mountain Internet đã nói như vậy trên Tạp chí phố Wall sau cuộc khủng hoảng tài chính dây chuyền năm 1998 buộc công ty của ông phải hoãn việc phát hành đợt trái phiếu vô danh trị giá
175 triệu USD.
Rạng sáng ngày 8/12/1997, chính phủ Thái Lan tuyên bố đóng cửa 56 trên tổng số 58 công ty tài chính hàng đầu. Chỉ qua một đêm, các ngân hàng tư nhân này đã rơi vào tình trạng phá sản do sự mất giá của đồng nội tệ (đồng Bath). Các công ty tài chính vay một lượng lớn tiền bằng đồng đô la Mỹ và sau đó cho các doanh nghiệp Thái vay lại để xây dựng khách sạn, văn phòng, những toà địa ốc sang trọng và các nhà máy. Tất cả họ đều nghĩ rằng mình được an toàn bởi chính phủ đã cam kết giữ chặt tỷ giá cố định giữa đồng Baht và đồng đô la Mỹ. Tuy nhiên khi chính phủ không làm được điều đó, tiếp sau đó là các hoạt động đầu cơ được thực hiện chống lại đồng Bath thì các giới thương nhân hiểu rằng nền kinh tế của họ không hề khoẻ mạnh như họ vốn nghĩ. Đồng nội tệ đã giảm tới 30%. Điều này có nghĩa là giới kinh doanh vay bằng đồng đô la sẽ phải trả nhiều hơn 30% giá trị đồng Bath cho mỗi một đồng vốn vay. Nhiều công ty không còn khả năng trả nợ cho các công ty tài chính, các công ty tài chính không thể trả nợ cho các chủ nợ nước ngoài và kết quả là toàn bộ hệ thống rơi vào khủng hoảng, khiến 20.000 nhân viên văn phòng mất
việc làm. Một ngày sau đó, tôi lái xe tới một cuộc hẹn ở Băng Cốc, phố Asoke - được ví như là phố Wall của Thái Lan, nơi mà hầu hết các công ty tài chính phá sản đóng trụ sở. Chúng tôi chầm chậm lái xe qua từng công ty chứng khoán và trái phiếu Mêhicô, để tiền dưới mỗi tấm nệm hoặc két an toàn để họ có thể tìm thấy. Sự sụp đổ của thị trường Braxin và bất kỳ thị trường mới nổi nào khác gây ra phản ứng
dây chuyền đối với cả trái phiếu kho bạc Mỹ. Ngược lại, sự gia tăng giá trị của trái phiếu kho bạc Mỹ khiến cho lãi suất mà chính phủ Mỹ đưa ra để thu hút các nhà
đầu cơ giảm xuống đồng thời làm tăng giá trái phiếu của Mỹ và trái phiếu khác cũng như sự tăng giá trên những thị trường trái phiếu mới nổi.
	
	updating...'
    ,N'Sách văn học');
GO

INSERT INTO dbo.tbl_Book( bookTitle , author, brief, publisher, content, category)
    VALUES(
    N'Bí mật mộ Khổng Minh'
    ,N'Hồng Lĩnh Sơn'
    ,''
    ,N'Alphabook'
    ,N' Gia Cát Lượng (181- 234) tự Khổng Minh, là một nhân vật chính trị kiệt xuất trong lịch sử Trung Quốc. Cuối đời Đông Hán, vua hèn yếu, bị quyền thần lấn át, triều đình không kỷ cương phép tắc gì nữa. Bọn quan địa phương tha hồ vơ vét bóc lột của dân, khiến nhân dân vô cùng cực khổ lầm than. Lợi dụng tình hình ấy hào kiệt khắp nơi nổi lên cát cứ, thôn tính lẫn nhau, khiến đất nước loạn lạc tứ tung. Gia Cát Lượng là một người tài cao, học rộng nhưng còn đợi thời ở ẩn tại Nam Dương để có thời gian trao dồi thêm tài năng kiến thức, nuôi dưỡng chí lớn giúp đời. Ngay khi còn nằm trong túp liều tranh nhờ nghiên cứu phân tích tình hình thời thế dựa trên các yếu tố “thiên thời địa lợi nhân hòa” một cách chính xác và sắc sảo, ông đã nhìn ra cái thế “chia ba chân vạc” của các nước Ngụy, Thục, Ngô. Được Lưu Bị ba lần thân hành đến mời, Gia Cát Lượng đã giúp đỡ Lưu Bị xây dựng nước Thục thành một trong ba nước hùng mạnh thời Tam quốc. Ông là một nhà quân sư thiên tài, đã vạch ra chiến lược chiến thuật khiến quân Thục đánh thắng quân Ngụy nhiều trận như trận thiêu đồn Bác Vọng, trận thủy chiến ơ Bạch Hà, trận hỏa công ở Xích Bích... Ông còn giỏi về cách dùng gián điệp, khổ nhục kế li gián hàng ngũ kẽ địch, dùng miệng lưỡi thuyết phục vận động kẻ địch, đánh vào tinh thần của chúng, hoàn thành sách lược liên minh với Ngô để chống Ngụy. Ông còn là một nhà khoa học như nghiên cứu thiên văn, bày “Bát trận đồ”, dùng trâu gỗ lắp máy để vận chuyển quân lương qua những rặng núi hiểm trở đất Thục. Khi Lưu Bị sắp qua đời, ân cần phó thác con côi là Lưu Thiện làm vua Thục Hán. Với chức vụ thừa tướng, lo sắp xếp công việc nội trị để giữ nước yên dân. Ông dâng bài “Xuất sư biểu”, xin đem quân đi đánh Ngụy, lời lẽ hùng tráng kích thiết, được coi là một tác phẩm văn học ưu tú của Trung Quốc. Trong sáu lần ra Kỳ Sơn, ông đã dùng nhiều mưu kế thần diệu như lên thành – đàn để đánh lừa Tư Mã Ý, mai phục ở cửa Kiếm môn để đánh quân Tôn Quyền... Không may ông mắc bệnh qua đời, nên sự nghiệp đành để lở dở, nhưng lịch sử còn ghi mãi tên ông như một nhà quân sự lỗi lạc. Sự tích về Khổng Minh đầu tiên được chép trong Tam quốc chí của Trần Tho đời Hán, sau được đưa vào Nhi Thập tứ sử, bộ sử chính thống của Trung Quốc. Đại thi hào Đỗ Phủ đời Đường có bài thơ Đề Gia Cát Vũ hầu miếu hết lời ca ngợi con người và sự nghiệp của ông: “Lầm lẫm xuất sư biểu, Đường đường bát trận đồ”. Nhà chính trị và nhà thơ yêu nước Văn Thiên Đường đời Tống trong khi bị quân xâm lược Nguyên Mông bắt, đã làm bài Chính khí ca để giải bày tấm long của mình, trong khi nhắc đến những tấm gương oanh liệt trong lịch sử, đã đề cập đến Gia Cát Lượng trong câu thơ bất hủ “Hoặc vi xuất sư biểu, Quỷ thần khấp trang liệt” (Bài biểu xin ra quân, khiến cho quỷ thần phải khóc trước sự hùng tráng). Nhưng phải đợi đến Tam quốc trí của La Quán Trung đời Minh, dựa theo Tam Quốc Chí của Trần Thọ và những thoại bản lưu truyền trong nhân gian để viết thành tiểu thuyết, sự tích Khổng Minh mới được truyề tụng khắp chợ cùng quê và Khổng Minh thành nhân vật điển hình cho con người mưu trí tuyệt vời. Thông qua tài năng nghệ thuật của La Quán Trung, hình tượng Khổng Minh được xây dựng hết sức thành công, làm say mê mấy thế hệ người đọc đến mấy chữ “mưu Gia Cát” “kế Khổng Minh” đã đi vào thành ngữ nhân gian. Ở Việt Nam, sự tích về Khổng Minh đã được truyền tụng từ lâu. Khi Trần Nghệ Tông đem con gửi cho Hồ Qúi Ly, đã cho người vẽ bức tranh Tứ phụ đồ ban cho Qúy Ly, trong đó vẽ tích bốn người: Chu Công giúp Thành Vương, Hắc Quan giúp Hán Chiêu Đế, Gia Cát Lượng giúp Hán Hậu Chủ, Tô Hiến Thành giúp Lý Cao Tôn, ngụ ý mong mởi Qúy Ly cũng sẽ giúp con mình như thế. Đến lúc Nghệ Tông đem việc này hỏi Trần Nguyên Đán (ông ngoại Nguyễn Trãi), ông lặng lẽ không đáp, hồi lâu chảy nước mắt và đọc hai câu thơ: “Nhận ngôn ký tử dữ lão nha, Bất thức lão nha liên ái Phủ” (Đem con mà gởi quạ già, Biết là cái quạ thương là chẳng thương). Nghệ Tông không nghe cứ đem con là Trần Thuận uỷ thác cho Qúy Ly, quả nhiên tám năm sau Quý Ly bắt Thuận Tông phải nhường ngôi cho con mới lên ba tức Thiếu Đế, rồi lại truất Thiếu Đế mà lên làm vua. Trong văn học dân gian cũng lưu hành giai thoại: Có một người học trò nhà nghèo, một hôm hết tiền ăn phải đem quần áo đến cầm ở nhà một ông quan. Ông này bảo: Thày có thực là học trò thì tôi ra cho vế câu đối này, nếu đối được thì tôi sẽ cấp tiền cho ăn học”. Rồi ông ta đọc luôn :
Quần tử cố cùng, Quận tử cùng, quân tử cố. Nghĩa là: Người quân tử bền lòng lúc cùng, người quân tử cùng, người quân tử bền lòng. Người học trò đối ngày rằng : Khổng Minh cầm túng, Khổng Minh túng, Khổng Minh cầm Nghĩ là: Ông Khổng Minh bắt, tha, ông Khổng Minh tha, ông Khổng Minh bắt. Lấy tích “Khổng Minh thất cầm thất túng” bảy lần bắt bảy lần tha Mạnh Hoạch để dùng lượng khoan hồng thuyết phục kẻ địch quy thuận. Ông quan khen phục câu đối vừa có nghĩa đen vừa có nghĩ bóng, vừa đối chữ, vừa đối tiếng (cùng, túng, cầm, cố), bèn cấp tiền cho anh ta ăn học.
Khi Đào Duy Từ (1572 – 1634 ) rời bỏ Đàng Ngoài tìm vào Đàng Trong, phiêu dạt tới Bình Định phải đi chăn trâu một thời gian rồi xin vào dạy học ở nhà quan Khám Lý Trần Đức Hòa. Từ làm bài Ngọa Long Cương ngâm, tự ví mình với Khổng Minh qua đó bày tỏ chí hướng của mình. Trần Đức Hòa đọc lấy làm lạ liền tiến cử Từ tên chúa Nguyễn Phúc Nguyên. Từ được chúa biết tài nên rất tin dùng, phong dần đến chức Quân cơ tham lý quốc chính, tước Lộc Khuê hầu. Chúa thường nói:”Duy Từ là Tử Phòng, Khổng Minh ngày nay vậy. Trong đoạn Ngọa Long Cương ngâm có đoạn ca ngợi Khổng Minh : Binh quyền việc những đương tay Lâm cơ thể thắng, một này địch muôn. Trên bày Bác Vọng thiêu đồn Bạch hà dung thuỷ, Hầu Đôn chạy dài. Bốn cờ biết mấy sức trai, Có tài thiện chiến, có tài tâm công.
Dạ nghiêm truyền dựa vịnh song, Mười muôn tên Ngụy nộp cùng Chu Lang. Hỏa công dâng chước ra hàng, Gió tàn Xích Bích thổi tàn Ngụy binh Hoa dung khiến tướng phân doanh. Gian cùng sớm đã nớp mình vỡ gan... Nhiều tích về Khổng Minh được vẽ thành tranh, vẽ trên bình phong, tủ chè, ấm chén sứ... và dựng trên sân khấu tuồng được khán giả say mê thưởng thức như những vở Tam khi Chu Du, Huê Dung đạo... Khi Nguyễn Tri Phương, Hoàng Diệu đánh Pháp tuần tiết được nhân dân đưa vào thờ ở đền Trung Liệt trên gò Đống Đa, có người làm thơ để đền Trung Liệt, hai câu kết như sau : Lòng trung chỉ có lòng trung biết, Đỗ Phủ ngày xưa khóc Vũ Hầu.
Ngụ ý ngày xưa Đỗ Phủ làm thơ khóc người trung nghĩa như Gia Cát Lượng thì nay mình cũng làm thơ khóc những người trung nghĩa như Nguyễn Tri Phương, Hoàng Diệu.
Vì Khổng Minh là một người thành thạo về khoa học kỹ thuật thời Trung cổ, nên trong dân gian từ lâu đã lưu hành câu chuyện về mộ Khổng Minh. Từ khi còn sống, Khổng Minh đã cho xây ngôi mộ của mình với những cách sắp đặt kỳ quái, những máy móc bí hiểm, những cãm bẫy bất ngờ, những đừng hầm khuất khúc nhằm mục đích nhắm lạc hướng, thử thách óc phán đoán của những kẻ có tham vọng khám phá những bí mật ở đây. Trong những chuyện đó, có những chuyện có căn cứ khoa học như chuyện viên tướng Minh Lưu Bá Ôn sau khi giúp Chu Nguyên Chương nhất thống sơn hà, lập nên nhà Minh, đã tìm vào thám hiểm ngôi mộ Khổng Minh. Qua những đường hầm quanh co rắc rối như bàn cờ, những cửa ngầm cửa giả chằng chịt khó phân biệt, Lưu Bá Ôn đến một khoảng sân rộng, phía trong đặt bàn thờ, ngoài có một tấm biển bắt người tới nơi phải lạy trước bàn thờ. Lưu Bá Ôn nghĩ mình là một vị quân sư của vua Minh không thua kém gì Khổng Minh là quân sư của vua Thục Hán nên ngang nhiên không chịu lạy. Bất đồ khi bước vào khoảng sân thì bị kéo nằm rạp xuống đất không đứng dậy nổi. Thì ra khoảng sân đó có lát phiến đá nam châm, có đặc tính hút sắt, Lưu Bá Ôn mặt áo giáp sắt nên bị nam châm kéo xuống. Lưu Bá Ôn đang luống cuống bỗng ngước nhìn lên thấy mộ bức hoành trên đề bốn chữ “Giải y nhi thoát” (Cởi áo ra thì thoát). Lưu hiểu ý cởi tấm áo giáp sắt ra quả nhiên đứng lên được. Thì ra Khổng Minh đã biết lợi dụng từ tính trong công trình xây mộ của mình. Gạt bỏ những yếu tố hoang đường, câu chuyện vẫn có cơ sở khoa học đáng tin cậy.
Cuốn Bí mật mộ Khổng Minh viết dựa theo những tài liệu truyền lại từ xưa, chắc sẽ gây cho người đọc sự hấp dẫn và hứng thú ngoài những chi tiết về võ thuật. Qua đó, còn chứng minh đầu óc sáng tạo của con người quả là vô tận, từ những mưu trí dùng trong quân sự chuyển sang mưu trí dùng trong khoa học kỹ thuật, từ việc đánh vào thể xác đến việc đánh vào tinh thần đối phương, khuất phục họ bằng những sự kỳ diệu của khoa học, khi con người biết thu phục tự nhiên, bắt tự nhiên phục vụ cho lợi ích của xã hội. Biết đâu nó chẳng thúc đẩy đầu óc đang tìm hiểu, khám phá, phát minh, sáng chế của lớp trẻ hôm nay tương tự như những chuyện khoa học viễn tưởng trong thời đại hiện nay. Bời vì đi vào chiều sâu của những bí mật tìm ẩn trong quá khứ cũng là lấy đà phóng mình vào tương lai để khám phá những bí mật của vũ trụ đầy rẫy những cái chưa biết, những câu hỏi chưa lời giải đáp, những lỗ trống trong không gian cũng như trong kiến thức con người.
	
	updating...'
    ,N'Sách lịch sử, Biography');
GO

INSERT INTO dbo.tbl_Book( bookTitle , author, brief, publisher, content, category)
    VALUES(
    N'11 bí quyết giao tiếp để thành công'
    ,N'M. T. Lederman'
    ,''
    ,N'publisher'
    ,N'Để trở thành người thành công trong mọi mối quan hệ
Chúng ta đều biết networking là một yếu tố quan trọng để tạo nên những thành công, những hiệu quả tuyệt vời trong công việc cũng như những mối quan hệ ngoài đời sống. Nhưng đôi khi có vẻ như networking đã loại bỏ tất cả những cảm xúc từ sự thiết lập mạng lưới và chỉ tập trung vào mục tiêu trước mắt. Trong khi các loại mối quan hệ có sức mạnh bền bỉ thực sự, mang lại cho chúng ta niềm vui, và ủng hộ giúp đỡ lẫn nhau dài hạn lại được hình thành đơn giản từ sự yêu mến nhau.
Cuốn sách này bao gồm các hoạt động, những câu hỏi tự đánh giá, và những câu chuyện thực tế từ môi trường chuyên nghiệp và xã hội, chỉ cho độc giả thấy cách để xác định những điều đáng yêu của bản thân và tạo ra sự trung thực, tương tác đáng tin cậy trở thành "chiến thắng" cho tất cả các bên liên quan. Độc giả sẽ khám phá ra cách:
	-	Bắt đầu cuộc trò chuyện và giữ cho chúng diễn ra một cách dễ dàng
	-	Chuyển đổi người quen thành bạn bè
	-	Khám phá sở thích của mọi người và tinh chỉnh phong cách cá nhân của họ để cho phép hấp dẫn, tương tác lẫn nhau
	-	Tạo ra những theo dõi và ở lại trong tâm trí của người khác sau cuộc gặp gỡ đầu tiên
	
	updating...'
    ,N'Sách kỹ năng sống, Self-help');
GO

INSERT INTO dbo.tbl_Book( bookTitle , author, brief, publisher, content, category)
    VALUES(
    N'4 PHONG CÁCH LÀM VIỆC'
    ,N'Robert Bolton, Dorothy Grover Bolton'
    ,'Cách thức tạo dựng các mối quan hệ với hiệu quả cao nhất theo tính cách cá nhân'
    ,N'Nhà xuất bản lao động - xã hội'
    ,N'	Lời giới thiệu
		Bất kỳ nhà lãnh đạo cũng phải đối mặt với một trong những thách thức lớn nhất trong lĩnh vực quản lý là vấn đề nhân sự. Mối quan hệ giữa con người với con người trong công việc, đặc biệt là tỏng xã hội hiện đại, ngày càng trở nên phức tạp và căng thẳng. Mối quan hệ này chi phối, tác động và ảnh hướng rất lớn đén chất lượng, năng suất và hiệu quả làm việc của tập thể cũng như của từng cá nhân.
		Đối với mỗi cá nhân, thành công trong công việc và hạnh phúc trong cuộc sống phụ thuộc rất lớn vào khả năng họ xây dựng mỗi quan hệ với người khác: đồng nghiệp, khách hàng, nhà cung cấp, gia đình, hàng xóm... tốt đến mức nào. Tuy nhiên hầu hết mọi người, kể cả những người được cho là xuất sắc trong việc tạo dựng và duy trì các mối quan hệ đều phải thừa nhận "những vấn đề về con người" thực sự phức tạp và khó khăn hơn chúng ta thường nghĩ
		
	updating...	'
    ,N'Sách kỹ năng sống, Self-help');
GO

INSERT INTO dbo.tbl_Book( bookTitle , author, brief, publisher, content, category)
    VALUES(
    N'Ai che lưng cho bạn'
    ,'Keith Ferrazzi'
    ,'Chương trình đột phá nhằm xây dựng mối quan hệ sâu sắc tin cậy giúp kiến tạo thành công - và sẽ không để bạn thất bại'
    ,N'Nhà xuất bản Trẻ'
    ,N'Tôi đang ngồi trong căn phòng khách sạn tại Singapore sau một ngày họp hành tất bật và bữa tối với mọi người trong nhóm, cảm giác lâng lâng do chênh lệch múi giờ bắt đầu tấn công. Chúng tôi là một nhóm các nhà tư vấn quản trị của Deloitte & Touche chuyên đi chiến đấu khắp thế giới. Đêm trước tôi đã tranh thủ ngủ được một giấc trên chuyến bay từ London, nhưng
ngay cả chiếc ghế có thể ngã ra tối đa trong khoang hạng nhất cũng không thể thay thế được một chiếc giường thực thụ, và thế là bây giờ tôi gần như tan vào trong chiếc nệm êm ái. Tôi chỉ mới thiu thiu ngủ thì nghe tiếng lạo xạo dưới cánh cửa phòng. Trời, một bản fax! Thôi kệ nó, đợi đến sáng cũng được mà, tôi nghĩ thế.
	Nhưng với tư cách là tổng giám đốc tiếp thị của công ty - đồng thời là thành viên mới nhất trong ban lãnh đạo - tôi không được phép để yên cái gì cả. Vì thế tôi phải buộc mình trèo khỏi giường, mắt nhắm mắt mở đi ra cửa và mở cái phong bì mới gửi vào
	
	updating...'
,N'Sách kỹ năng sống, Self-help');

INSERT INTO dbo.tbl_Book( bookTitle , author, brief, publisher, content, category)
    VALUES(
    N'Đạo: Ba kho báu'
    ,'Osho'
    ,''
    ,N'OSHO INTERNATIONAL FOUNDATION'
    ,N'	1.Đạo thường hằng
		Đạo thường hằng
		Đạo có thể nói ra
		không là Đạo thường hằng
		khi nổi lên các cực tương đối
		Thiên hạ đều biết tốt là tốt,
		Thì đã có xấu rồi;
		Đều biết lành là lành
		Thì đã có cái chẳng lành rồi
		Bởi vậy:
		Có và không cùng sinh,
		Khó và dễ cùng thành,
		Dài và ngắn cùng chiều,
		Cao và thấp cùng nhau,
		Giọng và tiếng cùng hoạ,
		Trước và sau cùng theo.
		Vậy nên hiền nhân:
		Dùng vô vi mà xử sự;
		Dùng vô ngôn mà dạy dỗ;
		Để cho mọi vật nên mà không cản
		Tạo ra mà không chiếm đoạt
		Làm mà không cậy công;
		Thành công mà không ở lại.
		Vì không ở lại
		Nên không bị bỏ đi
		Đạo thường hằng
		
		updating...'
,N'Sách triết học');

INSERT INTO dbo.tbl_Book( bookTitle , author, brief, publisher, content, category)
    VALUES(
    N'Bức xúc không làm ta vô can'
    ,'Đặng Hoàng Giang'
    ,''
    ,N'Nhà xuất bản hội nhà văn'
    ,N'Sự lộn xộn, nhếch nhác ở Việt Nam gắn liền với mức phát triển kinh tế của chúng ta, nhưng không phải là đặc thù Việt. Các nước đang phát triển khác cũng lộn xộn, bụi bặm, thiếu quy củ như vậy. Cũng khó mà yêu cầu những người nghèo đang vật lộn hằng ngày phải lịch sự, đi nhẹ nói khẽ và nhường nhịn người xung quanh. Hay thậm chí, những người không còn nghèo nữa thì vẫn mang thói quen từ thời bao cấp đã ăn sâu trong tiềm thức, nên vào resort (khu nghỉ dưỡng) vẫn còn chen lấn nhau khi lấy đồ ăn…
    
    updating...'
,N'Sách kỹ năng sống');

INSERT INTO dbo.tbl_Book( bookTitle , author, brief, publisher, content, category)
    VALUES(
    N'Dẫn Dắt – Lãnh Đạo Chứ Không Quản Lý'
    ,'Alex Furguson, Michael Moritz'
    ,''
    ,N'publisher'
    ,N'Làm thế nào để dẫn dắt một tập thể giành được những thành công ở tầm thế giới trong suốt một thời gian dài? Sir Alex Ferguson là một trong số rất hiếm hoi những nhà lãnh đạo làm được điều này! Trong sự nghiệp 38 năm làm huấn luyện viên bóng đá, ông giành được tổng cộng 49 danh hiệu, đồng thời góp phần biến CLB bóng đá Manchester United trở thành một trong những thương hiệu lớn nhất thế giới. Trong cuốn sách đầy cảm hứng và rất thẳng thắn này, Sir Alex tiết lộ với chúng ta những “bí mật” thú vị đằng sau sự nghiệp lừng lẫy của ông. Tác giả tập trung trình bày những kỹ năng quản lý và lãnh đạo mà ông xem là quan trọng nhất, cũng chính là những gì mà chúng ta ngay lập tức hình dung khi nghĩ về “phong cách huấn luyện của Sir Alex Ferguson”: kỷ luật, kiểm soát, tinh thần đồng đội và động lực thi đấu. Ngoài ra, tác giả không quên đề cập tới những khía cạnh dường như không nổi bật, nhưng không kém phần quan trọng trên con đường đi tới thành công, chẳng hạn như việc giao trách nhiệm và ủy quyền, phân tích dữ liệu, cách ứng xử trước những thất bại …
    
    updating...'
,N'Sách kinh tế');

INSERT INTO dbo.tbl_Book( bookTitle , author, brief, publisher, content, category)
    VALUES(
    N'Khi Hơi Thở Hóa Thinh Không'
    ,'Paul Kalanithi'
    ,''
    ,N'Nhà xuất bản lao động'
    ,N'Khi Hơi Thở Hóa Thinh Không là tự truyện của một bác sĩ bị mắc bệnh ung thư phổi. Trong cuốn sách này, tác giả đã chia sẻ những trải nghiệm từ khi mới bắt đầu học ngành y, tiếp xúc với bệnh nhân cho tới khi phát hiện ra mình bị ung thư và phải điều trị lâu dài.
    Kalanithi rất yêu thích văn chương nên câu chuyện của anh đã được thuật lại theo một phong cách mượt mà, dung dị và đầy cảm xúc. Độc giả cũng được hiểu thêm về triết lý sống, triết lý nghề y của Kalanithi, thông qua ký ức về những ngày anh còn là sinh viên, rồi thực tập, cho đến khi chính thức hành nghề phẫu thuật thần kinh. “Đối với bệnh nhân và gia đình, phẫu thuật não là sự kiện bi thảm nhất mà họ từng phải đối mặt và nó có tác động như bất kỳ một biến cố lớn lao trong đời. Trong những thời điểm nguy cấp đó, câu hỏi không chỉ đơn thuần là sống hay chết mà còn là cuộc sống nào đáng sống.” – Kalanithi luôn biết cách đưa vào câu chuyện những suy nghĩ sâu sắc và đầy sự đồng cảm như thế.

Bạn bè và gia đình đã dành tặng những lời trìu mến nhất cho con người đáng kính trọng cả về tài năng lẫn nhân cách này. Dù không thể vượt qua cơn bệnh nan y, nhưng thông điệp của tác giả sẽ còn khiến người đọc nhớ mãi.

	updating...'
,N'Sách y học');
GO

	INSERT INTO dbo.tbl_Book( bookTitle , author, brief, publisher, content, category)
		VALUES(
		N'Thế Giới Phẳng'
		,N'Thomas L. Friedman'
		,''
		,N'Nhà xuất bản Trẻ'
		,N'Thế giới phẳng (tiếng Anh: The World is Flat) là một tác phẩm của Thomas Friedman, một biên tập viên chuyên mục ngoại giao và kinh tế của tạp chí New York Times có những tác phẩm và công trình nghiên cứu về vấn đề toàn cầu hoá rất thành công: Nóng, Phẳng, Chật, Từ Beirut đến Jerusalem, Chiếc Lexus và cây ôliu, Từng là bá chủ.
	Năm 2005,cuốn sách này được trao giải thưởng Cuốn sách hay nhất năm do Financial Times và Goldman Sachs bình chọn và Thomas Friedman cũng được bình chọn là một trong những nhà lãnh đạo xuất sắc nhất Hoa Kỳ.
	Hiện nay "thế giới phẳng" đã trở thành thuật ngữ quen thuộc chỉ sự phát triển toàn cầu hóa từ những năm đầu của thế kỷ XXI khi mười nhân tố lớn liên quan đến kinh tế và khoa học kỹ thuật trên thế giới cùng nhau tác động, khiến cho các mô hình xã hội, chính trị và xã hội đã bị thay đổi và thế giới trở nên phẳng hơn bao giờ hết khi sự tiếp xúc giữa các cá nhân trở nên dễ dàng và chặt chẽ hơn trước.
	Bản tiếng Việt - Thế giới phẳng: Tóm lược Lịch sử Thế giới Thế kỷ XXI - do Nguyễn Quang A, Nguyễn Hồng Quang, Vũ Duy Thành, Lã Việt Hà, Lê Hồng Vân, Hà Thị Thanh Huyền dịch và hiệu đính, Nhà xuất bản Trẻ xuất bản tháng 8 năm 2006 dưới hình thức sách bìa mềm dày 820 trang. Bản ebook Nhà xuất bản Trẻ 1399 trang. Sách được dịch và xuất bản bằng tiếng Việt dưới sự hỗ trợ về tài chính của Phòng Thông tin - Văn hóa. Tổng lãnh sự quán Hoa Kỳ tại Thành phố Hồ Chí Minh.
	
	updating...	'
	,N'Sách kinh doanh');
	GO
	 
	INSERT INTO dbo.tbl_Book( bookTitle , author, brief, publisher, content, category)
		VALUES(
		N'Content Hay Nói Thay Nước Bọt'
		,N'MEDIAZ'
		,N'Thế giới của quyền năng sáng tạo'
		,N'Nhà Xuất Bản Thế Giới'
		,N'Content Hay Nói Thay Nước Bọt - Bí Quyết Thành Công Của Content Creator” - một ấn phẩm đặc biệt dành tặng riêng bạn trong hành trình khám phá, chu du những miền đất sáng tạo, kiếm tìm những mảnh ghép để hoàn thiện hơn cho thế giới Content của riêng mình.
	Với 4 phần chính lần lượt đi từ tổng quan về content, về những kiến thức nền của thế giới digital content cho đến cách thức sáng tạo content chạm được vào cảm xúc của khách hàng cùng các xu hướng content trong thời đại ngày nay, Content Hay Nói Thay Nước Bọt đem đến các định nghĩa đầy đủ và dễ hiểu, các ví dụ thực tế trực quan, các bài tập thực hành cụ thể nhằm giúp cho người đọc có cái nhìn cơ bản nhất, định hướng rõ hơn về ý tưởng sáng tạo và giúp bạn xây dựng đúng content ngay từ đầu.
	Được coi như những tấm ván chắc chắn để làm nên một con thuyền content vững chãi, sẵn sàng bước ra biển khơi sáng tạo trong tương lai, cuốn sách sẽ là người thầy, người đồng hành của bạn trong quá trình chinh chiến với nghề Content.
	Giá sản phẩm trên Tiki đã bao gồm thuế theo luật hiện hành. Tuy nhiên tuỳ vào từng loại sản phẩm hoặc phương thức, địa chỉ giao hàng mà có thể phát sinh thêm chi phí khác như phí vận chuyển, phụ phí hàng cồng kềnh, ...

	updating...	'
	,N'Sách kinh doanh');
	GO

	INSERT INTO dbo.tbl_Book( bookTitle , author, brief, publisher, content, category)
		VALUES(
		 N'Suối Nguồn'
		,N'AYN RAND'
		,N'Bản chất của con người'
		,N'Nhà Xuất Bản Trẻ'
		,N'… Trong lịch sử nhân loại, hiếm thấy ai phát biểu quan điểm này về con người. Ngày nay, quan điểm này hầu như không tồn tại. Tuy nhiên, chính quan điểm này – dù tồn tại ở các cấp độ khác nhau của sự khao khát, ao ước, đam mê và hoang mang đau khổ – là quan điểm khởi đầu cuộc sống của những người ưu tú nhất của nhân loại. Đối với đa số họ, đây thậm chí không phải là một quan điểm rõ ràng mà chỉ là một cảm giác mơ hồ, khó nắm bắt, nó được tạo thành từ những nỗi đau trần trụi và từ niềm hạnh phúc không thể diễn tả nổi. Nó là cảm giác về một kỳ vọng lớn, rằng cuộc sống của một người là quan trọng, rằng những thành tựu lớn lao có thể nằm trong khả năng, và rằng những điều vĩ đại còn nằm phía trước.

	Bản chất của con người – và của bất cứ sinh vật nào – không phải là đầu hàng, hoặc phỉ nhổ và nguyền rủa sự tồn tại của mình; điều ấy thực ra đòi hỏi cả một quá trình suy đồi mà tốc độ của nó tuỳ thuộc mỗi người. Một vài người đầu hàng vào lần đầu tiên tiếp xúc với áp lực; một vài người mặc nhiên đầu hàng; một số khác đi xuống từ từ và cứ thế mất dần ngọn lửa mà chính họ cũng không hề nhận ra nó đã tàn lụi như thế nào. Sau đó, tất cả biến mất trong cái đầm lầy khổng lồ gồm những người già cỗi, những người rao giảng rằng trưởng thành bao hàm việc chối bỏ chính kiến, rằng sự ổn định bao hàm việc chối bỏ những giá trị riêng, và rằng sống thực tế có nghĩa là phải gạt bỏ sự tồn tại. Chỉ một số ít người kiên quyết không đầu hàng và tiếp tục tiến lên; họ biết rằng không thể phản bội ngọn lửa kia; họ học cách nuôi dưỡng nó, cho nó hình hài, mục đích và sự sống… Tóm lại, dù tương lai mỗi người khác nhau, ở vào thời điểm bắt đầu cuộc sống, nhân loại luôn tìm kiếm một hình ảnh cao cả về bản chất con người cũng như về cuộc sống.

	Có rất ít cột chỉ đường trong cuộc tìm kiếm này. Suối nguồn là một trong những cột chỉ đường đó. Đây chính là một trong những lý do cơ bản nhất khiến cho suối nguồn có sức hấp dẫn lâu dài; nó tái khẳng định tinh thần của tuổi trẻ, nó tuyên bố về chiến thắng của con người, nó chỉ ra người ta có thể làm được những gì…

	updating...	'
	,N'Tiểu thuyết Văn học');
	GO

	INSERT INTO dbo.tbl_Book( bookTitle , author, brief, publisher, content, category)
		VALUES(
		N'Đừng Bao Giờ Đi Ăn Một Mình'
		,N'Keith Ferrazzi'
		,N'Bậc thầy về kết nối'
		,N'Nhà Xuất Bản Trẻ'
		,N'Bạn mong muốn đi tắt đón đầu? Bạn muốn vững bước đến thành công? Công thức để làm được điều này, theo lời bậc thầy về kết nối là Keith Ferrazzi, chính là phải biết làm quen với mọi người. Ferrazzi đã khám phá từ khi còn trẻ rằng điểm khác biệt của những người thành công rực rỡ chính là cách họ vận dụng quyền năng của những mối quan hệ – để mọi người cùng thắng.

	Trong quyển sách Đừng bao giờ đi ăn một mình, Ferrazzi chỉ ra từng bước cách thức – và lý do – mà chính ông đã áp dụng để kết nối với hàng ngàn người là đồng nghiệp, bạn bè có tên trong số danh bạ, những người ông đã giúp đỡ và ngược lại cũng sẵn sàng giúp đỡ ông.

	updating...	'
	,N'Sách kinh doanh');
	GO

	INSERT INTO dbo.tbl_Book( bookTitle , author, brief, publisher, content, category)
		VALUES(
		N'Pr là Sống'
		,N'Phạm Quốc Hưng'
		,N'Pr là cuộc sống'
		,N'Nhà Xuất TP.Hồ Chí Minh'
		,N'Bạn muốn biết cách luyện thi vào một trường đại học hạng nhất? Ôi thôi đi, dễ chừng một nửa số cây trên thế giới đã bị đốn để in các loại sách có khi đều đáng vứt vào sọt rác rồi còn gì. Bạn muốn một cuốn cẩm nang dạy cách sống sót qua những năm đại học? Thế cũng thôi đi, đến chúng tôi còn chẳng hiểu làm sao có thể gắng gượng được đến phút cuối nữa là.

	Còn nếu các bạn muốn tìm một tấm gương tày liếp về sự sa ngã nơi giảng đường một khi bạn không biết suy nghĩ cho tử tế, thì đây, câu chuyện về chúng tôi - ba ngôi sao thời trung học nhưng lại thành ra Ba chàng ngốc đì đẹt điểm trung bình ngày đại học với đủ trò quậy phá, gian lận, và cũng là Ba chàng ngốc luôn sát cánh bên nhau nếm trải nào tình bạn khắc cốt ghi tâm, nào tình yêu vượt qua mọi rào cản, nào tình thầy trò sáng trong thân thiết, nào tình cảm gia đình sẵn sàng xả thân.

	Và, có thể bạn đã biết, năm 2009, câu chuyện về chúng tôi đã được đạo diễn Rajkumar Hirani chuyển thể thành Ba chàng ngốc - bộ phim Bollywood phá mọi kỷ lục phòng vé để trở thành bộ phim ăn khách nhất lịch sử Ấn Độ. Còn bây giờ, nào, hãy cùng chúng tôi trải nghiệm những năm tháng tuổi trẻ điên rồ nổi loạn!

	updating...	'
	,N'Truyện Cười - Tiếu Lâm');
	GO

	INSERT INTO dbo.tbl_Book( bookTitle , author, brief, publisher, content, category)
		VALUES(
		N'Ba Chàng Ngốc'
		,N'Chetan Bhagat'
		,N'Pr là cuộc sống'
		,N'Nhà Xuất Hội Nhà Văn'
		,N'PR là một chức năng quản trị định hướng thái độ của công chúng, xác định chính sách, thực hiện và làm cho quan tâm một tổ chức, được thực hiện theo một chương trình hành động tìm kiếm sự thông hiểu và chấp nhận của công chúng” theo lời một nữ chuyên gia PR định nghĩa. 

	Ngày nay trong bất cứ ngành nào, PR vẫn rất quan trọng. PR thể hiện tầm quan trọng trong giao tiếp của một tổ chức hay một cá nhân và đối tượng của họ như là nhân viên, đối tác, nhóm cần quan tâm. Đặc biệt, chúng ta có thể thấy sức mạnh của PR trong lĩnh vực dịch vụ như ngân hàng, tài chính, vận tải, du lịch, nhà hàng, khách sạn mà các hoạt động của con người cần sự giao tiếp tốt để có hiệu quả công việc cao. 

	Bằng tất cả nỗ lực, tác giả đã cố gắng thực hiện và hoàn thành cuốn sách này. Hy vọng tất cả trải nghiệm, suy nghĩ, ý tưởng và cảm nhận của tác giả có thể đóng góp một phần vào sự hoàn hảo của cộng đồng PR. PR không tự nó là phương thuốc diệu kỳ cho sự vững mạnh của thương hiệu mà ở tại người nhìn nhận và sử dụng nó như thế nào. Với các nguyên tắc 3PR, 3S, CAR, NCNS, và ANGEL STARS, PR sẽ thật sự sống mãi cùng thương hiệu của từng tổ chức và cuộc đời của mỗi người.

	updating...	'
	,N'Marketing - Bán hàng');
	GO

INSERT INTO BookCase
	VALUES(1,N'Giỏ sách của CuongTT12'),
		  (2,N'Giỏ sách của DuongNV30'),
		  (3,N'Giỏ sách của HoanNM'),
		  (4,N'Giỏ sách của HoangDC1'),
		  (5,N'Giỏ sách của SonPH19');
GO

INSERT INTO Contain
	VALUES(1,1,'2020-08-12'),
	      (1,2,'2020-08-13'),
	      (1,3,'2020-08-13'),
	      (1,4,'2020-08-13'),
	      
	      (2,2,'2020-09-01'),
	      (2,3,'2020-09-06'),
	      (2,5,'2020-08-13'),
	      (2,6,'2020-08-13'),
	      
	      (3,1,'2019-01-23'),
	      (3,6,'2020-01-07'),
	      
	      (4,5,'2018-05-17'),
	      (4,6,'2018-11-30'),
	      
	      (5,1,'2020-08-13'),
	      (5,4,'2020-08-13'),
	      (5,6,'2020-08-13');
		  
GO

SELECT content FROM tbl_Book;
SELECT * FROM tbl_User;
SELECT * FROM BookCase;
SELECT * FROM Contain;
SELECT id,password FROM tbl_User WHERE userName = 'cuongtt12';

SELECT b.* 
FROM dbo.Contain AS c JOIN dbo.tbl_Book AS b ON c.book_id = b.book_id
WHERE c.book_case_id = 7
GO

select * from dbo.tbl_Book
