# How to Write Specifications

## What is a specification?

Before we can write a specification we have to know what it is.

Specification is a noun, derived from the verb to specify. To specify is to
state explicitly or in detail. So a specification is the result of stating
explicitly or in detail, or something that states explicitly or in detail.

For our purpose let's say a specification is the thing that identifies how a
piece of software should behave.

## No specifications

Alice and Barbara don't use specifications, at least that's what they told me.
All that overhead was too much work and unpleasant to boot. It might be
necessary for a large bureaucratic company, or useful at NASA or a large bank
where the stakes are really high, but they are a small startup and flying by the
seat of their pants so they don't need or use any specifications.

I asked Barbara to show me the last function she had written. Then I asked her
what it did.

"It calculates the distance between the user's eyes."

I asked Alice what the application they were working on does.

"It rates your funny-face making skills relative to your friends."

Alice and Barbara did have specifications. Barbara knew what her function was
supposed to do. Alice knew what the application was supposed to do. Those are
specifications.

Specifications are unavoidable. If you don't know what it does how could you
possibly know what to write? How would you know when you are done?

When a specification is not completely captured or communicated I call it an
implicit specification.

## Implicit specifications

An implicit specification is any specification that doesn't exist outside of
someone's head.

Implicit specifications have a lot of upsides. They are very easy to create,
springing into existence with no little or no effort. They are equally easy to
change, as fluid as thought itself.

This flexibility is also a downside of implicit specifications. When the
behavior changes constantly and without warning it is very difficult for users
to effectively use the software. When the specification changes constantly it's
difficult to write code that meets the specification; you are trying to hit a
moving target.

Complex or confusing specifications exasperate the problems. When implicit, they
change for no other reason than it is not possible to maintain them completely
in working memory.

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
happens every three and a half days or every fourteen days? (TODO: imprecise
example)

## Legalese specifications

Eliminating ambiguities and ensuring precision in language is the same work a
lawyer does when writing a contract or other legal document and the outcomes are
very similar. I call these legalese specifications.

Even for experts, writing and reading legalese takes considerable effort. And
after all their training, experience, expertise, and effort, the existence of
courts demonstrates that the writing is still not always as precise or
unambiguous as needed.

## Executable specifications

An executable specification is computer code that specifies how another computer
program works.

Executable specifications are precise and unambiguous by their nature as
computer code.

==

TODO: English, not "natural language" Probably lots more concreteness in examples
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

[0] Everything I say about plain English specifications is most likely true
about specifications written in any natural language.
