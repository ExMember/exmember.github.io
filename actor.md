---
layout: home
---
# Actor

As an actor,
I have performed
in theatre, commercials, network television, and film.
You may have seen me
in commercials
for [Safe Auto](https://www.youtube.com/watch?v=wNudyDtpBwQ),
[Evolve](https://www.youtube.com/watch?v=pQD88GlQ8dw),
[Morgan and Morgan](https://www.youtube.com/watch?v=9OPQ0U6VZ-I);
[teaching mindfulness](https://childmind.org/healthyminds/mindfulness-students-elementary/)
with the Child Mind Institute
or as the narrator
in [Project Life](https://www.youtube.com/watch?v=KluTIX4m520).

I am represented
by Laura Bowman
and Alex Recore
at [Brady, Brannon & Rich Talent Agency](https://www.bbrtalentagency.com)

<ul class="usa-collection usa-collection--condensed">
  {% for post in site.categories["acting"] %}
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
  {% endfor %}
</ul>
