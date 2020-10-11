require_relative "fight_crawler"

crawler = FightCrawler.new ARGV.first
crawler.fights