json.extract! comment, :id, :msg, :post_id, :user_id, :created_at, :updated_at
json.url comment_url(comment, format: :json)
