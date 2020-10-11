require 'mechanize'

class FightCrawler

  def initialize url
    agent = Mechanize.new
    @page = agent.get url
  end

  def fights
    lines = fights_table.search 'tr'
    lines.each do |line|
      columns = line.search 'td'
      puts "#{columns[1].text.strip} x #{columns[3].text.strip}" rescue NoMethodError 
    end
  end

  def fights_table
    @page.search '.toccolours'
  end

end

crawler = FightCrawler.new 'https://pt.wikipedia.org/wiki/UFC_229'
crawler.fights