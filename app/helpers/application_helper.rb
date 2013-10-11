module ApplicationHelper
  
	def typekit_include_tag(apikey)
    javascript_include_tag("http://use.typekit.com/#{apikey}.js") +
      javascript_tag("try{Typekit.load()}catch(e){}")
  end


  def default_meta_tags
    {
      :title       => 'Member Login',
      :description => 'Member login page.',
      :keywords    => 'Site, Login, Members',
      :separator   => "&mdash;".html_safe,
    }
  end
  
end
