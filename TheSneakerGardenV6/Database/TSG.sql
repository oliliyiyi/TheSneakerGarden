--CREATE DATABASE TSG

--GO
CREATE TABLE Brand(
	BrandID int identity(1,1) not null,
	BrandName nvarchar(30) not null,
	CONSTRAINT PK_Branch PRIMARY KEY CLUSTERED(
		BrandID ASC
	)
)
GO
INSERT INTO dbo.Brand(BrandName) VALUES (N'Nike')
INSERT INTO dbo.Brand(BrandName) VALUES (N'Adidas')
GO
CREATE TABLE Categories (
    CategoryID int identity(1,1) NOT NULL ,
    CategoryName varchar(50) NOT NULL
    CONSTRAINT PK_Category PRIMARY KEY CLUSTERED (
        CategoryID
    )
)

GO
INSERT INTO dbo.Categories(CategoryName) VALUES(N'Shoes')
INSERT INTO dbo.Categories(CategoryName) VALUES(N'Sock')
INSERT INTO dbo.Categories(CategoryName) VALUES(N'Hat')
INSERT INTO dbo.Categories(CategoryName) VALUES(N'Backpack')
GO

CREATE TABLE Sizes(
	SizeNumber int NOT NULL,
	[Length] nvarchar(10),
	Width nvarchar(10),
	CONSTRAINT PK_Sizes PRIMARY KEY CLUSTERED (
		SizeNumber
	)
)
GO
INSERT INTO dbo.Sizes(SizeNumber, [Length], Width) VALUES (35, N'21-21.5', N'8')
INSERT INTO dbo.Sizes(SizeNumber, [Length], Width) VALUES (36, N'21.6-22', N'8-8.5')
INSERT INTO dbo.Sizes(SizeNumber, [Length], Width) VALUES (37, N'22.1-22.5', N'8.5')
INSERT INTO dbo.Sizes(SizeNumber, [Length], Width) VALUES (38, N'22.6-23', N'8.5-9')
INSERT INTO dbo.Sizes(SizeNumber, [Length], Width) VALUES (39, N'23.1-23.5', N'9')
INSERT INTO dbo.Sizes(SizeNumber, [Length], Width) VALUES (40, N'23.6-24', N'9-9.5')
INSERT INTO dbo.Sizes(SizeNumber, [Length], Width) VALUES (41, N'24.1-24.5', N'9.5')
INSERT INTO dbo.Sizes(SizeNumber, [Length], Width) VALUES (42, N'24.6-25', N'9.5-10')
INSERT INTO dbo.Sizes(SizeNumber, [Length], Width) VALUES (43, N'25.1-25.5', N'10')
INSERT INTO dbo.Sizes(SizeNumber, [Length], Width) VALUES (44, N'25.6-26', N'10-10.5')
INSERT INTO dbo.Sizes(SizeNumber, [Length], Width) VALUES (45, N'26.1-26.5', N'10.5')
INSERT INTO dbo.Sizes(SizeNumber, [Length], Width) VALUES (46, N'26.6-27', N'10.5-11')
INSERT INTO dbo.Sizes(SizeNumber, [Length], Width) VALUES (47, N'27.1-27.5', N'11')
INSERT INTO dbo.Sizes(SizeNumber, [Length], Width) VALUES (48, N'27.6-28', N'11-11.5')
INSERT INTO dbo.Sizes(SizeNumber, [Length], Width) VALUES (49, N'28.1-28.5', N'11.5')
INSERT INTO dbo.Sizes(SizeNumber, [Length], Width) VALUES (50, N'28.6-29', N'11.5-12')
GO
CREATE TABLE Products (
    ProductID int identity(1,1) NOT NULL ,
	CategoryID int  NOT NULL,
	BrandID int NOT NULL,
    ProductName nvarchar(100)  NOT NULL ,
    Price float  NOT NULL ,
    ImageLink varchar(200) NULL,
    [Description] varchar(400) NULL ,
    Rate float NULL ,
	[Status] bit  NOT NULL ,
    CONSTRAINT PK_Products PRIMARY KEY CLUSTERED (
        ProductID 
    ),
	CONSTRAINT FK_Products_Categories FOREIGN KEY
	(
		CategoryID
	) REFERENCES dbo.Categories(
		CategoryID
	),
	CONSTRAINT FK_Products_Branch FOREIGN KEY(
		BrandID
	)REFERENCES dbo.Brand (
		BrandID
	)
)

