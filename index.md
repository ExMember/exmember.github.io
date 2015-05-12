---
---

<div class="home">

  <p>I am Damien. This is my website.</p>

  <ul class="post-list">
      {% for post in site.posts %}
          <li>
            <h3>
              <a class="post-link" href="{{ post.url | prepend: site.baseurl }}">
                {{ post.title }}
              </a>
            </h3>
          </li>
      {% endfor %}
    </ul>
</div>
