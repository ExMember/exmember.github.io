---
title: Software Engineering Incentives and Maintainability
date: 2024-05-13 07:00:00 -08:00
tags:
- software
---

Most software is not written in a way that would make it easy to maintain. There are multiple reasons for this. Making software easy to maintain is difficult and a skill few engineers have had the opportunity to develop. But the primary reason is that there are a lack of incentives to make software easier to maintain.

To start with, in nearly every case, individual engineers do not pay the price of their work being difficult to maintain. Writing code that will cause problems in five years is very unlikely to cause trouble for an engineer who will probably not be at the same job, much less on the same product when problems come to the surface.

Instead of being incentivized to write code that is easy to maintain and prevent problems down the road, engineers are incentivized to add new technologies and new features. New technologies and features added this year are a huge asset on resumes and in performance-review season. In contrast, few to any engineering managers know how to value what won't happen years in the future.

Beyond individual engineers, most products are not built to last. This is moderately excusable in the startup space where it is unclear if the product is something anyone will want or pay for. More maintainable code could be a waste for a codebase that might be abandoned next year. It could be an unaffordable investment for a company that will die if certain improvements are not finished this quarter.[^investmentuncertainty]

[^investmentuncertainty]: Or, because more maintainable code is, by definition, easier to modify and work with, investments in maintainability could improve the speed of advancement and survivability of the product and company. Software startups are hard.

Even in an organization with stable financials and an established user base, company incentives often prioritize short term gains over long term viability. When your income is tied to next quarter's revenue or stock price, it's only natural to do what you can to boost that regardless of the possible impact on the project years from now.

Making software easy to maintain is not easy to do. But the primary reason it is so uncommon is that engineers, managers, and companies have little reason to build for the long haul, and many reasons not to.
