CREATE DATABASE TSG

GO
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
INSERT INTO dbo.Sizes(SizeNumber, [Length], Width) VALUES (0, N'0', N'0')
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
VALUES(1, 2, N'Adidas Fluidflow 2.0', 500000, N'https://sneakerholicvietnam.vn/wp-content/uploads/2022/07/adidas-fluidflow-2-0-all-black-fz1985.jpg', N'The Ultraboost running shoes serve up comfort and responsiveness at every pace and distance. The adidas PRIMEKNIT upper includes foam around the heel to prevent blisters. Y A Continental™ Rubber outsole grips in wet and dry conditions so you can stride confidently.', 4, 1)
INSERT INTO dbo.Products(CategoryID, BrandID, ProductName, Price, ImageLink, [Description], Rate, [Status])
VALUES(1, 2, N'Adidas Alphabounce+ 3.0 – Cloud White"', 700000, N'https://sneakerholicvietnam.vn/wp-content/uploads/2022/06/adidas-alphabounce-3-0-cloud-white-ef8061.jpg', N'It does not really matter whether or not a run is in the cards for the day. An ultra-breathable feel and cushy midsole that energises give these adidas shoes an edge. Hit the pavement or hit the town. You have got the kicks for whatever unfolds.', 3, 1)
INSERT INTO dbo.Products(CategoryID, BrandID, ProductName, Price, ImageLink, [Description], Rate, [Status])
VALUES(1, 2, N'Adidas Alphabounce+ 3.0 – Triple Black"', 650000, N'https://sneakerholicvietnam.vn/wp-content/uploads/2022/06/adidas-alphabounce-3-0-triple-black-eg1391.jpg', N'Comfort that is rooted in running meets effortless style in these adidas Ultraboost Web DNA Shoes. A lattice design on the midsole and outsole reveals the energy-returning Boost cushioning underneath. The adidas Primeknit upper is stretchy and supportive.', 3.5, 1)
INSERT INTO dbo.Products(CategoryID, BrandID, ProductName, Price, ImageLink, [Description], Rate, [Status])
VALUES(1, 2, N'Adidas Stan Smith Vintage – Fruits & Rainbow Patches"',800000, N'https://sneakerholicvietnam.vn/wp-content/uploads/2022/06/adidas-stan-smith-vintage-fruits-rainbow-patches-gw8156.jpg', N'Move through your day feeling comfortable and ready for anything with these adidas running shoes. A mesh upper is breathable, keeping your feet fresh even on warm days. Energised cushioning puts a spring in every step you take.', 5, 1)
INSERT INTO dbo.Products(CategoryID, BrandID, ProductName, Price, ImageLink, [Description], Rate, [Status])
VALUES(1, 2, N'Adidas Alphaboost – Core Black', 400000, N'https://sneakerholicvietnam.vn/wp-content/uploads/2022/06/adidas-alphaboost-core-black-ef1183.jpg', N'You like to be one step ahead. Blending retro vibes with modern design, these adidas Retropy F2 Shoes are right there with you. Rooted in 80s running style, they show off a layered material-mix upper. The sleek shape and thick EVA midsole make them ideal for today.', 4, 1)
INSERT INTO dbo.Products(CategoryID, BrandID, ProductName, Price, ImageLink, [Description], Rate, [Status])
VALUES(1, 2, N'Adidas Stan Smith Vintage – Collegiate Green', 600000, N'https://sneakerholicvietnam.vn/wp-content/uploads/2021/12/adidas-stan-smith-vintage-collegiate-green-fx5522.jpg', N'Every day is a good day for a run when you lace up in these adidas shoes. A padded collar gives you a snug and secure fit, while lightweight cushioning underfoot delivers enhanced flexibility for a comfortable step from heel-strike to toe-off.', 4.5, 1)
INSERT INTO dbo.Products(CategoryID, BrandID, ProductName, Price, ImageLink, [Description], Rate, [Status])
VALUES(1, 2, N'Adidas Forum Plus – Clear Mint', 600000, N'https://sneakerholicvietnam.vn/wp-content/uploads/2021/11/adidas-forum-plus-clean-mint-fy4529-4.jpg', N'Lace up in comfort with these adidas running shoes. Breathable mesh keeps your feet feeling cool and fresh as you move through your day. A lightweight midsole cushions every step from the first of the day to the last.', 4, 1)
INSERT INTO dbo.Products(CategoryID, BrandID, ProductName, Price, ImageLink, [Description], Rate, [Status])
VALUES(1, 2, N'Adidas Superstar – Silver Metallic', 900000, N'https://sneakerholicvietnam.vn/wp-content/uploads/2022/04/adidas-superstar-silver-metallic-gz4274.jpg', N'Make the most out of your runs. No matter how far you go, these adidas shoes cushion every take-off and landing to make each step feel like a good one. Another block. Another lap. Another mile. Get after it.', 4.3, 1)
INSERT INTO dbo.Products(CategoryID, BrandID, ProductName, Price, ImageLink, [Description], Rate, [Status])
VALUES(1, 1, N'Nike Air Force 1 Low – Lucky Charms"', 700000, N'https://sneakerholicvietnam.vn/wp-content/uploads/2021/11/nike-air-force-1-low-lucky-charms-dd1525-100-6.jpg', N'Leather, suede and woven material in rave colours and metallics bring a whole new life to this staple of sport, with a special edition font to add a little extra personality.', 4, 1)
INSERT INTO dbo.Products(CategoryID, BrandID, ProductName, Price, ImageLink, [Description], Rate, [Status])
VALUES(1, 1, N'Nike Air Force 1 Low x Serena Williams – All White', 400000, N'https://sneakerholicvietnam.vn/wp-content/uploads/2022/04/nike-air-force-1-low-x-serena-williams-all-white-dm5036-100.jpg', N'Get your kicks, inspired by Route 66. The Nike Air Max 90 G stays true to the original icon, with a Max Air unit in the heel, and adds integrated traction for exceptional grip. A Swoosh logo paired with a Route 66 logo on the tongue pays tribute to 1 of America is original highways. The outsole is made with at least 13% Nike Grind material.', 4, 1)
INSERT INTO dbo.Products(CategoryID, BrandID, ProductName, Price, ImageLink, [Description], Rate, [Status])
VALUES(1, 1, N'Nike Court Legacy Mule – Sail Light Madder Root',  500000, N'https://sneakerholicvietnam.vn/wp-content/uploads/2022/05/nike-court-legacy-mule-sail-light-madder-root-dv1741-181.jpg', N'The double-stacked Zoom Air works in sync with an outer jumper frame made from lightweight, resilient, and sturdy PEBAX®. The woven exoskeleton-like upper helps you feel fully connected', 4.5, 1)
INSERT INTO dbo.Products(CategoryID, BrandID, ProductName, Price, ImageLink, [Description], Rate, [Status])
VALUES(1, 1, N'Nike Air Force 1 PLT.AF.ORM – Metallic Silver', 650000 ,N'https://sneakerholicvietnam.vn/wp-content/uploads/2019/12/nike-air-force-1-plt-af-orm-metallic-silver-dj9946-101.jpg', N'The Nike ZoomX Invincible Run Flyknit 2 keeps you going with the same super-soft feel that lets you feel your potential when your foot hits the pavement. We have crafted shoes with our highest level of spring responsiveness and support to keep you feeling secure and competitive.', 4.3, 1)
INSERT INTO dbo.Products(CategoryID, BrandID, ProductName, Price, ImageLink, [Description], Rate, [Status])
VALUES(1, 1, N'Nike Air Force 1 Shadow – Fossil', 600000, N'https://sneakerholicvietnam.vn/wp-content/uploads/2022/07/nike-air-force-1-shadow-fossil-ci0919-116.jpg', N'In sneaker history, few styles last. Only one transcends every era—the Nike Air Force 1 07 LV8. Celebrate perfection with the b-ball original that delivers what you know best: bold details and some extra flash to keep you shining.', 5, 1)
INSERT INTO dbo.Products(CategoryID, BrandID, ProductName, Price, ImageLink, [Description], Rate, [Status])
VALUES(1, 1, N'Nike Court Borough Low 2 – Wolf Grey', 400000, N'https://sneakerholicvietnam.vn/wp-content/uploads/2022/07/nike-court-borough-low-2-wolf-grey-839985-104.jpg', N'Harnessing the classic look you love, it now features an elastic heel with velvet-like texture and large drawstrings for easy on and off. Oversized details like logos and laces add interest while plush foam tongues and thicker stitching celebrate the iconic look that has been hailed on the streets since 777.', 4, 1)
INSERT INTO dbo.Products(CategoryID, BrandID, ProductName, Price, ImageLink, [Description], Rate, [Status])
VALUES(1, 1, N'Nike Dunk Low – Barber Shop Grey', 700000, N'https://sneakerholicvietnam.vn/wp-content/uploads/2022/07/nike-dunk-low-barber-shop-grey-dh7614-500.jpg', N'Faded side panels and classic red, white and blue piping celebrates trusted barbers to help you look good. The padded, low-cut collar lets you take your signature style anywhere — in comfort.', 4.4, 1)
INSERT INTO dbo.Products(CategoryID, BrandID, ProductName, Price, ImageLink, [Description], Rate, [Status])
VALUES(1, 1, N'Nike Air Max 90 – Infrared (2020)', 800000, N'https://sneakerholicvietnam.vn/wp-content/uploads/2022/07/nike-air-max-90-infrared-2020-ct1685-100.jpg', N'The radiance lives on with the b-ball original. Crossing hardwood comfort with off-court flair, it puts a fresh spin on what you know best: era-echoing, 80s construction, bold details and nothin-but-net style.', 4.8, 1)
INSERT INTO dbo.Products(CategoryID, BrandID, ProductName, Price, ImageLink, [Description], Rate, [Status])
VALUES(2, 2, N'Adidas Mid-Ankle Socks – Multicolor', 350000, N'https://sneakerholicvietnam.vn/wp-content/uploads/2022/03/tat-vo-adidas-mid-ankle-socks-multicolor-h32446.jpg', N'Designed for everyday comfort whether you are lounging at home or working out at the gym, this trio of low-cut socks have a slim, lightweight feel. Cotton blend design with built-in arch support for a snug fit. They are accented with the adidas logo just below the ribbed cuffs.', 4.5, 1)
INSERT INTO dbo.Products(CategoryID, BrandID, ProductName, Price, ImageLink, [Description], Rate, [Status])
VALUES(2, 2, N'Adidas Crew Socks – Black', 150000, N'https://sneakerholicvietnam.vn/wp-content/uploads/2021/12/tat-vo-adidas-crew-socks-black-s21490.jpg', N'Heel-to-toe cushioning makes these ankle-length socks super comfortable. Knit-in arch support and a smooth toe seam give them snug fit and feel. The cotton-rich design is finished with sporty adidas branding.', 4, 1)
INSERT INTO dbo.Products(CategoryID, BrandID, ProductName, Price, ImageLink, [Description], Rate, [Status])
VALUES(2, 2, N'Adidas Low Cut Socks – Black', 400000, N'https://sneakerholicvietnam.vn/wp-content/uploads/2021/12/tat-vo-adidas-low-cut-socks-black-dw4132.jpg', N'Anything that is annoying at the start is unbearable by the finish line. Find distraction-free comfort for every step of your run in the thin, snug and stretchy build of these adidas socks. HEAT.RDY maximises airflow, and a flat-toe seam means no friction.', 4.3, 1)
INSERT INTO dbo.Products(CategoryID, BrandID, ProductName, Price, ImageLink, [Description], Rate, [Status])
VALUES(2, 2, N'Adidas No Show Sock 3P – White', 420000, N'https://sneakerholicvietnam.vn/wp-content/uploads/2021/12/tat-vo-adidas-no-show-sock-3p-white-cv5941.jpg', N'Creating a classic football kit is not just about getting the jersey right. Borrowed from the club is mid-90s look, the lightning bolt graphic on these adidas Arsenal socks makes a real impression. Moisture-absorbing AEROREADY and a comfortable FORMOTION fit ensure they feel as good as they look.', 4, 1)
INSERT INTO dbo.Products(CategoryID, BrandID, ProductName, Price, ImageLink, [Description], Rate, [Status])
VALUES(2, 1, N'Nike Everyday Training Ankle Socks – Pink Oxford', 359000, N'https://sneakerholicvietnam.vn/wp-content/uploads/2022/06/tat-vo-nike-everyday-training-ankle-socks-pink-oxford-dh5485-601.jpg', N'Power through your workout with the Nike Everyday Lightweight Socks. Soft yarns with sweat-wicking technology help keep your feet comfortable and dry.', 4, 1)
INSERT INTO dbo.Products(CategoryID, BrandID, ProductName, Price, ImageLink, [Description], Rate, [Status])
VALUES(2, 1, N'Nike Everyday Training Ankle Socks – Amethyst', 309000, N'https://sneakerholicvietnam.vn/wp-content/uploads/2022/06/tat-vo-nike-everyday-training-ankle-socks-amethyst-dh5485-565.jpg', N'The Nike Academy Socks are designed to keep you comfortable during play with soft, sweat-wicking fabric with arch support.', 4.3, 1)
INSERT INTO dbo.Products(CategoryID, BrandID, ProductName, Price, ImageLink, [Description], Rate, [Status])
VALUES(2, 1, N'Nike Cushioned Crew Socks', 359000, N'https://sneakerholicvietnam.vn/wp-content/uploads/2022/06/tat-vo-nike-cushioned-crew-socks-da2401-903.jpg', N'Power through your workout with the Nike Everyday Cushioned Socks. The thick terry sole gives you extra comfort for foot drills and lifts, while a ribbed arch band wraps your midfoot for a supportive feel.', 4.5, 1)
INSERT INTO dbo.Products(CategoryID, BrandID, ProductName, Price, ImageLink, [Description], Rate, [Status])
VALUES(2, 1, N'Nike Everyday Essential Ankle Socks – University Red', 509000, N'https://sneakerholicvietnam.vn/wp-content/uploads/2022/04/tat-vo-nike-everyday-essential-ankle-socks-university-red-dx5080-010.jpg', N'Oh-so-fly and comfy, the Nike Everyday Essential Crew Socks have a clean, classic look. Contrast stripes and an Air logo add a pop of colour you can pair with your shoes. This product is made from at least 75% recycled polyester fibres.', 4.4, 1)
INSERT INTO dbo.Products(CategoryID, BrandID, ProductName, Price, ImageLink, [Description], Rate, [Status])
VALUES(3, 2, N'Adidas Trefoil Logo Cap – Green', 500000, N'https://sneakerholicvietnam.vn/wp-content/uploads/2021/12/mu-adidas-trefoil-logo-cap-green-dj0883.jpg', N'When the sun is blazing, you have got to dress accordingly. Top off your warm-weather workout ensemble with the adidas Superlite Hat. The comfortable, six-panel construction has perforated side panels to help keep you cool. A non-glare undervisor makes running on bright concrete easy on the eyes.', 4.8, 1)
INSERT INTO dbo.Products(CategoryID, BrandID, ProductName, Price, ImageLink, [Description], Rate, [Status])
VALUES(3, 2, N'Adidas Trefoil Snap Back Cap – Red', 600000, N'https://sneakerholicvietnam.vn/wp-content/uploads/2021/12/mu-adidas-trefoil-snap-back-cap-red-dh4281.jpg', N'Top off your look with laid-back style. This adidas bucket hat keeps things chill under the sun with its moisture-wicking sweatband and mesh ventilation. Built-in UV 50 factor adds extra coverage, and an adjustable chin strap lets you customize the fit.', 4, 1)
INSERT INTO dbo.Products(CategoryID, BrandID, ProductName, Price, ImageLink, [Description], Rate, [Status])
VALUES(3, 2, N'Adidas Adicolor Bucket Hat – Blue', 400000, N'https://sneakerholicvietnam.vn/wp-content/uploads/2021/12/mu-adidas-adicolor-bucket-hat-blue-fm1336.jpg', N'Keep it comfortable. Keep it classic. A trusty cap never goes out of style. Head to the game or hang with friends, no matter what is on your schedule, this hat keeps you covered with a comfy cotton build and a moisture-wicking sweatband. An embroidered adidas Badge of Sport on the front keeps your look legit.', 3.8, 1)
INSERT INTO dbo.Products(CategoryID, BrandID, ProductName, Price, ImageLink, [Description], Rate, [Status])
VALUES(3, 2, N'Adidas Clover Old Hat – Burgundy', 700000, N'https://sneakerholicvietnam.vn/wp-content/uploads/2021/12/mu-adidas-clover-old-hat-burgundy-dv2485.jpg', N'No beach outfit is complete without the perfect hat. Even if you are stuck in the city, tap into vacation vibes with this adidas boonie hat. A close cousin to the ever-iconic and stylish bucket hat, it has a side pocket to stash some small essentials. Attach it to your bag with the lobster clip for easy on-the-go carrying.', 4.3, 1)
INSERT INTO dbo.Products(CategoryID, BrandID, ProductName, Price, ImageLink, [Description], Rate, [Status])
VALUES(3, 1, N'Bucket Nike Sportswear – Black', 869000, N'https://sneakerholicvietnam.vn/wp-content/uploads/2022/06/mu-non-bucket-nike-sportswear-black-dc3967-010.jpg', N'Incredibly stretchy and very breathable, the Nike Dri-FIT ADV Classic99 Hat is built to keep you cool and comfortable so you can play at your best, round after round.', 4.1, 1)
INSERT INTO dbo.Products(CategoryID, BrandID, ProductName, Price, ImageLink, [Description], Rate, [Status])
VALUES(3, 1, N'Bucket Nike Sportswear – Pink Foam', 659000, N'https://sneakerholicvietnam.vn/wp-content/uploads/2022/06/mu-non-bucket-nike-sportswear-pink-foam-ck5324-663-1.jpg', N'A washed fabric on the crown of the Nike Sportswear Bucket Hat gives it a soft, well-worn feel.Its unstructured crown and brim offer a laidback look and added coverage from the elements.', 4.6, 1)
INSERT INTO dbo.Products(CategoryID, BrandID, ProductName, Price, ImageLink, [Description], Rate, [Status])
VALUES(3, 1, N'Bucket Nike ACG – Black', 659000, N'https://sneakerholicvietnam.vn/wp-content/uploads/2022/06/mu-non-bucket-nike-acg-black-dm4931-010.jpg', N'Show them your hops in the Jordan Pro Jumpman Snapback Hat.It has a flat bill and high structured crown made from tightly woven twill.The iconic logo is thickly embroidered on the front, a bold projection of the Brand is heritage.This product is made from at least 50% recycled polyester fibres.', 4.7, 1)
INSERT INTO dbo.Products(CategoryID, BrandID, ProductName, Price, ImageLink, [Description], Rate, [Status])
VALUES(3, 1, N'Nike Japan Heritage86 Basketball – Black', 559000, N'https://sneakerholicvietnam.vn/wp-content/uploads/2021/10/mu-nike-heritage86-basketball-black-da3204-010.jpg', N'The Nike Sportswear Heritage86 Hat has a durable 6-panel design with an adjustable strap for the perfect fit. The iconic "JUST DO IT." adds a classic look you can wear anywhere.', 4, 1)
INSERT INTO dbo.Products(CategoryID, BrandID, ProductName, Price, ImageLink, [Description], Rate, [Status])
VALUES(4, 2, N'Adidas Waist Bag by Ji Won Choi', 750000, N'https://sneakerholicvietnam.vn/wp-content/uploads/2021/12/tui-adidas-waist-bag-by-ji-won-choi-ej8773.jpg', N'It is taken many forms over the years, but that cannon badge is an iron-clad symbol of your support. Decked in Arsenal is home colours, this adidas backpack makes no secret of your football loyalties. Inside, an array of pockets creates room for all your stuff. Mesh on the back ensures comfortable carrying on hot days.', 3.5, 1)
INSERT INTO dbo.Products(CategoryID, BrandID, ProductName, Price, ImageLink, [Description], Rate, [Status])
VALUES(4, 2, N'Adidas Essential Crossbody Bag – Blue', 1000000, N'https://sneakerholicvietnam.vn/wp-content/uploads/2021/12/tui-adidas-essential-crossbody-bag-blue-fl9660.jpg', N'Every day is an adventure, and with this adidas backpack you are prepared. Inspired by outdoor gear, it has a top zip pocket so you can quickly access your keys, wallet or mobile. An external compartment keeps your laptop securely stowed but easy to reach.', 4.1, 1)
INSERT INTO dbo.Products(CategoryID, BrandID, ProductName, Price, ImageLink, [Description], Rate, [Status])
VALUES(4, 2, N'Adidas Essential Crossbody Bag – White', 950000, N'https://sneakerholicvietnam.vn/wp-content/uploads/2021/12/tui-adidas-essential-crossbody-bag-white-fl9659.jpg', N'Suit up for work, a workout — or both — and let your brand pride take centre stage. This adidas backpack stores books, training gear and your lunch in the roomy main compartment. Essentials go in the zip pocket out front. Keep your tech safely tucked away in the inner laptop compartment.', 4.7, 1)
INSERT INTO dbo.Products(CategoryID, BrandID, ProductName, Price, ImageLink, [Description], Rate, [Status])
VALUES(4, 2, N'Adidas Mini Airliner Bag – Black', 800000, N'https://sneakerholicvietnam.vn/wp-content/uploads/2022/01/tui-adidas-mini-airliner-bag-black-fl9638.jpg', N'Even before you make it to the gym, your commitment to sport is clear. The adidas Badge of Sport logo on this backpack says it all. Toss your clothes, towel, shoes and water bottle into the roomy design, sling it on your shoulders and go.', 4, 1)
INSERT INTO dbo.Products(CategoryID, BrandID, ProductName, Price, ImageLink, [Description], Rate, [Status])
VALUES(4, 1, N'Nike Sportswear Futura 365 Cross-Body – Pink', 609000, N'https://sneakerholicvietnam.vn/wp-content/uploads/2022/04/tui-nike-sportswear-futura-365-cross-body-pink-cw9300-824.jpg', N'The Nike Utility Shoe Tote helps keep your shoes separate from the rest of your gear between home, work and the gym. The ventilated design is made from tough fabric and includes an outside pocket and handles for convenience.', 4.3, 1)
INSERT INTO dbo.Products(CategoryID, BrandID, ProductName, Price, ImageLink, [Description], Rate, [Status])
VALUES(4, 1, N'Nike Sportswear Futura 365 Cross-Body – Black', 819000, N'https://sneakerholicvietnam.vn/wp-content/uploads/2022/03/tui-nike-sportswear-futura-365-cross-body-black-cw9300-010.jpg', N'The Nike Sportswear Essentials Cross-Body Bag features 2 zip pockets to let you keep the small stuff organised and easy to grab. The accessory pocket zip pull offers quick access to smaller items, while an adjustable strap and buckle provide an easy-on-and-off fit. This product is made from at least 50% recycled polyester fibres.', 3.5, 1)
INSERT INTO dbo.Products(CategoryID, BrandID, ProductName, Price, ImageLink, [Description], Rate, [Status])
VALUES(4, 1, N'Nike Shoe Box – White Orange', 639000, N'https://sneakerholicvietnam.vn/wp-content/uploads/2022/03/tui-dung-giay-nike-shoe-box-white-orange-da7337-869.jpg', N'A comfortable and easy-to-adjust strap makes taking the Nike Heritage Waistpack on everyday trips a no-brainer. The main compartment provides secure storage for your phone, snacks or wallet, while the smaller accessories pocket on the back helps keep things like your keys or travel info safe and close at hand. This product is made from at least 65% recycled polyester.', 4.2, 1)
INSERT INTO dbo.Products(CategoryID, BrandID, ProductName, Price, ImageLink, [Description], Rate, [Status])
VALUES(4, 1, N'Nike Stash Shoe Bag – Black', 2000000, N'https://sneakerholicvietnam.vn/wp-content/uploads/2022/04/tui-nike-stash-shoe-bag-black-db0192-010.jpg', N'Designed to match your flash, the Nike Sportswear Futura Tote elevates a Nike favourite with polished metal accents, a satin lining and a removable clip-on accessories pouch. The large main compartment with zip closure secures your stuff, while additional pockets inside and out help keep you organised on the go. This product is made from at least 50% recycled polyester fibres.', 4.8, 1)
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
INSERT INTO dbo.Inventory(ProductID, SizeNumber, Quantity) VALUES (17, 0, 15)
INSERT INTO dbo.Inventory(ProductID, SizeNumber, Quantity) VALUES (18, 0, 15)
INSERT INTO dbo.Inventory(ProductID, SizeNumber, Quantity) VALUES (19, 0, 15)
INSERT INTO dbo.Inventory(ProductID, SizeNumber, Quantity) VALUES (20, 0, 15)
INSERT INTO dbo.Inventory(ProductID, SizeNumber, Quantity) VALUES (21, 0, 15)
INSERT INTO dbo.Inventory(ProductID, SizeNumber, Quantity) VALUES (22, 0, 12)
INSERT INTO dbo.Inventory(ProductID, SizeNumber, Quantity) VALUES (23, 0, 19)
INSERT INTO dbo.Inventory(ProductID, SizeNumber, Quantity) VALUES (24, 0, 15)
INSERT INTO dbo.Inventory(ProductID, SizeNumber, Quantity) VALUES (25, 0, 2)
INSERT INTO dbo.Inventory(ProductID, SizeNumber, Quantity) VALUES (26, 0, 15)
INSERT INTO dbo.Inventory(ProductID, SizeNumber, Quantity) VALUES (27, 0, 15)
INSERT INTO dbo.Inventory(ProductID, SizeNumber, Quantity) VALUES (28, 0, 15)
INSERT INTO dbo.Inventory(ProductID, SizeNumber, Quantity) VALUES (29, 0, 14)
INSERT INTO dbo.Inventory(ProductID, SizeNumber, Quantity) VALUES (30, 0, 15)
INSERT INTO dbo.Inventory(ProductID, SizeNumber, Quantity) VALUES (31, 0, 15)
INSERT INTO dbo.Inventory(ProductID, SizeNumber, Quantity) VALUES (32, 0, 15)
INSERT INTO dbo.Inventory(ProductID, SizeNumber, Quantity) VALUES (33, 0, 15)
INSERT INTO dbo.Inventory(ProductID, SizeNumber, Quantity) VALUES (34, 0, 15)
INSERT INTO dbo.Inventory(ProductID, SizeNumber, Quantity) VALUES (35, 0, 15)
INSERT INTO dbo.Inventory(ProductID, SizeNumber, Quantity) VALUES (36, 0, 15)
INSERT INTO dbo.Inventory(ProductID, SizeNumber, Quantity) VALUES (37, 0, 15)
INSERT INTO dbo.Inventory(ProductID, SizeNumber, Quantity) VALUES (38, 0, 15)
INSERT INTO dbo.Inventory(ProductID, SizeNumber, Quantity) VALUES (39, 0, 15)
INSERT INTO dbo.Inventory(ProductID, SizeNumber, Quantity) VALUES (40, 0, 15)
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
	[token] [nvarchar](30) NULL,
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
VALUES (1, 1, N'admin', N'admin', N'Cong',  N'congttse@gmail.com', N'0123456789', N'Le Van Viet, TP.Thu Duc, TP.HCM', 1)
INSERT INTO dbo.Customer([CustomerID], [RoleID], [Account], [Password], [FullName], [Email], [Phone], [Address], [Status])
VALUES (2, 1, N'admin1', N'admin1', N'Phai', N'phailvse@gmail.com', N'0123456788', N'Le Van Viet, TP.Thu Duc, TP.HCM', 1)
INSERT INTO dbo.Customer([CustomerID], [RoleID], [Account], [Password], [FullName], [Email], [Phone], [Address], [Status])
VALUES (3, 2, N'customer', N'customer', N'Linh', N'linhltqse@gmail.com', N'0123456787', N'Nguyen Xien, TP.Thu Duc, TP.HCM', 1)
INSERT INTO dbo.Customer([CustomerID], [RoleID], [Account], [Password], [FullName], [Email], [Phone], [Address], [Status])
VALUES (4, 2, N'customer1', N'customer1', N'Khanh', N'khanhndbse@gmail.com', N'0123456786', N'Mai Chi Tho, Quan 12, TP.HCM', 1) 
INSERT INTO dbo.Customer([CustomerID], [RoleID], [Account], [Password], [FullName], [Email], [Phone], [Address], [Status])
VALUES (5, 2, N'customer299', N'customer2', N'Cong', N'congnqse@gmail.com', N'0123456785', N'Man Thien,  TP.Thu Duc, TP.HCM', 1)
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
    OrderID int identity(1,1) NOT NULL,
	CustomerID int,
	FullName nvarchar(30) NOT NULL,
	Phone varchar(10) NOT NULL,
	ShipAddress nvarchar(100) NOT NULL,
	Email nvarchar(100) NOT NULL,
    OrderDate datetime  NOT NULL ,
    ShippedDate datetime,
	[Status] int not null
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
INSERT INTO dbo.[Orders](CustomerID, FullName, Phone, ShipAddress, Email, OrderDate, ShippedDate, [Status]) 
VALUES(3, 'Quang Linh', '0123456787', 'Nguyen Xien, TP.Thu Duc, TP.HCM', 'linhltqse@gmail.com', '2022-05-06', '2022-07-06', 1)
INSERT INTO dbo.[Orders](CustomerID, FullName, Phone, ShipAddress, Email, OrderDate, ShippedDate, [Status]) 
VALUES(4, 'Khanh', '0123456786', 'Mai Chi Tho, Quan 12, TP.HCM', 'khanhndbse@gmail.com', '2022-03-06', '2022-10-06', 1)
INSERT INTO dbo.[Orders](CustomerID, FullName, Phone, ShipAddress, Email, OrderDate, ShippedDate, [Status]) 
VALUES(5, 'Quoc Cong', '0123456785', 'Man Thien, TP.Thu Duc, TP.HCM', 'congnqse@gmail.com', '2022-11-05', '2022-03-06', 1)
INSERT INTO dbo.[Orders](FullName, Phone, ShipAddress, Email, OrderDate, ShippedDate, [Status]) 
VALUES('Lisa Manobal', '0123999999', 'Bui Vien, P.Pham Ngu Lao, Quan 1, TP.HCM', 'lalisa@gmail.com', '2022-12-03', '2022-12-10', 1)
INSERT INTO dbo.[Orders](FullName, Phone, ShipAddress, Email, OrderDate, [Status]) 
VALUES('Lam Van Phai', '0123456788', 'Tran Hung Dao B, P.6, Quan 5, TP.HCM','phailvse@gmail.com', '2022-02-22', 0)

