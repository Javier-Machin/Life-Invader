module UsersHelper
  
  def allows_friends?(user)
    if  current_user.friends.include?(user) || 
        current_user.requests_received.any? { |req| req.sender == user } || 
        current_user.friend_requests.any? { |req| req.receiver == user }
      return false
    end
    true
  end
  
end
