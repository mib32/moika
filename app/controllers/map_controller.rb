class MapController < ApplicationController
  layout "main_page"
  def show
    @car_washes = CarWash.limit(10)
    @updated_at = Time.now.utc
    @ivideon_url1 = "http://open.ivideon.com/embed/v2/?server=100-9a30484492988f37c30166eefe98969c&camera=0&width=&height=&lang=ru"
    @ivideon_url2 = "http://open.ivideon.com/embed/v2/?server=200-ef82357d701571c3bce35f1014bf7ac6&camera=0&width=&height=&lang=ru"
    @ivideon_url3 = "http://open.ivideon.com/embed/v2/?server=200-fb548054bd9ea8dd98d0753c689533f6&camera=65536&width=&height=&lang=ru"
  end
end
