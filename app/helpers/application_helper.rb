module ApplicationHelper
  def raven_image_link
    poem = Writing.find_by(name: 'The Raven', author_last: 'Poe')
    link_to(
        image_tag('raven.png', alt: 'raven', class: 'img-fluid m-auto p-2 ps-3'),
        writing_path(poem)
    )
  end
end
