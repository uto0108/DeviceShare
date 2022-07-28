# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Admin.create!(
   email: 'admin@admin',
   password: 'testtest'
)

customers=Customer.create!(
   [
    {email: 'tomoki@test.com', name: 'tomoki', password: '111111', profile_image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-customer1.png"), filename:"sample-customer1.png")},
    {email: 'aoki@test.com', name: 'aoki', password: '111111', profile_image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-customer2.png"), filename:"sample-customer2.png")},
    {email: 'sanpei@test.com', name: 'sanpai', password: '111111', profile_image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-customer3.png"), filename:"sample-customer3.png")}
  ]
)

categories=Category.create!(
  [
    {category: 'マウス'},
    {category: 'キーボーボード'},
    {category: 'マイク'},
    {category: 'その他'}
  ]
)

posts=Post.create!(
  [
    {title: 'G PRO X SUPERLIGHT', post_image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/G PRO X SUPERLIGHT.jpg"), filename:"G PRO X SUPERLIGHT.jpg"), body: '軽くて使いやすいマウスです。', customer_id: customers[0].id,category_id: categories[0].id, star: "4" },
    {title: 'Razer Huntsman Mini', post_image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/Razer Huntsman Mini.jpg"), filename:"Razer Huntsman Mini.jpg"), body: 'スペースを取らなくて使いやすいです', customer_id: customers[1].id, category_id: categories[1].id, star: "5" },
    {title: 'hyperx solo cast', post_image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/hyperx solo cast.jpg"), filename:"hyperx solo cast.jpg"), body: 'コスパ抜群です！', customer_id: customers[2].id, category_id: categories[2].id, star: "3" },
    {title: 'c920n', post_image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/c920n.jpg"), filename:"c920n.jpg"), body: '画質がとても良くて使いやすいです', customer_id: customers[2].id, category_id: categories[3].id, star: "5" }
  ]
)

comment=Comment.create!(
  [
    {comment: 'ソフトも使いやすかった', customer_id: customers[0].id, post_id: posts[3].id},
    {comment: '持ちやすいです', customer_id: customers[2].id, post_id: posts[0].id}
  ]
)
