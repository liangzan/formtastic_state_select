module FormtasticStateSelect

  def state_input(method, options)
    raise "To use the :state input, please install the state_select plugin http://github.com/sprsquish/state_select" unless self.respond_to?(:state_select)

    html_options = options.delete(:input_html) || {}

    self.label(method, options_for_label(options)) <<
      self.state_select(method, strip_formtastic_options(options), html_options)
  end

end


if Object.const_defined? "Formtastic"
  Formtastic::SemanticFormBuilder.class_eval { include FormtasticStateSelect }
end
