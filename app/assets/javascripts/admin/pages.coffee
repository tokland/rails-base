$ ->
  input = $("#wmd-input")
  return if input.isEmpty()
  input.wrap($("<div />").attr("class", "markdown-box"))
    .before($("<div />").attr("id", "wmd-button-bar"))
    .after($("<div />").attr("id", "wmd-preview"))
  
  #converter = Markdown.getSanitizingConverter()
  converter = new Markdown.Converter()
  editor = new Markdown.Editor(converter)
  editor.run()
