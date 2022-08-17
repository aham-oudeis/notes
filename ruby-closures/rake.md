## Rake

Rake is a Rubygem used for automating many common functions required to build, test, package, and install programs.

** Why use Rake? **

A generic benefit of automation: while performing all the tasks manually is possible, such manual method is prone to error and time-consuming. Rake handles all of that by automating the common tasks.

For instance: (Copied from [here](https://launchschool.com/books/core_ruby_tools/read/rake).)
    Set up required environment by creating directories and files
    Set up and initialize databases
    Run tests
    Package your application and all of its files for distribution
    Install the application
    Perform common Git tasks
    Rebuild certain files and directories (assets) based on changes to other files and directories

Rake uses the `Rakefile` from the project directory. Both `Gemfile` and `Rakefile` live in the same directory. In the `Rakefile` we describe the tasks that need to be performed and when we run rake with `bundle exec rake -T`, it lists all the tasks described in the `Rakefile`. When we run rake with the command `bundle exec rake task_name`, it runs the specific task named `task_name`.

Example of a `Rakefile`

```ruby
desc 'Say hello'
task :hello do
  puts "Hello there. This is the `hello` task."
end

desc 'Say goodbye'
task :bye do
  puts 'Bye now!'
end

desc 'Do everything'
task :default => [:hello, :bye]
# => point to the dependency; that is, running the task :default requires running
# both the :hello and :bye tasks.
```
