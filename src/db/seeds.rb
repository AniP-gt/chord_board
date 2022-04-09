# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# メインのサンプルユーザーを1人作成する
User.create!( username:  "テストユーザー",
              email: "test@example.com",
              password:              123456,
              password_confirmation: 123456,
              confirmed_at: Time.zone.now
              )

# 追加のユーザーをまとめて生成する
99.times do |n|
  name  = Faker::Name.name
  email = "test-#{n+1}@example.com"
  password = 123456
  User.create!( username:  name,
                email: email,
                password:              password,
                password_confirmation: password,
                confirmed_at: Time.zone.now
                )
end


# ユーザーの一部を対象に作品を投稿する
user1 = User.second
user2 = User.third
user3 = User.fourth

title1 = "王道進行4536　キーG"
work1  = "C,C,D,D,Bm,Bm,Em,Em,"
body1  = "王道の４５３６進行です。キーはCです。"

title2 = "丸の内サディスティック進行"
work2  = "FMaj7,FMaj7,E7,E7,Am7,Am7,C7,C7,"
body2  = "椎名林檎が良く使う別名「丸の内サディスティック進行」です"

title3 = "カノン進行"
work3  = "D,D,A,A,Bm,Bm,Fsm,Fsm,G,G,D,D,G,G,A,A,"
body3  = "王道カノン進行です。"

title4 = "小室進行　キーF"
work4  = "Dm,Dm,As,As,C,C,F,F,"
body4  = "小室哲哉ご用達のコード進行"

title5 = "Let it Be進行"
work5  = "C,C,G,G,Am,Am,F,F,"
body5  = "ビートルズのLet it Beで使われた進行です"

title6 = "下降転調パターン"
work6  = "GsMaj7,GsMaj7,Fsm7,Fsm7,GMaj7,GMaj7,Fm7,Fm7,"
body6  = "j-POPでよくみるパターンですね"


user2.chords.create(title: title1, work: work1, body: body1)
user3.chords.create(title: title2, work: work2, body: body2)
user1.chords.create(title: title3, work: work3, body: body3)
user2.chords.create(title: title4, work: work4, body: body4)
user3.chords.create(title: title5, work: work5, body: body5)
user2.chords.create(title: title6, work: work6, body: body6)


# リレーションシップ
users = User.all
user  = users.first
following = users[2..50]
followers = users[3..40]
following.each { |followed| user.follow(followed) }
followers.each { |follower| follower.follow(user) }

