class ClientVideoBanner < ClientBanner
  before_save :change_url
  private
    def change_url
      unless self.filename.nil?
        base = "//www.youtube.com/embed/"
        suffix = "?wmode=transparent"
        url = URI.parse(self.filename).query
        if url.nil?
          self.filename += suffix if (/wmode=transparent/ =~ self.place).nil?
        else
          self.filename = base + url[2..-1] + suffix
        end
      end
    end
end
