require 'spec_helper'

describe VideosController do

  describe "GET 'index'" do
    it "assigns @videos" do
      video1 = FactoryGirl.create(:video)
      video2 = FactoryGirl.create(:video,
                                  url: "http://www.tudou.com/programs/view/LvBHY6_YPgw/",
                                  title: "video2")

      get :index
      assigns[:videos].should == [video1, video2]
      response.should render_template :index
    end

    it "render template" do
      video1 = FactoryGirl.create(:video)
      video2 = FactoryGirl.create(:video)

      get :index
      assigns[:videos].should == [video1, video2]
      response.should render_template :index
    end
  end

end
