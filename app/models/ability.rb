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
    cannot :create, Buyer

    can %i(update destroy show), Buyer, id: @user.buyer.id
    can :update, User, id: @user.id
    can :create, Company if @user.buyer.company.nil?
    can :create, Complaint
    return unless @user.fully_verified?

    can :create, Bid
    can %i(index show), Auction
  end

  def seller_abilities
    cannot :create, Seller

    can :create, Complaint
    can %i(update destroy show), Seller, id: @user.seller.id
    can :update, User, id: @user.id
    can :create, Company if @user.seller.company.nil?
    return unless @user.fully_verified?

    can %i(index show create update destroy), Auction, seller_id: @user.seller.id
  end

  def admin_abilities
    can :manage, :all
  end
end
