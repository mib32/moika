class MapController < ApplicationController
  layout "main_page"
  def show
    @car_washes = CarWash.limit(10)
    @updated_at = Time.now.utc
    #
    @ivideon_url1 = "http://open.ivideon.com/embed/v2/?server=100-9a30484492988f37c30166eefe98969c&camera=0&width=&height=&lang=ru"
    @ivideon_title1 = CarWash.where(video_url1: @ivideon_url1).first.try(:video_title1)
    @ivideon_url2 = "http://open.ivideon.com/embed/v2/?server=200-ef82357d701571c3bce35f1014bf7ac6&camera=0&width=&height=&lang=ru"
    @ivideon_title2 = CarWash.where(video_url1: @ivideon_url2).first.try(:video_title1)
    # Second Greytek-1
    @ivideon_url3 = "http://open.ivideon.com/embed/v2/?server=200-fb548054bd9ea8dd98d0753c689533f6&camera=65536&width=&height=&lang=ru"
    @ivideon_title3 = CarWash.where(video_url2: @ivideon_url3).first.try(:video_title2)
    # First Greytek-1
    @ivideon_url4 = "http://open.ivideon.com/embed/v2/?server=200-fb548054bd9ea8dd98d0753c689533f6&camera=0&width=&height=&lang=ru"
    @ivideon_title4 = CarWash.where(video_url1: @ivideon_url4).first.try(:video_title1)
    # First Greytek-6
    @ivideon_url5 = "http://open.ivideon.com/embed/v2/?server=200-6a0ca794d128a7696136f9c0044d7924&camera=0&width=&height=&lang=ru"
    @ivideon_title5 = CarWash.where(video_url1: @ivideon_url5).first.try(:video_title1)
    # Second Greytek-6
    @ivideon_url6 = "http://open.ivideon.com/embed/v2/?server=200-6a0ca794d128a7696136f9c0044d7924&camera=65536&width=&height=&lang=ru"
    @ivideon_title6 = CarWash.where(video_url2: @ivideon_url6).first.try(:video_title2)
  end
end
