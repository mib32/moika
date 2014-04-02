namespace :setup do
  desc "Add 4 emty banners to each Car Wash"

  task add_empty_admin_banners: :environment do
    puts "Add admin banners"
    AdminBanner.where("place like '%top%'").delete_all

    AdminYoutubeBanner.create!(place: 'top_1', youtube_url: '//www.youtube.com/embed/qeIeS8RDD98')
    AdminImageBanner.create!(place: 'top_2')
    AdminIvideonBanner.create!(place: 'top_3')
    AdminImageBanner.create!(place: 'top_4')


  end

  task add_empty_client_banners: :environment do
    puts "Add empty banners"
    banners_data = [
      {place: "client_fat_top"},
      {place: "client_thin_bottom"},
      {place: "client_thin_top_1"},
      {place: "client_thin_top_2"}
    ]

    CarWash.find_each do |cw|
      cw.banners.destroy_all
      banners_data.each do |data| 
        puts "Add #{data[:place]} banner to #{cw.title}"
        cw.banners << ClientBanner.new(data)
      end
      puts
    end
  end

  task add_admin_type_banners: :environment do
    puts "Add admin type to banners with empty type"
    Banner.where(type: nil).find_each do |banner|
      banner.update(type: "AdminBanner")
    end
  end

  task add_empty_left_bottom_client_banners: :environment do
    puts "Add empty banners"
    banners_data = [
      {place: "client_thin_top_3"},
      {place: "client_thin_top_4"}
    ]

    CarWash.find_each do |cw|
      banners_data.each do |data| 
        puts "Add #{data[:place]} banner to #{cw.title}"
        cw.banners << ClientBanner.new(data)
      end
      puts
    end
  end

  task add_empty_client_video_banners: :environment do
    puts "Add empty video banners"

    CarWash.find_each do |cw|
      cw.banners.where(type: 'ClientVideoBanner').destroy_all
      cw.banners << ClientVideoBanner.new
    end
  end

  task create_banners_config: :environment do
    puts "create bunners config"
    places = [
      'top_1',
      'top_2',
      'top_3',
      'top_4',
      'bottom_1',
      'bottom_2',
      'bottom_3',
      'bottom_4',
    ]

    BannersConfig.create!(place: 'top_1', mode: "youtube")
    BannersConfig.create!(place: 'top_2', mode: "image")
    BannersConfig.create!(place: 'top_3', mode: "ivideon")
    BannersConfig.create!(place: 'top_4', mode: "image")
    BannersConfig.create!(place: 'bottom_1', mode: "slideshow")
    BannersConfig.create!(place: 'bottom_2', mode: "youtube")
    BannersConfig.create!(place: 'bottom_3', mode: "ivideon")
    BannersConfig.create!(place: 'bottom_4', mode: "youtube")
  end

  task add_first_payment: :environment do
    puts "Add first payment to all car_washes"
    CarWash.find_each do |cw|
      cw.payments << Payment.new(amount: 6000.00)
    end
  end

  task add_signal_type: :environment do
    puts "add signal_type"
    CarWash.find_each do |cw|
      if cw.blink
        cw.signal_type = 'blink'
      elsif cw.videoned
        cw.signal_type = 'videoned'
      elsif cw.action_on_map
        cw.signal_type = 'action_on_map'
      else
        cw.signal_type = 'normal'
      end
      cw.save
    end
  end

end
