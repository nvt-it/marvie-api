class UserService
  def initialize(params)
    @params = params
  end

  private

  attr_reader :params

  def verify(attributes)
    record = ::User.find_or_new(params['localId'])
    
    ApplicationRecord.transaction do
      user_attributes = mapping_user_attributes.merge(attributes.except(:uid))

      record.assign_attributes(user_attributes)
      record.save!
    end

    [record.try(:id), record.try(:token)]
  end

  def mapping_user_attributes
    {
      uid: params['localId'],
      name: params['displayName'],
      email: params['email'],
      avatar_url: params['photoUrl']
    }
  end
end