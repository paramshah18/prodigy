module Api
  module V1
    class ActivitiesController < ApplicationController
      def day_plan
        day = params[:day].to_i
        return render json: { error: 'Invalid day' }, status: 400 unless (14..21).include?(day)

        activities = ProgramDay.includes(:activity)
                               .where(day: day)
                               .map(&:activity)
                               .uniq

        response = activities.map do |activity|
          {
            id: activity.id,
            title: activity.title,
            category: activity.category,
            frequency: activity.frequency,
            duration: activity.duration,
            completed: ActivityCompletion.exists?(activity_id: activity.id, day: day, completed: true)
          }
        end

        render json: {
          day: day,
          remaining_activities: response.count { |a| !a[:completed] },
          activities: response
        }
        
      end
    end
  end
end
