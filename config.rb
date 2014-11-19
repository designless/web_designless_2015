###
# Compass
###

compass_config do |config|
  # Require any additional compass plugins here.

  # Set this to the root of your project when deployed:
  config.http_path = "/"
  config.css_dir = "assets/css"
  config.sass_dir = "assets/css"
  config.images_dir = "assets/images"
  config.javascripts_dir = "assets/js"
  fonts_dir = "assets/fonts"

  # You can select your preferred output style here (can be overridden via the command line):
  # output_style = :expanded or :nested or :compact or :compressed
  output_style = :compressed
  set :slim, { :pretty => true, :sort_attrs => false, :format => :html5 }

  # To enable relative paths to assets via compass helper functions. Uncomment:
  relative_assets = true

  # To disable debugging comments that display the original location of your selectors. Uncomment:
  line_comments = false

  # If you prefer the indented syntax, you might want to regenerate this
  # project again passing --syntax sass, or you can uncomment this:
  # preferred_syntax = :sass
  # and then run:
  # sass-convert -R --from scss --to sass sass scss && rm -rf sass && mv scss sass

end

# Change Compass configuration
# compass_config do |config|
#   config.output_style = :compact
# end

###
# Page options, layouts, aliases and proxies
###

# Per-page layout changes:
#
# With no layout
# page "/path/to/file.html", :layout => false
#
# With alternative layout
# page "/path/to/file.html", :layout => :otherlayout
#
# A path which all have the same layout
# with_layout :admin do
#   page "/admin/*"
# end

# Proxy pages (http://middlemanapp.com/dynamic-pages/)
# proxy "/this-page-has-no-template.html", "/template-file.html", :locals => {
#  :which_fake_page => "Rendering a fake page with a local variable" }

###
# Helpers
###

# Automatic image dimensions on image_tag helper
# activate :automatic_image_sizes

# Methods defined in the helpers block are available in templates
helpers do

  # breadcrumbs
  def breadcrumbs(resource)
    list = []
    list << content_tag(:li, resource.data.title, class: 'active fa fa-home')
    unless resource.parent.nil?
      current = resource.parent
      until current.nil?
        if current.parent.nil?
          list << content_tag(:li, link_to(current.data.title, current.url), class: 'fa fa-home')
        else
          list << content_tag(:li, link_to(current.data.title, current.url), class: 'fa fa-angle-right')
        end
        current = current.parent
      end
    end
    list.reverse.join("\n").html_safe
  end

  # current page
  def current_page?(path)
    current_page.url == path
  end

  #nav link
  def nav_link(link_text, link_path)
    class_name = current_page?(link_path) ? 'current' : ''

    content_tag(:li, :class => class_name) do
      link_to link_text, link_path
    end
  end
end

set :css_dir, 'assets/css'
set :js_dir, 'assets/js'
set :images_dir, 'assets/images'

activate :livereload

require "uglifier"

# Build-specific configuration
configure :build do

  set :relative_links, true

  activate :minify_css

  activate :minify_javascript, :compressor => Uglifier.new({
    :output => {
      :comments => :all
    }
  })

  activate :minify_html

  activate :imageoptim do |options|
    # print out skipped images
    # options.verbose = true

    # Setting these to true or nil will let options determine them (recommended)
    # options.nice = true
    # options.threads = true

    # Image extensions to attempt to compress
    # options.image_extensions = %w(.png .jpg .gif)

    # compressor worker options, individual optimisers can be disabled by passing
    # false instead of a hash
    # options.pngcrush_options  = {:chunks => ['alla'], :fix => false, :brute => false}
    #options.pngout_options    = {:copy_chunks => false, :strategy => 0}
    # options.optipng_options   = {:level => 6, :interlace => false}
    options.pngout_options = false
    # options.advpng_options    = {:level => 4}
    # options.jpegoptim_options = {:strip => ['all'], :max_quality => 100}
    # options.jpegtran_options  = {:copy_chunks => false, :progressive => true, :jpegrescan => true}
    # options.gifsicle_options  = {:interlace => false}
  end

  # Enable cache buster
  # activate :asset_hash

  # Use relative URLs
  # activate :relative_assets

  # Or use a different image path
  # set :http_prefix, "/Content/images/"
end

