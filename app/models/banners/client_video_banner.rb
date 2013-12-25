class ClientVideoBanner < ClientBanner
  before_save :change_url
  private
    def change_url
      unless self.filename.nil?
        base = "//www.youtube.com/embed/"
        url = URI.parse(filename).query
        self.filename = base + url[2..-1]
      end
    end
end
