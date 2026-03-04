# Ruby < 4.0: Set uses @hash internally.  Replacing it with an
# RBTree gives us sorted iteration for free.

class SortedSet
  def initialize(*args)
    @hash = RBTree.new
    super
  end
end