GO
INSERT INTO dbo.Products(CategoryID, BrandID, ProductName, Price, ImageLink, [Description], Rate, [Status])
VALUES(1, 2, N'ULTRABOOST 22 SHOES', 500000, N'https://assets.adidas.com/images/w_383,h_383,f_auto,q_auto,fl_lossy,c_fill,g_auto/5ae921bb08034aa2803fad7800abdd7f_9366/ultraboost-22-shoes.jpg', N'The Ultraboost running shoes serve up comfort and responsiveness at every pace and distance. The adidas PRIMEKNIT upper includes foam around the heel to prevent blisters. Y A Continental™ Rubber outsole grips in wet and dry conditions so you can stride confidently.', 4, 1)
INSERT INTO dbo.Products(CategoryID, BrandID, ProductName, Price, ImageLink, [Description], Rate, [Status])
VALUES(1, 2, N'FLUIDFLOW 2.0 SHOES', 700000, N'https://assets.adidas.com/images/h_840,f_auto,q_auto,fl_lossy,c_fill,g_auto/170aeeeea80b4b538da8ac1d010f4a69_9366/Fluidflow_2.0_Shoes_Black_FZ1985_01_standard.jpg', N'It does not really matter whether or not a run is in the cards for the day. An ultra-breathable feel and cushy midsole that energises give these adidas shoes an edge. Hit the pavement or hit the town. You have got the kicks for whatever unfolds.', 3, 1)
INSERT INTO dbo.Products(CategoryID, BrandID, ProductName, Price, ImageLink, [Description], Rate, [Status])
VALUES(1, 2, N'ULTRABOOST WEB DNA SHOES', 650000, N'https://assets.adidas.com/images/h_840,f_auto,q_auto,fl_lossy,c_fill,g_auto/8c3a0cd0d4524c68abf2ad430109ca79_9366/Ultraboost_Web_DNA_Shoes_White_GY4167_01_standard.jpg', N'Comfort that is rooted in running meets effortless style in these adidas Ultraboost Web DNA Shoes. A lattice design on the midsole and outsole reveals the energy-returning Boost cushioning underneath. The adidas Primeknit upper is stretchy and supportive.', 3.5, 1)
INSERT INTO dbo.Products(CategoryID, BrandID, ProductName, Price, ImageLink, [Description], Rate, [Status])
VALUES(1, 2, N'RESPONSE SUPER 2.0 SHOES',800000, N'https://assets.adidas.com/images/h_840,f_auto,q_auto,fl_lossy,c_fill,g_auto/28392f623ffc41089e1ead7100d3a94e_9366/Response_Super_2.0_Shoes_White_GX8264_01_standard.jpg', N'Move through your day feeling comfortable and ready for anything with these adidas running shoes. A mesh upper is breathable, keeping your feet fresh even on warm days. Energised cushioning puts a spring in every step you take.', 5, 1)
INSERT INTO dbo.Products(CategoryID, BrandID, ProductName, Price, ImageLink, [Description], Rate, [Status])
VALUES(1, 2, N'RETROPY F2 SHOES', 400000, N'https://assets.adidas.com/images/h_840,f_auto,q_auto,fl_lossy,c_fill,g_auto/6c6ab76673b44ce3a868adf9012dde3b_9366/Retropy_F2_Shoes_Green_GW0506_01_standard.jpg', N'You like to be one step ahead. Blending retro vibes with modern design, these adidas Retropy F2 Shoes are right there with you. Rooted in 80s running style, they show off a layered material-mix upper. The sleek shape and thick EVA midsole make them ideal for today.', 4, 1)
INSERT INTO dbo.Products(CategoryID, BrandID, ProductName, Price, ImageLink, [Description], Rate, [Status])
VALUES(1, 2, N'QUESTAR SHOES', 600000, N'https://assets.adidas.com/images/h_840,f_auto,q_auto,fl_lossy,c_fill,g_auto/982b0d4744d249be8d37ade900fd2ef6_9366/Questar_Shoes_Black_GZ0621_01_standard.jpg', N'Every day is a good day for a run when you lace up in these adidas shoes. A padded collar gives you a snug and secure fit, while lightweight cushioning underfoot delivers enhanced flexibility for a comfortable step from heel-strike to toe-off.', 4.5, 1)
INSERT INTO dbo.Products(CategoryID, BrandID, ProductName, Price, ImageLink, [Description], Rate, [Status])
VALUES(1, 2, N'EQ21 RUN SHOES', 600000, N'https://assets.adidas.com/images/h_840,f_auto,q_auto,fl_lossy,c_fill,g_auto/04fa4c9f8da348389770ae14008ac808_9366/EQ21_Run_Shoes_Orange_GZ6869_01_standard.jpg', N'Lace up in comfort with these adidas running shoes. Breathable mesh keeps your feet feeling cool and fresh as you move through your day. A lightweight midsole cushions every step from the first of the day to the last.', 4, 1)
INSERT INTO dbo.Products(CategoryID, BrandID, ProductName, Price, ImageLink, [Description], Rate, [Status])
VALUES(1, 2, N'GALAXY 5 SHOES', 900000, N'https://assets.adidas.com/images/h_840,f_auto,q_auto,fl_lossy,c_fill,g_auto/47631b05c092437ba433ae0d00f57c6d_9366/Galaxy_5_Shoes_White_GW0763_01_standard.jpg', N'Make the most out of your runs. No matter how far you go, these adidas shoes cushion every take-off and landing to make each step feel like a good one. Another block. Another lap. Another mile. Get after it.', 4.3, 1)
INSERT INTO dbo.Products(CategoryID, BrandID, ProductName, Price, ImageLink, [Description], Rate, [Status])
VALUES(1, 1, N'Nike Dunk High By You', 700000, N'https://static.nike.com/a/images/t_PDP_864_v1/f_auto,b_rgb:f5f5f5,q_80/f57965b5-9331-4452-8437-cccb22de3ac2/custom-nike-dunk-high-by-you.png', N'Leather, suede and woven material in rave colours and metallics bring a whole new life to this staple of sport, with a special edition font to add a little extra personality.', 4, 1)
INSERT INTO dbo.Products(CategoryID, BrandID, ProductName, Price, ImageLink, [Description], Rate, [Status])
VALUES(1, 1, N'Nike Air Max 90 G', 400000, N'https://static.nike.com/a/images/t_PDP_864_v1/f_auto,b_rgb:f5f5f5/160ac08e-9b45-4f74-a9cc-c8502b58658b/air-max-90-g-golf-shoes-P2Wfz8.png', N'Get your kicks, inspired by Route 66. The Nike Air Max 90 G stays true to the original icon, with a Max Air unit in the heel, and adds integrated traction for exceptional grip. A Swoosh logo paired with a Route 66 logo on the tongue pays tribute to 1 of America is original highways. The outsole is made with at least 13% Nike Grind material.', 4, 1)
INSERT INTO dbo.Products(CategoryID, BrandID, ProductName, Price, ImageLink, [Description], Rate, [Status])
VALUES(1, 2, N'Nike Air Zoom G.T. Jump',  500000, N'https://static.nike.com/a/images/t_PDP_864_v1/f_auto,b_rgb:f5f5f5/aeeecdd0-3a5a-4f8b-8c16-d4c8e9256231/air-zoom-gt-jump-basketball-shoes-22QS5F.png', N'The double-stacked Zoom Air works in sync with an outer jumper frame made from lightweight, resilient, and sturdy PEBAX®. The woven exoskeleton-like upper helps you feel fully connected', 4.5, 1)
INSERT INTO dbo.Products(CategoryID, BrandID, ProductName, Price, ImageLink, [Description], Rate, [Status])
VALUES(1, 1, N'Nike ZoomX Invincible Run Flyknit 2', 650000 ,N'https://static.nike.com/a/images/t_PDP_864_v1/f_auto,b_rgb:f5f5f5/76e6dd8d-5a2e-435c-bd9b-294b2e929d95/zoomx-invincible-run-flyknit-2-road-running-shoes-0lCQ5S.png', N'The Nike ZoomX Invincible Run Flyknit 2 keeps you going with the same super-soft feel that lets you feel your potential when your foot hits the pavement. We have crafted shoes with our highest level of spring responsiveness and support to keep you feeling secure and competitive.', 4.3, 1)
INSERT INTO dbo.Products(CategoryID, BrandID, ProductName, Price, ImageLink, [Description], Rate, [Status])
VALUES(1, 1, N'Nike Air Force 1 07 LV8', 600000, N'https://static.nike.com/a/images/t_PDP_864_v1/f_auto,b_rgb:f5f5f5/6f3f5d83-0770-45da-97ec-280233fd949f/air-force-1-07-lv8-shoes-g8VPMF.png', N'In sneaker history, few styles last. Only one transcends every era—the Nike Air Force 1 07 LV8. Celebrate perfection with the b-ball original that delivers what you know best: bold details and some extra flash to keep you shining.', 5, 1)
INSERT INTO dbo.Products(CategoryID, BrandID, ProductName, Price, ImageLink, [Description], Rate, [Status])
VALUES(1, 1, N'Nike Blazer Mid 77 Jumbo', 400000, N'https://static.nike.com/a/images/t_PDP_864_v1/f_auto,b_rgb:f5f5f5/1c7ee386-246a-4b75-bbe9-7771333bc8f9/blazer-mid-77-jumbo-shoes-jfX5HT.png', N'Harnessing the classic look you love, it now features an elastic heel with velvet-like texture and large drawstrings for easy on and off. Oversized details like logos and laces add interest while plush foam tongues and thicker stitching celebrate the iconic look that has been hailed on the streets since 777.', 4, 1)
INSERT INTO dbo.Products(CategoryID, BrandID, ProductName, Price, ImageLink, [Description], Rate, [Status])
VALUES(1, 1, N'Nike Dunk Low Retro SE', 700000, N'https://static.nike.com/a/images/t_PDP_864_v1/f_auto,b_rgb:f5f5f5/1027ea63-1476-4006-82b0-f83ad0c7169c/dunk-low-retro-se-shoes-chsffk.png', N'Faded side panels and classic red, white and blue piping celebrates trusted barbers to help you look good. The padded, low-cut collar lets you take your signature style anywhere — in comfort.', 4.4, 1)
INSERT INTO dbo.Products(CategoryID, BrandID, ProductName, Price, ImageLink, [Description], Rate, [Status])
VALUES(1, 1, N'Nike Air Force 1 07 SE', 800000, N'https://static.nike.com/a/images/t_PDP_864_v1/f_auto,b_rgb:f5f5f5/8ebf647b-f49b-4a42-b0b4-3177fb2d9c2b/air-force-1-07-se-shoes-J2qs7m.png', N'The radiance lives on with the b-ball original. Crossing hardwood comfort with off-court flair, it puts a fresh spin on what you know best: era-echoing, 80s construction, bold details and nothin-but-net style.', 4.8, 1)
INSERT INTO dbo.Products(CategoryID, BrandID, ProductName, Price, ImageLink, [Description], Rate, [Status])
VALUES(2, 2, N'LOW-CUT SOCKS 3 PAIRS', 350000, N'https://assets.adidas.com/images/h_840,f_auto,q_auto,fl_lossy,c_fill,g_auto/17734a313bc646539309a9d300acedbf_9366/Low-Cut_Socks_3_Pairs_White_DZ9401_03_standard.jpg', N'Designed for everyday comfort whether you are lounging at home or working out at the gym, this trio of low-cut socks have a slim, lightweight feel. Cotton blend design with built-in arch support for a snug fit. They are accented with the adidas logo just below the ribbed cuffs.', 4.5, 1)
INSERT INTO dbo.Products(CategoryID, BrandID, ProductName, Price, ImageLink, [Description], Rate, [Status])
VALUES(2, 2, N'CUSHIONED ANKLE SOCKS', 150000, N'https://assets.adidas.com/images/h_840,f_auto,q_auto,fl_lossy,c_fill,g_auto/77d8e4ebb6c6418c8ce1aa2200d70fad_9366/Cushioned_Ankle_Socks_Black_DZ9368_03_standard.jpg', N'Heel-to-toe cushioning makes these ankle-length socks super comfortable. Knit-in arch support and a smooth toe seam give them snug fit and feel. The cotton-rich design is finished with sporty adidas branding.', 4, 1)
INSERT INTO dbo.Products(CategoryID, BrandID, ProductName, Price, ImageLink, [Description], Rate, [Status])
VALUES(2, 2, N'ANKLE PERFORMANCE RUNNING SOCKS', 400000, N'https://assets.adidas.com/images/h_840,f_auto,q_auto,fl_lossy,c_fill,g_auto/0178dba7fa384c10bff0ae7a00d2a127_9366/Ankle_Performance_Running_Socks_Yellow_HN6311_03_standard.jpg', N'Anything that is annoying at the start is unbearable by the finish line. Find distraction-free comfort for every step of your run in the thin, snug and stretchy build of these adidas socks. HEAT.RDY maximises airflow, and a flat-toe seam means no friction.', 4.3, 1)
INSERT INTO dbo.Products(CategoryID, BrandID, ProductName, Price, ImageLink, [Description], Rate, [Status])
VALUES(2, 2, N'ARSENAL 22/23 HOME SOCKS', 420000, N'https://assets.adidas.com/images/h_840,f_auto,q_auto,fl_lossy,c_fill,g_auto/f8b52e3343a344019458addd002c8ab7_9366/Arsenal_22-23_Home_Socks_Red_H35910_03_standard.jpg', N'Creating a classic football kit is not just about getting the jersey right. Borrowed from the club is mid-90s look, the lightning bolt graphic on these adidas Arsenal socks makes a real impression. Moisture-absorbing AEROREADY and a comfortable FORMOTION fit ensure they feel as good as they look.', 4, 1)
INSERT INTO dbo.Products(CategoryID, BrandID, ProductName, Price, ImageLink, [Description], Rate, [Status])
VALUES(2, 1, N'Nike Everyday Lightweight', 359000, N'https://static.nike.com/a/images/t_PDP_1728_v1/f_auto,b_rgb:f5f5f5/ufdkp0ukknqv4b9zfqby/everyday-lightweight-training-ankle-socks-ShtJfk.png', N'Power through your workout with the Nike Everyday Lightweight Socks. Soft yarns with sweat-wicking technology help keep your feet comfortable and dry.', 4, 1)
INSERT INTO dbo.Products(CategoryID, BrandID, ProductName, Price, ImageLink, [Description], Rate, [Status])
VALUES(2, 1, N'Nike Academy', 309000, N'https://static.nike.com/a/images/t_PDP_1728_v1/f_auto,b_rgb:f5f5f5/8c6cd1dc-572d-4305-8538-0787daae40c5/academy-over-calf-football-socks-3LZwVZ.png', N'The Nike Academy Socks are designed to keep you comfortable during play with soft, sweat-wicking fabric with arch support.', 4.3, 1)
INSERT INTO dbo.Products(CategoryID, BrandID, ProductName, Price, ImageLink, [Description], Rate, [Status])
VALUES(2, 1, N'Nike Everyday Cushioned', 359000, N'https://static.nike.com/a/images/t_PDP_864_v1/f_auto,b_rgb:f5f5f5/a80c3fd8-2084-4f96-b8eb-81131981a3fc/everyday-cushioned-training-low-socks-VNb5d4.png', N'Power through your workout with the Nike Everyday Cushioned Socks. The thick terry sole gives you extra comfort for foot drills and lifts, while a ribbed arch band wraps your midfoot for a supportive feel.', 4.5, 1)
INSERT INTO dbo.Products(CategoryID, BrandID, ProductName, Price, ImageLink, [Description], Rate, [Status])
VALUES(2, 1, N'Nike Everyday Essential', 509000, N'https://static.nike.com/a/images/t_PDP_864_v1/f_auto,b_rgb:f5f5f5/31472549-b98b-4623-b048-5c59a97beb79/everyday-essential-crew-socks-VKXr4t.png', N'Oh-so-fly and comfy, the Nike Everyday Essential Crew Socks have a clean, classic look. Contrast stripes and an Air logo add a pop of colour you can pair with your shoes. This product is made from at least 75% recycled polyester fibres.', 4.4, 1)
INSERT INTO dbo.Products(CategoryID, BrandID, ProductName, Price, ImageLink, [Description], Rate, [Status])
VALUES(3, 2, N'SUPERLITE HAT', 500000, N'https://assets.adidas.com/images/h_840,f_auto,q_auto,fl_lossy,c_fill,g_auto/272d5d9cb7b74415a6c9ac8e015a4ccc_9366/Superlite_Hat_Black_EX7048_01_standard.jpg', N'When the sun is blazing, you have got to dress accordingly. Top off your warm-weather workout ensemble with the adidas Superlite Hat. The comfortable, six-panel construction has perforated side panels to help keep you cool. A non-glare undervisor makes running on bright concrete easy on the eyes.', 4.8, 1)
INSERT INTO dbo.Products(CategoryID, BrandID, ProductName, Price, ImageLink, [Description], Rate, [Status])
VALUES(3, 2, N'VICTORY BUCKET HAT', 600000, N'https://assets.adidas.com/images/h_840,f_auto,q_auto,fl_lossy,c_fill,g_auto/f680d176984d4da081baad44008683b5_9366/Victory_Bucket_Hat_Black_FZ6836_01_standard.jpg', N'Top off your look with laid-back style. This adidas bucket hat keeps things chill under the sun with its moisture-wicking sweatband and mesh ventilation. Built-in UV 50 factor adds extra coverage, and an adjustable chin strap lets you customize the fit.', 4, 1)
INSERT INTO dbo.Products(CategoryID, BrandID, ProductName, Price, ImageLink, [Description], Rate, [Status])
VALUES(3, 2, N'ULTIMATE HAT', 400000, N'https://assets.adidas.com/images/h_840,f_auto,q_auto,fl_lossy,c_fill,g_auto/83806f774aa74251ae0aad510111dc17_9366/Ultimate_Hat_Red_FZ6869_01_standard.jpg', N'Keep it comfortable. Keep it classic. A trusty cap never goes out of style. Head to the game or hang with friends, no matter what is on your schedule, this hat keeps you covered with a comfy cotton build and a moisture-wicking sweatband. An embroidered adidas Badge of Sport on the front keeps your look legit.', 3.8, 1)
INSERT INTO dbo.Products(CategoryID, BrandID, ProductName, Price, ImageLink, [Description], Rate, [Status])
VALUES(3, 2, N'NON-DYED BOONIE HAT', 700000, N'https://assets.adidas.com/images/h_840,f_auto,q_auto,fl_lossy,c_fill,g_auto/dd4a9921388b42a587fbad4400409c4c_9366/Non-Dyed_Boonie_Hat_White_EY5565_01_standard.jpg', N'No beach outfit is complete without the perfect hat. Even if you are stuck in the city, tap into vacation vibes with this adidas boonie hat. A close cousin to the ever-iconic and stylish bucket hat, it has a side pocket to stash some small essentials. Attach it to your bag with the lobster clip for easy on-the-go carrying.', 4.3, 1)
INSERT INTO dbo.Products(CategoryID, BrandID, ProductName, Price, ImageLink, [Description], Rate, [Status])
VALUES(3, 1, N'Nike Dri-FIT ADV Classic99', 869000, N'https://static.nike.com/a/images/t_PDP_1728_v1/f_auto,b_rgb:f5f5f5/05d803e1-c067-4262-990c-4b272a4ebeb9/dri-fit-adv-classic99-perforated-golf-hat-5Sh2pF.png', N'Incredibly stretchy and very breathable, the Nike Dri-FIT ADV Classic99 Hat is built to keep you cool and comfortable so you can play at your best, round after round.', 4.1, 1)
INSERT INTO dbo.Products(CategoryID, BrandID, ProductName, Price, ImageLink, [Description], Rate, [Status])
VALUES(3, 1, N'Nike Sportswear', 659000, N'https://static.nike.com/a/images/t_PDP_1728_v1/f_auto,b_rgb:f5f5f5/3c945e18-1df2-4d3f-b191-49f4a94fe60d/sportswear-bucket-hat-pnF01f.png', N'A washed fabric on the crown of the Nike Sportswear Bucket Hat gives it a soft, well-worn feel.Its unstructured crown and brim offer a laidback look and added coverage from the elements.', 4.6, 1)
INSERT INTO dbo.Products(CategoryID, BrandID, ProductName, Price, ImageLink, [Description], Rate, [Status])
VALUES(3, 1, N'Jordan Pro Jumpman', 659000, N'https://static.nike.com/a/images/t_PDP_1728_v1/f_auto,b_rgb:f5f5f5/9e55cf10-0338-4a93-bb57-32cf88167d5b/jordan-pro-jumpman-snapback-hat-KbPBND.png', N'Show them your hops in the Jordan Pro Jumpman Snapback Hat.It has a flat bill and high structured crown made from tightly woven twill.The iconic logo is thickly embroidered on the front, a bold projection of the Brand is heritage.This product is made from at least 50% recycled polyester fibres.', 4.7, 1)
INSERT INTO dbo.Products(CategoryID, BrandID, ProductName, Price, ImageLink, [Description], Rate, [Status])
VALUES(3, 1, N'Nike Sportswear Heritage86', 559000, N'https://static.nike.com/a/images/t_PDP_1728_v1/f_auto,b_rgb:f5f5f5/f05b49b0-dcc4-4e4e-87af-b957dcc97f0e/sportswear-heritage86-adjustable-hat-mGg30s.png', N'The Nike Sportswear Heritage86 Hat has a durable 6-panel design with an adjustable strap for the perfect fit. The iconic "JUST DO IT." adds a classic look you can wear anywhere.', 4, 1)
INSERT INTO dbo.Products(CategoryID, BrandID, ProductName, Price, ImageLink, [Description], Rate, [Status])
VALUES(4, 2, N'ARSENAL BACKPACK', 750000, N'https://assets.adidas.com/images/h_840,f_auto,q_auto,fl_lossy,c_fill,g_auto/aae72bcea6284a068383adde0142cd3d_9366/Arsenal_Backpack_Red_H62446_01_standard.jpg', N'It is taken many forms over the years, but that cannon badge is an iron-clad symbol of your support. Decked in Arsenal is home colours, this adidas backpack makes no secret of your football loyalties. Inside, an array of pockets creates room for all your stuff. Mesh on the back ensures comfortable carrying on hot days.', 3.5, 1)
INSERT INTO dbo.Products(CategoryID, BrandID, ProductName, Price, ImageLink, [Description], Rate, [Status])
VALUES(4, 2, N'4ATHLTS CAMPER BACKPACK', 1000000, N'https://assets.adidas.com/images/h_840,f_auto,q_auto,fl_lossy,c_fill,g_auto/91e5927d451940068649ad9a007ad06e_9366/4ATHLTS_Camper_Backpack_Black_HC7269_01_standard.jpg', N'Every day is an adventure, and with this adidas backpack you are prepared. Inspired by outdoor gear, it has a top zip pocket so you can quickly access your keys, wallet or mobile. An external compartment keeps your laptop securely stowed but easy to reach.', 4.1, 1)
INSERT INTO dbo.Products(CategoryID, BrandID, ProductName, Price, ImageLink, [Description], Rate, [Status])
VALUES(4, 2, N'BTS BRANDPACK GRAPHIC BACKPACK', 950000, N'https://assets.adidas.com/images/h_840,f_auto,q_auto,fl_lossy,c_fill,g_auto/36d1f2bb4c654cb1844cada400398863_9366/BTS_Brandpack_Graphic_Backpack_Black_HE2668_01_standard.jpg', N'Suit up for work, a workout — or both — and let your brand pride take centre stage. This adidas backpack stores books, training gear and your lunch in the roomy main compartment. Essentials go in the zip pocket out front. Keep your tech safely tucked away in the inner laptop compartment.', 4.7, 1)
INSERT INTO dbo.Products(CategoryID, BrandID, ProductName, Price, ImageLink, [Description], Rate, [Status])
VALUES(4, 2, N'BADGE OF SPORT BACKPACK', 800000, N'https://assets.adidas.com/images/h_840,f_auto,q_auto,fl_lossy,c_fill,g_auto/11e461c4478b46ae9bdaada10074a9a5_9366/Badge_of_Sport_Backpack_Beige_HC4760_01_standard.jpg', N'Even before you make it to the gym, your commitment to sport is clear. The adidas Badge of Sport logo on this backpack says it all. Toss your clothes, towel, shoes and water bottle into the roomy design, sling it on your shoulders and go.', 4, 1)
INSERT INTO dbo.Products(CategoryID, BrandID, ProductName, Price, ImageLink, [Description], Rate, [Status])
VALUES(4, 1, N'Nike Utility', 609000, N'https://static.nike.com/a/images/t_PDP_864_v1/f_auto,b_rgb:f5f5f5/i1-23b78c77-402f-4ca2-952b-6d73cf13f5f4/utility-training-shoe-tote-wMMHtH.png', N'The Nike Utility Shoe Tote helps keep your shoes separate from the rest of your gear between home, work and the gym. The ventilated design is made from tough fabric and includes an outside pocket and handles for convenience.', 4.3, 1)
INSERT INTO dbo.Products(CategoryID, BrandID, ProductName, Price, ImageLink, [Description], Rate, [Status])
VALUES(4, 1, N'Nike Sportswear Essentials', 819000, N'https://static.nike.com/a/images/t_PDP_864_v1/f_auto,b_rgb:f5f5f5/be3adc6a-60cb-44ec-8540-cb7024f9c26a/sportswear-essentials-cross-body-bag-ZBDCWj.png', N'The Nike Sportswear Essentials Cross-Body Bag features 2 zip pockets to let you keep the small stuff organised and easy to grab. The accessory pocket zip pull offers quick access to smaller items, while an adjustable strap and buckle provide an easy-on-and-off fit. This product is made from at least 50% recycled polyester fibres.', 3.5, 1)
INSERT INTO dbo.Products(CategoryID, BrandID, ProductName, Price, ImageLink, [Description], Rate, [Status])
VALUES(4, 1, N'Nike Heritage', 639000, N'https://static.nike.com/a/images/t_PDP_864_v1/f_auto,b_rgb:f5f5f5/b468e82d-df6a-4ce7-bfc8-36785a520c9f/heritage-waistpack-Fnc8kw.png', N'A comfortable and easy-to-adjust strap makes taking the Nike Heritage Waistpack on everyday trips a no-brainer. The main compartment provides secure storage for your phone, snacks or wallet, while the smaller accessories pocket on the back helps keep things like your keys or travel info safe and close at hand. This product is made from at least 65% recycled polyester.', 4.2, 1)
INSERT INTO dbo.Products(CategoryID, BrandID, ProductName, Price, ImageLink, [Description], Rate, [Status])
VALUES(4, 1, N'Nike Sportswear Futura Luxe', 2000000, N'https://static.nike.com/a/images/t_PDP_864_v1/f_auto,b_rgb:f5f5f5/6c6c6267-d402-4b96-b4b3-c957b98b09d6/sportswear-futura-luxe-tote-JKBBdX.png', N'Designed to match your flash, the Nike Sportswear Futura Tote elevates a Nike favourite with polished metal accents, a satin lining and a removable clip-on accessories pouch. The large main compartment with zip closure secures your stuff, while additional pockets inside and out help keep you organised on the go. This product is made from at least 50% recycled polyester fibres.', 4.8, 1)
GO
CREATE TABLE Inventory(
	ProductID int NOT NULL,
	SizeNumber int NOT NULL,
	Quantity smallint,
	CONSTRAINT FK_Inventory_Products FOREIGN KEY(
		ProductID
	) REFERENCES dbo.Products(
		ProductID
	),
	CONSTRAINT FK_Inventory_Sizes FOREIGN KEY(
		SizeNumber
	)REFERENCES dbo.Sizes(
		SizeNumber
	),
	CONSTRAINT CHK_Quantity CHECK (Quantity >= 0)
)
GO
INSERT INTO dbo.Inventory(ProductID, SizeNumber, Quantity) VALUES (1, 35, 10)
INSERT INTO dbo.Inventory(ProductID, SizeNumber, Quantity) VALUES (1, 36, 11)
INSERT INTO dbo.Inventory(ProductID, SizeNumber, Quantity) VALUES (2, 37, 10)
INSERT INTO dbo.Inventory(ProductID, SizeNumber, Quantity) VALUES (3, 38, 5)
INSERT INTO dbo.Inventory(ProductID, SizeNumber, Quantity) VALUES (3, 39, 6)
INSERT INTO dbo.Inventory(ProductID, SizeNumber, Quantity) VALUES (4, 40, 0)
INSERT INTO dbo.Inventory(ProductID, SizeNumber, Quantity) VALUES (5, 41, 8)
INSERT INTO dbo.Inventory(ProductID, SizeNumber, Quantity) VALUES (5, 42, 9)
INSERT INTO dbo.Inventory(ProductID, SizeNumber, Quantity) VALUES (5, 43, 10)
INSERT INTO dbo.Inventory(ProductID, SizeNumber, Quantity) VALUES (6, 44, 0)
INSERT INTO dbo.Inventory(ProductID, SizeNumber, Quantity) VALUES (6, 45, 0)
INSERT INTO dbo.Inventory(ProductID, SizeNumber, Quantity) VALUES (7, 46, 3)
INSERT INTO dbo.Inventory(ProductID, SizeNumber, Quantity) VALUES (7, 47, 4)
INSERT INTO dbo.Inventory(ProductID, SizeNumber, Quantity) VALUES (8, 40, 5)
INSERT INTO dbo.Inventory(ProductID, SizeNumber, Quantity) VALUES (8, 38, 6)
INSERT INTO dbo.Inventory(ProductID, SizeNumber, Quantity) VALUES (9, 41, 7)
INSERT INTO dbo.Inventory(ProductID, SizeNumber, Quantity) VALUES (9, 38, 8)
INSERT INTO dbo.Inventory(ProductID, SizeNumber, Quantity) VALUES (10, 37, 9)
INSERT INTO dbo.Inventory(ProductID, SizeNumber, Quantity) VALUES (10, 43, 10)
INSERT INTO dbo.Inventory(ProductID, SizeNumber, Quantity) VALUES (11, 37, 11)
INSERT INTO dbo.Inventory(ProductID, SizeNumber, Quantity) VALUES (11, 39, 12)
INSERT INTO dbo.Inventory(ProductID, SizeNumber, Quantity) VALUES (12, 40, 0)
INSERT INTO dbo.Inventory(ProductID, SizeNumber, Quantity) VALUES (12, 41, 0)
INSERT INTO dbo.Inventory(ProductID, SizeNumber, Quantity) VALUES (13, 45, 0)
INSERT INTO dbo.Inventory(ProductID, SizeNumber, Quantity) VALUES (13, 39, 0)
INSERT INTO dbo.Inventory(ProductID, SizeNumber, Quantity) VALUES (14, 35, 3)
INSERT INTO dbo.Inventory(ProductID, SizeNumber, Quantity) VALUES (14, 37, 4)
INSERT INTO dbo.Inventory(ProductID, SizeNumber, Quantity) VALUES (15, 39, 5)
INSERT INTO dbo.Inventory(ProductID, SizeNumber, Quantity) VALUES (15, 40, 6)
INSERT INTO dbo.Inventory(ProductID, SizeNumber, Quantity) VALUES (16, 42, 7)
INSERT INTO dbo.Inventory(ProductID, SizeNumber, Quantity) VALUES (16, 41, 8)
GO
CREATE TABLE [Role](
	RoleID int identity(1,1) NOT NULL,
	RoleName nvarchar(60) NULL,
	CONSTRAINT PK_Role PRIMARY KEY CLUSTERED(
		RoleID
	)
)
GO
INSERT INTO dbo.[Role](RoleName) VALUES (N'admin')
INSERT INTO dbo.[Role](RoleName) VALUES (N'customer')
GO
CREATE TABLE Customer (
	[CustomerID] [int] IDENTITY(1,1) NOT NULL,
	[RoleID] [int] NOT NULL,
	[Account] [nvarchar](50) NOT NULL,
	[Password] [nvarchar](30) NOT NULL,
	[FullName] [nvarchar](30) NOT NULL,
	[Email] [nvarchar](100) NOT NULL,
	[Phone] [varchar](10) NOT NULL,
	[Address] [nvarchar](100) NOT NULL,
	[Status] [int] NULL,
    CONSTRAINT PK_Customer_Customer PRIMARY KEY CLUSTERED (
        CustomerID 
    ),
	CONSTRAINT FK_Customer_Role FOREIGN KEY(
		RoleID
	)REFERENCES dbo.[Role](
		RoleID
	)
)
GO
SET IDENTITY_INSERT [dbo].[Customer] ON
INSERT INTO dbo.Customer([CustomerID], [RoleID], [Account], [Password], [FullName], [Email], [Phone], [Address], [Status])
VALUES (1, 1, N'admin', N'admin', N'Cong',  N'congttse@gmail.com', N'0123456789', N'TP.HCM, Quan 9, Le Van Viet Street', 1)
INSERT INTO dbo.Customer([CustomerID], [RoleID], [Account], [Password], [FullName], [Email], [Phone], [Address], [Status])
VALUES (2, 1, N'admin1', N'admin1', N'Phai', N'phailvse@gmail.com', N'0123456788', N'TP.HCM, Quan 9, Le Van Viet Street', 1)
INSERT INTO dbo.Customer([CustomerID], [RoleID], [Account], [Password], [FullName], [Email], [Phone], [Address], [Status])
VALUES (3, 2, N'customer', N'customer', N'Linh', N'linhltqse@gmail.com', N'0123456787', N'TP.HCM, Quan 9, Vo Chi Cong Street', 1)
INSERT INTO dbo.Customer([CustomerID], [RoleID], [Account], [Password], [FullName], [Email], [Phone], [Address], [Status])
VALUES (4, 2, N'customer1', N'customer1', N'Khanh', N'khanhndbse@gmail.com', N'0123456786', N'TP.HCM, Quan 12, Mai Chi Tho Street', 1) 
INSERT INTO dbo.Customer([CustomerID], [RoleID], [Account], [Password], [FullName], [Email], [Phone], [Address], [Status])
VALUES (5, 2, N'customer299', N'customer2', N'Cong', N'congnqse@gmail.com', N'0123456785', N'TP.Thu Duc, Quan 9, Man Thien Street', 1)
GO
CREATE TABLE Review(
	ReviewID int identity(1,1) NOT NULL,
	ProductID int NOT NULL,
	CustomerID int NOT NULL,
	[Message] nvarchar(200),
	ReviewDate datetime,
	CONSTRAINT PK_Review PRIMARY KEY CLUSTERED(
		ReviewID 
	),
	CONSTRAINT FK_Review_Products FOREIGN KEY(
		ProductID
	)REFERENCES dbo.Products(
		ProductID
	),
	CONSTRAINT FK_Review_Customer FOREIGN KEY(
		CustomerID
	)REFERENCES dbo.Customer(
		CustomerID
	)
)
GO
INSERT INTO dbo.Review(ProductID, CustomerID, [Message], ReviewDate)
VALUES(1, 3, N'Great quality, super comfortable. The price is really great for all the nice features the shoe offers.', N'2022-02-02')
INSERT INTO dbo.Review(ProductID, CustomerID, [Message], ReviewDate)
VALUES(1, 4, N'Honestly beat my expectations, as comfy as the yeezy 350s imo', N'2022-02-04')
INSERT INTO dbo.Review(ProductID, CustomerID, [Message], ReviewDate)
VALUES(5, 3, N'Pretty good purchase. Really comfortable to wear for long hours.', N'2022-03-04')
INSERT INTO dbo.Review(ProductID, CustomerID, [Message], ReviewDate)
VALUES(8, 5, N'Great shoe. Usually wear a 12 but I could have went for an 11.5. Might try to return them for a better size', N'2022-05-06' )
INSERT INTO dbo.Review(ProductID, CustomerID, [Message], ReviewDate)
VALUES(10, 3, N'Very comfortable and they look good! I would size down a half size from usual Nike size', N'2022-06-05')
INSERT INTO dbo.Review(ProductID, CustomerID, [Message], ReviewDate)
VALUES(13, 4, N'Obsessed with these shoes, got them a couple days ago and have been wearing them ever since. The flower/butterfly patches are super cute', N'2022-01-03')
INSERT INTO dbo.Review(ProductID, CustomerID, [Message], ReviewDate)
VALUES(16, 5, N'Got these as a gift for my boyfriend and he loves them. Great for a general wear trainer and they are easy to clean and look after.', N'2022-04-13')
INSERT INTO dbo.Review(ProductID, CustomerID, [Message], ReviewDate)
VALUES(16, 3, N'So happy with these - They look great and super comfy even from the first wear', N'2022-02-15' )
GO

