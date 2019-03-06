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

## Configuration

The plugin can be configured by the *Redmine* administrator via the Redmine interface, ``Administration`` -> ``Plugins`` -> ``Redmine Drawio Plugin`` -> ``Configure``.

In the configuration form you can set 

  * Markdown-it JS location: the plugin come with default lib. If you wish to use external CSDN, you can set it.
  * internal CSS location: 
  * extra JS location
  * extra CSS location
  * Collapsible class name: default is `"html_collapsible"`
  * Markdown class name: default is `"html_md"`

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

## Known issues

- Only one collapsible tag class supported. 

## TODO

- Add more manageable macro to control wiki content

  - Printer support layout
  - ...not think about it yet

## License

MIT License

Copyright (c) 2019 KC Chen

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.


## Plugin author

(c) KC Chen - [https://github.com/kowei](https://github.com/kowei)

## Project help, bugs

If you need help you can contact the maintainers on the project page on GitHub ([https://github.com/kowei](https://github.com/kowei)). If you want to report bugs, please open a new issue here: [https://github.com/kowei/issues](https://github.com/kowei/issues)
