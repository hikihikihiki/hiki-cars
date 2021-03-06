class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_many_attached :images

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,:confirmable

  def self.search(search)
      if search
        livein = User.liveins.select { |k, v| k.include?(search) }.values&.first
        maker = User.makers.select { |k, v| k.include?(search) }.values&.first
        User.where(['name LIKE ? OR livein = ? OR maker = ? OR syasyu LIKE ?', "%#{search}%", livein, maker, "%#{search}%"])
      else
        Uer.all
      end
  end

  def password_required?
    super && confirmed?
  end

  def active_for_authentication?
    super && confirmed?
  end

  def inactive_message
    confirmed? ? super : :needs_confirmation
  end
  validates :name, length: { maximum: 20 }
  validates :password, presence: true, length: { minimum: 6 }, allow_nil: true
  # validates :introduce, length: { maximum: 255 }mo

  enum livein: {
    "--未選択--":0,北海道:1,青森県:2,岩手県:3,宮城県:4,秋田県:5,山形県:6,福島県:7,
    茨城県:8,栃木県:9,群馬県:10,埼玉県:11,千葉県:12,東京都:13,神奈川県:14,
    新潟県:15,富山県:16,石川県:17,福井県:18,山梨県:19,長野県:20,
    岐阜県:21,静岡県:22,愛知県:23,三重県:24,
    滋賀県:25,京都府:26,大阪府:27,兵庫県:28,奈良県:29,和歌山県:30,
    鳥取県:31,島根県:32,岡山県:33,広島県:34,山口県:35,
    徳島県:36,香川県:37,愛媛県:38,高知県:39,
    福岡県:40,佐賀県:41,長崎県:42,熊本県:43,大分県:44,宮崎県:45,鹿児島県:46,沖縄県:47
  }
  enum maker: {
    未選択:0,TOYOTA:1,NISSAN:2,MITSUBISHI:3,SUBARU:4,LEXUS:5,HONDA:6,BMW:7,
    Mercedes:8,Audi:9,PORSCHE:10,Wagen:11
  }
end