CREATE TABLE [Orders] (
    OrderID int identity(1,1) NOT NULL ,
	CustomerID int NOT NULL,
    ShipVia varchar(20)  NOT NULL ,
    OrderDate datetime  NOT NULL ,
    ShippedDate datetime NOT NULL,
    CONSTRAINT PK_Orders PRIMARY KEY CLUSTERED (
        OrderID 
    ),
	CONSTRAINT FK_Orders_Customer FOREIGN KEY 
	(
		CustomerID
	) REFERENCES dbo.Customer (
		CustomerID
	)
)
GO
INSERT INTO dbo.[Orders](CustomerID, ShipVia, OrderDate, ShippedDate) 
VALUES(3, N'Speedy Express', '2022-05-06', '2022-07-06')
INSERT INTO dbo.[Orders](CustomerID, ShipVia, OrderDate, ShippedDate) 
VALUES(4, N'United Package', '2022-03-06', '2022-10-06')
INSERT INTO dbo.[Orders](CustomerID, ShipVia, OrderDate, ShippedDate) 
VALUES(5, N'Federal Shipping', '2022-11-05', '2022-03-06')
INSERT INTO dbo.[Orders](CustomerID, ShipVia, OrderDate, ShippedDate) 
VALUES(5, N'Federal Shipping', '2022-02-22', '2022-05-05')
INSERT INTO dbo.[Orders](CustomerID, ShipVia, OrderDate, ShippedDate) 
VALUES(3, N'United Package', '2022-12-03', '2022-12-10')

