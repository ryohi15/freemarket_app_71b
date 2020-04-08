class PurchaseController < ApplicationController
  before_action :set_item, only: %i[pay]
  before_action :set_card, only: %i[show pay]

  require 'payjp'

  def show
    @item = Item.find(params[:id])
    @prefecture = Prefecture.find(params[:id])
    #Cardテーブルは前回記事で作成、テーブルからpayjpの顧客IDを検索
    if @card.blank?
      #登録された情報がない場合にカード登録画面に移動
      redirect_to controller: "card", action: "new"
    else
      Payjp.api_key = "sk_test_5da731fc8cfd2337a1058a3e"
      #保管した顧客IDでpayjpから情報取得
      customer = Payjp::Customer.retrieve(@card.customer_id)
      #保管したカードIDでpayjpから情報取得、カード情報表示のためインスタンス変数に代入
      @default_card_information = customer.cards.retrieve(@card.card_id)
    end
  end

  def pay
    Payjp.api_key = "sk_test_5da731fc8cfd2337a1058a3e"
    Payjp::Charge.create(
    amount: @item.price, #支払金額を入力（itemテーブル等に紐づけても良い）
    customer: @card.customer_id, #顧客ID
    currency: 'jpy', #日本円
  )
  @item.update(buyer_id: current_user.id)
  redirect_to action: 'done' #完了画面に移動
  end


  private
  def set_item
    @item = Item.find(params[:id])
  end

  def set_card
    @card = Card.where(user_id: current_user.id).first
  end

end