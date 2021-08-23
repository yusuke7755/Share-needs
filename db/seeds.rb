# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Department.create!(
  [
  { name: '営業部', web_flg: true},
  { name: 'サポート部', web_flg: true},
  { name: '開発部', web_flg: true},
  { name: '総務部', web_flg: false},
  { name: '事業部', web_flg: false}
]
)

Employee.create!(
  [
  { name: '酒見賢一', email: 'admin1@gmail.com', password: 'password', password_confirmation: 'password', admin: true, department_id: 1, departmentname: '営業部', position: 1, web_flg: true },
  { name: '大和真也', email: 'admin2@gmail.com', password: 'password', password_confirmation: 'password', admin: true, department_id: 2, departmentname: 'サポート部', position: 2, web_flg: true },
  { name: '篠月美弥', email: 'admin3@gmail.com', password: 'password', password_confirmation: 'password', admin: true, department_id: 3, departmentname: '開発部', position: 1, web_flg: true },
  { name: '神坂一', email: 'user1@gmail.com', password: 'password', password_confirmation: 'password', admin: false, department_id: 1, departmentname: '営業部', position: 4 , web_flg: true},
  { name: '雑賀礼史', email: 'user2@gmail.com', password: 'password', password_confirmation: 'password', admin: false, department_id: 1 , departmentname: '営業部', position: 4, web_flg: true },
  { name: '深沢美潮', email: 'user3@gmail.com', password: 'password', password_confirmation: 'password', admin: false, department_id: 2, departmentname: 'サポート部', position: 3 , web_flg: true},
  { name: '仁木英之', email: 'user4@gmail.com', password: 'password', password_confirmation: 'password', admin: false, department_id: 2, departmentname: 'サポート部', position: 4 , web_flg: true},
  { name: '鷹見一幸', email: 'user5@gmail.com', password: 'password', password_confirmation: 'password', admin: false, department_id: 3, departmentname: '開発部', position: 3 , web_flg: true},
  { name: '森岡浩之', email: 'user6@gmail.com', password: 'password', password_confirmation: 'password', admin: false, department_id: 3, departmentname: '開発部', position: 4 , web_flg: true}
  ]
)

Customer.create!(
  [
  { name: '中川コンツェルン', address: '東京都港区', tel: '0312345678', user_flg: true },
  { name: 'サカタインダストリィ', address: '東京都渋谷区', tel: '0388899998', user_flg: false },
  { name: '霧島重工株式会社', address: '東京都上野区', tel: '348948999', user_flg: false },
  { name: '東西新聞社', address: '東京都中央区', tel: '348979925', user_flg: true },
  { name: 'カプセルコーポレーション', address: '東京都豊島区', tel: '12345678901', user_flg: true },
  { name: 'バロックワークス', address:'東京都新宿区', tel: '13454559154', user_flg: false },
  { name: 'ヴァルストークファミリー', address: '東京都品川区', tel: '1446568733', user_flg: false },
  { name: 'ZOITEC', address: '東京都文京区', tel: '7585255875' , user_flg: true },
  { name: 'ブッホ・コンツェルン', address: '東京都墨田区', tel: '1245456297', user_flg: true },
  { name: 'ディアブルアビオニクス', address:'東京都台東区', tel: '12345678990', user_flg: false }
  ]
)

