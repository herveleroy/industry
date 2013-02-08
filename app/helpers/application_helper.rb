module ApplicationHelper

def extension_of(url)
  extension = url.split("?")[0].split(".").last
  if ["png", "jpg","jpeg","gif","bmp", "pdf"].include?(extension)
    icon_url = url
  else
    icon_url = image_path("missing_icon.png")
  end
  return icon_url

end

end
