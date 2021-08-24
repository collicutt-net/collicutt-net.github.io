---
layout: post
title:  "Costing Application Platforms: Horizontal Standards vs Vertical Integration"
date:   2021-8-24
categories: building-platforms
summary: "Sometimes you just gotta go vertical"
header_image: "hs-vi.jpg"
---

# Costing Application Platforms: Horizontal Standards vs Vertical Integration

What do we want?

To reduce costs!

When do we want it?

Right now!

## Overview

But how do we reduce costs? Two of the major models I see are:

1. Horizontal Standardization (HS)
2. Vertical Integration (VI)

By far the most often used contemporary examples with this kind of thinking are around the use of public clouds. Do we design our platforms and applications so they can be migrated from one public cloud to another (some form of HS)? Or do we go "all in" on a single public cloud, using all the proprietary tools we can (VI)? Now, that begs the question as to whether or not is is actually possible to go "all in" on a public cloud from a HS and VI perspective, which means discussing large public clouds in a bit more detail before getting to the main point of this post.

## Public Clouds

While most of the thinking in this area, eg. switching costs, has been done around public clouds, it's important to note that public clouds, while vertically integrated in some fashion, offer few services that comprise a full platform. Instead they offer individual building blocks that engineers can take and build something "whole" on top of. 

AWS offers over 200 individual services, and few, if any, of them offer a complete, enterprise worthy stack all the way up to managing an application. 

