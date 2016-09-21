require "job_sorter/version"

class JobSorter

	def initialize
		@dependencies = Hash.new{|j,d| j[d] = []}
	end

	def add_job_dependency(job, *job_dependencies)
		@dependencies[job] = job_dependencies
	end

	def split_jobs(unsorted_jobs)
		s_jobs = unsorted_jobs.split(", ")
		s_jobs.each do |s|
			k, v = s.split(" => ")
			@m = add_job_dependency(k,v)
		end
	end

  def order_jobs(job_string)
  	job_sorter = JobSorter.new
  	job_sorter.split_jobs(job_string)
  	
  end
end
