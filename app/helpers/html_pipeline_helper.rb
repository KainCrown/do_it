module HtmlPipelineHelper
  def add_filters(content)
    pipeline_context = { gmf: true, asset_root: 'http://localhost:3000/images/' }
    pipeline = HTML::Pipeline.new [
      HTML::Pipeline::MarkdownFilter,
      HTML::Pipeline::EmojiFilter,
      HTML::Pipeline::SanitizationFilter,
    ], pipeline_context
    pipeline.call(content)[:output].to_s.html_safe
  end
end
