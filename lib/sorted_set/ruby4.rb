# Ruby >= 4.0: Set is a built-in class backed by C code and no longer
# uses @hash.  Subclassing Set automatically includes
# Set::SubclassCompatible, which delegates composite operations to
# primitive methods.  We override those primitives to use RBTree.

class SortedSet
  def initialize(enum = nil, &block)
    @tree = RBTree.new
    super
  end

  def add(o)
    @tree[o] = true
    self
  end
  alias << add

  def delete(o)
    @tree.delete(o)
    self
  end

  def include?(o)
    @tree.has_key?(o)
  end
  alias member? include?

  def each(&block)
    block or return enum_for(__method__) { size }
    @tree.each_key(&block)
    self
  end

  def size
    @tree.size
  end
  alias length size

  def empty?
    @tree.empty?
  end

  def clear
    @tree.clear
    self
  end

  def replace(enum)
    if enum.instance_of?(self.class)
      @tree = enum.instance_variable_get(:@tree).dup
    else
      clear
      merge(enum)
    end
    self
  end

  def to_a
    @tree.keys
  end

  def hash
    @tree.keys.hash
  end

  def freeze
    @tree.freeze
    super
  end

  def initialize_dup(orig)
    super
    @tree = orig.instance_variable_get(:@tree).dup
  end

  def initialize_clone(orig, freeze: nil)
    super
    # When freeze is nil, clone preserves the frozen state of orig.
    @tree = orig.instance_variable_get(:@tree).clone(freeze: freeze.nil? ? orig.frozen? : freeze)
  end
end
