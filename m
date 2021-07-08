Return-Path: <SRS0=5QGv=MA=gmail.com=akiyks@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=to:cc:from:subject:message-id:date:user-agent:mime-version
         :content-language:content-transfer-encoding;
        bh=Yc3j8s+znebQ77vNBPqEjjewPBK4qNQH20JXPoSFDqo=;
        b=I5w00doDDG0/bQT8trlGEFFGHB8bt+wOb7v++pWkGj72s73E0BKUTCl/6lygPUT+Dx
         OrXehBWHoEmr2gyeiZuRjoT39kGWhI9R/DWvOG4dWjbg7vho05QWFVGg7WagkwZN6xBI
         E8BBEvXuzlPmUkpStb0K8S/URSyulGjNHLUNgo2680MByZlMIm+5SMtKurEvfJBPjBBy
         eBtcwa+wKEvnvLQjrK+cVOorfTSMSrq1V5IsxcmGbiLj4Wlaa11ugoUWME47vgcyRZyY
         3Bz6ftw4sBb4dzmYMQY0wJ4KI6fRWsvm9W7+w0Ab0CgOGhai3oDfyEgT/84Rr2uIp9Aj
         +s7w==
From: Akira Yokosawa <akiyks@gmail.com>
Subject: [PATCH -perfbook 0/6] Break and capitalize after colon, take two
Message-ID: <b502a83e-5a41-8ccb-1170-8cefd589e1a2@gmail.com>
Date: Thu, 8 Jul 2021 19:40:16 +0900
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

Hi Paul,

Here are colon related tweaks though Chapter 9.

Patches 1/6 -- 3/6 don't change sentences/clauses/phrases except
for capitalization.
Patches 4/6 -- 6/6 remove redundant looking Oxford commas in
two-item enumeration lists.
However, I'm not sure Patches 4/6 -- 6/6 are the right fixes or not.

Please pick whichever ones you'd like.

NOTE: There is a hunk in Patch 3/6:

> @@ -535,9 +537,10 @@ and with increasing use of hazard pointers in other projects, demonstrates
>  that tolerance for such inconsistencies is more common than one might
>  imagine.
>  This is especially the case given that single-item lookups are much more
> -common than traversals:  After all, (1)~concurrent updates are less likely
> -to affect a single-item lookup than they are a full traversal, and
> -(2)~an isolated single-item lookup cannot detect such inconsistencies.
> +common than traversals:
> +After all, (1)~concurrent updates are less likely to affect a single-item
> +lookup than they are a full traversal, and (2)~an isolated single-item
> +lookup cannot detect such inconsistencies.
>  
>  From a more theoretical viewpoint, there are even some special cases where
>  RCU readers can be considered to be fully ordered with updaters, despite

, where the inline enumerated list is not converted to the "enumerate*" list.
This one is lead by "After all," not by a colon, and I kept the lowercase
words following (1) and (2).

This level of fluctuation is unavoidable in natural language text,
I suppose.

        Thanks, Akira

--
Akira Yokosawa (6):
  toolsoftrade, count, SMPdesign: Break and capitalize after colon
  locking: Break and capitalize after colon
  defer: Break and capitalize after colon
  count: Remove Oxford comma in two-item enumeration list
  locking: Remove Oxford comma in two-item list
  defer: Remove Oxford comma in two-item list

 SMPdesign/SMPdesign.tex       | 23 ++++----
 SMPdesign/beyond.tex          | 19 +++----
 count/count.tex               | 66 ++++++++++++-----------
 defer/hazptr.tex              |  9 ++--
 defer/rcufundamental.tex      | 29 ++++++-----
 defer/rcuintro.tex            |  6 ++-
 defer/rcuusage.tex            | 34 +++++++-----
 defer/seqlock.tex             | 12 +++--
 defer/whichtochoose.tex       | 19 ++++---
 locking/locking-existence.tex |  4 +-
 locking/locking.tex           | 98 ++++++++++++++++++++---------------
 toolsoftrade/toolsoftrade.tex | 31 ++++++-----
 12 files changed, 201 insertions(+), 149 deletions(-)

-- 
2.17.1

