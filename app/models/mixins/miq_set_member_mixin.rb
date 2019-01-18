module MiqSetMemberMixin
  extend ActiveSupport::Concern
  included do
    has_many :miq_set_memberships, :dependent => :delete, :as => :member
  end

  module ClassMethods
    def miq_set_class
      @miq_set_class ||= "#{name}Set".constantize
    end

    def sets
      miq_set_class.all
    end
  end

  def miq_sets
    miq_set_memberships.includes(:miq_set).collect(&:miq_set)
  end
  alias memberof miq_sets
end
