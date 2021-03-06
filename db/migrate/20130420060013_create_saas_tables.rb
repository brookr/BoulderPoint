class CreateSaasTables < ActiveRecord::Migration

  def self.up
    create_table "accounts", :force => true do |t|
      t.string   "name"
      t.datetime "created_at"
      t.datetime "updated_at"
      t.string   "full_domain"
      t.datetime "deleted_at"
    end

    add_index "accounts", ["full_domain"], :name => "index_accounts_on_full_domain"

    create_table "saas_admins", :force => true do |t|
      t.string   "email",                                 :default => "", :null => false
      t.string   "encrypted_password",     :limit => 128, :default => "", :null => false
      t.string   "password_salt",                         :default => "", :null => false
      t.string   "reset_password_token"
      t.datetime "reset_password_sent_at"
      t.datetime "remember_created_at"
      t.integer  "sign_in_count",                         :default => 0
      t.datetime "current_sign_in_at"
      t.datetime "last_sign_in_at"
      t.string   "current_sign_in_ip"
      t.string   "last_sign_in_ip"
      t.datetime "created_at"
      t.datetime "updated_at"
      t.datetime "reset_password_sent_at"
    end

    add_index "saas_admins", ["email"], :name => "index_admins_on_email", :unique => true
    add_index "saas_admins", ["reset_password_token"], :name => "index_admins_on_reset_password_token", :unique => true

    create_table "subscription_affiliates", :force => true do |t|
      t.string   "name"
      t.decimal  "rate",       :precision => 6, :scale => 4, :default => 0.0
      t.datetime "created_at"
      t.datetime "updated_at"
      t.string   "token"
    end

    add_index "subscription_affiliates", ["token"], :name => "index_subscription_affiliates_on_token"

    create_table "subscription_discounts", :force => true do |t|
      t.string   "name"
      t.string   "code"
      t.decimal  "amount",                 :precision => 6, :scale => 2, :default => 0.0
      t.boolean  "percent"
      t.date     "start_on"
      t.date     "end_on"
      t.datetime "created_at"
      t.datetime "updated_at"
      t.boolean  "apply_to_setup",                                       :default => true
      t.boolean  "apply_to_recurring",                                   :default => true
      t.integer  "trial_period_extension",                               :default => 0
    end

    create_table "subscription_payments", :force => true do |t|
      t.integer  "subscriber_id"
      t.integer  "subscription_id"
      t.decimal  "amount",                    :precision => 10, :scale => 2, :default => 0.0
      t.string   "transaction_id"
      t.datetime "created_at"
      t.datetime "updated_at"
      t.boolean  "setup"
      t.boolean  "misc"
      t.integer  "subscription_affiliate_id"
      t.decimal  "affiliate_amount",          :precision => 6,  :scale => 2, :default => 0.0
      t.string   "subscriber_type",                                          :default => "User"
    end

    add_index "subscription_payments", ["subscriber_id", "subscriber_type"], :name => "index_subscription_payments_on_subscriber"
    add_index "subscription_payments", ["subscription_id"], :name => "index_subscription_payments_on_subscription_id"

    create_table "subscription_plans", :force => true do |t|
      t.string   "name"
      t.decimal  "amount",         :precision => 10, :scale => 2
      t.datetime "created_at"
      t.datetime "updated_at"
      t.integer  "renewal_period",                                :default => 1
      t.decimal  "setup_amount",   :precision => 10, :scale => 2
      t.integer  "trial_period",                                  :default => 1
      t.string   "trial_interval",                                :default => 'months'
      t.integer  "user_limit"
      t.float    "unit_price"
      t.text     "description"
      t.boolean  "featured",                                      :default => false
    end

    create_table "subscriptions", :force => true do |t|
      t.decimal  "amount",                    :precision => 10, :scale => 2
      t.datetime "next_renewal_at"
      t.string   "card_number"
      t.string   "card_expiration"
      t.datetime "created_at"
      t.datetime "updated_at"
      t.string   "state",                                                    :default => "trial"
      t.integer  "subscription_plan_id"
      t.integer  "subscriber_id"
      t.integer  "renewal_period",                                           :default => 1
      t.string   "billing_id"
      t.integer  "user_limit"
      t.integer  "subscription_discount_id"
      t.integer  "subscription_affiliate_id"
      t.string   "subscriber_type",                                          :default => "User"
    end

    add_index "subscriptions", ["subscriber_id", "subscriber_type"], :name => "index_subscriptions_on_subscriber_id_and_subscriber_type"

    create_table "users", :force => true do |t|
      t.string   "name"
      t.string   "email",                                   :null => false
      t.string   "encrypted_password",                      :null => false
      t.string   "password_salt",                           :null => false
      t.datetime "last_sign_in_at"
      t.datetime "current_sign_in_at"
      t.string   "last_sign_in_ip"
      t.string   "current_sign_in_ip"
      t.integer  "account_id"
      t.boolean  "admin",                :default => false
      t.datetime "created_at"
      t.datetime "updated_at"
      t.string   "confirmation_token"
      t.datetime "confirmed_at"
      t.datetime "confirmation_sent_at"
      t.string   "reset_password_token"
      t.string   "remember_token"
      t.datetime "remember_created_at"
      t.integer  "sign_in_count",        :default => 0
      t.integer  "failed_attempts",      :default => 0
      t.string   "unlock_token"
      t.datetime "locked_at"
    end

    add_index "users", ["account_id"], :name => "index_users_on_account_id"
    add_index "users", ["confirmation_token"], :name => "index_users_on_confirmation_token", :unique => true
    add_index "users", ["email"], :name => "index_users_on_email"
    add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true
    add_index "users", ["unlock_token"], :name => "index_users_on_unlock_token", :unique => true
  end

  def self.down
    drop_table "accounts"
    drop_table "subscription_affiliates"
    drop_table "subscription_discounts"
    drop_table "subscription_payments"
    drop_table "subscription_plans"
    drop_table "subscriptions"
    drop_table "saas_admins"
  end
end
