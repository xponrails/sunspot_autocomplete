module ViewHelpers
  
  # Generates a text input using the given <code>object_name</code> and <code>method</code>.
  # The generated text field autocompletes given <code>solr_url</code>: the url to your solr instance (e.g. http://127.0.0.1:8983/solr/)
  # Autocompletion is fetching results that only begins with the given part of word.
  # <code>autocomplete_field_name</code> is the unique field_name assigned in your model's searchable block
  # <code>html_options</code> are regular HTML options like :class and :id
  # <code>autocomplete_options</code> are advanced options for autocompletion http://docs.jquery.com/Plugins/Autocomplete/autocomplete#toptions
  def autocomplete_text_field(object_name, method, solr_url, autocomplete_field_name, html_options={}, autocomplete_options={})
    autocomplete_stub object_name, method, solr_url, autocomplete_field_name, false, html_options, autocomplete_options
  end
  
  # Generates a text input using the given <code>object_name</code> and <code>method</code>.
  # The generated text field autosuggests given <code>solr_url</code>: the url to your solr instance (e.g. http://127.0.0.1:8983/solr/)
  # Autosuggestion is fetching results that begins with/ends with/contains the given part of word.
  # <code>autocomplete_field_name</code> is the unique field_name assigned in your model's searchable block
  # <code>html_options</code> are regular HTML options like :class and :id
  # <code>autocomplete_options</code> are advanced options for autocompletion http://docs.jquery.com/Plugins/Autocomplete/autocomplete#toptions
  def autosuggest_text_field(object_name, method, solr_url, autocomplete_field_name, html_options={}, autocomplete_options={})
    autocomplete_stub object_name, method, solr_url, autocomplete_field_name, true, html_options, autocomplete_options
  end
  
  private
  
  def autocomplete_stub(object_name, method, url, field_name, suggest=false, html_options={}, autocomplete_options={})
    ac_js_options = "{" + autocomplete_options.collect{|k,v| "#{k.to_s}: #{ v.kind_of?(Numeric) ? v : "'" + v + "'" }"}.join(" , ") + "}"
    result = []
    result << text_field(object_name, method, html_options)
    result << "<script>$('##{object_name}_#{method}').#{suggest ? 'autosuggest' : 'autocomplete'}('#{url.ends_with?('/') ? url : url + '/'}', '#{field_name}', #{ac_js_options});</script>"
    result.join " "
  end
  
end

ActionView::Base.send :include, ViewHelpers
