# SortedSet Changelog

## 1.1.0 (2026-03-05)

* Enhancements
  * Support Ruby 4.0, where Set is a built-in C class that no longer uses `@hash`.  SortedSet now overrides primitive methods and relies on `Set::SubclassCompatible` for composite operations.
  * Support JRuby with Ruby 4.0 compatibility, using `java.util.TreeSet` as the backing store instead of rbtree.
  * Remove the runtime dependency on the set gem, which is part of the standard library or built-in across all supported Ruby versions.

## 1.0.3 (2021-02-13)

* Enhancements
  * Switch back to the original [rbtree](https://rubygems.org/gems/rbtree) gem, which added support for Ruby >=3.0.

## 1.0.2 (2020-12-24)

* Enhancements
  * Switch to the [rbtree3](https://github.com/kyrylo/rbtree3) gem to support Ruby >=3.0.

## 1.0.1 (2020-12-22)

* Enhancements
  * Be a no-op library for JRuby, as it has its own version of Set and SortedSet.

## 1.0.0 (2020-12-22)

This is the first release of sorted_set as a gem.  Here lists the changes since the version bundled with Ruby 2.7.

* Breaking Changes
  * The pure-ruby fallback implementation has been removed.  It now requires an RBTree library to install and run.
