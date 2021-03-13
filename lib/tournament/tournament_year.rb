class TournamentYear
  include Singleton

  TY_MAPPING = 'tournament_year_mapping'
  YT_MAPPING = 'year_tournament_mapping'

  def self.year(tournament_id)
    new.year(tournament_id)
  end

  def self.tournament_id(year)
    new.tournament_id(year)
  end

  def tournament_id(year)
    yt_mapping[year]
  end

  def year(tournament_id)
    ty_mapping[tournament_id]
  end

  private
  def ty_mapping
    # load_mapping
    Rails.cache.fetch(TY_MAPPING, compress: false) {load_mapping}
  end

  def yt_mapping
    # load_mapping.invert
    Rails.cache.fetch(YT_MAPPING, compress: false) {load_mapping.invert}
  end

  def load_mapping
    # byebug
    # return @mapping unless @mapping.nil?
    Tournament.select(:id, :year).as_json.each_with_object({}) do |row, hash|
      hash[row['id']] = row['year']
    end
    # Rails.cache.write(TY_MAPPING, map)
    # Rails.cache.write(YT_MAPPING, map.invert)
    # map
  end
end