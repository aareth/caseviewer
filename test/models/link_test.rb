require 'test_helper'

class LinkTest < ActiveSupport::TestCase

  attr_accessor :first_subject, :second_subject, :description

  def setup
    @first_subject = create(:subject)
    @second_subject = create(:subject)
    description = "Brothers"
  end

  def teardown
    Link.all.each { |link| link.destroy }
  end
  
  test "link two subjects" do
    Link.create(left: first_subject, right: second_subject, description: description)
    link = first_subject.links.first
    assert_equal link.left, first_subject
    assert_equal description, link.description
  end

  test "link two subjects links the inverse" do
    Link.create(left: first_subject, right: second_subject, description: description)
    link = second_subject.links.first
    assert_equal link.right, second_subject
    assert_equal description, link.description
  end

  test "creating link saves associations" do
    link = Link.create(left: first_subject, right: second_subject, description: description)
    saved_first = Subject.find_by_id(first_subject.id)
    saved_second = Subject.find_by_id(second_subject.id)
    assert_equal saved_first.links.first, link
    assert_equal saved_second.links.first, link
  end

end
