module ApplicationHelper
  def image_with_placeholder(image, alt_text, placeholder: 'placeholder.webp')
    image_tag(image.present? ? url_for(image) : asset_path(placeholder), alt: alt_text,
                                                                         class: 'img-fluid object-fit-cover preview-img',
                                                                         onerror: "this.onerror=null;this.src='#{asset_path(placeholder)}';")
  end
end
