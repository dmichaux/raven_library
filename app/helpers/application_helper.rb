module ApplicationHelper
  def raven_image_link
    poem = Writing.find_by(name: 'The Raven', author_last: 'Poe')
    link_to(
        image_tag('raven.png', alt: 'raven', class: 'img-fluid m-auto p-2 ps-3'),
        writing_path(poem)
    )
  end

  def pub_unpub_link(object)
    text = object.published? ? 'unpublish' : 'publish'
    path = "#{object.class.to_s.downcase}_path"

    link_to(text, send(path, object), method: :patch, class: 'text-black')
  end
end
