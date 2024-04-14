---
title: The Attempted XV Backdoor is Good News
date: 2024-04-18 07:00:00 -08:00
tags:
- software
- security
---

First some background: For the past several years, one or more people have been executing an intricate plan to install a backdoor into the vast majority of the servers in the world. Using multiple, apparently-fake identities, they combined social engineering and technical wizardry to hide malicious code in XV, a widely-used open-source compression library, to compromise sshd, the remote access server.

At least three years in the making, the project was almost successful. The backdoored library was included in some beta versions of Debian and Red Hat and was probably only weeks from being widely distributed on production servers. But on Good Friday, engineer Andres Freund was, in his free time, troubleshooting a minor performance problem and ruined everything.

This was bad. It was nearly a global catastrophe. We were one curious engineer away from giving someone, and no one knows who, access to nearly every computer on the Internet. And given the scope, ambition, and skill involved, the plotters are believed to part of a national military or intelligence agency. What if this had been successful?

But this is also really good news, for several reasons.

First, the project failed. Very few machines were vulnerable to the backdoor. That's great news.

Secondly, whoever funded this endeavor has spent a lot of time and other resources unsuccessfully. Eating up the resources of an advanced persistent threat (APT) like this is good for the security of the world in general. It might not mean much, given the seemingly infinite resources available to the military-industrial complexes of the world, but it is something.

But to me the best news is that this was expensive. The three-year timespan alone is a heavy commitment. That means faster cheaper options were unlikely to be available.

To be more specific, it is very unlikely that the agency responsible for this attack has a quantum computer capable of factoring 2048-bit primes. If they did, they wouldn't bother with an attack like this. They wouldn't need it to compromise nearly any Internet-connected machine. Because this attack was attempted, we can be reasonably confident that public-key cryptography still works to keep at least one nation-state level APT at bay.

We can say the same thing about the Debian package servers and distribution system. Somewhere, someone who seems to be extremely competent, did the math and seems to have concluded that this was easier to compromising those systems.

We can go down the list of the practices that are used to keep most of the Internet safe. For each one, we can conclude that it is likely that compromising them is at least as difficult as what was attempted here.

Maybe I'm an eternal optimist. Maybe that is because I am not responsible for safeguarding all the computers in the world. But I sincerely believe that an infrastructure attack like this gives us the best (and only real) insight into how secure our infrastructure is. And honestly, it's better than I thought.
