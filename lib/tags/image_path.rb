class ImagePath < Liquid::Tag
  def render(context)
    assigns = context.scopes[1]
    "https://raw.githubusercontent.com/codeship/screencast-storyboards/#{assigns['technology_slug']}-#{assigns['repository_slug']}-#{assigns['deployment_slug']}"
  end
end

Liquid::Template.register_tag('image_path', ImagePath)
