## Assertions

`assert(test)`                      => Fails unless test is truthy.

`assert_equal(exp, act)` 	          => Fails unless exp == act.

`assert_nil(obj)` 	                => Fails unless obj is nil.

`assert_raises(*exp) { ... }` 	    => Fails unless block raises one of *exp.

`assert_instance_of(cls, obj)` 	    => Fails unless obj is an instance of cls.

`assert_includes(collection, obj)` 	=> Fails unless collection includes obj.

One important thing to note with `assert_equal` is that when we are comparing custom objects, we need to provide our own `==` method for comparing the objects.