require 'test_helper'

class LinksControllerTest < ActionController::TestCase

 test "gets links" do
    create_link
    create_link
    get :index, format: :json
    links = JSON.parse(response.body)
    p links
    assert_equal 2, links.size
    assert_not_equal links.first, links.last
  end

  def create_link
    first_subject = create(:subject)
    second_subject = create(:subject)
    Link.create(left: first_subject, right: second_subject)
  end

end

