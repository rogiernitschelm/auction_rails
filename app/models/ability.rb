class Ability
  include CanCan::Ability

  def initialize(user)
    return guest_abilities unless user

    @user = user

    admin_abilities if user.admin?
    buyer_abilities if user.buyer?
    seller_abilities if user.seller?
  end

  private

  def guest_abilities
    can :create, Seller
    can :create, Buyer
    can :create, User
  end

  def buyer_abilities
    can %i(update destroy show), Buyer, id: @user.buyer.id
    can :update, User, id: @user.id
    can :create, Company if @user.buyer.company.nil?
    return unless @user.fully_verified?

    can :create, Bid
  end

  def seller_abilities
    can %i(update destroy show), Seller, id: @user.seller.id
    can :update, User, id: @user.id
    can :create, Company if @user.seller.company.nil?
    return unless @user.fully_verified?

    can :create, Auction
  end

  def admin_abilities
    can :manage, :all
  end
end
