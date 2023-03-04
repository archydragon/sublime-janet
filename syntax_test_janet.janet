# SYNTAX TEST "Janet.sublime-syntax"

# TOP DEFS

(def topdef "description" value)
#^ keyword.janet
#    ^ entity.name.constant.janet
#           ^ comment.block.documentation.janet

(defdyn *dynvar*
#^ keyword.janet
#       ^ entity.name.constant.janet
  "documentation")
# ^ comment.block.documentation.janet

(defglobal globalvar
#^ keyword.janet
#          ^ entity.name.constant.janet
  "documentation")
# ^ comment.block.documentation.janet


# DEFN

  (defn defglobal
#  ^ keyword.janet
#       ^ entity.name.function.janet
    "Dynamically create a global def."
#   ^ comment.block.documentation.janet
    [name value]
#   ^ punctuation.definition.group.begin.janet
#    ^ variable.other.janet
#         ^ variable.other.janet
#              ^ punctuation.definition.group.end.janet
    (def name* (symbol name))
#    ^ keyword.janet
#        ^ variable.other.janet
#               ^ keyword.janet
#                      ^ variable.other.janet
    (setdyn name* @{:value value})
#    ^ keyword.janet
#           ^ variable.other.janet
#                 ^ punctuation.accessor.mutable.janet
#                  ^ punctuation.definition.group.begin.janet
#                   ^ keyword.symbol.janet
#                          ^ variable.other.janet
    nil)
#   ^ constant.language.janet

  (defmacro when
#  ^ keyword.janet
#           ^ entity.name.function.janet
    "Evaluates the body when the condition is true. Otherwise returns nil."
#   ^ comment.block.documentation.janet
    [condition & body]
#   ^ punctuation.definition.group.begin.janet
#    ^ variable.other.janet
#              ^ punctuation.separator.optional.janet
#                ^ variable.other.janet
#                    ^ punctuation.definition.group.end.janet
    ~(if ,condition (do ,;body)))
#   ^ punctuation.accessor.readermac.janet
#     ^ keyword.janet
#        ^ punctuation.accessor.readermac.janet
#         ^ variable.other.janet
#                    ^ keyword.janet
#                       ^^ punctuation.accessor.readermac.janet
#                         ^ variable.other.janet


# CONSTANTS
[
  nil
# ^^^ constant.language.janet
  true
# ^^^^ constant.language.janet
  false
# ^^^^^ constant.language.janet
]


# NUMBERS

[
  1_000_000
# ^^^^^^^^^ constant.numeric.janet
  1.0
# ^^^ constant.numeric.janet
  1
# ^ constant.numeric.janet
  2.1
# ^^^ constant.numeric.janet
  1e10
# ^^^^ constant.numeric.janet
  2e10
# ^^^^ constant.numeric.janet
  1e-10
# ^^^^^ constant.numeric.janet
  2e-10
# ^^^^^ constant.numeric.janet
  1.123123e10
# ^^^^^^^^^^^ constant.numeric.janet
  1.123123e-10
# ^^^^^^^^^^^^ constant.numeric.janet
  -1.23e2
# ^^^^^^^ constant.numeric.janet
  -4.5e15
# ^^^^^^^ constant.numeric.janet
  -4.5e151
# ^^^^^^^^ constant.numeric.janet
  -4.5e200
# ^^^^^^^^ constant.numeric.janet
  -4.5e123
# ^^^^^^^^ constant.numeric.janet
  123123123123123123132123
# ^^^^^^^^^^^^^^^^^^^^^^^^ constant.numeric.janet
  0000000011111111111111111111111111
# ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ constant.numeric.janet
  .112312333333323123123123123123123
# ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ constant.numeric.janet
  0
# ^ constant.numeric.janet
  +0.0
# ^^^^ constant.numeric.janet
  -10_000
# ^^^^^^^ constant.numeric.janet
  16r1234abcd
# ^^^^^^^^^^^ constant.numeric.janet
  0x23.23
# ^^^^^^^ constant.numeric.janet
  1e10
# ^^^^ constant.numeric.janet
  1.6e-4
# ^^^^^^ constant.numeric.janet
  7r343_111_266.6&+10
# ^^^^^^^^^^^^^^^^^^^ constant.numeric.janet
]


# STRINGS
[
  "normal string"
# ^^^^^^^^^^^^^^^ string.quoted.double.janet
  "normal string with \\escape"
# ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ string.quoted.double.janet
#                     ^^ constant.character.escape.janet
  `another normal string`
# ^^^^^^^^^^^^^^^^^^^^^^^ string.quoted.double.janet
  ``and
  another
  one``
# ^^^^^ string.quoted.double.janet
  ```and
  even
  more
  !!!
  ```
# ^^^ string.quoted.double.janet
  @"string buffer"
# ^^^^^^^^^^^^^^^^ string.quoted.double.janet
  @`string buffer`
# ^^^^^^^^^^^^^^^^ string.quoted.double.janet
  @``string buffer``
# ^^^^^^^^^^^^^^^^^^ string.quoted.double.janet
  @```string buffer```
# ^^^^^^^^^^^^^^^^^^^^ string.quoted.double.janet
]


# SOME MORE TESTS

  (defn pairs
#  ^ keyword.janet
#       ^ entity.name.function.janet
    "Get the key-value pairs of an associative data structure."
#   ^ comment.block.documentation.janet
    [x]
#   ^ punctuation.definition.group.begin.janet
#    ^ variable.other.janet
#     ^ punctuation.definition.group.end.janet
    (def arr @[])
#    ^ keyword.janet
#        ^ variable.other.janet
#            ^ punctuation.accessor.mutable.janet
#             ^ punctuation.definition.group.begin.janet
#              ^ punctuation.definition.group.end.janet
    (var k (next x nil))
#    ^ keyword.janet
#        ^ variable.other.janet
#           ^ keyword.janet
#                ^ variable.other.janet
#                  ^ constant.language.janet
    (while (not= nil k)
#    ^ keyword.janet
#           ^ keyword.janet
#                ^ constant.language.janet
#                    ^ variable.other.janet
      (array/push arr (tuple k (in x k)))
#      ^ storage.type.class.janet
#            ^ variable.other.janet
#                 ^ variable.other.janet
#                      ^ keyword.janet
#                            ^ variable.other.janet
#                               ^ keyword.janet
#                                  ^ variable.other.janet
#                                    ^ variable.other.janet
      (set k (next x k)))
#      ^ keyword.janet
#          ^ variable.other.janet
#             ^ keyword.janet
#                  ^ variable.other.janet
#                    ^ variable.other.janet
    arr)
#   ^ variable.other.janet


# INVALID PARENS
(1 2 3)))
#      ^^ invalid.illegal.stray-bracket-end.janet
[1 2 3]]
#      ^ invalid.illegal.stray-bracket-end.janet
([)]
# ^ invalid.illegal.stray-bracket-end.janet
