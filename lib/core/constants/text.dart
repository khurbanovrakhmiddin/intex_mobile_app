import 'package:flutter/cupertino.dart';enum TypeSale{popular,discount,neww}const String  title = 'INTEX-MARKET.UZ';const String  call = 'Позвонить';const String  telegram = 'Телеграм';const String  instagram = 'Инстаграм';const String  categoryF = 'Каркасные бассейны';const String  all = 'Все';const String  cart = 'Заказать';const String  noCash = 'no cash';const String  recomended = 'Рекомендуем';const String  freeDelivery = 'Бесплатная доставка';const String freeConsult = 'Получить бесплатную \nконсультацию';const String  deliveryAbout = 'Бесплатная доставка осуществляется в '    'пределах \nгорода Ташкент (за пределами города доставка\n '    'оплачивается отдельно)';const String  workingTime = 'Рабочее время';const String  workingDays = 'Без выходных';const String  sites = 'intex.uz';const String  metalCarcass = 'Металлический каркас';const String  thanks = 'Поздравляем';const String  success = 'Ваш заказ успешно оформлен. Мь свяжемся с вами в ближайшее время.';const String  iconInstagram ='assets/icon/instagram.svg';const String  iconTelegram = 'assets/icon/telegram.svg';const String  lottie = 'assets/lottie/success'    '.json';//const String  metalCarcass = 'Металлический каркас'; Uri  telegramLauncher = Uri.parse('https://t.me/mobile_bro_b'); Uri  phoneLauncher = Uri(scheme: 'tel', path: '+99888787275'); Uri  instagramLauncher = Uri.parse('https://www.instagram.com/khurbanov_089'); /// ############ String  notConnect = 'notConnect';//Почему нужно выбрать нас?const String  aboutclient = 'aboutclient';///#///Прочностьconst String a = 'a';//Простота установкиconst String b = 'b';//Красивые и ярки цветаconst String c = 'c';//Стильный дизайнconst String d = 'd';//Высокое качествоconst String e = 'e';const String  aboutIntex1 = 'aboutIntex1';const String  aboutIntex2 = 'aboutIntex2';///# mainconst String companyname = 'INTEX-MARKET';const String address = 'address';const String link = 'link';const String contacts = 'contacts';const String productAbout = 'productAbout';const String cont = 'cont';const String whyWe = 'whyWe';const String category = 'category';const String popular = 'popular';const String news = 'news';const String discount = 'discount';const String gmail = 'intex@gmail.com';const String callCentre = 'callCentre';const String stepFirstAbout = 'stepFirstAbout';// const String deliveryAndPayment = 'Доставка и оплата';// const String frequentlyAsked = 'Часто задаваемые вопросы';// const String confidential = 'Политика конфиденциальности';const String  aboutEcperience = 'aboutEcperience';const String  aboutEcperience1 = 'aboutEcperience1';const String  aboutEcperiencePng = 'assets/images/experience.png';const String  aboutDelivery = 'aboutDelivery';const String  aboutDelivery1 = 'aboutDelivery1';const String  aboutDeliveryPng = 'assets/images/img_delivery.png';const String  aboutQuality = 'aboutQuality';const String  aboutQuality1 = 'aboutQuality1';const String  aboutQualityPng = 'assets/images/quality.png';const String  instagramSVG = 'assets/icons/instagram.svg';const String  twitterSVG = 'assets/icons/twitter.svg';const String  requestCall = 'requestCall';///# type categoryconst String  popularProduct = 'popularProduct';const String  newProduct = 'newProduct';const String  discountProduct = 'discountProduct';const String  buyBulk = 'buyBulk';const String  buyBulkAbout = 'buyBulkAbout';const String phoneNumber = 'phoneNumber';const String send = 'send';const String  categoryS = 'categoryS';const String  xitProdaj = 'xitProdaj';const String  status = 'status';const String  novinki = 'novinki';const String  okay = 'okay';const String endPage = 'endPage';const String yourCart = 'yourCart';const String  fromIntex = 'fromIntex';//Получить консултациюconst String  consult = 'consult';//Чтобы получить консультацию, отправьте нам свой номер телефона и имя, и мы свяжемся с вами в ближайшее время.const String  forConsult = 'forConsult';const String  name = 'name';const String  phone = 'phone';const String  typeName = 'typeName'; bool isTablet(BuildContext context) =>MediaQuery.of(context).size.width >= 600;