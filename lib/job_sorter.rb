require "tsort"
class JobSorter
  include TSort

  def self_dependency_error(k)
    raise "Job cannot have self-dependency."
  end

  def initialize
    @dependencies = Hash.new{ |j,d| j[d] = [] }
  end

  def add_job_dependency(job, *job_dependencies)
    @dependencies[job] = job_dependencies
  end

  def tsort_each_node(&block)
    @dependencies.each_key(&block)
  end

  def tsort_each_child(job, &block)
    @dependencies[job].each(&block) if @dependencies.has_key?(job)
  end

  def split_jobs(unsorted_jobs)
    s_jobs = unsorted_jobs.split(", ")
    s_jobs.each do |s|
      k, v = s.split(" => ")
      if k === v
        raise self_dependency_error(k)
      elsif v === nil
        @m = add_job_dependency(k)
      else
        @m = add_job_dependency(k,v)
      end
    end
  end

  def order_jobs(job_string)
    job_sorter = JobSorter.new
    job_sorter.split_jobs(job_string)
    job_sorter.tsort.join(" ")
  end
end
