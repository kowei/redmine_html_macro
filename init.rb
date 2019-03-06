require 'redmine'

Redmine::Plugin.register :redmine_html_macro do
    require 'html_macro_hook'

    name 'Redmine HTML Macro Plugin'
    author 'KC Chen'
    author_url 'https://github.com/kowei'
    description 'Embed markdown text in wiki pages using the markdown-it to convert HTML content<br>Collapsible tag for collaps content'
    url 'git@shark.mygo.com:Redmine/redmine_markdown_macro.git'
    version '0.0.3'

    settings :default => { 
                            'js_url' => '' ,
                            'css_url' => '' ,
                            'collapsible_keyword' => 'html_collapsible' ,
                            'markdown_keyword' => 'html_md' ,
                            'markdown-it_url' => '' ,
                            'htmlmacro_url' => '',
                         },
             :partial => 'settings/redmine_html_macro_settings'
end

# wiki macro for embedding videos
Redmine::WikiFormatting::Macros.register do
    macro :hm do |o, args|
        # counter for video index
        @num ||= 0
        @num = @num + 1
        # find width and height
        for arg in args
            if arg.starts_with?("linkify=")
                linkify = arg[6..-1]
            end
            if arg.starts_with?("typographer=")
                typographer = arg[7..-1]
            end
        end
        # start html block for video
        out = """
<script>
$(document).ready(function () {
    // var md = new showdown.Converter();
    var md = window.markdownit();
    md.set({
        html: true,
        linkify: true,
        typographer: true,
      });
    // md.setOption('tables', true);
    var init = false;
    if (!init) {
        ['.""" + Setting.plugin_redmine_html_macro['markdown_keyword'] + """'].forEach((key) => {
            var coll = $(key);
            var i;
            console.log('> ' + key + ': ', coll ? coll.length : 'null');
            for (i = 0; i < coll.length; i++) {
                // console.log('> ', coll[i] ? coll[i].innerHTML : 'null');
                // coll[i].innerHTML = md.makeHtml(coll[i].innerHTML);

                coll[i].innerHTML = md.render(removeLeadingSpace(coll[i].innerHTML));
                if(coll[i].title){
                    coll[i].innerHTML = setLang(coll[i].innerHTML, coll[i].title);
                }
                // console.log('>',coll[i].title,coll[i].innerHTML)
            }
        });
        ['.endpoint_collapsible', '.""" + Setting.plugin_redmine_html_macro['collapsible_keyword'] + """'].forEach((key) => {
            var coll = $(key);
            var i;
            console.log('> ' + key + ': ', coll ? coll.length : 'null');
            for (i = 0; i < coll.length; i++) {
                // var content = coll[i].nextElementSibling;
                // content.style.display = 'none';
                coll[i].addEventListener('click', function () {
                    var content = this.nextElementSibling;
                    this.classList.toggle('mygo_active');
                    // console.log(content);
                    if (content.style.display === 'block') {
                        content.style.display = 'none';
                    } else {
                        content.style.display = 'block';
                    }
                });
            }
        });
        init = true;
    }
});

function removeLeadingSpace(data) {
    let lines = data.split('\\n');
    if (lines && lines.length > 0) {
        let line = String(lines[0]).replace(/^\s+|\s+$/g, '');
        let count = String(lines[0]).length - line.length;
        lines.forEach((line, index) => {
            lines[index] = String(lines[index]).substring(count);
            // console.log('>' + count + '|' + lines[index] + '|');
        });
    }
    return lines.join('\\n');
}

function setLang(data, lang) {
    let lines = data.split('\\n');
    if (lines && lines.length > 0) {
        lines.forEach((line, index) => {
            if (lines[index].match(/<code>/i)) {
                console.log('> FOUND code');
                lines[index] = String(lines[index]).replace(/<code>/i, '<code class=\"' + lang + '\">');
                console.log('>|' + lines[index] + '|');
            }
            // console.log('>' + count + '|' + lines[index] + '|');
        });
    }
    return lines.join('\\n');
}

</script>
        """
        out.html_safe
    end
end
