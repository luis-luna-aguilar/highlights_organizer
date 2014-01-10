module TopicsHelper

  def generate_list_for(topic, current_topic)
    if topic.is_childless?
      to_html_li(topic, current_topic)
    else
      children_html = "<ul>" + (topic.children.sort_by {|e| e.title}).reduce("") {|html, child| html + generate_list_for(child, current_topic)} + "</ul>"
      to_html_li(topic, current_topic, children_html)
    end
  end

  def to_html_li(topic, current_topic, children_html='')
    is_selected = ((topic == current_topic) ? 'selected' : 'not-selected')
    id = topic.id
    url = "/?current_topic=#{id}"
    "<li class='topic-li' data-id='#{id}'><a href='#{url}' class='#{is_selected} topic' data-type='text' data-pk='#{id}' data-url='{url}'>#{topic.title}</a>#{children_html}</li>"
  end

end
