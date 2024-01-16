---
layout: home
---
# Writer

Sometimes,
when I think
my thoughts
are interesting enough
to be
worth sharing
I write them
down here.

<ul class="usa-collection usa-collection--condensed">
  {% for post in site.posts %}
  {% unless post.categories contains "acting" %}
    <li class="usa-collection__item">
        <div class="usa-collection__body">
        <h4 class="usa-collection__heading">
            <a class="usa-link" href="{{ post.url }}">
            {{ post.title }}
            </a>
        </h4>
        <ul class="usa-collection__meta" aria-label="More information">
            <li class="usa-collection__meta-item">
            <time datetime="{{ post.date | date: "%F" }}">
                {{ post.date | date: "%b %-d, %Y" }}
            </time>
            </li>
        </ul>
        </div>
    </li>
  {% endunless %}
  {% endfor %}
</ul>
