## Testing Terminology

- [Testing Terminology](#testing-terminology)
  - [Test Suite](#test-suite)
  - [Test](#test)
  - [Assertions](#assertions)

### Test Suite
The entire set of the tests for an application or a program.

### Test
The test is a specific situation or context for which the tests are run. For instance, if we want a method to output a TypeError, we create a specific test to check if the method raises a TypeError. This specific scenario for which the tests are run is called a test.

You can have several assertions in a test, although some people prefer to have only one assertion per test.

```ruby
class Operation
  class << self
    def square(num)
      raise TypeError unless num.is_a? Integer
      num ** 2
    end
  end
end
```

For a method like this, we may want to test as follows: (with many ommitted details)

```ruby
require 'minitest/autorun'
require 'minitest/reporters'
Minitest::Reporters.use!

require_relative 'file_path'

class OperationTest < Minitest::Test
  def test_square_raises_type_error
    assert_raises(TypeError) { Operation.square("Hello") }
  end
end
```

### Assertions

The actual verification step to ensure that the application or program behaves exactly as anticipated.

```ruby
require 'minitest/autorun'
require 'minitest/reporters'
Minitest::Reporters.use!

class OperationTest < Minitest::Test
  def test_square_raises_type_error
    assert_raises(TypeError) { square("Hello") }
  end

  def test_square_float
    assert_equal(4.0, Operation.square(2.0))
  end

  def test_square_big_num
    num = 10383793830
    sq_num = num * num
    assert_equal(sq_num, Operation.square(num))
  end
end
```
