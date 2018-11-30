class FollowTable < ActiveRecord::Migration
  def change
    create_table :follow do |follows|
      follows.column :follower_id, :integer
      follows.column :following_id, :integer
    end
  end
end


# estw user 1 , user 2 , user 3
# follower_id  , following_id
#     3        ,      1               o 3 akolou8ei ton 1 dld  /users/3/all_users/1
#     3        ,      2               o 3 akolou8ei ton 2 dld  /users/3/all_users/2
#     2        ,      3               o 2 akolou8ei ton 3 dld  /users/2/all_users/3
#
# 8elw na vrw poious akolou8ei o 3
# select following_id
# from follow
# where follower_id=3
