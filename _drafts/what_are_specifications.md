# Types of Specifications

## What is a specification?

Before we can write a specification we have to know what it is.

Specification is a noun, derived from the verb to specify. To specify is to
state explicitly or in detail. So a specification is the result of stating
explicitly or in detail, or something that states explicitly or in detail.

For our purpose let's say a specification is the thing that identifies how a
piece of software should behave.

## No specifications

For a lot of people software specifications have a bad rap. They are considered
an unpleasant way to add a lot of overhead to development and avoidable unless
you are part of a large bureaucracy or somewhere the stakes are exceptionally
high, like NASA or a large bank.

But specifications are unavoidable. If you don't know what a method does how
could you possibly know how to write it? How would you know when you are done?
If you don't know what the application is supposed to do, how do you know if
it is doing it right?

## Implicit specifications

When a specification is not completely captured or communicated I call it an
implicit specification.  An implicit specification is any specification that
doesn't exist outside of someone's head.

Implicit specifications have a lot of upsides. They are very easy to create,
springing into existence with no little or no effort. They are equally easy to
change, as fluid as thought itself.

This flexibility is also the downside of implicit specifications. When the
behavior changes constantly and without warning it is very difficult to
effectively use the software. When the specification changes constantly it's
difficult to write code that meets the it; you are trying to hit a moving
target.

Large, complicated, or confusing specifications exasperate the problem. When
implicit, these specifications change for no other reason than it is not
possible to maintain them completely in working memory.

Keeping specifications implicit also makes it easy to overlook problems such as
ambiguity, incompleteness, or inconsistency.

Finally, implicit specifications are impossible to communicate. To express them
in language is to make them explicit. If the communication is not captured,
for example a water-cooler conversation, then the explicit specification is lost
forever and what you have left is multiple implicit specifications.

## Plain English specification

A plain English specification is a specification written in plain English.[0]

One of the curious characteristics of English is that it is ambiguous and
imprecise. For example, if I say something is biweekly, does that mean it
happens every three-and-a-half days or every fourteen days? If I say your
account is locked after too many failed login attempts, how many is too many?

## Legalese specifications

Eliminating ambiguities and ensuring precision in language is the same work a
lawyer does when writing a contract or other legal document. The outcomes are
are also very similar. I call these legalese specifications.

Even for experts, writing and reading legalese takes considerable effort. And
after all their training, experience, expertise, and effort, the existence of
courts demonstrates that legalese is still not always as precise or unambiguous
as needed.

## Executable specifications

An executable specification is computer code that specifies how another computer
program works.

Executable specifications are precise and unambiguous by their nature as
computer code.

Executable specifications are also cheap to keep around for regression testing.
A computer can test your application in seconds or minutes against a
specification that a human would spend days or weeks on.

## Recommendations

You can't actually do without specifications. My recommendation is that you
write them down and you write them in as computer code. Executable software is
the only effective way to describe the behavior of executable software.

Write your specifications, in executable software, and then use that software to
drive your development.

I call it specification-driven development.

[0] Everything I say about plain English specifications is most likely true
about specifications written in any natural language.
