$ ->
  input = $("#wmd-input")
  return if input.isEmpty()
  input
    .wrap($("<div />").attr("class", "markdown-box"))
    .before($("<div />").attr("id", "wmd-button-bar"))
    .after($("<div />").attr("id", "wmd-preview"))
  
  converter1 = Markdown.getSanitizingConverter()
  editor1 = new Markdown.Editor(converter1)
  editor1.run()