GO

CREATE TABLE "OrderDetails" (
	"OrderID" int NOT NULL ,
	"ProductID" int NOT NULL ,
	"SizeNumber" int,
	"Quantity" "smallint" NOT NULL CONSTRAINT "DF_OrderDetails_Quantity" DEFAULT (1),
	"UnitPrice" "money" NOT NULL CONSTRAINT "DF_OrderDetails_UnitPrice" DEFAULT (0),
	CONSTRAINT "PK_OrderDetails" PRIMARY KEY  CLUSTERED 
	(
		"OrderID",
		"ProductID"
	),
	CONSTRAINT "FK_OrderDetails_Inventory" FOREIGN KEY 
	(
		"SizeNumber"
	) REFERENCES "dbo"."Sizes" (
		"SizeNumber"
	),
	CONSTRAINT "FK_OrderDetails_Orders" FOREIGN KEY 
	(
		"OrderID"
	) REFERENCES "dbo"."Orders" (
		"OrderID"
	),
	CONSTRAINT "FK_OrderDetails_Products" FOREIGN KEY 
	(
		"ProductID"
	) REFERENCES "dbo"."Products" (
		"ProductID"
	),
	CONSTRAINT "CK_Quantity" CHECK (Quantity > 0),
	CONSTRAINT "CK_UnitPrice" CHECK (UnitPrice >= 0)
)
GO
INSERT INTO dbo.[OrderDetails](OrderID, ProductID, SizeNumber, Quantity, UnitPrice)
VALUES(1, 1, 35, 2, 500000)
INSERT INTO dbo.[OrderDetails](OrderID, ProductID, SizeNumber, Quantity, UnitPrice)
VALUES(1, 5, 41, 1, 400000)
INSERT INTO dbo.[OrderDetails](OrderID, ProductID, SizeNumber, Quantity, UnitPrice)
VALUES(1, 15, 39, 2, 700000)
INSERT INTO dbo.[OrderDetails](OrderID, ProductID, SizeNumber, Quantity, UnitPrice)
VALUES(2, 7, 46, 1, 600000)
INSERT INTO dbo.[OrderDetails](OrderID, ProductID, SizeNumber, Quantity, UnitPrice)
VALUES(2, 14, 35, 3, 400000)
INSERT INTO dbo.[OrderDetails](OrderID, ProductID, SizeNumber, Quantity, UnitPrice)
VALUES(3, 8, 40, 1, 900000)
INSERT INTO dbo.[OrderDetails](OrderID, ProductID, SizeNumber, Quantity, UnitPrice)
VALUES(4, 10, 37, 1, 400000)
INSERT INTO dbo.[OrderDetails](OrderID, ProductID, SizeNumber, Quantity, UnitPrice)
VALUES(4, 11, 39, 1, 500000)
INSERT INTO dbo.[OrderDetails](OrderID, ProductID,  SizeNumber, Quantity, UnitPrice)
VALUES(5, 16, 42, 1, 800000)
INSERT INTO dbo.[OrderDetails](OrderID, ProductID,  SizeNumber, Quantity, UnitPrice)
VALUES(5, 5, 42, 1, 400000)
GO
CREATE TABLE PaymentType(
	TypeID int identity(1,1) NOT NULL,
	TypeName nvarchar(30) NOT NULL,
	CONSTRAINT PK_Payment_Type PRIMARY KEY CLUSTERED(
		TypeID 
	)
)
GO
INSERT INTO dbo.PaymentType(TypeName) VALUES (N'Cash on delivery')
INSERT INTO dbo.PaymentType(TypeName) VALUES (N'Momo')
INSERT INTO dbo.PaymentType(TypeName) VALUES (N'Viettelpay')
INSERT INTO dbo.PaymentType(TypeName) VALUES (N'Credit card')
INSERT INTO dbo.PaymentType(TypeName) VALUES (N'Visa')
GO
CREATE TABLE Payment(
	PaymentID int identity(1,1) NOT NULL,
	CustomerID int NULL,
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



