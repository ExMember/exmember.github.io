# Specifications not Tests

Stop writing tests. I want you to stop writing tests for your code. Stop writing
tests and start writing specifications.

## Judgement

Tests render judgement. You can fail a test. And if you fail a test what does
that make you? A failure.

Specifications do not render judgement. You can confirm to a specification or
you can not confirm to a specification. That is a choice you get to make. If you
are writing an email server, you will probably want to confirm the IMAP
specification. If you are writing a first-person shooter you probably won't.

## Chronology

Tests come after the fact. You learn fractions, and then you take a test. You
build a car, and then you crash-test it.

Specifications come first. Before you build anything you need to first identify
what you are building.

## Optionality

Tests are optional. You can test the waters, or you can just dive in. You can
take a blood test, or you can assume you're fine.

Specifications are not optional. If you don't specify what it does, how do you
know you are done writing it?

## Naming

You may already be writing specifications but calling them tests. Call them
specifications. Names are important. If you don't believe that, rename all of
your variables and methods by drawing letters from a bag of Scrabble tiles.

Random names are still far better than names that are misleading.  Calling a
specification a test is like calling a saddle a seat. The distinction is subtle
but very important. If you treat a saddle like a seat after a few miles your
butt is going to hurt.

If it comes before the application code, is necessary, and isn't used to judge
developers then you are not writing tests, you are writing specifications. Call
them that. If your specifications are used to drive the application development,
then you are doing specification-driven development. Call it that.

====

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
