require 'tsort'

class JobSorter
  include TSort

  def initialize
    @dependencies = dependencies
  end

  def self.order_jobs(job_string)
    job_sorter = JobSorter.new
    job_sorter.split_and_add_jobs(job_string)

    join_jobs(job_sorter)
  end

  def split_and_add_jobs(unsorted_jobs)
    split_jobs(unsorted_jobs).map { |job| add_jobs(job) }
  end

  private

  def add_jobs(new_job)
    key, value = new_job.split(' => ')

    key === value ? self_dependency_error(key) : add_job_dependency(key, value)
  end

  def self_dependency_error(key)
    raise 'Job cannot have self-dependency.'
  end

  def add_job_dependency(job, *job_dependencies)
    @dependencies[job] = job_dependencies
  end

  def split_jobs(unsorted_jobs)
    unsorted_jobs.split(', ')
  end

  def self.join_jobs(job_sorter)
    job_sorter.tsort.join(' ')
  end

  def tsort_each_node(&block)
    @dependencies.each_key(&block)
  end

  def tsort_each_child(job, &block)
    @dependencies[job].each(&block) if @dependencies.has_key?(job)
  end

  def dependencies
    Hash.new{ |job, dependency| job[dependency] = [] }
  end
end
