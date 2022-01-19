require "test_helper"

class DocumentTest < ActiveSupport::TestCase
  # validates  :name, :description, :file_path , presence: true
  test "is not valid without to name" do
    document = Document.new
    refute document.valid?
    assert_includes document.errors.messages[:name], "can't be blank"
  end

  test "is not valid without to description" do
    document = Document.new
    refute document.valid?
    assert_includes document.errors.messages[:description], "can't be blank"
  end

  test "is not valid without to file_path" do
    document = Document.new
    refute document.valid?
    assert_includes document.errors.messages[:file_path], "can't be blank"
  end

  test "must be valid with to name description and file path" do
    document = Document.new(name: "Responsive", description: "For tournaments required", file_path: "./here/path/doc1.pdf")
    assert document.valid?
  end
end
