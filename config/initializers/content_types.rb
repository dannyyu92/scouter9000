ActionController::Responder.class_eval do
  alias :to_json :to_html
end