class AmazonProduct < ActiveRecord::Base
  self.table_name = "#{Global.subject}_amazon_products"
end
class AmazonCategory < ActiveRecord::Base
  self.table_name = "#{Global.subject}_amazon_categories"
end
