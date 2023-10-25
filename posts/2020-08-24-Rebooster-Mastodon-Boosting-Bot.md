---
title: A Mastodon Hashtag Boosting Bot
tags: fediverse, oss, project
---

Over the weekend I dove into the world of [Mastodon bot building](https://mastodonpy.readthedocs.io/en/stable/) and came up with a simple customizable script that reads the global Mastodon timeline, listening for new toots tagged with specified hashtags, and retooting them as they show up.

My use case was to use it to connect with the gamedev community on Mastodon by sharing gamedev content, and I'm very happy with the result.

Running it yourself
-------------------

If you'd like to use it yourself, clone the [source code from Github](https://github.com/Lambdanaut/Rebooster/) and rename the `config_example.py` file to `config.py`. Fill that file in with your own account credentials and the tags you wish to retoot, and run the `rebooster.py` script with Python.

It's really that easy.



For updates, follow me on Mastodon at [lambdanaut@mastodon.gamedev.place](https://mastodon.gamedev.place/)
