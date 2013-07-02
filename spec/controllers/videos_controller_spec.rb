require 'spec_helper'

describe VideosController do

  describe "GET 'index'" do
    it "assigns @videos and render template" do
      video1 = Video.create(url: "http://v.youku.com/v_show/id_XNTc3NTA2NTky.html",
                            title: "video1",
                            size: 42)
      video2 = Video.create(url: "http://www.tudou.com/programs/view/LvBHY6_YPgw/",
                            title: "video2")
      get :index
      assigns[:videos].should == [video1, video2]
      response.should render_template :index
    end
  end

end
