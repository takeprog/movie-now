class Genre < ActiveHash::Base
  self.data = [
    { id: 1, name: '--' },
    { id: 2, name: 'good' },
    { id: 3, name: 'bad' },
    { id: 4, name: 'その他' }
  ]

  include ActiveHash::Associations
  has_many :comments

  end