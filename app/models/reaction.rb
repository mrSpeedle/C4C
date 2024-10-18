class Reaction < ApplicationRecord
  belongs_to :user
  belongs_to :publication, optional: true
  belongs_to :comment, optional: true

  validates :kind, inclusion: { in: %w[like dislike] } # Asegúrate de que sea 'like' o 'dislike'
  validates :reaction_type, presence: true # Asegúrate de que reaction_type esté en la base de datos

  # Método para obtener los tipos de reacción
  def self.kinds
    %w[like dislike]
  end
end
