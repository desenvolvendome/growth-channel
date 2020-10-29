require 'growth_channel/adSense/view'

RSpec.describe 'AdSense::View' do
  context 'count' do
    it 'total_views_per_video' do
      total_views_per_video = AdSense::View.new('spec/suports/report_adsense_sample.csv').total_views_per_video
      result = [
        { id_video_principal: 'v1', views: 411 + 301 },
        { id_video_principal: 'v10', views: 451 + 107 + 0 + 37 }
      ]
      expect(total_views_per_video).to eq(result)
    end

    it 'total_views_per_video_ideias' do
      groups = AdSense::View.new('spec/suports/report_adsense_sample.csv').get_videos_ideias
      result = [
        { id_video_principal: 'v1', views: 411 + 301 },
        { id_video_principal: 'v10', views: 107 + 0 + 37 }
      ]
      expect(groups).to match_array(result)
    end
  end
end
