# Redmine HTML macro plugin
Redmine Plugin to embed markdown and collapsible content in Wiki HTML pages.

This plugin provides an additional wiki macro for Redmine, which allows to embed markdown content using the markdown-it to convert to HTML. The other feature is collapsible
content.

Compatibility: Tested with Redmine 3.4.6

## Installation
Go to the plugin folder of your redmine installation under plugins folder and clone this repository:

    git clone git@github.com:kowei/redmine_html_macro.git

Migrate:

     rake redmine:plugins:migrate RAILS_ENV=production

And finally restart Redmine.

## Usage
For support this plugin in wiki page, first add following line in wiki content:

    {{hm()}}

* Markdown

  `<div class="html_md">`

  Put class name `"html_md"` in any enclosure tag such as `<div class="html_md">...</div>`, the tag's innerHTML will be treat as markdown content
  

* Collapsible content

  `<div class="html_collapsible">`

  Put class name `"html_collapsible"` in any enclosure tag such as 
  ```
  <div class="html_collapsible">
    <div>
        My collapsible content
    </div>
  </div>
  ```
  , the tag's next tag will be treat as collapsible content.


