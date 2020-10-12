require_relative "fight_scraper"

scraper = FightScraper.new ARGV.first
scraper.fights