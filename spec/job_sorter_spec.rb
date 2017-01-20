require "spec_helper"

describe JobSorter do
  describe '.order_jobs' do
    let(:job_sorter) { JobSorter.new }

    context "given an empty String (no jobs)" do
      let(:job_string) { " " }
      it "is of type String" do
        expect(job_string).to be_a(String)
      end

      it "returns an empty String" do
        expect(job_sorter.order_jobs(job_string)).to eql(' ')
      end

    end

    context "given 'a => '" do
      let(:job_string) { "a" }

      it "is of type String" do
        expect(job_string).to be_a(String)
      end

      it "returns a String" do
        expect(job_sorter.order_jobs(job_string)).to be_a(String)
      end

      it "returns 'a'" do
        expect(job_sorter.order_jobs(job_string)).to eq('a')
      end

      it "contains exactly 'a'" do
        expect([job_sorter.order_jobs(job_string)]).to contain_exactly('a')
      end
    end

    context "given 'a => , b => , c => '" do
      let(:job_string) { "a => , b => , c => " }

      it "is of type String" do
        expect(job_string).to be_a(String)
      end

      it "returns a String" do
        expect(job_sorter.order_jobs(job_string)).to be_a(String)
      end

      it "returns 'a b c'" do
        expect(job_sorter.order_jobs(job_string)).to eq('a b c')
      end
    end

    context "given 'a => , b => c, c => '" do
      let(:job_string) { "a => , b => c, c => " }

      it "is of type String" do
        expect(job_string).to be_a(String)
      end

      it "returns a String" do
        expect(job_sorter.order_jobs(job_string)).to be_a(String)
      end

      it "returns 'a c b'" do
        expect(job_sorter.order_jobs(job_string)).to eq('a c b')
      end

    end

    context "given 'a => , b => c, c => f, d => a, e => b, f => '" do
      let(:job_string) { "a => , b => c, c => f, d => a, e => b, f => " }
      it "is of type String" do
        expect(job_string).to be_a(String)
      end

      it "returns a String" do
        expect(job_sorter.order_jobs(job_string)).to be_a(String)
      end

      it "returns 'a f c b d e'" do
        expect(job_sorter.order_jobs(job_string)).to eq('a f c b d e')
      end

    end

    context "given 'a => , b => , c => c'" do
      let(:job_string) { "a => , b => , c => c" }
      it "is of type String" do
        expect(job_string).to be_a(String)
      end

      it "raises error: job cannot have self-dependency" do
        expect{job_sorter.order_jobs(job_string)}.
          to raise_error(RuntimeError, 'Job cannot have self-dependency.')
      end
    end

    context "given 'a => , b => c, c => f, d => a, e => , f => b" do
      let(:job_string) { "a => , b => c, c => f, d => a, e => , f => b" }
      it "is of type String" do
        expect(job_string).to be_a(String)
      end

      it "raises error: topological sorting cyclic" do
        expect{job_sorter.order_jobs(job_string)}.to raise_error(TSort::Cyclic)
      end
    end
  end
end
