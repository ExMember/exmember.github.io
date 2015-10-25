# How to Write Specifications

## What is a specification?

Before we can write a specification we have to know what it is.

Specification is a noun, derived from the verb specify. So a specification is
the result of specifying, or something that specifies. To specify is to state
explicitly or in detail.

For our purpose let's say a specification is the thing that identifies how a
piece of software should behave.

## Implicit specifications

I expect a lot of software engineers to tell me they don't have specifications.
I will agree that they don't have explicit specifications. But specifications
are necessary and unavoidable. Would you write a function without knowing what
it does? An application?

Implicit specifications have a lot of upsides. They are very easy to create,
springing into existence with no little or no effort. They are equally easy to
change, as fluid as thought itself.

This flexibility is also a downside of implicit specifications. When the
behavior changes constantly and without warning it is very difficult for
other components or users to effective use the software component. When the
specification changes constantly it's difficult to even write code that meets
the specification, you are trying to hit a moving target.

Complicated or confusing specifications exasperate the problems. When implicit
they change for no other reason than it is not possible to maintain them
completely in working memory.

## English specification

## Legalese specifications

## Executable specifications

Let's talk about how to write specifications.

You can write them in English if you like. But English is a very imprecise
language. Anything you write will be easy to misinterpret and fail to include
some details.

If you try to write very formal English you will end up with what we call
legalese. It will be incredibly difficult to read and write and it will still be
subject to misinterpretation and missing details.

Write your specifications in code. Executable software is the only effective way
to describe the behavior of executable software.

Write your specifications, in executable software, and then use that software to
drive your development.

I call it specification-driven development!
