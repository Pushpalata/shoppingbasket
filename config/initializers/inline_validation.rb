ActionView::Base.field_error_proc = Proc.new do |html_tag, instance|
    %{
<div class="field_with_errors">#{html_tag}<span class="message" for="#{instance.send(:tag_id)}">#{instance.error_message.first}</span></div>}.html_safe
end
