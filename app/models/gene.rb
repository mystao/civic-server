class Gene < ActiveRecord::Base
  has_many :events
  has_many :category_genes
  has_many :gene_pathways
  has_many :gene_protein_motifs
  has_many :gene_protein_functions

  has_many :categories, through: :category_genes
  has_many :pathways, through: :gene_pathways
  has_many :protein_motifs, through: :gene_protein_motifs
  has_many :protein_functions, through: :gene_protein_functions

  validates :name, presence: true, uniqueness: true
  validates :entrez_id, presence: true, uniqueness: true
  validates :description, presence: true
  validates :official_name, presence: true

  def self.default_scope
    eager_load(:categories, :pathways, :protein_motifs, :protein_functions)
  end
end