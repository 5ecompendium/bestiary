# Bestiary

Bestiary is a mobile-friendly 5e compendium of creatures that organizes them in various classifications and strengths.

See the latest compiled build here: [http://chisaipete.github.io/bestiary/](http://chisaipete.github.io/bestiary/)

## To Do
* Sort by location, sub-types, tags, CR, level, etc.
* More Monsters from more sources!

## Structure
Creatures can be found inside `_posts/`. Each creature gets its own post, written and stored as a [Markdown](http://daringfireball.net/projects/markdown/basics) file. The date is arbitrary and never displayed, but still necessary for [Jekyll](http://jekyllrb.com) to process the posts properly.

If you'd like to help fill out the rest of the creatures from the MM, for each new spell you make:

1. Make a new post inside `_posts/` for each new creature, and copy the formatting from another creature.
2. Submit a pull request for the creatures(s) when you're finished, and that's it! Thank you so much. :)

## Build Instructions
I've edited _config.yml for my own build purposes, but if you've got [Jekyll](http://jekyllrb.com) set up locally, the following should create the build from your friendly command line terminal:
`jekyll serve -Vw --no-watch --baseurl ""`

## Thanks

Shoutout to Saph of http://ephe.github.io/grimoire from whom I've shamelessly borrowed the majority of the codebase
