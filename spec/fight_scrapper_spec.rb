require_relative 'spec_helper'
require_relative '../fight_scrapper'

RSpec.describe FightScrapper do
  
  describe '#fights_table' do
    context 'when page doesnt have expected table' do
      it 'is expected to return empty list' do
        scrapper = FightScrapper.new "file:///#{File.dirname(__FILE__)}/github.html"
        expect(scrapper.fights_table).to match []
      end
    end
    context 'when page has expected table' do
      it 'is expected to return table element' do
        scrapper = FightScrapper.new "file:///#{File.dirname(__FILE__)}/ufc_229.html"
        expect(scrapper.fights_table).not_to match []
      end
    end
  end

  describe '#fights' do
    it 'is expected to generate std_out' do
      scrapper = FightScrapper.new "file:///#{File.dirname(__FILE__)}/ufc_229.html"
      expect { scrapper.fights }.to output.to_stdout
    end
    it 'is expected to print all fights from card' do
      scrapper = FightScrapper.new "file:///#{File.dirname(__FILE__)}/ufc_229.html"
      expected_output = "Khabib Nurmagomedov (c) x Conor McGregor\nTony Ferguson x Anthony Pettis\nDominick Reyes x Ovince St. Preux\nDerrick Lewis x Alexander Volkov\nMichelle Waterson x Felice Herrig\nJussier Formiga x Sergio Pettis\nVicente Luque x Jalin Turner\nAspen Ladd x Tonya Evinger\nScott Holtzman x Alan Patrick\nYana Kunitskaya x Lina Länsberg\nNik Lentz x Gray Maynard\nAnthony Rocco Martin x Ryan LaFlare\n"
      expect { scrapper.fights }.to output(expected_output).to_stdout
    end
  end

end