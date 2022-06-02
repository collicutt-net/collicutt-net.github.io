---
layout: post
title:  "Platform Engineering"
date:   2022-6-2
categories: 
- building-platforms
- platform-engineering
- tanzu
summary: How does one find that golden path to production?
header_image: "treehouse.jpg"
---

We've got people and processes: developers, devops, SREs, platform engineers, sysadmins...many different job classifications and concepts. We've got technologies: virtual machines, containers, functions, public clouds, Kubernetes, platform as a service, Heroku dreams.

What do people in technology want to do? **Get their apps to end users.** That's it. Sure, add in all cross-cutting concerns, siloing, etc, but the point is to get apps to end users. With that in mind there has been an ongoing discussion in the technology ecosystem around platforms, and, I suppose, how they are engineered.

>Please note: The below meme is meant to be sarcastic. :)

<img src="/img/blog-images/ops-galaxy-brain.jpg" alt="sysadmin to devops to SRE to platform engineering" style="width:500px;"/>

This progressional concept of "ops" is echoed all [over the place](https://blog.getambassador.io/kubecon-eu-2022-summary-cloud-novices-golden-paths-and-software-supply-chains-f38d34b0c5a4), though mostly from a hype perspective, i.e. what's happening in the world of operations.

<blockquote class="twitter-tweet"><p lang="en" dir="ltr">My first <a href="https://twitter.com/hashtag/KubeCon?src=hash&amp;ref_src=twsrc%5Etfw">#KubeCon</a> <a href="https://twitter.com/hashtag/KubeConEU?src=hash&amp;ref_src=twsrc%5Etfw">#KubeConEU</a> takeaway:<br><br>2000: SysAdmins<br>2010: DevOps engineers<br>2017: SREs<br>2022: Platform engineers</p>&mdash; Ara Pulido (@arapulido) <a href="https://twitter.com/arapulido/status/1527216800416538624?ref_src=twsrc%5Etfw">May 19, 2022</a></blockquote> <script async src="https://platform.twitter.com/widgets.js" charset="utf-8"></script> 

I don't *actually* believe it's a job classification progression, instead it's an example of a somewhat hype-cycle based evolution of how we build and run applications (which, I think as an industry, we are still trying to figure out). Hence, now, the concept of platform engineering: a golden path to production.

I like this table from this [New Stack contributed article](https://thenewstack.io/how-the-developer-experience-is-changing-with-cloud-native/) because it shows what each persona has in terms of expectations of the other personas.

<img src="/img/blog-images/plat-eng-descriptions.jpg" alt="sysadmin to devops to SRE to platform engineering" style="width:800px;"/>

More from that same article, specifically around the operators:

>...the function of operations is to help balance developer freedom and responsibility, which the ops team facilitates by ensuring that the right technologies are completely embedded in the developer experience. Defining a “paved path” for developers streamlines their ramp-up, helps combat tool sprawl and supports developer ownership as a key to shipping software fast and safely.

Ultimately, I think "developer experience" is the key phrase here. Do developers, the people who are REALLY writing the application, honestly want to maintain their own "platform", deal with security, governance, CVEs, Dockerfiles, etc? No, I don't believe they do. And yet, that is what many of them burn working hours toiling away at. Perhaps they like the engineering challenge, but regardless, it's still work, it's still toil, and it's still complicated. What's more, there is considerable risk involved, especially when thinking about security and governance.

## Golden Path to Running Apps

So what is platform engineering? According to [Platformengineering.com](https://platformengineering.org/blog/what-is-platform-engineering) it's:

>...the discipline of designing and building toolchains and workflows that enable self-service capabilities for software engineering organizations in the cloud-native era. Platform engineers provide an integrated product most often referred to as an “Internal Developer Platform” covering the operational necessities of the entire lifecycle of an application.

What's more:

>Platform engineers provide an integrated product most often referred to as an "Internal Developer Platform" covering the operational necessities of the entire lifecycle of an application.

There is an entire [website](https://internaldeveloperplatform.org) dedicated to defining an IDP. It seems at this time most organizations will build an IDP that they try to make sense for themselves, and themselves only, and perhaps that is the right thing to do. However, even with that in mind, there are going to be commonalities between all IDPs, so adopting some kind of framework to deal with those commonalities can save time and money, and take away toil from platform engineering teams or the developers who have been unknowingly tasked with building a hidden platform.

## Example of an Internal Developer Platform Framework: The Tanzu Application Platform

Here's a screenshot of a supply chain in the [Tanzu Applicaton Platform](https://tanzu.vmware.com/application-platform) (TAP), where the GUI is provided by [Backstage](https://backstage.io) (which is part of TAP). The image is of a particular supply chain workflow, in this case one that compiles a Java app, builds an image for it (without a Dockerfile), scans that image for security issues, and then finally runs the application using knative in Kubernetes. From source to running app.

![An example of the TAP GUI: compiling code, budiling an image, scanning it, and running it in Kubernetes](/img/blog-images/tap-image-scan.jpg)

From the [internaldeveloperplatform.org](https://internaldeveloperplatform.org/frameworks/) site:

>Using [platform engineering] frameworks is the quickest and most state-of-the-art way to build your Internal Developer Platform. Remember that it needs to be your Internal Developer Platform. So you will need to customize it for your own needs and connect it to your own infrastructure. 

A good example of this Internal Developer Platform is the Tanzu Application Platform. TAP provides a modular developer platform on top of Kubernetes.

>VMware Tanzu Application Platform is a modular, application-aware platform that provides a rich set of developer tooling and a pre-paved path to production to build and deploy software quickly and securely on any compliant public cloud or on-premises Kubernetes cluster.

What's great about TAP is that it is modular, is built on open source components, and includes tooling like [Backstage](https://backstage.io). TAP is based on the idea of workflows (and more) which can be pieced together like lego blocks, either using existing developer experience components, CI/CD pipelines, etc, and integrating with them, or in some cases removing toil from those pre-existing systems (such as the hard work of building container images) and letting them focus on what they are good at, while TAP and its underlying components take care of the rest.

## Conclusion

What most companies will do, over time, is build a platform, typically on top of Kubernetes. Often these are hidden platforms in the guise of pipelines. Building these "do everything" pipelines is challenging and often fraught with missteps.

One way to avoid these missteps is to:

1. Accept that you are building a platform, even if it looks like a pipeline
2. Adopt a platform engineering framework that can help you maintain that platform with less toil

More to come on this topic!