require 'csv'
require 'growth_channel/util/manage_csv'

module OrganicViews
  class View

    def initialize
      @@report = ManageCSV.read_csv_youtube
    end

    def total_views_per_video
      total_per_video = []
      videos_per_version.each do |version|
        id_main_video = version.first[:id_main_video]
        sum_views = version.inject(0) { |sum, hash| sum + hash[:views] }

        total_per_video.push({id_main_video: id_main_video, views: sum_views})
      end
      total_per_video
    end

    private

    def read_per_video
      main_videos = []
      @@report.each do |row|
        id_main_video = row["Video title"].split(":").first
        version = id_main_video.split(".").last.to_i
        if version == 0
          views = row["Views"].to_i
          main_videos.push({id_main_video: id_main_video, views: views})
        end
      end
      main_videos
    end
    

    def videos_per_version
      read_per_video.group_by { |h| h[:id_main_video] }.values
    end

  end
end