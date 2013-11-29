json.extract! @banner, :id, :place, :filename, :text
json.url Banner.find(@banner.id).file.url
