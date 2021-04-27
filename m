Return-Path: <SRS0=/ExH=JY=gmail.com=akiyks@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=L6468QAwiqab72sDq1tF3yNo4XO0ardsBQ/vAprUmr0=;
        b=JTsIXLu73pN0vFQ0xkMysjftI2QogpLeV/CgaweT6LlhHsoTQ45Oxtzc74sN+RLdzX
         3eGjs2kOc+O1DuUO/vz2WCViepynRNqJ5VV9A1wp7CHJNX2EMFWQhsKZMdflAxrg1hn8
         9BxeArFBeundKOuvx5/gPp7CnjONoO2Fj6lwQulzxYRhoC/XAA6hmBZjEAd7n9hzuFN0
         3D4k5lS/IKzikmsdz16SC6otDx95b7MoxMsvZrPwOdLi8BqtKTv9xIkIJmFC+DfWhaZ7
         aIn82t1feAQv8gm2DUt9GMZ7nMayhXHnExFx95jUJspIZoj52qBfOJ46MIvsl39xZWGv
         0PXQ==
Subject: Re: [PATCH -perfbook v2 0/9] Add script to check period spacing
References: <71cd07ce-5753-4007-8fab-3654956e5a92@gmail.com>
 <20210427155126.GI975577@paulmck-ThinkPad-P17-Gen-1>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <c81eb726-4cff-e57a-5508-ae438d75b1f4@gmail.com>
Date: Wed, 28 Apr 2021 07:32:25 +0900
MIME-Version: 1.0
In-Reply-To: <20210427155126.GI975577@paulmck-ThinkPad-P17-Gen-1>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

On Tue, 27 Apr 2021 08:51:26 -0700, Paul E. McKenney wrote:
> On Wed, Apr 28, 2021 at 12:18:56AM +0900, Akira Yokosawa wrote:
>> Hi Paul,
>>
>> This patch set adds a set of scripts to check proper annotation
>> of periods to distinguish single and double spacing.
>>
>> Patch 1/9 adds a couple of annotations in-development version of
>> the script had caught.
>> Patches 2/9--5/9 add and improve the set of scripts.
>> They are kept separate patches to show the history.
>> Patches 6/9--9/9 are fixes in LaTeX sources to satisfy the script.
>> There are quite a few sentences which end in the middle of
>> input lines.
>>
>> After Patch 9/9 is applied, "make periodcheck" will be clean.
>>
>> I'm not saying the perl script is complete.
>> There can still be false negatives I'm not aware of.
>> False positives can happen when you add new contents.
>
> Queued and pushed, thank you!
>
> Would it make sense at some point to have "make periodcheck" happen
> automatically during a normal build to catch addition of issues with
> new content?
>
> 							Thanx, Paul

Like this?
Note that positive periodcheck doesn't cause a make error.
It can be promoted to a real error later when we feel confident of
the script.

"make 2c" (or any explicit target) doesn't run the script.

        Thanks, Akira

--------8<--------------------------
From: Akira Yokosawa <akiyks@gmail.com>
Date: Wed, 28 Apr 2021 07:26:05 +0900
Subject: [PATCH] Auto run periodcheck on 'make'

Run periodcheck on "make" and "make all".
Now they are the same as "make periodcheck".
"make periodcheck" builds your default target before the check.

Suggested-by: Paul E. McKenney <paulmck@kernel.org>
Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 Makefile | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/Makefile b/Makefile
index ea264dc5..792fa285 100644
--- a/Makefile
+++ b/Makefile
@@ -194,7 +194,7 @@ BASE_DEPENDS := perfbook.tex $(foreach v,tcb 1c msns mss mstx msr msn msnt sf nq
 .PHONY: help-experimental help-prefixed
 .PHONY: paper-clean periodcheck
 
-all: $(targ)
+all: periodcheck
 
 ifeq ($(MAKECMDGOALS),clean)
 else ifeq ($(MAKECMDGOALS),distclean)
@@ -611,7 +611,7 @@ ls-unused:
 neatfreak: distclean
 	find . -name '*.pdf' | xargs rm -f
 
-periodcheck:
+periodcheck: $(targ)
 	utilities/periodcheck.sh
 
 .SECONDEXPANSION:
-- 
2.17.1



