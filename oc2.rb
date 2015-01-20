class TheBanker
  TO_EURO = {
    usd: 0.77818,
    gbp: 1.27341,
    cad: 0.70518,
    aud: 0.69052,
    eur: 1.0
  }

  FROM_EURO = {
    usd: 1.28356,
    gbp: 0.78478,
    cad: 1.41613,
    aud: 1.44651,
    eur: 1.0
  }

  def self.convert(amount, from_currency, to_currency)
    value_old = amount * TO_EURO[from_currency]
    value_new = value_old * FROM_EURO[to_currency]
    value_new.round(3)
  end
end

describe TheBanker do 
  describe "#USD to Euro" do 
    it "should give the right amount of €" do
      expect(TheBanker.convert(100, :usd, :eur)).to eq(77.818)
    end
  end

  describe "#Euro to GbP" do 
    it "should give the right amount of €" do
      expect(TheBanker.convert(100, :eur, :gbp)).to eq(78.478)
    end
  end

  describe "#CAD to GbP" do 
    it "should give the right amount of €" do
      expect(TheBanker.convert(100, :usd, :gbp)).to eq(61.07)
    end
  end

  

end






