module ApplicationHelper
  def raven_image_link
    poem = Writing.find_by(name: 'The Raven', author_last: 'Poe')
    link_to(
        image_tag('raven.png', alt: 'raven', class: 'img-fluid m-auto p-2 ps-3'),
        writing_path(poem),
        class: 'm-auto'
    )
  end

  def pub_unpub_link(object)
    klass = object.class.to_s.downcase
    path = "#{klass}_path"
    text = 'publish'
    param = Time.zone.now

    if object.published?
      text = 'unpublish'
      param = nil
    end

    button_to(text,
              send(path, object),
              method: :patch,
              params: { klass.to_sym => { published_at: param } },
              class: 'btn btn-sm text-black p-0 text-decoration-underline',
              form_class: 'd-inline-flex')
  end
end
