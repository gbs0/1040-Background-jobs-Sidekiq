class Email < ApplicationRecord
  after_update :redo_chuck_norris_fact

  def redo_chuck_norris_fact
    EmailJob.perform_later
  end
end
