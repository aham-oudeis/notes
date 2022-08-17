# Minitest vs. Rspec

While Rpec is DSL(Domain Specific Language) for writing tests, Minitest offers both assertion style as well as expection style syntax.

In expectation style, tests are grouped in `describe` blocks and each test is run with `it` method call.

#### assertion-style

```ruby
class OperationTest < Minitest::Test
  def test_square_float
    assert_equal(4.0, Operation.square(2.0))
  end
end
```

#### expectation-style

```ruby
describe "Squaring numbers" do
  it "returns 4.0 for 2.0" do
    _(Operation.square(2)).must_equal 4.0
  end
end
```
