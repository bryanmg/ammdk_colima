class Document < ApplicationRecord
  validates :name, :description, :file_path, presence: true
end
