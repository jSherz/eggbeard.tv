###
# Page options, layouts, aliases and proxies
###

# Per-page layout changes:
#
# With no layout
page '/*.xml', layout: false
page '/*.json', layout: false
page '/*.txt', layout: false

# With alternative layout
# page "/path/to/file.html", layout: :otherlayout

# Proxy pages (http://middlemanapp.com/basics/dynamic-pages/)
# proxy "/this-page-has-no-template.html", "/template-file.html", locals: {
#  which_fake_page: "Rendering a fake page with a local variable" }

# General configuration

# Reload the browser automatically whenever files change
configure :development do
  activate :livereload
end

set :haml, ugly: true, format: :html5

###
# Helpers
###

# Methods defined in the helpers block are available in templates
helpers do
  def render_stat(value, &description)
    partial 'partials/stat-number', locals: { value: value, description: capture(&description) }
  end

  def social_icon(name, title, url)
    partial 'partials/social-icon', locals: { name: name, title: title, url: url }
  end

  def format_stat(value)
    number_with_precision(value, precision: 0, delimiter: ',')
  end
end

# Build-specific configuration
configure :build do
  # Minify CSS on build
  activate :minify_css

  # Minify Javascript on build
  activate :minify_javascript
end
