class StudentSerializer < ActiveModel::Serializer
  attributes :id, :major, :age, :name
  belongs_to :instructor
end
