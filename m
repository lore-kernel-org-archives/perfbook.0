Return-Path: <perfbook-owner@vger.kernel.org>
Received: from mail.kernel.org ([198.145.29.99]:51220 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1731977AbhASS3Q (ORCPT <rfc822;perfbook@vger.kernel.org>);
        Tue, 19 Jan 2021 13:29:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1611080908;
        bh=SQVIC/cYlcdRt9LeP/u5Wn+VxyuNxPDi0OGDF9KXeEM=;
        h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
        b=KPSYAwy7OXq7azskLBAQqUVFZ+Hz1afpXLo7QYTA3oWw1U3a0+XyTkgB1HaZJ+ELD
         WYFTxXSAhQcwTLFw35CxXGQIpsYvMAR3jNG6lCSz5MQYtJ+Ts22XO6Plgd3TOgz+vb
         dkCePKxaj84txYhN8P9LkbqSKWTsy5tUQIL7lY89OMP2p2bRty1B4cIoyOJt9RzuMr
         YxDzBHmHytKaBfBH6VwgDVgKoLAraVDJTTmWnDWy8btBYVsjcRJcNUntnoTnJoNs1f
         sxOsn0kzSptxqLvaCOz8S5qWVWhZRZf3t7nLqFkkVzI4wHn9F/uQO7O18c4vhelVQp
         H8kaDTXoN7C+g==
Date: Tue, 19 Jan 2021 10:22:19 -0800
From: "Paul E. McKenney" <paulmck@kernel.org>
Subject: Re: [PATCH 0/3 -perfbook] Makefile fix and RCU test bar chart update
Message-ID: <20210119182219.GV2743@paulmck-ThinkPad-P72>
Reply-To: paulmck@kernel.org
References: <25e9a0f4-8903-1523-9d04-ce34d7d97db6@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <25e9a0f4-8903-1523-9d04-ce34d7d97db6@gmail.com>
List-ID: <perfbook.vger.kernel.org>
To: Akira Yokosawa <akiyks@gmail.com>
Cc: perfbook@vger.kernel.org

On Mon, Jan 18, 2021 at 12:02:53AM +0900, Akira Yokosawa wrote:
> Hi Paul,
> 
> This patch set is last minute updates for the Second Edition.
> 
> Patch 1/3 fixes a regression resulting in the "(m)" flag in the
> watermark of footnote area.  It can happen only in parallel make
> of first build. See the commit log of the root cause of the false
> flag.

I don't see a patch 1/3, but I did apply and push the others, thank
you!

See below for a delta on top of patch 2/3.

> Patches 2/3 and 3/3 are my attempt to update Figure 12.4 to extend
> the bar chart up to Linux v5.10.
> 
> I thought all I need to do would be to append data of v5.x releases.
> However, when I ran the rcutorture.sh (for the first time), I noticed
> the differences in line counts of RCU code of previous releases.
> 
> My guess is that when you collected the data, your Linux git
> repository had some untracked file(s) which unfortunately matched
> the wildcard pattern in the script.
> 
> Can you check the data on your own?

I do see some differences.  For one thing, your formal/data/rcu-test.dat
file has "" in the version field for every three of four versions.
(I don't see how the script does that.  Was this something that you
hand-edited?)  The numbers were different, but to your point about
untracked files, I cloned a fresh repo to avoid untracked files.

After that, the numbers match yours except for v5.8 onwards, which
have refscale.sh instead of refperf.sh.

> Also, the discussion of the evolution of use of validation needs
> some expansion to mention the trend of v5.x era.
> Especially, v5.0 had a spike in test ratio.
> A new trend of RCU code increase can be seen since v5.8.
> Can you add some explanation regarding them?

Done!  Please see the second diff below.

							Thanx, Paul

------------------------------------------------------------------------

diff --git a/CodeSamples/formal/rcutorture.sh b/CodeSamples/formal/rcutorture.sh
index 0782b39..bc9a285 100644
--- a/CodeSamples/formal/rcutorture.sh
+++ b/CodeSamples/formal/rcutorture.sh
@@ -1,6 +1,6 @@
 #!/bin/bash
 #
-# rcutorture.sh: Output LaTeX table entries showing the fraction of
+# rcutorture.sh: Output gnuplot .dat entries showing the fraction of
 #	Linux-kernel RCU that is test code.  Run in a git clone of
 #	the Linux-kernel source tree.
 #
@@ -25,9 +25,9 @@ tags="`git tag -l | grep '^v' | grep -v -e - | grep -v '\..*\..*\.' | grep -v '2
 for t in $tags
 do
 	git reset --hard $t > /dev/null 2>&1
-	nontorture="`ls kernel/*rcu*.* kernel/rcu/* include/linux/*rcu* 2> /dev/null | grep -v torture | grep -v rcuperf | grep -v refperf | grep -v rcuscale`"
+	nontorture="`ls kernel/*rcu*.* kernel/rcu/* include/linux/*rcu* 2> /dev/null | grep -v torture | grep -v rcuperf | grep -v refperf | grep -v rcuscale | grep -v refscale`"
 	ntn="`wc -l $nontorture 2> /dev/null | tail -1 | awk '{ print $1 }'`"
-	tn="`wc -l tools/testing/selftests/rcutorture/configs/*/*.sh kernel/rcutorture.c kernel/rcu/torture.c kernel/rcu/rcutorture.c kernel/rcu/rcuperf.c kernel/rcu/refperf.c kernel/rcu/rcuscale.c kernel/torture.c tools/testing/selftests/rcutorture/bin/* 2> /dev/null | tail -1 | awk '{ print $1 }'`"
+	tn="`wc -l tools/testing/selftests/rcutorture/configs/*/*.sh kernel/rcutorture.c kernel/rcu/torture.c kernel/rcu/rcutorture.c kernel/rcu/rcuperf.c kernel/rcu/refperf.c kernel/rcu/rcuscale.c kernel/rcu/refscale.c kernel/torture.c tools/testing/selftests/rcutorture/bin/* 2> /dev/null | tail -1 | awk '{ print $1 }'`"
 	frac="`awk -v ntn=$ntn -v tn=$tn 'END { printf "%.1f", 100 * tn / (tn + ntn) "%"; }' < /dev/null`"
 	echo $t  $ntn $tn $((ntn + tn)) $frac
 done

------------------------------------------------------------------------

commit 3c8c4764725cccdf9f25dc1b87b9080d8b4f5199
Author: Paul E. McKenney <paulmck@kernel.org>
Date:   Tue Jan 19 10:18:12 2021 -0800

    formal: Add commentary on changes in Linux-kernel RCU
    
    This commit adds explanations for the larger changes shown in the Figure
    12.4 bar graph.
    
    Reported-by: Akira Yokosawa <akiyks@gmail.com>
    Signed-off-by: Paul E. McKenney <paulmck@kernel.org>

diff --git a/formal/formal.tex b/formal/formal.tex
index 2428942..99d13aa 100644
--- a/formal/formal.tex
+++ b/formal/formal.tex
@@ -343,6 +343,14 @@ Linux kernel v3.14 added scripting that automated testing and also
 analysis of test results, moving RCU towards continuous integration.
 Linux kernel v4.7 added a performance validation suite for RCU's update-side
 primitives.
+Linux kernel v4.12 added Tree SRCU, featuring improved update-side
+scalability, and v4.13 removed the old less-scalable SRCU implementation.
+Linux kernel v5.0 briefly hosted the \path{nolibc} library within
+the rcutorture scripting directory before it moved to its long-term
+home in \path{tools/include/nolibc}.
+Linux kernel v5.8 added the Tasks Trace and Rude flavors of RCU.
+Linux kernel v5.9 added the \path{refscale.c} suite of read-side performance
+tests.
 Numerous other changes may be found in the Linux kernel's \co{git} archives.
 % rcutorture
 % v2.6.15: First torture test
@@ -355,7 +363,11 @@ Numerous other changes may be found in the Linux kernel's \co{git} archives.
 % v3.15: Add support for multiple torture-tests suites for locktorture.
 % v3.16: Add support for conditional grace-period primitives.
 % v4.7: Add update-side performance validation suite. *
+% v4.12: Added Tree SRCU.
+% v4.13: Removed non-Tree SRCU.
 % v5.0: nolibc was briefly in the rcutorture scripting directory.
+% v5.8: Added Tasks Trace RCU and Rude RCU.
+% v5.9: Added refscale.c.
 
 We have established that the validation budget varies from one project
 to the next, and also over the lifetime of any given project.
