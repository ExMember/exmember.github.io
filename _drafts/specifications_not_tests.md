Show of hands, who is familiar with TDD?

Show of hands, who writes tests for their code?

I want you to stop. I want you to stop writing tests for your code. Stop writing
tests and start writing specifications.

Tests render judgement. You can fail a test. And if you fail a test, doesn't
that make you a failure?

Specifications don't render judgement. Your code can confirm to a specification.
Do you want that? Depends on what you are writing and the specification. You
probably want your email server to confirm the IMAP specification. You probably
don't want that for your oven clock.

Tests come after the fact. You learn fractions, and then you take the test. You
build a car, and then you test it.

Specifications come first. Before you build it you need to specify what it does.

Tests are optional. "If we need to be *sure* it does what it's supposed to we
can write a test but I'm pretty sure it works, after all I just wrote it and I'm
pretty good at this stuff."

Specifications are not optional. If you don't specify what it does, how do you
know you are done writing it?

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
