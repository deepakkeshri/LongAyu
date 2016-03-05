class Ability
  include CanCan::Ability

  def initialize(account)
    # Define abilities for the passed in user here. For example:
    #
       account ||= Account.new # guest user (not logged in)
       if account.has_role? :admin
         can :manage, :all#[Property,FacilityType,ServiceType,CentreType,StaffType,Patient]
       elsif account.has_role? :branch_admin
         can :manage,[Property,Account], :account_id => account.id
         can [:show, :read,:create,:edit,:update,:destroy],[Centre], :id => account.centre.id
         can [:read,:create,:edit,:update,:destroy],[Staff]#, :property_id => property.id
         #can [:edit],Password
         can [:data_import,:import], Centre
         can [:read,:create,:edit,:update,:destroy],[Service,Facility]
       elsif account.has_role? :branch
         can [:show,:edit,:update],[Centre], :id => account.centre.id
         can [:read],[Centre,Staff]
         can [:read,:create,:edit,:update,:destroy],[Service,Facility,Staff]#, :centre_id => centre.id
       elsif account.has_role? :patient
         can [:edit,:update,:show],[Patient,Account], :account_id => account.id
         can :book, Service
       else
         can [:create,:signin,:signup], Property
         can :book, Service
       end
    #
    # The first argument to `can` is the action you are giving the user 
    # permission to do.
    # If you pass :manage it will apply to every action. Other common actions
    # here are :read, :create, :update and :destroy.
    #
    # The second argument is the resource the user can perform the action on. 
    # If you pass :all it will apply to every resource. Otherwise pass a Ruby
    # class of the resource.
    #
    # The third argument is an optional hash of conditions to further filter the
    # objects.
    # For example, here the user can only update published articles.
    #
    #   can :update, Article, :published => true
    #
    # See the wiki for details:
    # https://github.com/ryanb/cancan/wiki/Defining-Abilities
  end
end
