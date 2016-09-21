# JobSorter

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'job_sorter'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install job_sorter

## About this gem

job_sorter takes in a single string of jobs and their dependencies, e.g. `"a => , b => c, c => "` and then sorts them using TSort, returning the result as a string.

1. Require job_sorter: `require "job_sorter"`
2. Create your object: `job_sorter = JobSorter.new`
3. Create your job string: `job_string = "FILL ME IN"`
4. Run the method: `result = job_sorter.order_jobs(job_string)`

TSort automatically re-arranges any elements in a nested hash to a topologically-sorted collection.
It also has a built-in function for detecting cyclic dependencies: `TSort::Cyclic`

## The Challenge

Imagine we have a list of jobs, each represented by a character. Because certain jobs must be done before others, a job may have a dependency on another job. For example, a may depend on b, meaning the final sequence of jobs should place b before a. If a has no dependency, the position of a in the final sequence does not matter.

* Given you're passed an empty string (no jobs), the result should be an empty sequence.

* Given the following job structure:

`a => `

The result should be a sequence consisting of a single job a.

* Given the following job structure:

`a =>
b =>
c =>`

The result should be a sequence containing all three jobs abc in no significant order.

* Given the following job structure:

`a =>
b => c
c =>`

The result should be a sequence that positions c before b, containing all three jobs abc.

* Given the following job structure:

`a =>
b => c
c => f
d => a
e => b
f =>`

The result should be a sequence that positions f before c, c before b, b before e and a before d containing all six jobs abcdef.

* Given the following job structure:

`a =>
b =>
c => c`

The result should be an error stating that jobs can't depend on themselves.

* Given the following job structure:

`a =>
b => c
c => f
d => a
e => 
f => b`

The result should be an error stating that jobs can't have circular dependencies.

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/rubyandcoffee/job_sorter.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

