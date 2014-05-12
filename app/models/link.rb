class Link
  include MongoMapper::Document

  after_create :link_both_sides

  key :description
  belongs_to :left, :class => Subject
  belongs_to :right, :class => Subject

  def link_both_sides
    link_and_save(left)
    link_and_save(right)
  end

  private
    def link_and_save(subject)
      subject.links << self
      subject.save
    end
end
