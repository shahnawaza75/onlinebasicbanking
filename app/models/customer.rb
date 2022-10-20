class Customer < ApplicationRecord
    has_many :senders, class_name: 'Transfer', foreign_key: :sender_id
    has_many :receivers, class_name: 'Transfer', foreign_key: :receiver_id
end
