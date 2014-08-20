class Global
  @subject = 'golf'
  @brand = '高尔夫球'
  @video_keywords = %w{高尔夫球 高尔夫球视频 高尔夫球教学视频}
  @video_head_desc = "极好的高尔夫球视频."
  @product_keywords = %w{高尔夫球 高尔夫球杆 高尔夫球装备}
  @product_head_desc = "高尔夫球特价、新款装备."
  def self.subject 
    @subject
  end
  def self.brand
    @brand
  end
  def self.video_keywords
    @video_keywords.join(",")
  end
  def self.video_head_desc
    @video_head_desc
  end
  def self.product_keywords
    @product_keywords
  end
  def self.product_head_desc
    @product_head_desc
  end
end
