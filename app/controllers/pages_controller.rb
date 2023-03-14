class PagesController < ApplicationController
	def home
		
	end

	def live_draft

		if params['d1'].present? && Group.where(id: params['group_id']).pluck(:draft_order_1).join().blank? 
			Group.where(id: params['group_id']).update_all draft_order_1: params['d1'], draft_order_2: params['d2'], draft_order_3: params['d3'], draft_order_4: params['d4']
			Group.where(id: params['group_id']).update_all live_draft_start: true
			redirect_to pages_live_draft_path(draft: 'live', group_id: params['group_id'])
		end

		group = Group.find_by(id: params['group_id'])
		@total_draft = []
		order_start = [group.draft_order_1, group.draft_order_2, group.draft_order_3, group.draft_order_4]
		order_end = [group.draft_order_4, group.draft_order_3, group.draft_order_2, group.draft_order_1]

		8.times do 
			order_start.each do |i|
				@total_draft.push(i)
			end
			order_end.each do |i|
				@total_draft.push(i)
			end
		end

		return
	end
end