>The large cloud vendors...continue to come out with better components that can be built into ever-more-impressive systems with extensive amounts of work. If they continue down this path, they’re going to find themselves inhabiting a world where the bulk of their business comes from SaaS companies who package their services into something that’s customer coherent, that speaks to problems end users want to pay to make go away, and that drives significant margin to those SaaS customers. - [Corey Quinn](https://www.lastweekinaws.com/blog/the-next-million-cloud-customers/)

Putting the modern public cloud discussions behind us...we can apply HS/VI thinking to any platform stack, from network, compute, and storage all the way up to pipelines and runtimes, or choose smaller slices of that stack to analyze, no matter where it runs or who owns the code. 

## Defining Terms

Other terms that get thrown around in this area:

* lock-in
* portability
* single vendor
* switching costs, switching barriers
* technology agnosticism
* walled garden, closed platform

Lock-in is probably the worst of the terms, as it means so many different things to different people. Frankly it should be avoided because it is so imprecise. (Personally I believe switching costs and speed should be the main focus of any analysis.)

### Horizontal Standardization

>The use of de facto or de jure standards to reduce platform switching costs.

HS is about finding standards--whether they are APIs or tools or standards bodies--to reduce the cost of switching from one platform/stack to another. In the situation that one platform is more cost effective than the other, we can, in theory, "simply" move the application, and make the switch cost effectively, because we’ve chosen to standardize on certain aspects of the platform and have pre-considered what it will take to move.

The major issue with HS that people tend to bring up is that the standards tend to rely on "lowest common denominator" technologies, so while VI solutions will have useful, sometimes proprietary, features, using HS we may not be able to take advantage of those features unless they have become standardized. However, that’s entirely the point of HS...to find areas of standardization, areas of commonalities. So to me this is a moot point. It’s not about "lowest common denominator" , it's about what can be standardized, whether its de facto or not.

However, in order for HS to be successful the organization must maintain the capability to quickly switch from one stack to another, which means additional resource expenditure, even if it's only in training to maintain capability around multiple standardized components. If the organization can’t quickly switch then HS is a failure.

One advantage that is often touted is that HS can be used as a negotiating ploy, but it’s important to remember that this means that a fair amount of your spend with one vendor will be spent on another, reducing the total spend, and thus likely negotiating strength.

#### The Shim

I believe to properly do HS there needs to be a "shim" inserted in between component layers where the actual HS is occurring. Without this switching costs become unwieldy. We need some sort of tooling or process to enable the switch, and if such a thing doesn’t exist, is there really a standard to adhere to? I don’t personally think simply swapping in a new component without the ability to automate is useful...there has to be some kind of, hopefully code-based, "shim" to enable the switch.

![the shim](/img/blog-images/hs-vi-the-shim.jpg)

With HS, the "stack" becomes a collection of shims. We do not interact directly with the "component" rather the shim, and when we switch the shim points to the new component.

If we remove the components, we can see the stack/platform can consist of several HS.

![hs only](/img/blog-images/hs-vi-hs-only.jpg)

That said, in the real world, every stack will be a collection of HS and VI. 

### Vertical Integration

>The use of a single vendor’s highly integrated product made up of multiple components.

To me to approach VI is to accept that you WILL NOT SWITCH. HS assumes that a switch can, and in fact must, be made at some point, but VI’s base assumption is...you never will, and that’s OK. The benefits of never switching and using an integrated platform are:

* reduced costs as using an entire stack, basically a form of economies of scale and negotiation
* agility in not having to think about or prepare for switching
* agility from using an integrated stack
* agility from having to make fewer decisions...less bikeshedding

Here’s a diagram that tries to show what HS and VI stacks might look like.

![hs vi main](/img/blog-images/hs-vi-main.jpg)

The blue vertical rectangle represents (you guessed it) vertical integration, and the orange horizontal bars represents, yep, horizontal standardization.

A few things to note:

* with HS, there must be at least two components which represent the layer that could be switched to (if there’s only one component, then what’s the point)
* with HS, there will be multiple "slices" at which point HS can be applied, and each of these points will be quite different, as they mark different stack components--the same standardization will obviously not apply to each component
* with VI, it could take up possibly the entire stack, or only certain levels of components, but it would obviously have to maintain more than one to make it useful, otherwise it’s just a single vendor choice for a particular layer of the stack, and is not "vertically integrated"

Problems arise from VI in things like:

* the vendor’s stack is over-complicated with too many decisions (see public cloud)
* the vendors stack is not well integrated, the various components don’t work well together, perhaps aren’t tested together
* organizations get caught up in VI licensing costs, ignoring the value they get out of a VI solution, and often ignore staffing costs and, more importantly, the toil that staff is put through without VI solutions

### Problem: Engineers don’t like black boxes

>Engineers gotta engineer

One issue with VI is that technical people, like the kind that work on applications at your organization, tend to not like black boxes. They like to engineer. They like to know how things work. They like to build things, to assemble something useful out of a collection of components that *they chose*. 

Further to that, typically organizations reward engineers who "gotta engineer" with better pay, bigger titles, and more influence. It’s rare that an engineer will choose an inscrutable VI black box even if it's best for the organization and its end users. This is one of the biggest issues with VI, and is, I believe, why public clouds have so, so, so many non-VI features--they provide the lego blocks that engineers want. Ultimately implementing VI can present a staffing problem from an engineering perspective. 

That said, one would think, a well thought out solution using VI which can manage applications should be extremely attractive to developers. If an organization's main goal is to get custom applications into production, then the focus should be on doing that, as opposed to building custom platforms. If developers write code for a living, they should appreciate the ability to easily get their code running.

## Switching Costs and Speed

Ultimately, to me, everything comes down to switching costs or speed. That’s all this is about. How much does it cost to move an application from one platform to another, and how fast or agile can one be with the platform(s). 

The most important thing to understand about these switching costs is that it doesn’t have as much to do with whoever is proving the components of the stack (ie. vendors, open source software, etc) it’s about the organization's ability *to actually perform the switch*, and how much that costs to do--including either running multiple platforms or ensuring that the teams have the ability to use more than one platform.

As far as speed (or agility, but I prefer speed) is concerned, there’s not a lot of point to switching to a stack that costs you more by slowing you down, or cases where implementing horizontal standardization costs you more due to slowness.

I don’t believe that anything that isn’t a consideration of switching costs or speed is important.

## Conclusion

Most platforms will be made up of several layers of HS and VI. It’s rare that a platform would be made up of only one type.

![both](/img/blog-images/hs-vi-both.jpg)

Ultimately it will take an extremely dedicated organization to use HS economically and effectively to support quickly switching platforms. Choosing a highly vertically integrated stack will likely, I believe, be considerably less expensive. Having said that, engineers and architects tend to 1) want to build their own higher level solutions out of individual components and 2) prefer to train themselves on de facto standards, and may simply not be interested in VI. As well, organizations are typically not capable of understanding the costs of toil, and only see the VI licensing costs.