---
layout: post
title:  "Improve Developer Experience by Speeding Up Pipelines"
date:   2020-12-22
categories: DX
summary: Speed Matters
header_image: "pipelines.jpg"
header_permalink: "https://unsplash.com/photos/T5QT2bmiD4E"
---

Speed is often overlooked. Historically computers got faster all the time. More CPU, more memory, more storage. Speed was basically free every six months, it was like passive income...a cheque just arrived every month and you didn't have to do anything to get it. But now, Moore's law is slowing down, and we need to, or at least can, look elsewhere for performance improvements. For this post, lets get out of the "running code" space and into the "building and depoying code" space and think about speed in that context.

## Update!

I started writing this post, mostly for myself to think about pipelines, while I was reading the base thread that Charity Majors had started. It's such a good thread. As I was writing, @mipsytipsy pulled together an amazing [post](https://charity.wtf/2020/12/31/why-are-my-tests-so-slow-a-list-of-likely-suspects-anti-patterns-and-unresolved-personal-trauma/) on the same topic. I'd heavily suggest reading her post first, and only then, if you feel like it, come back and read this one. 

## Slow Tools

Slow tools affect productivity, and they affect the productivity of *all the developers* working on the project. So fixing that, speeding it up, can improve every single developer. Seems like a strategic place to put resources into.

<blockquote class="twitter-tweet"><p lang="en" dir="ltr">this thread is a capsule story of all the reasons software is terrible, and it starts with .. spoiler alert ... slow tools.<br><br>it MATTERS that your build/test/deploy be as snappy as possible. i maintain that 15 minutes is a good upper bound threshold to aim for. <a href="https://t.co/znbgKgelGM">https://t.co/znbgKgelGM</a></p>&mdash; Charity Majors (@mipsytipsy) <a href="https://twitter.com/mipsytipsy/status/1341582751355441153?ref_src=twsrc%5Etfw">December 23, 2020</a></blockquote> <script async src="https://platform.twitter.com/widgets.js" charset="utf-8"></script> 

I heavily suggest looking through that thread and reading about what teams are doing to improve the speed of their pipelines.

## Speeding Up Piplines

I've collected a few of the things people mentioned about improving build speed.

* Parrallelization

Examples in the thread were technologies like [RSpecQ](https://t.co/Vd2GkiUIAZ?amp=1).

* Caching
* Eliminate sign-off steps
* Remove the work, have someone else do it
* Skip tests unafected by code changes

Mention of tools like [Jest](https://jestjs.io/docs/en/cli#--onlychanged) that can skip tests for unaffected code changes.

* Optimize tests

Good [post](https://devblog.kogan.com/blog/django-test-splitting-on-circleci) on optimizing tests:

> Running your test suite in parallel across multiple nodes is great at reducing the feedback loop for developers, but it does nothing to decrease the total runtime of your test suite. Indeed, it takes longer in absolute CPU time as N environments now need to be provisioned. To reduce your costs and get an even tighter feedback loop, you have to optimise your actual tests too.

* Brian Scanlan [says](https://twitter.com/brian_scanlan/status/1341658203701047296?s=20) focus on small, easy wins

> The improvements came from a load of small improvements and no radical re-architecture. Analyse, fix, repeat. We got CI from 10 to 5 minutes mostly through infrastructure automation. We parallelised various safety checks. We sped up production deploy by, well, doing it faster.


* Charity Majors [mentions a few more things](https://twitter.com/mipsytipsy/status/1341871253183860743?ref_src=twsrc%5Etfw%7Ctwcamp%5Etweetembed%7Ctwterm%5E1341881253469941761%7Ctwgr%5E%7Ctwcon%5Es2_) they worked on to speed up their pipeline. (Again - please note that Charity Majors has put up a [much longer post](https://charity.wtf/2020/12/31/why-are-my-tests-so-slow-a-list-of-likely-suspects-anti-patterns-and-unresolved-personal-trauma/) detailing strategies and tactics to help speed up pipelines.)

> * building a new AMI
> * using EBS
> * using lots of any AWS calls, really
> * not parallelizing tests
> * tests that take several seconds to init
> * setup/teardown of dbs
> * importing test data
> * selenium and other UX tests
> * rsyncing sequentially

One really interesting tidbit in her post is this:

> setup/teardown of databases (HINT try ramdisks)

Note the `HINT: ramdisks`, ie. putting databases onto storage that is backed by RAM for massive speed increases. Very interesting idea. Storage has gotten fast, e.g. NVMe, but not as fast as RAM.

* Building software versus managing infrastructure

[@mipsytipsy](https://twitter.com/mipsytipsy) also differentiates between building software and managing infrastructure. In pipelines you're doing both, and typically infrastructure is slower to manage. In her [blog post](https://charity.wtf/2020/12/31/why-are-my-tests-so-slow-a-list-of-likely-suspects-anti-patterns-and-unresolved-personal-trauma/) she also mentions how "calls to AWS" (i.e. managing AWS infrastructure for pipelines), any calls really, are slow. 

## Strategies Versus Tactics: Where to Put in the Work?

One thing I find very interesting about this topic is that many of the ideas are high level strategies, for example caching, while others are very low level direct tactics, such as the aforementioned RAM disk for test databases.

This could lead to spending a lot of time on items that end up not providing value. I like the idea of setting a time target, e.g. 15 minutes, and focussing on as many small, obvious, easy wins as possible to get to that number, and then work at staying at that number. Otherwise one could end up over-optimizing too early and building a hard to change pipeline. Ultimately a 15 minute build and deploy time doesn't seem that challenging to obtain with a bit of dedicated effort.

Ultimately, what we are trying to do is improve the speed of something that affects everyone on the team, maybe every developer in the company. There are some big wins to be had here.

As a final point, I can't say it better than the below tweet. Code is rotting as soon as it's written.

<blockquote class="twitter-tweet"><p lang="en" dir="ltr">Software on the shelf doesn&#39;t age like wine; it ages like milk.</p>&mdash; Matthew Mark Miller (@DataMiller) <a href="https://twitter.com/DataMiller/status/1344308056058961932?ref_src=twsrc%5Etfw">December 30, 2020</a></blockquote> <script async src="https://platform.twitter.com/widgets.js" charset="utf-8"></script> 