GO

CREATE TABLE "Order Details" (
	"OrderID" int NOT NULL ,
	"ProductID" int NOT NULL ,
	"UnitPrice" "money" NOT NULL CONSTRAINT "DF_Order_Details_UnitPrice" DEFAULT (0),
	"Quantity" "smallint" NOT NULL CONSTRAINT "DF_Order_Details_Quantity" DEFAULT (1),
	CONSTRAINT "PK_Order_Details" PRIMARY KEY  CLUSTERED 
	(
		"OrderID",
		"ProductID"
	),
	CONSTRAINT "FK_Order_Details_Orders" FOREIGN KEY 
	(
		"OrderID"
	) REFERENCES "dbo"."Orders" (
		"OrderID"
	),
	CONSTRAINT "FK_Order_Details_Products" FOREIGN KEY 
	(
		"ProductID"
	) REFERENCES "dbo"."Products" (
		"ProductID"
	),
	CONSTRAINT "CK_Quantity" CHECK (Quantity > 0),
	CONSTRAINT "CK_UnitPrice" CHECK (UnitPrice >= 0)
)
GO
INSERT INTO dbo.[Order Details](OrderID, ProductID, UnitPrice, Quantity)
VALUES(1, 1, 500000, 2)
INSERT INTO dbo.[Order Details](OrderID, ProductID, UnitPrice, Quantity)
VALUES(1, 5, 400000, 1)
INSERT INTO dbo.[Order Details](OrderID, ProductID, UnitPrice, Quantity)
VALUES(1, 15, 700000, 2)
INSERT INTO dbo.[Order Details](OrderID, ProductID, UnitPrice, Quantity)
VALUES(2, 4, 800000, 1)
INSERT INTO dbo.[Order Details](OrderID, ProductID, UnitPrice, Quantity)
VALUES(2, 14, 400000, 3)
INSERT INTO dbo.[Order Details](OrderID, ProductID, UnitPrice, Quantity)
VALUES(3, 8, 900000, 1)
INSERT INTO dbo.[Order Details](OrderID, ProductID, UnitPrice, Quantity)
VALUES(4, 10, 400000, 1)
INSERT INTO dbo.[Order Details](OrderID, ProductID, UnitPrice, Quantity)
VALUES(4, 12, 650000, 1)
INSERT INTO dbo.[Order Details](OrderID, ProductID, UnitPrice, Quantity)
VALUES(5, 16, 800000, 1)
INSERT INTO dbo.[Order Details](OrderID, ProductID, UnitPrice, Quantity)
VALUES(5, 5, 400000, 1)
GO
CREATE TABLE PaymentType(
	TypeID int identity(1,1) NOT NULL,
	TypeName nvarchar(30) NOT NULL,
	CONSTRAINT PK_Payment_Type PRIMARY KEY CLUSTERED(
		TypeID 
	)
)
GO
INSERT INTO dbo.PaymentType(TypeName) VALUES (N'Momo')
INSERT INTO dbo.PaymentType(TypeName) VALUES (N'Viettelpay')
INSERT INTO dbo.PaymentType(TypeName) VALUES (N'Credit card')
INSERT INTO dbo.PaymentType(TypeName) VALUES (N'Visa')
GO
CREATE TABLE Payment(
	PaymentID int identity(1,1) NOT NULL,
	CustomerID int NOT NULL,
	TypeID int NOT NULL,
	OrderID int NOT NULL,
	Amount float NOT NULL,
	CONSTRAINT PK_Payment PRIMARY KEY CLUSTERED (
		PaymentID 
	),
	CONSTRAINT FK_Payment_Customer FOREIGN KEY(
		CustomerID
	)REFERENCES dbo.Customer(
		CustomerID
	),
	CONSTRAINT FK_Payment_Type FOREIGN KEY(
		TypeID
	)REFERENCES dbo.PaymentType(
		TypeID
	),
	CONSTRAINT FK_Payment_Orders FOREIGN KEY(
		OrderID
	)REFERENCES dbo.[Orders] (
		OrderID
	)
)
GO
INSERT INTO dbo.Payment(CustomerID, TypeID, OrderID, Amount) VALUES(3, 1, 1, 5000000)
INSERT INTO dbo.Payment(CustomerID, TypeID, OrderID, Amount) VALUES(4, 3, 2, 3000000)
INSERT INTO dbo.Payment(CustomerID, TypeID, OrderID, Amount) VALUES(5, 1, 3, 1500000)
INSERT INTO dbo.Payment(CustomerID, TypeID, OrderID, Amount) VALUES(5, 1, 4, 2000000)
INSERT INTO dbo.Payment(CustomerID, TypeID, OrderID, Amount) VALUES(3, 4, 5, 1000000)
GO



