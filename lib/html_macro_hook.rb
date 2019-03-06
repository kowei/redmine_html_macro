# encoding: UTF-8
require 'redmine'

class HTMLMacroHookListener < Redmine::Hook::ViewListener
  include ActionView::Helpers::TagHelper
  include ActionView::Helpers::JavaScriptHelper

  # Setting.plugin_redmine_html_macro['htmlmacro_url'] ? Setting.plugin_redmine_html_macro['htmlmacro_url'] : 
  # Setting.plugin_redmine_html_macro['markdown-it_url'] ? Setting.plugin_redmine_html_macro['markdown-it_url'] : 
  def view_layouts_base_body_bottom(context={})
    html = ""
    html << stylesheet_link_tag('htmlmacro.css', :plugin => 'redmine_html_macro')
    html << javascript_include_tag('markdown-it.min.js', :plugin => 'redmine_html_macro')
    # html << stylesheet_link_tag('/redmine/plugin_assets/redmine_html_macro/stylesheets/htmlmacro.css')
    # html << javascript_include_tag('/redmine/plugin_assets/redmine_html_macro/javascripts/markdown-it.min.js')
    html << stylesheet_link_tag(Setting.plugin_redmine_html_macro['css_url'])
    html << javascript_include_tag(Setting.plugin_redmine_html_macro['js_url'])
    # html
    # html << javascript_tag("mermaid.initialize({startOnLoad:true});var mermaidInitialized = 1;")
    return html
  end

end
