# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :video do
    url "http://v.youku.com/v_show/id_XNTc3NTA2NTky.html"
    title "极品玩家神作：只因酷爱游戏动漫"
    site "Youku.com"
    type "Flash video (video/x-flv)"
    size 11617975
  end
end
