$ ->
  $("#wmd-input").wrap($("<div />").attr("class", "markdown-box"))
  $("#wmd-input").before($("<div />").attr("id", "wmd-button-bar"))
  $("#wmd-input").after($("<div />").attr("id", "wmd-preview"))
  
  converter1 = Markdown.getSanitizingConverter()
  editor1 = new Markdown.Editor(converter1)
  editor1.run()
