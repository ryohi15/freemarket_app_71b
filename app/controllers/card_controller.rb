class CardController < ApplicationController

  require "payjp"

  def new
    card = Card.where(user_id: current_user.id)
    redirect_to action: "show" if card.exists?
  end

  def pay #payjpとCardのデータベース作成を実施します。
    Payjp.api_key = "sk_test_5da731fc8cfd2337a1058a3e"
    if params['payjp-token'].blank?
      redirect_to action: "new"
    else
      customer = Payjp::Customer.create(
      description: '登録テスト', #なくてもOK
      email: current_user.email, #なくてもOK
      card: params['payjp-token'],
      metadata: {user_id: current_user.id}
      ) #念の為metadataにuser_idを入れましたがなくてもOK
      @card = Card.new(user_id: current_user.id, customer_id: customer.id, card_id: customer.default_card)
      if @card.save
        redirect_to action: "show"
      else
        redirect_to action: "pay"
      end
    end
  end

  def delete #PayjpとCardデータベースを削除します
    if set_card.blank?
    else
      Payjp.api_key = "sk_test_5da731fc8cfd2337a1058a3e"
      customer = Payjp::Customer.retrieve(set_card.customer_id)
      customer.delete
      set_card.delete
    end
      redirect_to action: "new"
  end

  def show #Cardのデータpayjpに送り情報を取り出します
    if set_card.blank?
      redirect_to action: "new" 
    else
      Payjp.api_key = "sk_test_5da731fc8cfd2337a1058a3e"
      customer = Payjp::Customer.retrieve(set_card.customer_id)
      @default_card_information = customer.cards.retrieve(set_card.card_id)
    end
  end

  private

  def set_card
    Card.where(user_id: current_user.id).first
  end


end