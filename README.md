eggbeard.tv
===========

The http://eggbeard.tv website.

Bot
---

One half of this project is a bot that will run 24/7 in the Twitch EggBeard channel and record when users join and leave.

### Configuration

Create a `config/application.yml` file based on the `config/application.yml.example`.

```
bundle install
rake bot:start
```

Website
--------

The other half is a website that displays statistics about followers and their time in the channel (for example, the viewer that has been on for the longest amount of time).

