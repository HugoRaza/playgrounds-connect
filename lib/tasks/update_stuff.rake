namespace :update_stuff do
  desc "Update participations statuses"
  task participations: :environment do
    Update.statuses
  end
end
