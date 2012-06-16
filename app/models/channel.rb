class Channel < ActiveRecord::Base
  attr_accessible :broadcastable_id, :broadcastable_type, :channel_ident, :last_validated
  belongs_to :broadcastable, :polymorphic => true
end
