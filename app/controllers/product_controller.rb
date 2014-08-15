require 'product.rb'
class ProductController < ApplicationController
  def show
    id = params[:id] || 1
    @product = Product.find(id)
    @img_show = 1
    @related_products = Product.where("id > ?",id).take(5)
    #render layout: "product"
  end
  def sitemap
    @amazon_products = Product.all.to_a
    @related_keywords = VideoRelatedKeyword.where(:keyword_string => "羽毛球拍").first
    unless @related_keywords.nil?
      @related_keywords_list = VideoRelatedKeyword.where(:keyword_string => @related_keywords.related_keywords.split(","))
    end
    #render layout: "product"
  end
end
