class AddIndexFeedback < ActiveRecord::Migration[5.2]
  def change
    def change
      add_reference :feedback, :company_token, index: true
      add_reference :feedback, :number, index: true
    end
  end
end
