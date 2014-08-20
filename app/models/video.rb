class Video < ActiveRecord::Base
  self.table_name = "#{Global.subject}_videos"
end

class VideoList < ActiveRecord::Base
  self.table_name = "#{Global.subject}_video_lists"
end

class RelatedKeyword < ActiveRecord::Base
  self.table_name = "#{Global.subject}_related_keywords"
end
