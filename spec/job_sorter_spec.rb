require "spec_helper"

describe JobSorter do
	describe '.order_jobs' do
		let(:job_sorter) { JobSorter.new }

		context "given 'a => '" do
			let(:job_string) { "a" }

			it "is a string" do
				expect(job_string).to be_a(String)
			end
		end

		context "given 'a => , b => , c => '" do
			let(:job_string) { "a => , b => , c => " }

			it "is a string" do
				expect(job_string).to be_a(String)
			end
		end

		context "given 'a => , b => c, c => '" do
			let(:job_string) { "a => , b => c, c => " }

			it "is a string" do
				expect(job_string).to be_a(String)
			end
		end

		context "given 'a => , b => c, c => f, d => a, e => b, f => '" do
			let(:job_string) { "a => , b => c, c => f, d => a, e => b, f => " }
			it "is a string" do
				expect(job_string).to be_a(String)
			end
		end

		context "given 'a => , b => , c => c'" do
			let(:job_string) { "a => , b => , c => c" }
			it "is a string" do
				expect(job_string).to be_a(String)
			end
		end

		context "given 'a => , b => c, c => f, d => a, e => , f => b" do
			let(:job_string) { "a => , b => c, c => f, d => a, e => , f => b" }
			it "is a string" do
				expect(job_string).to be_a(String)
			end
		end
	end
end
