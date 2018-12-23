module ChosenModul
  extend ActiveSupport::Concern

  included do
    after_create -> { author_chose }
  end

  def chose(user)
    Chosen.chose(user, self)
  end

  def author_chose
    Chosen.chose(User.find(user_id), self)
  end
end