Customeruser.create!(
  [
  { customer_id: 1, customername: '中川コンツェルン' , department: '財務部', name: '竹村岩男', email: 'dfaoi903faf@email.com', tel: '1115264446' },
  { customer_id: 1, customername: '中川コンツェルン' , department: '財務部', name: '亀井定雄', email: 'gfa94tgfg0ga@email.com', tel: '7414141112' },
  { customer_id: 1, customername: '中川コンツェルン' , department: '財務部', name: '速水晃一', email: 'iovxb945agfag@email.com', tel: '5411177112' },
  { customer_id: 2, customername: 'サカタインダストリィ' , department: '人事部', name: '中村青司', email: 'k90dgh094@email.com', tel: '1411417989' },
  { customer_id: 2, customername: 'サカタインダストリィ' , department: '人事部', name: '岡部和雄', email: '3dfggf090d@email.com', tel: '2158225211' },
  { customer_id: 2, customername: 'サカタインダストリィ' , department: '人事部', name: '杉原爽香', email: 'adf9u4e343@email.com', tel: '5214411222' },
  { customer_id: 3, customername: '霧島重工株式会社' , department: '開発部', name: '左文字進', email: 'fg09iv4afd4@email.com', tel: '3118844201' },
  { customer_id: 3, customername: '霧島重工株式会社' , department: '開発部', name: '狩矢荘助', email: '409dfg0daf@email.com', tel: '2818920143' },
  { customer_id: 3, customername: '霧島重工株式会社' , department: '開発部', name: '橋口大吾', email: 'bvje004fggs@email.com', tel: '3998191048' },
  { customer_id: 4, customername: '東西新聞社' , department: '文化部', name: '栗田 ゆう子', email: 'bjio80gffg@email.com', tel: '2497898944' },
  { customer_id: 4, customername: '東西新聞社' , department: '文化部', name: '三谷 典子', email: 'affag9agga9@email.com', tel: '3114118811' },
  { customer_id: 4, customername: '東西新聞社' , department: '文化部', name: '谷村 秀夫', email: 'daf9i090ag@emai.com', tel: '4115201155' },
  { customer_id: 5, customername: 'カプセルコーポレーション' , department: '経理部', name: '竹村岩男', email: 'b09ug9aa3435f@email.com', tel: '5141415421' },
  { customer_id: 5, customername: 'カプセルコーポレーション' , department: '経理部', name: '中村雅楽', email: 'dfag99agag9@email.com', tel: '1414414451' },
  { customer_id: 5, customername: 'カプセルコーポレーション' , department: '経理部', name: '栗本薫', email: 'fdaha879gfa@gmail.com', tel: '7454114612' },
  { customer_id: 6, customername: 'バロックワークス' , department: '資材部', name: '狩野俊介', email: 'ojfekaoogf34@email.com', tel: '5890444945' },
  { customer_id: 6, customername: 'バロックワークス' , department: '資材部', name: '伊集院大介', email: 'dgamoopa32i09@email.com', tel: '2194898731' },
  { customer_id: 6, customername: 'バロックワークス' , department: '資材部', name: '如月塔子', email: 'd9d0gga3r5@gmail.com', tel: '4021400025' },
  { customer_id: 7, customername: 'ヴァルストークファミリー' , department: '営業部', name: '矢代俊一', email: 'd9iga0rhat@email.com', tel: '4046014111' },
  { customer_id: 7, customername: 'ヴァルストークファミリー' , department: '営業部', name: '栗本薫', email: 'dfsa900ah9tat@email.com', tel: '5132154411' },
  { customer_id: 7, customername: 'ヴァルストークファミリー' , department: '営業部', name: '伊集院大介', email: 'gfh489hh4s8@email.com', tel: '1048181483' },
  { customer_id: 8, customername: 'ZOITEC' , department: '開発部', name: '柳原弘', email: 'io09a09@email.com', tel: '2118404227' },
  { customer_id: 8, customername: 'ZOITEC' , department: '開発部', name: '里見脩二', email: 'eiofjdajot320@email.com', tel: '4124822974' },
  { customer_id: 8, customername: 'ZOITEC' , department: '開発部', name: '財前五郎', email: 'aioffapitat@email.com', tel: '1455335486' },
  { customer_id: 9, customername: 'ブッホ・コンツェルン' , department: '総務部', name: '黒鳥兵衛', email: 'dfiofaoai@email.com', tel: '8114848484' },
  { customer_id: 9, customername: 'ブッホ・コンツェルン' , department: '総務部', name: '金売吉次', email: 'ariorofai@email.com', tel: '1992008910' },
  { customer_id: 9, customername: 'ブッホ・コンツェルン' , department: '総務部', name: '明石志賀之助', email: 'afijdoaiojag@email.com', tel: '1546519519' },
  { customer_id: 10, customername: 'ディアブルアビオニクス' , department: '経理部', name: '熊坂長範', email: 'erqrqrqrq@email.com', tel: '8219426119' },
  { customer_id: 10, customername: 'ディアブルアビオニクス' , department: '経理部', name: '松浦佐用姫', email: 'fareaffaa@email.com', tel: '5416234555' },
  { customer_id: 10, customername: 'ディアブルアビオニクス' , department: '経理部', name: '坂上田村丸', email: 'dfjeooffa@email.com', tel: '1411442284' }
  ]
)

Package.create!(
  [
  { name: '販売管理システム' },
  { name: '生産管理システム' },
  { name: '会計システム' },
  { name: '人事給与システム '},
  { name: '倉庫管理システム' }
]
)

Feature.create!(
  [
  { name: '商品管理機能', package_id: 1, packagename: '販売管理システム' },
  { name: '販売管理機能', package_id: 1, packagename: '販売管理システム' },
  { name: '顧客管理機能', package_id: 1, packagename: '販売管理システム' },
  { name: '材料管理機能', package_id: 2, packagename: '生産管理システム' },
  { name: '仕掛品管理機能', package_id: 2, packagename: '生産管理システム' },
  { name: '生産管理機能', package_id: 2, packagename: '生産管理システム' },
  { name: '売掛金管理機能', package_id: 3, packagename: '会計システム' },
  { name: '買掛金管理機能', package_id: 3 , packagename: '会計システム'},
  { name: '決算作成機能', package_id: 3, packagename: '会計システム' },
  { name: '給与管理機能', package_id: 4, packagename: '人事給与システム' },
  { name: '人事異動管理機能', package_id: 4, packagename: '人事給与システム' },
  { name: '査定管理機能', package_id: 4, packagename: '人事給与システム' },
  { name: '入庫管理機能', package_id: 5, packagename: '倉庫管理システム' },
  { name: '出庫管理機能', package_id: 5, packagename: '倉庫管理システム' },
  { name: '倉庫管理機能', package_id: 5, packagename: '倉庫管理システム' }
]
)

Project.create!(
  [
  { title: '商品紹介について', employee_id: 1, customeruser_id: 4, feature_id: 1 , apoint_at: Date.today, deadline: Date.today, description: 'あいうえお', priority: 3},
  { title: 'デモンストレーション', employee_id: 2, customeruser_id: 22, feature_id: 2 , apoint_at: Date.today, deadline: Date.today, description: 'かきくけこ', priority: 2},
  { title: '見積もり商談', employee_id: 3, customeruser_id: 29, feature_id: 3 , apoint_at: Date.today, deadline: Date.today, description: 'さしすせそ', priority: 1},
  { title: 'システム操作について', employee_id: 1, customeruser_id: 1 , feature_id: 1 , apoint_at: Date.today, deadline: Date.today, description: 'たちつてと', priority: 1},
  { title: 'システム障害対応', employee_id: 2, customeruser_id: 14 , feature_id: 2 , apoint_at: Date.today, deadline: Date.today, description: 'なにぬねの', priority: 2},
  { title: 'カスタマイズ対応', employee_id: 3, customeruser_id: 25 , feature_id: 3 , apoint_at: Date.today, deadline: Date.today, description: 'はひふへほ', priority: 3},
  { title: '状況調査について', employee_id: 3, customeruser_id: 26 , feature_id: 1 , apoint_at: Date.today, deadline: Date.today, description: 'まみむめも', priority: 3}
]
)