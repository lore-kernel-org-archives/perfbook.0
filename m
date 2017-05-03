Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20161025;
 h=from:subject:to:cc:message-id:date:user-agent:mime-version
 :content-language:content-transfer-encoding;
 bh=ZJEEvi3KxTvGZQSdan7b3n/7q83Rw/g+xl+5FuO+kOE=;
 b=SjmAeqZ7N9ws3/yLrYXb3NGAOOu0N0QGuoSQfVRpN7Y6jsnYZPfH81PLXwSJuh9IW+
 7QohpO+67H3n192gyasJRl9dD1gL6VolDd/3jULTb1kTh6hroaCrFQUOv78slXXCMLml
 Jc+xh3FpKG2oyowh5uPNgY/Qfs+sQUpnFDX/gP61KAftGlRhVpcN/mss1cDnSXrxvTnz
 sh6dMFyv07g50Lyc39OX0J7S/uvN1XyK7r+PVHW7v7yIFaomzfCDkpT9LcD6tnUCVjW3
 fjqNmLuJtq2g0MJGeHtRrLDmhvqoQo+uFsYcrnLZNg/ovGCRa4PtejER/LhShCUZGauf
 XTOA==
From: Akira Yokosawa <akiyks@gmail.com>
Subject: [Q] Heisenbug and anti-heisenbug
Message-ID: <883b737a-0c32-dedc-daff-db556a6ec83a@gmail.com>
Date: Wed, 3 May 2017 09:09:37 +0900
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

Hi Paul,

While reviewing your recent update in "Hunting Heisenbugs" section,
I found the analogy with particle physics didn't sit well with me.

"Heisenbug" is defined as:

> attempts to track down the heisenbug causes it to radically change
> its symptoms or even disappear completely. 

"Anti-heisenbug" is introduced as:

> Fortunately, particle physics is up to the task: Why not create
> an anti-heisenbug to annihilate the heisenbug?

At this point, "anti-heisenbug" seems to mean a patch that fixes
the heisenbug.

The use of anti-something in particle physics does not go along
with this usage.

For example, antiproton is an antiparticle of proton.
antiproton has mostly the same property as proton,
with the exception of electric charge and magnetic moment.
Also, an antiproton and an antielectron (positron) can compose
an antihydrogen atom. Well, I'm sure you know all about this.

So, if you employ this line of reasoning, an anti-heisenbug should
also be a bug with something opposite in nature.

If a heisenbug is a bug which vanishes when it is being tracked down,
an anti-heisenbug would be a bug which only emerges when it (or 
something else) is being tracked down.

However, it is not obvious you can create an anti-heisenbug for
a particular heisenbug so that when the two are combined, the symptoms
of both bugs to "annihilate".

So I'm wondering "What was Paul's intention in using the word 'annihilate'?".

In Section "Add Delay", anti-heisenbug is used as:

> Once you spot a bug involving a race condition, it is frequently
> possible to create an anti-heisenbug by adding delay in this manner.

This "anti-heisenbug" is not a bug, rather, it is a means to increase
the possibility of a given heisenbug to appear. 

