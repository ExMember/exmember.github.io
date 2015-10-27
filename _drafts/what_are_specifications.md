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

Keep specifications explicit also makes it easy to overlook problems such as
ambiguity, incompleteness, or inconsistency.

Finally, implicit specifications are impossible to communicate. To express them
in language is to make them explicit. If the communication is not captured,
for example a water-cooler conversation, then the explicit specification is lost
forever and what you have left is multiple implicit specifications.

## Natural language specification

The desire for communication often leads to written specifications. The process
usually looks something like this:

Alice has an idea about how a piece of software should work. This is an implicit
specification. Alice tries to communicate this specification to Barbara. Barbara
now has an idea of how the code should work so she goes off and writes it.

Barbara brings the code she has written back to Alice and Alice discovers it
doesn't meet her idea of what the code should do. Both Alice and Barbara are
very frustrated.

There are several ways this can happen and in most cases all of these factors
are present to varying extent.

- Alice and Barbara's initial communication could have been flawed
- Alice's implicit specification could have changed since their communication
- Barbara's implicit specification could have changed since their communication

Alice and Barbara recognize what's has happened and come up with a plan to write
down what it is the code is supposed to do so that they know they have the same
idea of what it's supposed to do and that idea doesn't change without them
knowing it.

They write in the same language they communicate in and the result is a
specification that is no longer implicit, but written in a natural language.

## Legalese specifications

One of the curious characteristics of natural languages is that they are
ambiguous. There is little consensus on the date of "next Wednesday."


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
