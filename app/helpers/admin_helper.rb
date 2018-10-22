module AdminHelper
  def tab_for(label, path, link_opts = {})
    klass = "nav-item#{' active' if tab_active?(label)}"
    content_tag(:li, class: klass) do
      link_to(label, path, link_opts.merge(class: 'nav-link'))
    end
  end

  private

  def tab_active?(label)
    controller_name == label.gsub(/\s+/, '_').downcase
  end
end
