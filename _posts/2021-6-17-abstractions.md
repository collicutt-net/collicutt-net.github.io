---
layout: post
title:  "It's Ok to Use Abstractions"
date:   2021-6-17
categories: abstraction
summary: I thought using loops was cheating...
header_image: "cheating.png"
---

I saw this [thread on Twitter](https://twitter.com/BrettMiller_IT/status/1405535383631241241?s=20) which shows an image with the below quote:

>I thought using loops was cheating, so I programmed my own using samples. I then thought using samples was cheating, so I recorded real drums. I then thought that programming it was cheating, so I learned to play drums for real. I then thought using bought drums was cheating, so I learned to make my own. I then thought using premade skins was cheating, so I killed a goat and skinned it. I then thought that that was cheating too, so I grew my own goat from a baby goat. I also think that is cheating, but I'm not sure where to go from here. I haven’t made any music lately, what with the goat farming and all.

(First: I'm not sure where this quote came from, I don't know who to attribute it to. I searched google a bit to try to figure it out, but there doesn't seem to be much in terms of origins so I apologise for borrowing it here...in the end it’s just too good.)

The context of the twitter thread was around lowering the bar to entry, ie. removing "gatekeeping" ideas like "HTML isn't a programming language" and such, which happens much, much too often.

## Engineers Want to Engineer

One thing I've learned for certain over time in the IT industry is that engineers want to engineer. I believe this is why Kubernetes is so popular in that it presents a tremendous amount of opportunity to do "real engineering" work, ie. manually build things that make Kubernetes actually usable for organizations. I believe that every single organization adopting Kuberentes has to build on top of it to make it useful--to make it effectively a platform as a service that matches the organization's structure, in some, hopefully correct, fashion.

## Public Cloud: Too Many Building Blocks?

We also see this same structure in public clouds with the continual release of new basic, infrastructure level services, as opposed to higher level abstractions. Again, engineers want to engineer, and, based on this, it seems one of the best ways to make money is to provide engineers the lego blocks they want in order to build one-off abstractions, as opposed to providing those abstractions directly. Even when the public clouds do [release attractions](https://aws.amazon.com/apprunner/), they seem to be missing something.

## Take Some Time to Stop and Reflect

I’m not sure what can, or should, be done about this--perhaps nothing if one-off engineering is economical. However, I do think it’s important to take a step back every once and a while and really think about what IT systems are being built and for what reasons. Question the value of what is being created...can we just buy that same abstraction for pennies on the dollar? Obviously there must be situations where it makes sense, but I think we have gone a little bit too far in that direction at this time, and it's worthwhile to take some time to reflect, especially with the current growth and adoption of Kubernetes. For better or worse, many organizations fail when it comes to building their own one-off abstractions, especially when the sheen, the initial excitement, has worn off, when these tools have been in use for a year or two and begin to degrade.

