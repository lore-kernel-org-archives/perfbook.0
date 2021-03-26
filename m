Return-Path: <perfbook-owner@vger.kernel.org>
Received: from mail.kernel.org ([198.145.29.99]:33966 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230007AbhCZAMQ (ORCPT <rfc822;perfbook@vger.kernel.org>);
        Thu, 25 Mar 2021 20:12:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1616717536;
        bh=h0VYWqF26tSJkYBMryDWk44fONZ6KcmGvpx4GHm5+GY=;
        h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
        b=Edj+OYLh+FDj9KAWOsmcBIB5MTgZAYyFzpUbYd7AZZb8TLI1oRarnGjM5jDv2mbYj
         pmsq1rVts+lAdfcedA9Eo/At2RC6whRNyjjRZJzY24le9Bx7/r80vIsbtdjAW+0kAN
         n/SyF4CflfMjM7IBqt1LIMN38E2B17iD+5k8pr02wnaQn58/FExGjFJo+BRSem+T5C
         c9zXQ4SRSkNOYEx6AnpQRBPuXcbi9eCCmwrA0KExEv0e64jq9ObgDX0QVkFY3fAioS
         ukg9Aa7+0bucj3TE2c+sHi9aXzNi3nlsSJGlBlVxL9I2ufnGq+8ceTcTvXpIVk8nqJ
         f1cglgUoN0trw==
Date: Thu, 25 Mar 2021 17:12:16 -0700
From: "Paul E. McKenney" <paulmck@kernel.org>
Subject: Re: [PATCH -perfbook 0/5] ebook reader size support
Message-ID: <20210326001216.GO2696@paulmck-ThinkPad-P72>
Reply-To: paulmck@kernel.org
References: <20210323010153.GH77072@balbir-desktop>
 <64419413-f54f-a737-bcae-e03b8ecaf606@gmail.com>
 <20210325161652.GL2696@paulmck-ThinkPad-P72>
 <eb5b9862-1fa3-93b4-1a2c-b287a16bdfbb@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="u3/rZRmxL6MmkK24"
Content-Disposition: inline
In-Reply-To: <eb5b9862-1fa3-93b4-1a2c-b287a16bdfbb@gmail.com>
List-ID: <perfbook.vger.kernel.org>
To: Akira Yokosawa <akiyks@gmail.com>
Cc: Balbir Singh <bsingharora@gmail.com>, perfbook@vger.kernel.org


--u3/rZRmxL6MmkK24
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Mar 26, 2021 at 04:24:03AM +0900, Akira Yokosawa wrote:
> On Thu, 25 Mar 2021 09:16:52 -0700, Paul E. McKenney wrote:
> > On Thu, Mar 25, 2021 at 07:49:44PM +0900, Akira Yokosawa wrote:
> >> Hi Balbir and Paul,
> >>
> >> So, this is a revised patch set based on the RFC PATCH from
> >> Balbir.
> >>
> >> Hearing no objection to the rename of "-er" to "-eb",
> >> I did the rename in Patch 1/5 of Balbir's.
> >> Patch 2/5 is an updated one I sent earlier, with additional 
> >> float-barrier macro for ebooksize build and minor tweaks.
> >> Note that the extra blank line at the bottom of \ebresizeverb
> >> is now fixed.
> >> Patch 3/5 is also an updated one I sent earlier.
> >> Patch 4/5 shrinks floats in styleguide.
> >> Patch 5/5 updates help text in Makefile to mention build targets
> >> for ebooksize.  They are marked as (WIP) for the moment.
> >>
> >> This set can be applied to current master.
> > 
> > When I try "git am -s -3", I get this:
> > 
> > ------------------------------------------------------------------------
> > 
> > Applying: perfbook-lt: Add macro to shrink floats for ebook
> > fatal: sha1 information is lacking or useless (perfbook-lt.tex).
> > error: could not build fake ancestor
> > Patch failed at 0001 perfbook-lt: Add macro to shrink floats for ebook
> > The copy of the patch that failed is found in: .git/rebase-apply/patch
> > When you have resolved this problem, run "git am --continue".
> > If you prefer to skip this patch, run "git am --skip" instead.
> > To restore the original branch and stop patching, run "git am --abort".
> > 
> > ------------------------------------------------------------------------
> > 
> > The usual cause of this is when the series is on top of a few additional
> > patches in your git archive.  If this is the case, then it is possible
> > that you can rebase them without git complaining because git analyzes the
> > intervening patches.  Lacking those intervening patches in my archive,
> > git just complains at me.
> > 
> > If this is the case, could you please rebase this series onto master,
> > then resend?  Alternatively, resend including the intervening patches,
> > allowing me to do the rebase.
> > 
> > If there are no intervening patches in your archive, I have no idea what
> > is happening.  ;-)
> 
> Strange...
> 
> I see the HEAD of master at the tag "Edition.2", whose commit id is
> 6932521bb9df ("future/htm: Remove redundant 'to' from 'WRT to' in section
> headings").
> 
> My attempt to apply this series by "git am" is OK.
> 
> Do you have any commits not pushed yet?
> 
> If so, please try to apply this patch set on Edition.2?

Yes, and already done, several attempts.  Very strange.

I recloned and tried again, with the same result, or lack thereof.

I did "git status", "git am", a "sum" comand, and "git show HEAD",
resulting in the output below.  What do you see on your side?  I am
especially interested in the output from that "sum" command at your end.

Hmmm...  It is also possible that the patch was damaged in transit.
I attached my copy.  Could you please check?

							Thanx, Paul

------------------------------------------------------------------------

$ git status
HEAD detached at Edition.2
nothing to commit, working tree clean
$ git am -s -3 /tmp/akiyks.patch
Applying: perfbook-lt: Add macro to shrink floats for ebook
fatal: sha1 information is lacking or useless (perfbook-lt.tex).
error: could not build fake ancestor
Patch failed at 0001 perfbook-lt: Add macro to shrink floats for ebook
The copy of the patch that failed is found in: .git/rebase-apply/patch
When you have resolved this problem, run "git am --continue".
If you prefer to skip this patch, run "git am --skip" instead.
To restore the original branch and stop patching, run "git am --abort".
$ sum Makefile perfbook-lt.tex
37096    19 Makefile
02089    18 perfbook-lt.tex
$ git show HEAD
commit 6932521bb9df8c95aa6e09ceb7fd3ced88fe412c
Author: Akira Yokosawa <akiyks@gmail.com>
Date:   Sun Mar 21 19:17:32 2021 +0900

    future/htm: Remove redundant 'to' from 'WRT to' in section headings
    
    Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
    Signed-off-by: Paul E. McKenney <paulmck@kernel.org>

diff --git a/future/htm.tex b/future/htm.tex
index cf222e5..242b85f 100644
--- a/future/htm.tex
+++ b/future/htm.tex
@@ -41,7 +41,7 @@ cache misses, and supporting a fair number of practical applications.
 However, it always pays to read the fine print, and HTM is no exception.
 A major point of this section is determining under what conditions HTM's
 benefits outweigh the complications hidden in its fine print.
-To this end, \cref{sec:future:HTM Benefits WRT to Locking}
+To this end, \cref{sec:future:HTM Benefits WRT Locking}
 describes HTM's benefits and
 \cref{sec:future:HTM Weaknesses WRT Locking} describes its weaknesses.
 This is the same approach used in earlier
@@ -51,7 +51,7 @@ and also in the previous section.\footnote{
 	discussions with the other authors, Maged Michael, Josh Triplett,
 	and Jonathan Walpole, as well as with Andi Kleen.}
 
-\Cref{sec:future:HTM Weaknesses WRT to Locking When Augmented} then describes
+\Cref{sec:future:HTM Weaknesses WRT Locking When Augmented} then describes
 HTM's weaknesses with respect to the combination of synchronization
 primitives used in the Linux kernel (and in many user-space applications).
 \Cref{sec:future:Where Does HTM Best Fit In?} looks at where HTM
@@ -61,8 +61,8 @@ greatly increase HTM's scope and appeal.
 Finally, \cref{sec:future:Conclusions}
 presents concluding remarks.
 
-\subsection{HTM Benefits WRT to Locking}
-\label{sec:future:HTM Benefits WRT to Locking}
+\subsection{HTM Benefits WRT Locking}
+\label{sec:future:HTM Benefits WRT Locking}
 
 The primary benefits of HTM are
 (1)~its avoidance of the cache misses that are often incurred by
@@ -144,7 +144,7 @@ Although it is possible to use two-phased locking and hashed arrays
 of locks to partition general data structures, other techniques
 have proven preferable~\cite{DavidSMiller2006HashedLocking},
 as will be discussed in
-\cref{sec:future:HTM Weaknesses WRT to Locking When Augmented}.
+\cref{sec:future:HTM Weaknesses WRT Locking When Augmented}.
 Given its avoidance of synchronization cache misses,
 HTM is therefore a very real possibility for large non-partitionable
 data structures, at least assuming relatively small updates.
@@ -843,7 +843,7 @@ serious shortcomings of locking,\footnote{
 	deadlock detectors~\cite{JonathanCorbet2006lockdep}, a wealth
 	of data structures that have been adapted to locking, and
 	a long history of augmentation, as discussed in
-	\cref{sec:future:HTM Weaknesses WRT to Locking When Augmented}.
+	\cref{sec:future:HTM Weaknesses WRT Locking When Augmented}.
 	In addition, if locking really were as horrible as a quick skim
 	of many academic papers might reasonably lead one to believe,
 	where did all the large lock-based parallel programs (both
@@ -867,8 +867,8 @@ hazard pointers~\cite{MagedMichael04a,HerlihyLM02},
 and RCU~\cite{McKenney98,McKenney01a,ThomasEHart2007a,PaulEMcKenney2012ELCbattery}.
 The next section looks at how such augmentation changes the equation.
 
-\subsection{HTM Weaknesses WRT to Locking When Augmented}
-\label{sec:future:HTM Weaknesses WRT to Locking When Augmented}
+\subsection{HTM Weaknesses WRT Locking When Augmented}
+\label{sec:future:HTM Weaknesses WRT Locking When Augmented}
 
 \input{future/HTMtableRCU}
 

--u3/rZRmxL6MmkK24
Content-Type: text/x-diff; charset=us-ascii
Content-Description: akiyks.patch
Content-Disposition: attachment; filename="akiyks.patch"

From SRS0=LEX/=IW=gmail.com=akiyks@kernel.org Tue Mar 23 19:43:47 2021
Delivered-To: paulmckrcu@gmail.com
Received: from pop.gmail.com [74.125.20.109]
	by paulmck-ThinkPad-P72 with POP3 (fetchmail-6.3.26)
	for <paulmck@localhost> (single-drop); Tue, 23 Mar 2021 19:43:47 -0700 (PDT)
Received: by 2002:a0c:b506:0:0:0:0:0 with SMTP id d6csp2201676qve;
        Tue, 23 Mar 2021 19:37:24 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzEtqzd8neC2LAivHlIgEVk7vKMjKCNVpJyMuEVZvuXSEhS/MmuxloRw4Kg1a9Igu9yyYtr
X-Received: by 2002:a63:5a26:: with SMTP id o38mr1064731pgb.54.1616553444102;
        Tue, 23 Mar 2021 19:37:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1616553444; cv=none;
        d=google.com; s=arc-20160816;
        b=SZM/h02kP9gsMe5nihcqtZJKs0MKL/nKHBZLxKLq6swchXkwl7p8AD391WTJrcTfZM
         zEVC+VJqVlilBZMFoFPqWKXtu3b4XXqdYusv+2g8FYHlXQChmgGJvrwvHtD3Tf+xrr42
         rp4zx3OqaqIUKei656H7bMmML54O9KN4uI7qYBYKMKjQinGYYjnvXZejboGmG/BTZG4J
         W3bfmhboZutqY3QgOCjRiGzQAB/0cz8qti3Fzn0l6+Wa01lvjQkvcDz7rRiGSQ6gDCjX
         NxthdCrC/Kcg8RzIVgiY+emzLUc4DVd9jWQqKAa0OTpFUOzWsJBxHScHWvPGOLFZPel2
         CDqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject
         :dkim-signature:dmarc-filter:delivered-to;
        bh=cBN/9fMGK7VQZNQtKaQQF1PrngazFcys/iGIUERUxFI=;
        b=c64qQBOcjMnjPjZkccql9s/vcfmJeMhvlhrmyhaNeniY8xzd4E++Swt3ZXoC3gFPzD
         nkmG69em4MZjjuvAbX2Seen1CMfMF80o1es1irfRhPRsxmtodyyuWbbeDuRo+Ye3w7iJ
         ZFksLvY+U7fnMcr2L8vj6ffTbPGczuGqA+qbXH3vKWK14Dmst5laqfTLQEz59S/jrZIS
         Qul3Q5/aCwPA1MtI4Y8jL0mTw6xCGwrLrPimImyzIqLb2SPEE5dcmPIUmk4SE6y2uyEN
         wK7GdI2ZIK8cP4YUdzZsOKiBUDXieCNKnq8GbBIpp0ZqZr+gWSpSixfxzNu4K0R8xbKq
         AaIA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=Aq5oXQbU;
       spf=pass (google.com: domain of srs0=lex/=iw=gmail.com=akiyks@kernel.org designates 198.145.29.99 as permitted sender) smtp.mailfrom="SRS0=LEX/=IW=gmail.com=akiyks@kernel.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <SRS0=LEX/=IW=gmail.com=akiyks@kernel.org>
Received: from mail.kernel.org (mail.kernel.org. [198.145.29.99])
        by mx.google.com with ESMTPS id 11si920602pgo.480.2021.03.23.19.37.23
        for <paulmckrcu@gmail.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 23 Mar 2021 19:37:24 -0700 (PDT)
Received-SPF: pass (google.com: domain of srs0=lex/=iw=gmail.com=akiyks@kernel.org designates 198.145.29.99 as permitted sender) client-ip=198.145.29.99;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=Aq5oXQbU;
       spf=pass (google.com: domain of srs0=lex/=iw=gmail.com=akiyks@kernel.org designates 198.145.29.99 as permitted sender) smtp.mailfrom="SRS0=LEX/=IW=gmail.com=akiyks@kernel.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: by mail.kernel.org (Postfix)
	id C5F1261580; Wed, 24 Mar 2021 02:37:23 +0000 (UTC)
Delivered-To: paulmck@kernel.org
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9917161481
	for <paulmck@kernel.org>; Wed, 24 Mar 2021 02:37:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9917161481
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=akiyks@gmail.com
Received: by mail-pl1-f172.google.com with SMTP id k4so7140585plk.5
        for <paulmck@kernel.org>; Tue, 23 Mar 2021 19:37:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=cBN/9fMGK7VQZNQtKaQQF1PrngazFcys/iGIUERUxFI=;
        b=Aq5oXQbU0b5eQOxHJhtUESSKx/bA+z5X+yvEapK0xdJc+nun/72ezR586O0UHFeSon
         Tq6+VkMtC4l0HScD9F5aBXaUJhvhC4D96bqQK/eRuVY6mhMiHLMBvD4cDp0IE42gvSVV
         l13+FTMMEXRkGIMp+j5xDKsZhXB5SIsWD8vPFz1YR44XDLDPMJ/XfPXSUpqPrYmpy1le
         WDzaJNzbXy31mA+64DpCjNka/SiRkbQKYFBQv6VY3NKR3QUtvwhLRAOdTM4gftOzcWUJ
         BX8Z4DSAcKYSaNyx2ThSI5M/BaV0A7rCZZS1WJw/UDZqPIMf3Hlo7stwNIJS//aYGCWO
         C+1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=cBN/9fMGK7VQZNQtKaQQF1PrngazFcys/iGIUERUxFI=;
        b=NPiuIBkRyrfAzTnKVnoWK3Y6qO9cvOVRcSCuqMWNDYJl9jInqf24VxDjawlaeqrj2a
         KszVPdB3yj/pXxUdCQKE9Lsz6x2V3vM+9LLfvZxNKSp0oWeFtQoSZmdG4agR+gL4xa+Z
         efZCkiAJh2O38AkNqj61eQyDwMJsAVCv4Ec8O6gqNbfbzLjIakfEzs80vUw74suXvteN
         sngBiSvadgd7VQ1v5u/mRXnOW6Rzwot2quBya5fAYEmG+WgB/BUZrm/RiT0uyEp23IED
         jYxA2+nJ02rk2wI3gliUwWixRpBHhbR2yGaIxU3A/nGSFTzKusqoeJxVU0QgKeaZcPBf
         uxuA==
X-Gm-Message-State: AOAM531ZrtSKiDBYxeY28tIq0mT4gLjrlJPHdTBZ76FGRdCe6WOQlXpx
	FQAp6s4j3DxaU5uSsDDuV9I=
X-Received: by 2002:a17:90a:ec15:: with SMTP id l21mr1043755pjy.164.1616553443235;
        Tue, 23 Mar 2021 19:37:23 -0700 (PDT)
Received: from [192.168.11.2] (KD106167171201.ppp-bb.dion.ne.jp. [106.167.171.201])
        by smtp.gmail.com with ESMTPSA id 3sm490510pfh.13.2021.03.23.19.37.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 23 Mar 2021 19:37:22 -0700 (PDT)
Subject: [RFC PATCH 1/2] perfbook-lt: Add macro to shrink floats for ebook
To: Balbir Singh <bsingharora@gmail.com>
Cc: "Paul E. McKenney" <paulmck@kernel.org>, perfbook@vger.kernel.org,
 Akira Yokosawa <akiyks@gmail.com>
References: <20210323010153.GH77072@balbir-desktop>
 <20210323052354.GS2696@paulmck-ThinkPad-P72>
 <20210323093822.GJ77072@balbir-desktop>
 <3a81ce2e-3c94-9609-b6a3-e4597425e838@gmail.com>
 <20210324011529.GK77072@balbir-desktop>
 <4b4a3289-9bd3-7f54-8d5b-6722d4d05e2b@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <4c78a483-8a15-7b18-db65-5883754be1f0@gmail.com>
Date: Wed, 24 Mar 2021 11:37:19 +0900
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <4b4a3289-9bd3-7f54-8d5b-6722d4d05e2b@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Status: RO
Content-Length: 2850
Lines: 106

\ebresizewidth{} is for table and figure.
\ebresizewidthsw{} is for sidewaystable.
\ebresizeverb{}{} is for code snippets.  1st argument specifies
shrink ratio.

These macro affect the ebook-size build (perfbook-er.pdf) only.

See subsequent changes for usage examples.

Also do minor cosmetic changes:

o Adjust position of commit/tag watermark closer to the bottom.
o Select onesided build for ebook readers.  By this change,
  chapters can start from both odd and even pages.

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 perfbook-lt.tex | 42 +++++++++++++++++++++++++++++++++++-------
 1 file changed, 35 insertions(+), 7 deletions(-)

diff --git a/perfbook-lt.tex b/perfbook-lt.tex
index a884011a..dc4da264 100644
--- a/perfbook-lt.tex
+++ b/perfbook-lt.tex
@@ -35,6 +35,7 @@
 \captionsetup[listing]{font=small,labelsep=colon}
 \captionsetup[subfloat]{font=small}
 % \usepackage{breakurl}
+\usepackage{varwidth}
 \usepackage{graphicx}
 \usepackage{rotating}
 \usepackage{setspace}
@@ -176,11 +177,12 @@
 
 \IfTwoColumn{}{
   \setboolean{colorlinks}{true}
-  \renewcommand\footnotelayout{%
-    \advance\leftskip 0.0in
-    \advance\rightskip 0.7in
-  }
-}
+  \IfEbookSize{}{
+    \renewcommand\footnotelayout{%
+      \advance\leftskip 0.0in
+      \advance\rightskip 0.7in
+    }
+}}
 
 \IfColorLinks{
 \hypersetup{colorlinks=true,allcolors=MediumBlue}
@@ -202,7 +204,11 @@
 \renewcommand*\ttdefault{lmtt}
 %msfontstub
 
-\newcommand{\OneColumnHSpace}[1]{\IfTwoColumn{}{\hspace*{#1}}}
+\IfEbookSize{
+  \newcommand{\OneColumnHSpace}[1]{}
+}{
+  \newcommand{\OneColumnHSpace}[1]{\IfTwoColumn{}{\hspace*{#1}}}
+}
 
 \IfSansSerif{
 \renewcommand{\familydefault}{\sfdefault}
@@ -325,8 +331,9 @@
   \setlength{\twocolumnwidth}{3.125in}
   \IfEbookSize {
     % From https://tex.stackexchange.com/questions/16735/latex-options-for-kindle
-    \usepackage[papersize={4.5in,6.3in},margin=0.2in,onecolumn]{geometry}
+    \usepackage[papersize={4.5in,6.3in},margin=0.2in,onecolumn,twoside=false]{geometry}
     \sloppy
+    \setlength{\onecolumntextwidth}{4.1in}
     %\pagestyle{empty}
     %\usepackage[scaled]{helvet}
     %\renewcommand{\familydefault}{\sfdefault}
@@ -366,6 +373,27 @@
 \SetWatermarkVerCenter{.95\paperheight}
 }{}
 
+\IfEbookSize{
+\SetWatermarkHorCenter{.8\paperwidth}
+\SetWatermarkVerCenter{.99\paperheight}
+\newsavebox\ebbox
+\newcommand{\ebresizewidth}[1]{\resizebox{\textwidth}{!}{#1}}
+\newcommand{\ebresizewidthsw}[1]{\resizebox{.95\textheight}{!}{#1}}
+\newcommand{\ebresizeverb}[2]{%
+  \begin{lrbox}{\ebbox}%
+    \begin{varwidth}{\textwidth}%
+      {#2}%
+    \end{varwidth}%
+  \end{lrbox}%
+  \resizebox{#1\textwidth}{!}{\usebox{\ebbox}}%
+}
+}{
+\newcommand{\ebresizewidth}[1]{#1}
+\newcommand{\ebresizewidthsw}[1]{#1}
+\newcommand{\ebresizeverb}[2]{#2}
+}
+
+
 \begin{document}
 
 %%HTMLSKIP
-- 
2.17.1



From SRS0=LEX/=IW=gmail.com=akiyks@kernel.org Tue Mar 23 19:43:48 2021
Delivered-To: paulmckrcu@gmail.com
Received: from pop.gmail.com [74.125.20.109]
	by paulmck-ThinkPad-P72 with POP3 (fetchmail-6.3.26)
	for <paulmck@localhost> (single-drop); Tue, 23 Mar 2021 19:43:48 -0700 (PDT)
Received: by 2002:a0c:b506:0:0:0:0:0 with SMTP id d6csp2202567qve;
        Tue, 23 Mar 2021 19:38:40 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw3KISZ8ZyjwfsCeEE1chNnMUZLxseY5Wf/lqfXHvJz3n6oQp5lEEUGzCvRW02cyduq2w80
X-Received: by 2002:a17:902:f1c2:b029:e4:6c23:489f with SMTP id e2-20020a170902f1c2b02900e46c23489fmr1393007plc.62.1616553520637;
        Tue, 23 Mar 2021 19:38:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1616553520; cv=none;
        d=google.com; s=arc-20160816;
        b=iuoycHYNLV0ZIh8ryqVhBuEK4ZqToMKmisMPmoKPeZuOlMtypZNMlZZxLWtCX10jMS
         iC0s/h3Jk1UqP+tsG8V4V2fbT1WQhds21k85D2FQwmZUu8IRWiK8W0kGdM6qrikj8tgv
         doJmKgGNBUVCn2L+o7mFi1AV+pc5PKuqWrI1ZaltGJ8bhrLmOY5Qi+IyydfsFp2/q23G
         GGUYgMtLs3rJhnyskf3QafYC0QPqVqRbl35hQwtMzuzdT0m7EDkuyIFPSe6BBP2jwQqM
         DyqqSn4RgNMTZMLZyzfiqHwk/dOKCKGJXYV6Tu9ze6j2qpzIJ6Pqq00XWOqRUAEsEN7M
         woeA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject
         :dkim-signature:dmarc-filter:delivered-to;
        bh=Jw+t+nhk0pr8uL52hgYJqo59a9tH90l0vsUNITXpHxw=;
        b=FEMlCC82zHSMaSO0SFaib3fKvAXod9qkyBRDEdahiH9OChSj2V8/x+7zgjDrwc9ZdE
         3qu1VL34YmrbA6DRG/xvjkPoDD60ROBJSn59/2Cfccl3mdlTUEK31WLCLLPdb20cJtDO
         jTl+pzqORT3rrGryQieg1k3JoyUhstVoXqAlrdz3dFZ5YcSh00UkjhxydE+xVumezw/h
         NxxhVEgbHdXaYTx4k8bTmt+KiIVU+5rd36kf2ooJdcBj70Y2w17E9VKc/sJ9vQXkSCqz
         X1RkW5/N19Nv+YWMFm5qlSm9DxTrQKghnapeCqO/Dy+K1EBH003vPUCSLQlha+2ZzCRz
         hOsg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=JiLmUIuG;
       spf=pass (google.com: domain of srs0=lex/=iw=gmail.com=akiyks@kernel.org designates 198.145.29.99 as permitted sender) smtp.mailfrom="SRS0=LEX/=IW=gmail.com=akiyks@kernel.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <SRS0=LEX/=IW=gmail.com=akiyks@kernel.org>
Received: from mail.kernel.org (mail.kernel.org. [198.145.29.99])
        by mx.google.com with ESMTPS id ga6si646203pjb.2.2021.03.23.19.38.40
        for <paulmckrcu@gmail.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 23 Mar 2021 19:38:40 -0700 (PDT)
Received-SPF: pass (google.com: domain of srs0=lex/=iw=gmail.com=akiyks@kernel.org designates 198.145.29.99 as permitted sender) client-ip=198.145.29.99;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=JiLmUIuG;
       spf=pass (google.com: domain of srs0=lex/=iw=gmail.com=akiyks@kernel.org designates 198.145.29.99 as permitted sender) smtp.mailfrom="SRS0=LEX/=IW=gmail.com=akiyks@kernel.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: by mail.kernel.org (Postfix)
	id 4E31D61481; Wed, 24 Mar 2021 02:38:40 +0000 (UTC)
Delivered-To: paulmck@kernel.org
Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 241E86192E
	for <paulmck@kernel.org>; Wed, 24 Mar 2021 02:38:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 241E86192E
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=akiyks@gmail.com
Received: by mail-pj1-f46.google.com with SMTP id k23-20020a17090a5917b02901043e35ad4aso357353pji.3
        for <paulmck@kernel.org>; Tue, 23 Mar 2021 19:38:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=Jw+t+nhk0pr8uL52hgYJqo59a9tH90l0vsUNITXpHxw=;
        b=JiLmUIuGF7OSAbFNuYYAPGrkkXB2yfwa5J/xCEvjUgLKJiDq7+K/5OCFcZjB0Olws4
         jU2Q9bk5N977OixpPve/hMfdhanAazgDwENqhK2dm42TRVDZKGGv5px/m4qFov1SlmKa
         wW9ausIeydhEvu6JHXE4db1lKQcckPuiuzvyCK8I/i1ZfFBRGcobz4dVTRpGSxlQl/Cv
         ANFsAHMUovxNrKwep3/4lS9lyjkz0C+R7WjZ8ONkRsJfwRW/EQn94lulc2txe2TlwcOq
         HwwBslbF5PoctDhzBWUdl6QMQCbbLEq6Cfj7tKXI8LH6WlD1ldW2QgCVroolyBY+Xa3F
         dgWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=Jw+t+nhk0pr8uL52hgYJqo59a9tH90l0vsUNITXpHxw=;
        b=d55r67tccvOFjt65PPpGZoQRH3Qzg09jnTGeXrA0uzY03ASTNymWyOf5gMbbwrbkxD
         V7ILeImZEU7EBk7w67EHcmmATmT6Lj/5s+qfAkct3/hcnjRZ45u5sGal0qChdMKCxGCb
         ATSNNzJG5umsR4lV+br68EaYIMi+pvnHgSm3SYjDpgI7QFRsZOt9CuoafSGyMRfkfzxT
         mB0OE7jqMR+jH4VdEKn9mQ0+VjtjpPpk5B7hXDHWLCFs0mQeJ7Ij++MzYIsx01YqEbqW
         XCF9gAcH367h7JNtFcsuRHowa6rkyBzBp7s3wEM6MRpMiU8fMgkfjsYhb3wRxRy3y8bE
         m4UA==
X-Gm-Message-State: AOAM530DJsjO+0yT+Uz/pXB7t+vqLwWS4jvSpCvk6aSiBxQpV74dqttr
	h/T/k1q8ba06fkxn5FZvJS4rPgtOrrw=
X-Received: by 2002:a17:902:ecc4:b029:e6:1a9f:3397 with SMTP id a4-20020a170902ecc4b02900e61a9f3397mr1445959plh.9.1616553519718;
        Tue, 23 Mar 2021 19:38:39 -0700 (PDT)
Received: from [192.168.11.2] (KD106167171201.ppp-bb.dion.ne.jp. [106.167.171.201])
        by smtp.gmail.com with ESMTPSA id e20sm493841pgm.1.2021.03.23.19.38.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 23 Mar 2021 19:38:39 -0700 (PDT)
Subject: [RFC PATCH 2/2] cpu, toolsoftrade, count, rcuapi: Shrink floats for
 ebook reader
To: Balbir Singh <bsingharora@gmail.com>
Cc: "Paul E. McKenney" <paulmck@kernel.org>, perfbook@vger.kernel.org,
 Akira Yokosawa <akiyks@gmail.com>
References: <20210323010153.GH77072@balbir-desktop>
 <20210323052354.GS2696@paulmck-ThinkPad-P72>
 <20210323093822.GJ77072@balbir-desktop>
 <3a81ce2e-3c94-9609-b6a3-e4597425e838@gmail.com>
 <20210324011529.GK77072@balbir-desktop>
 <4b4a3289-9bd3-7f54-8d5b-6722d4d05e2b@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <f8c67c44-04da-513d-682d-08c2e60ba993@gmail.com>
Date: Wed, 24 Mar 2021 11:38:37 +0900
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <4b4a3289-9bd3-7f54-8d5b-6722d4d05e2b@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Status: RO
Content-Length: 6707
Lines: 200

This commit demonstrates usages of \ebresizewidth, \ebresizewidthsw,
and \ebresizeverb.

NOTES:
o \ebresizeverb adds a blank line at the bottom of shrinked snippet.
  Hopefully, this can be fixed soon.
o One of sidewaystable in rcuapi uses \ebresizeverb, since tabularx
  in sidewaystable behaves unexpectedly within \ebresizewidthsw{}.
  The table has APIs enclosed in \tco{} which desides the widths of
  columns.

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 count/count.tex               | 16 +++++++++++-----
 cpu/overheads.tex             |  2 ++
 defer/rcuapi.tex              | 12 +++++++++++-
 toolsoftrade/toolsoftrade.tex |  2 ++
 4 files changed, 26 insertions(+), 6 deletions(-)

diff --git a/count/count.tex b/count/count.tex
index cafbcafc..abd85eaf 100644
--- a/count/count.tex
+++ b/count/count.tex
@@ -967,7 +967,7 @@ converge on the true value---hence this approach qualifies as
 eventually consistent.
 
 \begin{listing}[tbp]
-\input{CodeSamples/count/count_stat_eventual@whole.fcv}
+\ebresizeverb{.9}{\input{CodeSamples/count/count_stat_eventual@whole.fcv}}
 \caption{Array-Based Per-Thread Eventually Consistent Counters}
 \label{lst:count:Array-Based Per-Thread Eventually Consistent Counters}
 \end{listing}
@@ -1666,7 +1666,11 @@ line~\lnref{adjglobal} makes the corresponding adjustment to
 
 \begin{figure*}[tb]
 \centering
+\IfEbookSize{
+\resizebox{\textwidth}{!}{\includegraphics{count/globbal}}
+}{
 \resizebox{5in}{!}{\includegraphics{count/globbal}}
+}
 \caption{Schematic of Globalization and Balancing}
 \label{fig:count:Schematic of Globalization and Balancing}
 \end{figure*}
@@ -1981,7 +1985,7 @@ the result.
 }\QuickQuizEnd
 
 \begin{listing}[tbp]
-\input{CodeSamples/count/count_lim_atomic@add_sub.fcv}
+\ebresizeverb{.76}{\input{CodeSamples/count/count_lim_atomic@add_sub.fcv}}
 \caption{Atomic Limit Counter Add and Subtract}
 \label{lst:count:Atomic Limit Counter Add and Subtract}
 \end{listing}
@@ -2095,7 +2099,7 @@ the reader.
 \end{fcvref}
 
 \begin{listing}[tbp]
-\input{CodeSamples/count/count_lim_atomic@read.fcv}
+\ebresizeverb{.85}{\input{CodeSamples/count/count_lim_atomic@read.fcv}}
 \caption{Atomic Limit Counter Read}
 \label{lst:count:Atomic Limit Counter Read}
 \end{listing}
@@ -2384,7 +2388,7 @@ and \co{theft} variables, respectively.
 \end{fcvref}
 
 \begin{listing}[tbp]
-\input{CodeSamples/count/count_lim_sig@data.fcv}
+\ebresizeverb{.9}{\input{CodeSamples/count/count_lim_sig@data.fcv}}
 \caption{Signal-Theft Limit Counter Data}
 \label{lst:count:Signal-Theft Limit Counter Data}
 \end{listing}
@@ -2413,7 +2417,7 @@ state to READY\@.
 \end{fcvref}
 
 \begin{listing}[tbp]
-\input{CodeSamples/count/count_lim_sig@migration.fcv}
+\ebresizeverb{.78}{\input{CodeSamples/count/count_lim_sig@migration.fcv}}
 \caption{Signal-Theft Limit Counter Value-Migration Functions}
 \label{lst:count:Signal-Theft Limit Counter Value-Migration Functions}
 \end{listing}
@@ -2834,6 +2838,7 @@ will expand on these lessons.
 \small
 \centering
 \newcommand{\NA}{\cellcolor{white}}
+\ebresizewidth{
 \begin{tabular}{lrcS[table-format=2.1]S[table-format=3.0]S[table-format=4.0]
 		  S[table-format=6.0]S[table-format=6.0]}
 	\toprule
@@ -2869,6 +2874,7 @@ will expand on these lessons.
 		Y &  4.7 & 519 & 6 805 & 120 000 & 238 811 \\
 	\bottomrule
 \end{tabular}
+}
 \caption{Statistical/Limit Counter Performance on x86}
 \label{tab:count:Statistical/Limit Counter Performance on x86}
 \end{table*}
diff --git a/cpu/overheads.tex b/cpu/overheads.tex
index 9a39e5a3..6b3b7008 100644
--- a/cpu/overheads.tex
+++ b/cpu/overheads.tex
@@ -137,6 +137,7 @@ optimization.
 \rowcolors{1}{}{lightgray}
 \renewcommand*{\arraystretch}{1.1}
 \centering\small
+\ebresizewidth{
 \begin{tabular}
   {
     l
@@ -166,6 +167,7 @@ optimization.
 	Global Comms	& 195 000 000 & 409 500 000 & \\
 	\bottomrule
 \end{tabular}
+}
 \caption{CPU 0 View of Synchronization Mechanisms on 8-Socket System With Intel Xeon Platinum 8176 CPUs @ 2.10\,GHz}
 \label{tab:cpu:CPU 0 View of Synchronization Mechanisms on 8-Socket System With Intel Xeon Platinum 8176 CPUs at 2.10GHz}
 \end{table*}
diff --git a/defer/rcuapi.tex b/defer/rcuapi.tex
index 74efb10d..b4c2763e 100644
--- a/defer/rcuapi.tex
+++ b/defer/rcuapi.tex
@@ -51,7 +51,8 @@ API~\cite{PaulEMcKenney2019RCUAPI}.\footnote{
 \centering
 \caption{RCU Wait-to-Finish APIs}
 \label{tab:defer:RCU Wait-to-Finish APIs}
-\scriptsize\hspace*{-.125in}
+\scriptsize\IfEbookSize{\hspace*{-1.8in}}{\hspace*{-.125in}}
+\ebresizeverb{0.7}{
 \begin{tabularx}{8.5in}{>{\raggedright\arraybackslash}p{0.94in}
     >{\raggedright\arraybackslash}X
     >{\raggedright\arraybackslash}X
@@ -146,6 +147,7 @@ API~\cite{PaulEMcKenney2019RCUAPI}.\footnote{
 		    N/A \\
 \bottomrule
 \end{tabularx}
+}
 \end{sidewaystable*}
 
 If you are new to RCU, you might consider focusing on just one
@@ -415,6 +417,7 @@ that Linux supports~\cite{Spraul01}.
 \renewcommand*{\arraystretch}{1.15}
 \footnotesize
 \centering\OneColumnHSpace{-.4in}
+\ebresizewidth{
 \begin{tabular}{llp{2.2in}}
 \toprule
 Category &
@@ -457,6 +460,7 @@ Pointer subscribe (traveral) &
 		Simple instructions (memory barrier on Alpha) \\
 \bottomrule
 \end{tabular}
+}
 \caption{RCU Publish-Subscribe and Version Maintenance APIs}
 \label{tab:defer:RCU Publish-Subscribe and Version Maintenance APIs}
 \end{table*}
@@ -737,6 +741,7 @@ be a separate spinlock to be stored with the pointer itself.
   \setlength{\cwa}{1.95in}\setlength{\cwb}{2.15in}
   \setlength{\cwc}{1.9in}\setlength{\cwd}{1.7in}
 }
+\ebresizewidthsw{
 \begin{tabular}{>{\raggedright\arraybackslash}p{\cwa}
     >{\raggedright\arraybackslash}p{\cwb}
     >{\raggedright\arraybackslash}p{\cwc}
@@ -820,6 +825,7 @@ be a separate spinlock to be stored with the pointer itself.
 	    \\
 \bottomrule
 \end{tabular}
+}
 \end{sidewaystable*}
 
 The API members for these linked-list variants are summarized in
@@ -854,7 +860,11 @@ kfree(p);				\lnlbl[kfree]
 
 \begin{figure}[tbp]
 \centering
+\IfEbookSize{
+\resizebox{2in}{!}{\includegraphics{defer/RCUReplacement}}
+}{
 \resizebox{2.7in}{!}{\includegraphics{defer/RCUReplacement}}
+}
 \caption{RCU Replacement in Linked List}
 \label{fig:defer:RCU Replacement in Linked List}
 \end{figure}
diff --git a/toolsoftrade/toolsoftrade.tex b/toolsoftrade/toolsoftrade.tex
index 9e0838cb..bf34d2ca 100644
--- a/toolsoftrade/toolsoftrade.tex
+++ b/toolsoftrade/toolsoftrade.tex
@@ -479,7 +479,9 @@ lock~\cite{Hoare74}.
 }\QuickQuizEnd
 
 \begin{listing}[tbp]
+\ebresizeverb{.85}{
 \input{CodeSamples/toolsoftrade/lock@reader_writer.fcv}
+}
 \caption{Demonstration of Exclusive Locks}
 \label{lst:toolsoftrade:Demonstration of Exclusive Locks}
 \end{listing}
-- 
2.17.1



From SRS0=4SL/=IX=gmail.com=akiyks@kernel.org Thu Mar 25 04:00:01 2021
Delivered-To: paulmckrcu@gmail.com
Received: from pop.gmail.com [74.125.20.109]
	by paulmck-ThinkPad-P72 with POP3 (fetchmail-6.3.26)
	for <paulmck@localhost> (single-drop); Thu, 25 Mar 2021 04:00:01 -0700 (PDT)
Received: by 2002:a0c:b506:0:0:0:0:0 with SMTP id d6csp252249qve;
        Thu, 25 Mar 2021 03:52:31 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxRmVP+6gd6zh92EXDCu9tNF+foYTv+BnaBQ//43F3uRtdAfdEuLf/KZT8k4lZFH3Y3xdFr
X-Received: by 2002:a62:ddd2:0:b029:1f1:533b:b1cf with SMTP id w201-20020a62ddd20000b02901f1533bb1cfmr7360190pff.56.1616669551006;
        Thu, 25 Mar 2021 03:52:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1616669551; cv=none;
        d=google.com; s=arc-20160816;
        b=0DYUB/9H8PsqPo7H56Fy6jFpWEjdteFTfEmyrvk3x8ySQWHY/vFaqwwrCiIs3txl9m
         uiP/A6/SC/TjbL7h6ned8cbIQAgfj1VWjsFBdpHbMl3WkOb7OhLM4Zy+wLL4Asq+dZ88
         mjbg+CL8lNkRcT8FJeOjYbnbyAwYLz9O1WAhgxwj07LLHQHHgrjK8vWdywTfW/GQrsIy
         T/dyHBrgcgD1nKB0fqoomTSVwrvmw5Pp+ziqBOHZcud/SaWNx8M+oKZsQUtSqPu7SO8v
         PEug+D4Fjhqkngg9skDbbP0PifcUVV+4wS9Bf8i1y3tuIt+f8M+KfzkKWiXxULcElHK8
         zziA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject
         :dkim-signature:dmarc-filter:delivered-to;
        bh=g6ksUcfOOjxRdiaFdcsMwcPznsGHHZ3Pqgxl4FCOKUA=;
        b=fkxMsCV4o2F7b+3KvgQT6z/Wu+O2NPXB6d8LfzUzwOW8sw26N0Ny/ugT6XwOGrpZq1
         SMviRyxSkyI6VNzf3y13NmMIZCZLGthkBL8IMzoVJvMFiMDOubOcrclEmbJUFXMMic5S
         M5rJTzPe9kuensr8Mj2k92pnipJ7LVjHnMqjrHruZ70Aj+W2s3JV3suIFLkfgUfPXXc6
         YQxgKdoSD+SaeoB4CDvsplIjm0Kyz7rfEPqKnxLAlEace/ri/XZTPSpwf+7EY8c5tK4s
         FgnyRe7u2z12s9AMoHd9ulERX7sKwDhm0DdtnX2ohLe/0JR+SaLJoM02nU/PfjPfsC5Z
         duzg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=BzsAZnva;
       spf=pass (google.com: domain of srs0=4sl/=ix=gmail.com=akiyks@kernel.org designates 198.145.29.99 as permitted sender) smtp.mailfrom="SRS0=4SL/=IX=gmail.com=akiyks@kernel.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <SRS0=4SL/=IX=gmail.com=akiyks@kernel.org>
Received: from mail.kernel.org (mail.kernel.org. [198.145.29.99])
        by mx.google.com with ESMTPS id h9si5600978pgv.177.2021.03.25.03.52.30
        for <paulmckrcu@gmail.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 25 Mar 2021 03:52:30 -0700 (PDT)
Received-SPF: pass (google.com: domain of srs0=4sl/=ix=gmail.com=akiyks@kernel.org designates 198.145.29.99 as permitted sender) client-ip=198.145.29.99;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=BzsAZnva;
       spf=pass (google.com: domain of srs0=4sl/=ix=gmail.com=akiyks@kernel.org designates 198.145.29.99 as permitted sender) smtp.mailfrom="SRS0=4SL/=IX=gmail.com=akiyks@kernel.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: by mail.kernel.org (Postfix)
	id AC74C61A28; Thu, 25 Mar 2021 10:52:30 +0000 (UTC)
Delivered-To: paulmck@kernel.org
Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com [209.85.215.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6BDD961A27
	for <paulmck@kernel.org>; Thu, 25 Mar 2021 10:52:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6BDD961A27
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=akiyks@gmail.com
Received: by mail-pg1-f178.google.com with SMTP id r17so1427773pgi.0
        for <paulmck@kernel.org>; Thu, 25 Mar 2021 03:52:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=g6ksUcfOOjxRdiaFdcsMwcPznsGHHZ3Pqgxl4FCOKUA=;
        b=BzsAZnvaZZZjgFQy6KCKXauMBzPLExMUuf7rwtJw75zmSirYako2ovpLCV8YVhJgaX
         OvgMmjSpWY7V1NLbkGKz2C+VyWFOt5qF/zZrO+1J1OIBEpNmkUGF474SRtTk8hwdAXxs
         RDfeS5mRkhIz/4uGEIi2QGHbPUfeTjUnOIRlts/+QOtfSllRGrwqETgFmx6k/zin3+Bv
         oH3gGZsE36ffWqgHpAV9hB0Dqk/qVFxi9olwrOi1QkGXrxz4qpHvO8KTKOC66ZSCgW1l
         a+iD351J5nWeCgRDiL+ct/gCZYiSXPyUEKPjGmGNI+ms14NMLwj3+s8Ca+d6E9UypLR1
         WttQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=g6ksUcfOOjxRdiaFdcsMwcPznsGHHZ3Pqgxl4FCOKUA=;
        b=VEHOr2BN/BArV/bqNRz+9bR6X50Zx4/5KMJ6ws5G73buzOGjWmHQAr9ob9R42kE0nc
         ErUwYuG4/eQFFbwB8gwIdDl7s5iGTTTZy+wRKApIPVQgfXeUK6qfA/Si1rV4McLKSkgX
         jvzCIpsxyb3JJvegAcM1Ci2m910XzrJs5IOVphHdAis+jfF2UiCTsUO+QdzbmHe6oh16
         Dned+FD5040bBIoabIlu1o6hb8g2YtEJcO5nXK48wBTgetbXwUa2ZY3L13xnBxdqYNBO
         FGB4lFqVuT87dGvKyUe583DVBmzBxoMnu6Ir76Z5I+Le3Ky37NbLe69P9xcbwzvxKEWm
         eAUA==
X-Gm-Message-State: AOAM532lZhe2P1zV59B5+vElr/hVoc0Jt4GGt6tuTNMJCGKZS6Gjlsak
	/drJC+E1Z95pjFo5atzBKPg=
X-Received: by 2002:a63:1518:: with SMTP id v24mr7092378pgl.119.1616669549925;
        Thu, 25 Mar 2021 03:52:29 -0700 (PDT)
Received: from [192.168.11.2] (KD106167171201.ppp-bb.dion.ne.jp. [106.167.171.201])
        by smtp.gmail.com with ESMTPSA id q184sm5667285pfc.78.2021.03.25.03.52.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 25 Mar 2021 03:52:29 -0700 (PDT)
Subject: [PATCH -perfbook 1/5] perfbook/papersize: ebook reader size support
To: Balbir Singh <bsingharora@gmail.com>,
 "Paul E. McKenney" <paulmck@kernel.org>
Cc: perfbook@vger.kernel.org
References: <20210323010153.GH77072@balbir-desktop>
 <64419413-f54f-a737-bcae-e03b8ecaf606@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <a259ca25-cb15-781f-dcdf-b1c6eef7a2c7@gmail.com>
Date: Thu, 25 Mar 2021 19:52:25 +0900
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <64419413-f54f-a737-bcae-e03b8ecaf606@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Content-Length: 4005
Lines: 114

From: Balbir Singh <bsingharora@gmail.com>

Add support for ebooksize, which is roughly the size of
a kindle (4.5in, 6.3in) with margin size of 0.2in. The
recommended changes were taken from stackexchange with
links in the code. Not all tables take nicely to the
new size and warnings are produced, these warnings are
about overfull hbox's. This size/target also enforces
single column output and increases the size of the pdf
by almost 40% in terms of number of pages. The actual size
on the disk is not all that different. The final output
though is very readable on the kindle I own.

PDF of ebooksize can be built by either:

    make perfbook-eb.pdf

or

    env PERFBOOK_PAPER=EB make perfbook.pdf

TODOs:
1. Make tables and some figures work nicely in this mode
2. Consider scaling the font

Signed-off-by: Balbir singh <bsingharora@gmail.com>
[akiyks: changed target & env name to "eb" and "EB", massage commit log]
Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 Makefile        | 10 +++++++++-
 perfbook-lt.tex | 13 ++++++++++++-
 2 files changed, 21 insertions(+), 2 deletions(-)

diff --git a/Makefile b/Makefile
index db20da96..415bcef3 100644
--- a/Makefile
+++ b/Makefile
@@ -29,7 +29,7 @@ LATEXGENERATED = autodate.tex qqz.tex contrib.tex origpub.tex sub_qqz
 # parallel runs of divideqqz.pl.
 
 TWOCOLTARGETS := mstx msr msn msnt sf qq nq ix
-ABBREVTARGETS := lt hb a4 1c tcb msns mss $(TWOCOLTARGETS) $(foreach v,$(TWOCOLTARGETS),1c$(v))
+ABBREVTARGETS := lt hb a4 1c tcb msns mss eb $(TWOCOLTARGETS) $(foreach v,$(TWOCOLTARGETS),1c$(v))
 
 PDFTARGETS := perfbook.pdf $(foreach v,$(ABBREVTARGETS),perfbook-$(v).pdf)
 GENERATED_MAIN := $(filter-out perfbook-lt.tex,$(foreach v,$(ABBREVTARGETS),perfbook-$(v).tex)) perfbook.tex
@@ -178,10 +178,14 @@ ifeq ($(PERFBOOK_PAPER),A4)
 else
 ifeq ($(PERFBOOK_PAPER),HB)
 	PERFBOOK_BASE = perfbook-hb.tex
+else
+ifeq ($(PERFBOOK_PAPER),EB)
+	PERFBOOK_BASE = perfbook-eb.tex
 else
 	PERFBOOK_BASE = perfbook-lt.tex
 endif
 endif
+endif
 
 .PHONY: all touchsvg clean distclean neatfreak 2c ls-unused $(ABBREVTARGETS) mslm perfbook-mslm.pdf mslmmsg help help-official help-full
 all: $(targ)
@@ -283,6 +287,10 @@ perfbook-1c.tex: $(PERFBOOK_BASE)
 perfbook-hb.tex: perfbook-lt.tex
 	sed -e 's/setboolean{hardcover}{false}/setboolean{hardcover}{true}/' < $< > $@
 
+perfbook-eb.tex: perfbook-lt.tex
+	sed -e 's/setboolean{ebooksize}{false}/setboolean{ebooksize}{true}/' < $< > $@
+	sed -i 's/setboolean{twocolumn}{true}/setboolean{twocolumn}{false}/' $@
+
 perfbook-msns.tex: $(PERFBOOK_BASE)
 	sed -e 's/%msfontstub/\\usepackage{courier}/' < $< > $@
 
diff --git a/perfbook-lt.tex b/perfbook-lt.tex
index e76d4d7b..a884011a 100644
--- a/perfbook-lt.tex
+++ b/perfbook-lt.tex
@@ -116,6 +116,9 @@
 \newboolean{hardcover}
 \setboolean{hardcover}{false}
 \newcommand{\IfHardCover}[2]{\ifthenelse{\boolean{hardcover}}{#1}{#2}}
+\newboolean{ebooksize}
+\setboolean{ebooksize}{false}
+\newcommand{\IfEbookSize}[2]{\ifthenelse{\boolean{ebooksize}}{#1}{#2}}
 \newboolean{afourpaper}
 \setboolean{afourpaper}{false}
 \newcommand{\IfAfourPaper}[2]{\ifthenelse{\boolean{afourpaper}}{#1}{#2}}
@@ -320,6 +323,14 @@
       \usepackage[letterpaper,body={6.5in,8.25in},twocolumn,columnsep=0.25in]{geometry}      
 }}}{ % One Column
   \setlength{\twocolumnwidth}{3.125in}
+  \IfEbookSize {
+    % From https://tex.stackexchange.com/questions/16735/latex-options-for-kindle
+    \usepackage[papersize={4.5in,6.3in},margin=0.2in,onecolumn]{geometry}
+    \sloppy
+    %\pagestyle{empty}
+    %\usepackage[scaled]{helvet}
+    %\renewcommand{\familydefault}{\sfdefault}
+  }{
   \IfHardCover{
     \usepackage[papersize={8.25in,10.75in},body={4.75in,8.25in},onecolumn]{geometry}
   }{
@@ -327,7 +338,7 @@
     \usepackage[a4paper,body={4.75in,8.25in},onecolumn]{geometry}
     }{
     \usepackage[letterpaper,body={4.75in,8.25in},onecolumn]{geometry}
-  }}
+  }}}
   \geometry{hcentering=true} % horizontal centering for 1c layouts
 }
 \IfAfourPaper{
-- 
2.17.1



From SRS0=4SL/=IX=gmail.com=akiyks@kernel.org Thu Mar 25 04:00:02 2021
Delivered-To: paulmckrcu@gmail.com
Received: from pop.gmail.com [74.125.20.109]
	by paulmck-ThinkPad-P72 with POP3 (fetchmail-6.3.26)
	for <paulmck@localhost> (single-drop); Thu, 25 Mar 2021 04:00:02 -0700 (PDT)
Received: by 2002:a0c:b506:0:0:0:0:0 with SMTP id d6csp254364qve;
        Thu, 25 Mar 2021 03:55:56 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzHN/Qck2iMb14NWX8Dd0AbbFUIZZpZS53Ygs21NI+fedDCekLSp/JrZyr/67ykM7d2ue9o
X-Received: by 2002:a63:1021:: with SMTP id f33mr7052754pgl.409.1616669756415;
        Thu, 25 Mar 2021 03:55:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1616669756; cv=none;
        d=google.com; s=arc-20160816;
        b=tFlcqhRsTq74Nb9/LItP99761/BiI78JerECFVl//GwpOhDuDC2nPP7WlZnhQ9ChDA
         dyNf/u38ago7J2WFucOwo6zHUxY6/0esT3GOrjnSUu/m44efVB6tzMrkN/cUwWyGFEXr
         zIMoFMQrhvMgczGwqnLl+e5it+6kMNw3vZ3Glk6j0vraqwOVuC3PQ93kX1gzakmlQI7N
         Vj7Db/NwzCghE/8n1ob9jNENGMGwXAm2jgFlVP5ci77CfnRnMlYid4pvCkcpfcidw01U
         pEYRpXe5Y3jj9clDyUr0w0QgNIJ3vBdgpKaftRv4Lu06NV/YXY0nWXQ1a/MnfWRpx5iN
         7yqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject
         :dkim-signature:dmarc-filter:delivered-to;
        bh=Ys/HokKRotBTbccgr4VOYLsm1cPS9vuXRYIiX02PC30=;
        b=GCcMYTvFCo6ZW/5dQvMD5jXxxIEZvv3tCAMPng5llUsbfcIO22LOcrc+eBkmM7UE+4
         YD8FdbmHayTZK69uYHIYrMkzM7kBiqu5vDqm5bcTJov5vdvwr7ca3zfO10hY9f9q/VoP
         PUjr79O5TE149sE048okOsvmT7KWzkAqZStOS4YVGXh+wdV+oAG1LIOsob3i9eYp405E
         g2Y2NulIvs/Wx3IHak6dQ0DW0oH/6HFAEHxbsxsclLgfoclQpsOCDs7j0z2qa0k22/pM
         rzguD2ZMy4UKj8XXJ4KLUsOVfwOT9KJUSl2MIK7qZUlqEUHXDv4JjlxqIyDXnEtQZxYD
         iiSQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b="RqyEB/PW";
       spf=pass (google.com: domain of srs0=4sl/=ix=gmail.com=akiyks@kernel.org designates 198.145.29.99 as permitted sender) smtp.mailfrom="SRS0=4SL/=IX=gmail.com=akiyks@kernel.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <SRS0=4SL/=IX=gmail.com=akiyks@kernel.org>
Received: from mail.kernel.org (mail.kernel.org. [198.145.29.99])
        by mx.google.com with ESMTPS id f4si5190254plo.231.2021.03.25.03.55.56
        for <paulmckrcu@gmail.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 25 Mar 2021 03:55:56 -0700 (PDT)
Received-SPF: pass (google.com: domain of srs0=4sl/=ix=gmail.com=akiyks@kernel.org designates 198.145.29.99 as permitted sender) client-ip=198.145.29.99;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b="RqyEB/PW";
       spf=pass (google.com: domain of srs0=4sl/=ix=gmail.com=akiyks@kernel.org designates 198.145.29.99 as permitted sender) smtp.mailfrom="SRS0=4SL/=IX=gmail.com=akiyks@kernel.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: by mail.kernel.org (Postfix)
	id 0D90E61A26; Thu, 25 Mar 2021 10:55:56 +0000 (UTC)
Delivered-To: paulmck@kernel.org
Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C94DC619B4
	for <paulmck@kernel.org>; Thu, 25 Mar 2021 10:55:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C94DC619B4
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=akiyks@gmail.com
Received: by mail-pf1-f180.google.com with SMTP id l123so1643688pfl.8
        for <paulmck@kernel.org>; Thu, 25 Mar 2021 03:55:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=Ys/HokKRotBTbccgr4VOYLsm1cPS9vuXRYIiX02PC30=;
        b=RqyEB/PWQQKfkucVjYYjKB5gp9wTq9wUc9O6PvImzqvGPVQmAhk8AUEm4P7FRKpGcf
         aCAwa9jzAMQt3uI2WCbJ4WxxG3KcoY+57t4hzvy9gCLeOZ3Ptndu2xIKEzvSGg3w8rfu
         9ZanzU7Qqk7IiPME9rnXBecrkyV6mUJuapDYm9gKVR9YRHPVBarEKbsjUI0OBL6VC+5T
         xDirmgRN7bXCwUpdoqpC9LGanrVDe0CFG/aahagCK06J1Hze7oAsO8Jd+qAeGwkoHc8B
         YcUB9SfCUXt8D73kI76kCzPhaDGp0UHUaJL162XHbWQX02kViARF1v3ExwJ/8pK4mkJH
         GnmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=Ys/HokKRotBTbccgr4VOYLsm1cPS9vuXRYIiX02PC30=;
        b=ppPrmI41j5dWnRmCJSK5XvGOhutpXOtH1xFnR55rKK9c5tj2UVjTzuGuWDAUbT2Eju
         +bA0uZSHEgmYYy5ep4ongWsJeqEtNWk232psHdvDf2W/ZV90B1m+a4yascoUWULwsxVb
         iXe2XpWiEpB4RBD6XN6QLxrSwltpNi4TUC4OMuZXSU00ulaZwDNsfhZT9itZg/GbRE/o
         Iewrh+lplHdqnW7Ik/5HkCg5Mt9Io+U7x/Rl4NuENbvjQpEkVIkkuuoXu7n2iGTwizfC
         VjDPnqavzp65uvl6IE6CkshNmWR01m8nFaktWJSk8P3/IwNMCR5PKhdj8rZe0A1hRw4A
         EgWw==
X-Gm-Message-State: AOAM5321IX5JBkNLeEOoiXFEmu6dF+B4pBNyzvYQJ+HLVpxU9+yxYcjG
	jDoe24iPTFLLBtzAmu5mtAE=
X-Received: by 2002:a62:2d6:0:b029:204:9b3b:dced with SMTP id 205-20020a6202d60000b02902049b3bdcedmr7356029pfc.36.1616669755363;
        Thu, 25 Mar 2021 03:55:55 -0700 (PDT)
Received: from [192.168.11.2] (KD106167171201.ppp-bb.dion.ne.jp. [106.167.171.201])
        by smtp.gmail.com with ESMTPSA id mp21sm6107454pjb.16.2021.03.25.03.55.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 25 Mar 2021 03:55:54 -0700 (PDT)
Subject: [PATCH -perfbook 2/5] perfbook-lt: Add macros to shrink floats for
 ebook
To: Balbir Singh <bsingharora@gmail.com>,
 "Paul E. McKenney" <paulmck@kernel.org>
Cc: perfbook@vger.kernel.org
References: <20210323010153.GH77072@balbir-desktop>
 <64419413-f54f-a737-bcae-e03b8ecaf606@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <291b72a3-1f65-0fd0-114e-d2154bd66c94@gmail.com>
Date: Thu, 25 Mar 2021 19:55:51 +0900
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <64419413-f54f-a737-bcae-e03b8ecaf606@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Content-Length: 4179
Lines: 138

\ebresizewidth{} is for table and figure.
\ebresizewidthsw{} is for sidewaystable.
\ebresizeverb{}{} is for code snippets.  1st argument specifies
a resize ratio.

These macros affect the ebook-size build (e.g. perfbook-eb.pdf) only.

See subsequent changes for their usage examples.

Also do minor cosmetic changes:

o Move commit/tag watermark closer to the bottom.
o Select onesided build for ebooksize.
  By this change, chapters can start from both odd and even pages.
o Select 'section' option of placeins for ebook-size build.
  This change prevents overloaded floats to appear far from where
  they are mentioned.  This will occasionally cause premature
  page breaks, but they should be acceptable for ebook builds.
o Void \OneColumnHSpace
o Define \ebFloatBarrier macro which can be used for ebook-size-only
  float barriers.
o Allow footnotes to occupy full textwidth.

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
Acked-by: Balbir Singh <bsingharora@gmail.com>
---
 perfbook-lt.tex | 51 +++++++++++++++++++++++++++++++++++++++++--------
 1 file changed, 43 insertions(+), 8 deletions(-)

diff --git a/perfbook-lt.tex b/perfbook-lt.tex
index a884011a..1272fc95 100644
--- a/perfbook-lt.tex
+++ b/perfbook-lt.tex
@@ -35,6 +35,7 @@
 \captionsetup[listing]{font=small,labelsep=colon}
 \captionsetup[subfloat]{font=small}
 % \usepackage{breakurl}
+\usepackage{varwidth}
 \usepackage{graphicx}
 \usepackage{rotating}
 \usepackage{setspace}
@@ -74,7 +75,6 @@
 \usepackage[split,makeindex]{splitidx}
 \usepackage[nottoc]{tocbibind}
 \usepackage[columns=3,totoc,indentunit=12pt,justific=raggedright,font=small,columnsep=.15in,unbalanced]{idxlayout}
-\usepackage{placeins}
 \usepackage[bookmarks=true,bookmarksnumbered=true,pdfborder={0 0 0},linktoc=all]{hyperref}
 \usepackage{footnotebackref} % to enable cross-ref of footnote
 \usepackage[all]{hypcap} % for going to the top of figure and table
@@ -147,6 +147,11 @@
 \setboolean{indexhl}{false}
 \newcommand{\IfIndexHl}[2]{\ifthenelse{\boolean{indexhl}}{#1}{#2}}
 
+\IfEbookSize{
+\usepackage[section]{placeins}
+}{
+\usepackage{placeins}
+}
 % Custom commands for index
 \newindex[API Index]{api} % index for API
 \newindex[People Name Index]{ppl} % index for People Name
@@ -176,11 +181,12 @@
 
 \IfTwoColumn{}{
   \setboolean{colorlinks}{true}
-  \renewcommand\footnotelayout{%
-    \advance\leftskip 0.0in
-    \advance\rightskip 0.7in
-  }
-}
+  \IfEbookSize{}{
+    \renewcommand\footnotelayout{%
+      \advance\leftskip 0.0in
+      \advance\rightskip 0.7in
+    }
+}}
 
 \IfColorLinks{
 \hypersetup{colorlinks=true,allcolors=MediumBlue}
@@ -202,7 +208,11 @@
 \renewcommand*\ttdefault{lmtt}
 %msfontstub
 
-\newcommand{\OneColumnHSpace}[1]{\IfTwoColumn{}{\hspace*{#1}}}
+\IfEbookSize{
+  \newcommand{\OneColumnHSpace}[1]{}
+}{
+  \newcommand{\OneColumnHSpace}[1]{\IfTwoColumn{}{\hspace*{#1}}}
+}
 
 \IfSansSerif{
 \renewcommand{\familydefault}{\sfdefault}
@@ -325,8 +335,9 @@
   \setlength{\twocolumnwidth}{3.125in}
   \IfEbookSize {
     % From https://tex.stackexchange.com/questions/16735/latex-options-for-kindle
-    \usepackage[papersize={4.5in,6.3in},margin=0.2in,onecolumn]{geometry}
+    \usepackage[papersize={4.5in,6.3in},margin=0.2in,onecolumn,twoside=false]{geometry}
     \sloppy
+    \setlength{\onecolumntextwidth}{4.1in}
     %\pagestyle{empty}
     %\usepackage[scaled]{helvet}
     %\renewcommand{\familydefault}{\sfdefault}
@@ -366,6 +377,30 @@
 \SetWatermarkVerCenter{.95\paperheight}
 }{}
 
+\IfEbookSize{
+\SetWatermarkHorCenter{.8\paperwidth}
+\SetWatermarkVerCenter{.99\paperheight}
+\newsavebox\ebbox
+\newcommand{\ebresizewidth}[1]{\resizebox{\textwidth}{!}{#1}}
+\newcommand{\ebresizewidthsw}[1]{\resizebox{.95\textheight}{!}{#1}}
+\newcommand{\ebresizeverb}[2]{%
+  \begin{lrbox}{\ebbox}%
+    \begin{varwidth}{\textwidth}%
+      {#2}%
+    \end{varwidth}%
+  \end{lrbox}%
+  \resizebox{#1\textwidth}{!}{\usebox{\ebbox}}%
+  \vspace*{-7pt}%
+}
+\newcommand\ebFloatBarrier{\FloatBarrier}
+}{
+\newcommand{\ebresizewidth}[1]{#1}
+\newcommand{\ebresizewidthsw}[1]{#1}
+\newcommand{\ebresizeverb}[2]{#2}
+\newcommand\ebFloatBarrier{}
+}
+
+
 \begin{document}
 
 %%HTMLSKIP
-- 
2.17.1



From SRS0=4SL/=IX=gmail.com=akiyks@kernel.org Thu Mar 25 04:00:02 2021
Delivered-To: paulmckrcu@gmail.com
Received: from pop.gmail.com [74.125.20.109]
	by paulmck-ThinkPad-P72 with POP3 (fetchmail-6.3.26)
	for <paulmck@localhost> (single-drop); Thu, 25 Mar 2021 04:00:02 -0700 (PDT)
Received: by 2002:a0c:b506:0:0:0:0:0 with SMTP id d6csp255242qve;
        Thu, 25 Mar 2021 03:57:15 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwo2xwtmrdl8A1Zsuxb9QmpEmjzzVqPlhtAbKSj4diT5lN6XE9gxqDem7HcXeJvOQip0QqE
X-Received: by 2002:a17:902:8a95:b029:e7:1029:94be with SMTP id p21-20020a1709028a95b02900e7102994bemr8233346plo.26.1616669835377;
        Thu, 25 Mar 2021 03:57:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1616669835; cv=none;
        d=google.com; s=arc-20160816;
        b=pA33s8G4NNbKW1qAqaBkSBmL1ejgd2Jypu9VgAorgapNRyL3IV8rp6JRE7t4Zg+rsy
         h7/8eGjHGnDI+A4yYYANsAzyWIr00L2xnrKZ+/TW0OezhK3mtNtczusWA9ofZo/ElEoa
         7Bcjy43Fbet13xN0vm3JI5Lk9PTM/52LpmzwWalbnzsv7MxaMWdFo/kXa0n7y7mJIVTi
         sKvlCw3t1ll39N8IWskMEsbOpqwsOj+mIeu2yunir15F+kk+FEXuBTu5vjtXhBAeey6+
         GwLm/irjT9vaUE4Et5W729D0M9IBFa/QgM2vMoZThKcjmrbI3XivB5H5hPOiTLjSllyL
         enJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject
         :dkim-signature:dmarc-filter:delivered-to;
        bh=FUPunJigMwCdsrKnVOj18kJVu2IXHXns8Nns5uLRUQg=;
        b=FzY6Mn7aZM9vR7aeyaVOHlK25Abhd8PvWHircKgsvgXshZrXc9c3NgKDs0N87m3zf2
         agCRoJ71O+PaiaTSYx/TXTl4m3oIH2kZoqsoVZUdM/32RnVtnwnYTRkjuGxMW2Ll9Kxm
         5en8pITcJTcuQUYrq1MbhF0xL3LCxVeUusec6WcKB+K1h+uX1wjjic+GXO36bty0iGwb
         9nk8+3FwFrZqTWn0Ja76236CP4X/eSJD/mqVx6/36rwaCTz+3Z0740Mohe5/XW2WlrS5
         VtxCECLxRq/haKKQXVQaoN/qUzoLyuP85kuDZ+TkdtPao2IY/S/qC2YdYmlyDFdNYMu6
         H6Bg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=ZB+wPnrT;
       spf=pass (google.com: domain of srs0=4sl/=ix=gmail.com=akiyks@kernel.org designates 198.145.29.99 as permitted sender) smtp.mailfrom="SRS0=4SL/=IX=gmail.com=akiyks@kernel.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <SRS0=4SL/=IX=gmail.com=akiyks@kernel.org>
Received: from mail.kernel.org (mail.kernel.org. [198.145.29.99])
        by mx.google.com with ESMTPS id j7si5672153pgp.445.2021.03.25.03.57.15
        for <paulmckrcu@gmail.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 25 Mar 2021 03:57:15 -0700 (PDT)
Received-SPF: pass (google.com: domain of srs0=4sl/=ix=gmail.com=akiyks@kernel.org designates 198.145.29.99 as permitted sender) client-ip=198.145.29.99;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=ZB+wPnrT;
       spf=pass (google.com: domain of srs0=4sl/=ix=gmail.com=akiyks@kernel.org designates 198.145.29.99 as permitted sender) smtp.mailfrom="SRS0=4SL/=IX=gmail.com=akiyks@kernel.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: by mail.kernel.org (Postfix)
	id 0E55A619B4; Thu, 25 Mar 2021 10:57:15 +0000 (UTC)
Delivered-To: paulmck@kernel.org
Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B991061A13
	for <paulmck@kernel.org>; Thu, 25 Mar 2021 10:57:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B991061A13
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=akiyks@gmail.com
Received: by mail-pj1-f41.google.com with SMTP id lr1-20020a17090b4b81b02900ea0a3f38c1so3967313pjb.0
        for <paulmck@kernel.org>; Thu, 25 Mar 2021 03:57:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=FUPunJigMwCdsrKnVOj18kJVu2IXHXns8Nns5uLRUQg=;
        b=ZB+wPnrTWJ3srzM2J2mPcZ0WwUCoc47sq+/IgYcho6T2MPai+ED3oMDs8aLTypS7Xu
         TaUZlkJ7YPmGAS6t4wAI1jkO2o/6HQduyi4KCnH40wuob/mgmy49+/HD7uQlTMkUAG7z
         CBt37D6YNGIk3oK0YKPLK5LWg2or975Ufgi377YSYQutZgCn1XDEwubaulyy6qHITxEc
         BC5W7vP5xP5mA/0OG5t/UhKpwnpGE8h4lYImZSxIbnz/Z7xpgLW0e/by6cEkSC+oT2Al
         FWeCazYbqrO7MkFUMqKia4iN7UepNdKe7YH2Q7lz3pZuWdp/JesgEERE0ycVj7lNA0qv
         x16A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=FUPunJigMwCdsrKnVOj18kJVu2IXHXns8Nns5uLRUQg=;
        b=jnqulDbAa4J3Ri4xx+h17Cj3/xsvMlI8x9K08NaGEzdwkcVkIrGMTG2IBtmNqs6qWi
         drnkmINlhm4DjRsnIzDRAHJbHmCUqbf039QzH9k11Wdt94MEpfTrWUFXO9wrYWGIlAjk
         2YzJU9b1kZsNKbMgvozex1vRdKx3JDIFDtWC9uGEu7OpjcB7l+ZX4pPs1FXo1s3sbYvh
         T/VqhmAUxAJZYh5kT04zD6sQzJhJijP/5Q1akXgJRt1Yc97y+41MmHiT91t/RvlJFKbF
         oycIr/tu1hjernxf19N3F5+KGraiGvUmiqr/cfQEYW8xIwiV4/9StNhF2RSwPoBkdaNI
         GcUQ==
X-Gm-Message-State: AOAM531kU1hJxwg9GtwJl/nzbwyj+wBf9QGEWU4ruAsKnLNvSyiMLY3C
	NdV5ATs6he8/jUXK4ftOAvCZMqK34+U=
X-Received: by 2002:a17:90a:d41:: with SMTP id 1mr8525302pju.232.1616669834207;
        Thu, 25 Mar 2021 03:57:14 -0700 (PDT)
Received: from [192.168.11.2] (KD106167171201.ppp-bb.dion.ne.jp. [106.167.171.201])
        by smtp.gmail.com with ESMTPSA id w26sm5754276pfj.58.2021.03.25.03.57.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 25 Mar 2021 03:57:13 -0700 (PDT)
Subject: [PATCH -perfbook 3/5] cpu, toolsoftrade, count, rcuapi: Shrink floats
 for ebook reader
To: Balbir Singh <bsingharora@gmail.com>,
 "Paul E. McKenney" <paulmck@kernel.org>
Cc: perfbook@vger.kernel.org
References: <20210323010153.GH77072@balbir-desktop>
 <64419413-f54f-a737-bcae-e03b8ecaf606@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <49c9a145-0f43-91ea-7f10-bb0dda5458de@gmail.com>
Date: Thu, 25 Mar 2021 19:57:11 +0900
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <64419413-f54f-a737-bcae-e03b8ecaf606@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Content-Length: 6536
Lines: 198

This commit demonstrates usages of \ebresizewidth, \ebresizewidthsw,
and \ebresizeverb.

NOTE:
o One of sidewaystable in rcuapi uses \ebresizeverb, since tabularx
  in sidewaystable behaves unexpectedly with \ebresizewidthsw.
  The table has APIs enclosed in \tco{} which desides the widths of
  columns.

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
Acked-by: Balbir Singh <bsingharora@gmail.com>
---
 count/count.tex               | 15 +++++++++++----
 cpu/overheads.tex             |  2 ++
 defer/rcuapi.tex              | 12 +++++++++++-
 toolsoftrade/toolsoftrade.tex |  2 ++
 4 files changed, 26 insertions(+), 5 deletions(-)

diff --git a/count/count.tex b/count/count.tex
index cafbcafc..5e09285e 100644
--- a/count/count.tex
+++ b/count/count.tex
@@ -967,7 +967,7 @@ converge on the true value---hence this approach qualifies as
 eventually consistent.
 
 \begin{listing}[tbp]
-\input{CodeSamples/count/count_stat_eventual@whole.fcv}
+\ebresizeverb{.9}{\input{CodeSamples/count/count_stat_eventual@whole.fcv}}
 \caption{Array-Based Per-Thread Eventually Consistent Counters}
 \label{lst:count:Array-Based Per-Thread Eventually Consistent Counters}
 \end{listing}
@@ -1666,7 +1666,11 @@ line~\lnref{adjglobal} makes the corresponding adjustment to
 
 \begin{figure*}[tb]
 \centering
+\IfEbookSize{
+\resizebox{\textwidth}{!}{\includegraphics{count/globbal}}
+}{
 \resizebox{5in}{!}{\includegraphics{count/globbal}}
+}
 \caption{Schematic of Globalization and Balancing}
 \label{fig:count:Schematic of Globalization and Balancing}
 \end{figure*}
@@ -1981,7 +1985,7 @@ the result.
 }\QuickQuizEnd
 
 \begin{listing}[tbp]
-\input{CodeSamples/count/count_lim_atomic@add_sub.fcv}
+\ebresizeverb{.81}{\input{CodeSamples/count/count_lim_atomic@add_sub.fcv}}
 \caption{Atomic Limit Counter Add and Subtract}
 \label{lst:count:Atomic Limit Counter Add and Subtract}
 \end{listing}
@@ -2241,6 +2245,7 @@ line~\lnref{unregister:b}.
 }\QuickQuizEnd
 
 The next section qualitatively evaluates this design.
+\ebFloatBarrier
 
 \subsection{Atomic Limit Counter Discussion}
 
@@ -2384,7 +2389,7 @@ and \co{theft} variables, respectively.
 \end{fcvref}
 
 \begin{listing}[tbp]
-\input{CodeSamples/count/count_lim_sig@data.fcv}
+\ebresizeverb{.9}{\input{CodeSamples/count/count_lim_sig@data.fcv}}
 \caption{Signal-Theft Limit Counter Data}
 \label{lst:count:Signal-Theft Limit Counter Data}
 \end{listing}
@@ -2413,7 +2418,7 @@ state to READY\@.
 \end{fcvref}
 
 \begin{listing}[tbp]
-\input{CodeSamples/count/count_lim_sig@migration.fcv}
+\ebresizeverb{.81}{\input{CodeSamples/count/count_lim_sig@migration.fcv}}
 \caption{Signal-Theft Limit Counter Value-Migration Functions}
 \label{lst:count:Signal-Theft Limit Counter Value-Migration Functions}
 \end{listing}
@@ -2834,6 +2839,7 @@ will expand on these lessons.
 \small
 \centering
 \newcommand{\NA}{\cellcolor{white}}
+\ebresizewidth{
 \begin{tabular}{lrcS[table-format=2.1]S[table-format=3.0]S[table-format=4.0]
 		  S[table-format=6.0]S[table-format=6.0]}
 	\toprule
@@ -2869,6 +2875,7 @@ will expand on these lessons.
 		Y &  4.7 & 519 & 6 805 & 120 000 & 238 811 \\
 	\bottomrule
 \end{tabular}
+}
 \caption{Statistical/Limit Counter Performance on x86}
 \label{tab:count:Statistical/Limit Counter Performance on x86}
 \end{table*}
diff --git a/cpu/overheads.tex b/cpu/overheads.tex
index 9a39e5a3..6b3b7008 100644
--- a/cpu/overheads.tex
+++ b/cpu/overheads.tex
@@ -137,6 +137,7 @@ optimization.
 \rowcolors{1}{}{lightgray}
 \renewcommand*{\arraystretch}{1.1}
 \centering\small
+\ebresizewidth{
 \begin{tabular}
   {
     l
@@ -166,6 +167,7 @@ optimization.
 	Global Comms	& 195 000 000 & 409 500 000 & \\
 	\bottomrule
 \end{tabular}
+}
 \caption{CPU 0 View of Synchronization Mechanisms on 8-Socket System With Intel Xeon Platinum 8176 CPUs @ 2.10\,GHz}
 \label{tab:cpu:CPU 0 View of Synchronization Mechanisms on 8-Socket System With Intel Xeon Platinum 8176 CPUs at 2.10GHz}
 \end{table*}
diff --git a/defer/rcuapi.tex b/defer/rcuapi.tex
index 74efb10d..b4c2763e 100644
--- a/defer/rcuapi.tex
+++ b/defer/rcuapi.tex
@@ -51,7 +51,8 @@ API~\cite{PaulEMcKenney2019RCUAPI}.\footnote{
 \centering
 \caption{RCU Wait-to-Finish APIs}
 \label{tab:defer:RCU Wait-to-Finish APIs}
-\scriptsize\hspace*{-.125in}
+\scriptsize\IfEbookSize{\hspace*{-1.8in}}{\hspace*{-.125in}}
+\ebresizeverb{0.7}{
 \begin{tabularx}{8.5in}{>{\raggedright\arraybackslash}p{0.94in}
     >{\raggedright\arraybackslash}X
     >{\raggedright\arraybackslash}X
@@ -146,6 +147,7 @@ API~\cite{PaulEMcKenney2019RCUAPI}.\footnote{
 		    N/A \\
 \bottomrule
 \end{tabularx}
+}
 \end{sidewaystable*}
 
 If you are new to RCU, you might consider focusing on just one
@@ -415,6 +417,7 @@ that Linux supports~\cite{Spraul01}.
 \renewcommand*{\arraystretch}{1.15}
 \footnotesize
 \centering\OneColumnHSpace{-.4in}
+\ebresizewidth{
 \begin{tabular}{llp{2.2in}}
 \toprule
 Category &
@@ -457,6 +460,7 @@ Pointer subscribe (traveral) &
 		Simple instructions (memory barrier on Alpha) \\
 \bottomrule
 \end{tabular}
+}
 \caption{RCU Publish-Subscribe and Version Maintenance APIs}
 \label{tab:defer:RCU Publish-Subscribe and Version Maintenance APIs}
 \end{table*}
@@ -737,6 +741,7 @@ be a separate spinlock to be stored with the pointer itself.
   \setlength{\cwa}{1.95in}\setlength{\cwb}{2.15in}
   \setlength{\cwc}{1.9in}\setlength{\cwd}{1.7in}
 }
+\ebresizewidthsw{
 \begin{tabular}{>{\raggedright\arraybackslash}p{\cwa}
     >{\raggedright\arraybackslash}p{\cwb}
     >{\raggedright\arraybackslash}p{\cwc}
@@ -820,6 +825,7 @@ be a separate spinlock to be stored with the pointer itself.
 	    \\
 \bottomrule
 \end{tabular}
+}
 \end{sidewaystable*}
 
 The API members for these linked-list variants are summarized in
@@ -854,7 +860,11 @@ kfree(p);				\lnlbl[kfree]
 
 \begin{figure}[tbp]
 \centering
+\IfEbookSize{
+\resizebox{2in}{!}{\includegraphics{defer/RCUReplacement}}
+}{
 \resizebox{2.7in}{!}{\includegraphics{defer/RCUReplacement}}
+}
 \caption{RCU Replacement in Linked List}
 \label{fig:defer:RCU Replacement in Linked List}
 \end{figure}
diff --git a/toolsoftrade/toolsoftrade.tex b/toolsoftrade/toolsoftrade.tex
index 9e0838cb..bf34d2ca 100644
--- a/toolsoftrade/toolsoftrade.tex
+++ b/toolsoftrade/toolsoftrade.tex
@@ -479,7 +479,9 @@ lock~\cite{Hoare74}.
 }\QuickQuizEnd
 
 \begin{listing}[tbp]
+\ebresizeverb{.85}{
 \input{CodeSamples/toolsoftrade/lock@reader_writer.fcv}
+}
 \caption{Demonstration of Exclusive Locks}
 \label{lst:toolsoftrade:Demonstration of Exclusive Locks}
 \end{listing}
-- 
2.17.1



From SRS0=4SL/=IX=gmail.com=akiyks@kernel.org Thu Mar 25 04:00:02 2021
Delivered-To: paulmckrcu@gmail.com
Received: from pop.gmail.com [74.125.20.109]
	by paulmck-ThinkPad-P72 with POP3 (fetchmail-6.3.26)
	for <paulmck@localhost> (single-drop); Thu, 25 Mar 2021 04:00:02 -0700 (PDT)
Received: by 2002:a0c:b506:0:0:0:0:0 with SMTP id d6csp255993qve;
        Thu, 25 Mar 2021 03:58:25 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz2krU/HTTZKYxMtZhLal7duDhRBXkqlX/s8B9JbeeCn93T762qufVJ5vJaMNf2PQSLTfCU
X-Received: by 2002:a17:90a:4d07:: with SMTP id c7mr8290076pjg.104.1616669904808;
        Thu, 25 Mar 2021 03:58:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1616669904; cv=none;
        d=google.com; s=arc-20160816;
        b=eRdYKfH3vO+sCE6RpI6bonqXW9HvIoz4/XOSHzA1LbG/5xo64XkDaRDnU0Z21vjm9X
         y8heZw9qf/L8mSpJN2xyoAStLVb6br4JrQyBct/VD+vi7ZoG56EE4eJdD1zMKx2XyRWT
         tAPZtHSeWQmg2LddfXTPh8vd3ZkTcRWEWOQPp52+BgTFwHNsquiK7Yi4MH7nv1dxgY31
         4242K6ZM63qsqB4gKLkbwGchGEbeDkCB/mTljofGYh9Vr6QM0GE7eINvX3Ctm6EYS6br
         YvIW6cGsxr5ABX31/6A9CPg7DAQz94lxBpN9ITExpz61ltoNvImTvb2dT8fO2Zg+V/GR
         n3JA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject
         :dkim-signature:dmarc-filter:delivered-to;
        bh=+JrYaUudjPlfmaYwpIK0tEd4TwECVhHNUwKUvOXnbWs=;
        b=JFuCTQevIHvLq3Jd1d5SSdu4JloW86Pt7MoGmzxAbpLV8ZspHFCrYD22nQBXrB8Hto
         n5Gh8VXs+RYC1mk2ZmIPkuxSHwMkprqFKe5ZaYDryLm5xp8CnmuKx13UxfhMkhLqYFjv
         L4fH5tDu0gBktdq1VUyXZjz4Eo/aS+UMo0WJsKYDQZzaUAM0fsfinxO+ENmym0R1BARL
         9ijbrfZiShG1/6w4yosfhKqNjOF1O1LU8jWvk3ULTyH1yCEVGqcfWJdcTuVAQ1rsNt00
         U6XjT/uIPPwQ6xTTv7x8tzo6AFV0ZiQMi9NFEVwFibLEKYKrH+2ctWVmRw1DHk6fI8Ev
         f2yw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=KHnffZLm;
       spf=pass (google.com: domain of srs0=4sl/=ix=gmail.com=akiyks@kernel.org designates 198.145.29.99 as permitted sender) smtp.mailfrom="SRS0=4SL/=IX=gmail.com=akiyks@kernel.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <SRS0=4SL/=IX=gmail.com=akiyks@kernel.org>
Received: from mail.kernel.org (mail.kernel.org. [198.145.29.99])
        by mx.google.com with ESMTPS id i1si5212604pfr.73.2021.03.25.03.58.24
        for <paulmckrcu@gmail.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 25 Mar 2021 03:58:24 -0700 (PDT)
Received-SPF: pass (google.com: domain of srs0=4sl/=ix=gmail.com=akiyks@kernel.org designates 198.145.29.99 as permitted sender) client-ip=198.145.29.99;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=KHnffZLm;
       spf=pass (google.com: domain of srs0=4sl/=ix=gmail.com=akiyks@kernel.org designates 198.145.29.99 as permitted sender) smtp.mailfrom="SRS0=4SL/=IX=gmail.com=akiyks@kernel.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: by mail.kernel.org (Postfix)
	id 4E19E619B4; Thu, 25 Mar 2021 10:58:24 +0000 (UTC)
Delivered-To: paulmck@kernel.org
Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0D36A61A13
	for <paulmck@kernel.org>; Thu, 25 Mar 2021 10:58:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0D36A61A13
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=akiyks@gmail.com
Received: by mail-pj1-f44.google.com with SMTP id x21-20020a17090a5315b029012c4a622e4aso14114pjh.2
        for <paulmck@kernel.org>; Thu, 25 Mar 2021 03:58:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=+JrYaUudjPlfmaYwpIK0tEd4TwECVhHNUwKUvOXnbWs=;
        b=KHnffZLmHBkKrdfLBBsAuYj1m4YgiQgR3wHpTEewanY3siiBMRR7RejX9A4AYlvjv1
         SmCOnZWSYoX72O9spLB6BODqcZeFzEd7lQmQ65V/Q/u0sfllGhgoiJ0sWkstYxBRFW5R
         M693SLt2oZ0M3KONhTTf5chLa4BE1C6atuVwuRNeVXfAQV7YDpjcWaw1nhx40iSturUV
         5ucaFgsbH0NwlHS+T1THfDECkLMysYM516WE5piAmjD39lB/PMN/Vj0SgfbD9lw22AKY
         1PGExE196iag2L+t7ZNY3xJodSCwleHDvh5ErNYpKljfrhaZBAkMZpHP2PJ2UfFXSX8q
         r/Kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=+JrYaUudjPlfmaYwpIK0tEd4TwECVhHNUwKUvOXnbWs=;
        b=BB65hUU3MahWcVoKJbvnlP+mDCjakUTcIAUcwFEfjAf8Ii0N5zabMuCV2HRMh6xsrG
         7NEnipcvO4JasrCLgxDN0xuUlfeiNKggjof2MvpiE86DXGjZ93kD5QC9JN5YQXSmC5C/
         ta5k266fR2IgiSLG3ZfGcTdYWhmbhXQABZK7hB53YFfZ+AufXj9HVD4TpH8Xis2lF/1X
         zRLGptNGa/Y2VyjLHRvWf3ydXoW9UV1ptUCM9s8REWkb+3dSU2Kx5d9afZ7ADAy8JLpA
         wcKecrz4MGjFIRdBJeCM2V5SGiG7nbaHGZpZDfx647CsiVKzUWsgn4Sdx9AFoDSNcoWW
         bsVQ==
X-Gm-Message-State: AOAM533ur363pj9/A2qaEYhTP/sDtOvIxeSAEODZOI1HGISr88hoYUJ/
	to+9SPNgg22WaAswDuowt88=
X-Received: by 2002:a17:90a:af8a:: with SMTP id w10mr8010882pjq.114.1616669903571;
        Thu, 25 Mar 2021 03:58:23 -0700 (PDT)
Received: from [192.168.11.2] (KD106167171201.ppp-bb.dion.ne.jp. [106.167.171.201])
        by smtp.gmail.com with ESMTPSA id ha8sm5122838pjb.6.2021.03.25.03.58.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 25 Mar 2021 03:58:23 -0700 (PDT)
Subject: [PATCH -perfbook 4/5] styleguide: Adjust float size and add a
 floatbarrier for ebook-size build
To: Balbir Singh <bsingharora@gmail.com>,
 "Paul E. McKenney" <paulmck@kernel.org>
Cc: perfbook@vger.kernel.org
References: <20210323010153.GH77072@balbir-desktop>
 <64419413-f54f-a737-bcae-e03b8ecaf606@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <1a81efe3-d5ca-a5e0-19e7-2fa5d2783cff@gmail.com>
Date: Thu, 25 Mar 2021 19:58:21 +0900
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <64419413-f54f-a737-bcae-e03b8ecaf606@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Content-Length: 3062
Lines: 99

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 appendix/styleguide/styleguide.tex | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/appendix/styleguide/styleguide.tex b/appendix/styleguide/styleguide.tex
index 66dc9163..05fc57aa 100644
--- a/appendix/styleguide/styleguide.tex
+++ b/appendix/styleguide/styleguide.tex
@@ -1219,6 +1219,7 @@ which controls the behavior of \co{\\toprule}.
 \label{sec:app:styleguide:Improvement Candidates}
 
 \begin{figure*}[tbh]\centering
+\ebresizewidth{
 \begin{minipage}[t][][t]{2.1in}
 \resizebox{2.1in}{!}{\includegraphics{cartoons/1kHz}}
 \caption{Timer Wheel at 1\,kHz}
@@ -1230,6 +1231,7 @@ which controls the behavior of \co{\\toprule}.
 \caption{Timer Wheel at 100\,kHz}
 \label{fig:app:styleguide:Timer Wheel at 100kHz}
 \end{minipage}
+}
 \end{figure*}
 
 \begin{listing*}[tbh]%
@@ -1477,6 +1479,7 @@ is a sequence diagram drawn as a table.
 % This is why the 3rd row has the background color of <even-row color>.
 %
 % \cline of plain LaTeX also interfares the row count.
+\ebresizewidth{
 \begin{tabular}{rclcccccc}
 	\toprule
 	& & & \multicolumn{4}{c}{CPU Cache} & \multicolumn{2}{c}{Memory} \\
@@ -1495,6 +1498,7 @@ is a sequence diagram drawn as a table.
 	7 & 1 & Writeback	& 8/S &   8/S &   $-$/I & $-$/I   & V & V \\
 	\bottomrule
 \end{tabular}
+}
 \caption{Cache Coherence Example}
 \label{tab:app:styleguide:Cache Coherence Example}
 \end{table*}
@@ -1524,6 +1528,7 @@ chosen for simplicity.
 \renewcommand*{\arraystretch}{1.1}
 \footnotesize
 \centering
+\ebresizewidth{
 \begin{tabular}{lll}
 \toprule
 	Primitives &
@@ -1585,6 +1590,7 @@ chosen for simplicity.
 			Memory barrier \\
 \bottomrule
 \end{tabular}
+}
 \caption{RCU Publish-Subscribe and Version Maintenance APIs}
 \label{tab:app:styleguide:RCU Publish-Subscribe and Version Maintenance APIs}
 \end{table*}
@@ -1594,6 +1600,7 @@ chosen for simplicity.
 \rowcolors{3}{lightgray}{}
 \footnotesize
 \centering
+\ebresizewidth{
 \begin{tabular}{lllp{1.2in}}\toprule
 Category &
 	Primitives &
@@ -1663,6 +1670,7 @@ Pointer update &
 			Memory barrier \\
 \bottomrule
 \end{tabular}
+}
 \caption{RCU Publish-Subscribe and Version Maintenance APIs}
 \label{tab:app:styleguide:RCU Publish-Subscribe and Version Maintenance APIs (colortbl)}
 \end{table*}
@@ -1677,6 +1685,7 @@ is also a sequence diagram drawn as a tabular object.
 \renewcommand*{\arraystretch}{1.1}
 \small
 \centering\OneColumnHSpace{-0.1in}
+\ebresizewidth{
 \begin{tabular}{rllllll}
 	\toprule
 	& \multicolumn{3}{c}{CPU 0} & \multicolumn{3}{c}{CPU 1} \\
@@ -1696,10 +1705,13 @@ is also a sequence diagram drawn as a tabular object.
 		(Finish store) & & \tco{x1==2} \\
 	\bottomrule
 \end{tabular}
+}
 \caption{Memory Misordering: Store-Buffering Sequence of Events}
 \label{tab:app:styleguide:Memory Misordering: Store-Buffering Sequence of Events}
 \end{table*}
 
+\ebFloatBarrier
+
 \Cref{tab:app:styleguide:Refrigeration Power Consumption (arydshln)}
 shows another version of
 \cref{tab:app:styleguide:Refrigeration Power Consumption}
-- 
2.17.1



From SRS0=4SL/=IX=gmail.com=akiyks@kernel.org Thu Mar 25 04:10:04 2021
Delivered-To: paulmckrcu@gmail.com
Received: from pop.gmail.com [74.125.20.109]
	by paulmck-ThinkPad-P72 with POP3 (fetchmail-6.3.26)
	for <paulmck@localhost> (single-drop); Thu, 25 Mar 2021 04:10:04 -0700 (PDT)
Received: by 2002:a0c:b506:0:0:0:0:0 with SMTP id d6csp257023qve;
        Thu, 25 Mar 2021 04:00:10 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzCDg63Qok9PUw89vDtXCxgAyPS5ezNix+oiIRXCo2ahG5wpH44h2sKqRHKy5OPw279tx2n
X-Received: by 2002:a63:4c5d:: with SMTP id m29mr6856612pgl.366.1616670010745;
        Thu, 25 Mar 2021 04:00:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1616670010; cv=none;
        d=google.com; s=arc-20160816;
        b=0jF9SHzeNhLMCh3qSwkxMIGkpvg42BDH/UnY7vPx+NA6sgHYav7ZmwnkCh/BraNvTP
         Vb81PXv78ehuUmvxpRZS6heET+jriR6ZUzN/iGzKO5e2pC1CSvBXsIkBL/eQuo548Pr3
         /EYSe+zy+Fl6nigLD4eEXVVmj3wtncbtgy4uJoVlLLVs9xMYjO+aKV6XtBwvOvD2c3Ck
         nvZTkq1N2CqU0gX6tSx1IgbLIfRxvoHoJ7xutVa67auhNvZe6jSuD4CU/93gkCW4i0HC
         C7RLBfD7v+B7ataz9JWKkpEouCjUqWIM58fyuV4kGtsEbX7xAf4XmzlGNmKZCL+/FtP7
         GJbQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject
         :dkim-signature:dmarc-filter:delivered-to;
        bh=eQ48ra6E9OjPRLN/oY5YG/l56YffIFywUEUg9vFUCH4=;
        b=Y41/shsoquQeOcd3cteygCcXIfgRasJcdYMBI/fx4Bp5Qb/GDQ2oBoBkuahIIVsouU
         XNJ7UYB55QmJqrcasK1Blkug+Y93hq8QvUUbH8N/NFV25Gvz5DHxcGwBDjF4ShkFaFpV
         UN9OaE9z+Ixm74QEY6VszsYKUqA5u9SF7krg7fY+WCmYzi/s7XrShy0E53GzMD8gI6hV
         s3CTBlEXF5ZWzr2VAmkA8ayz+N0PlFAuhbXy6UEPyGtIp67iqBzJdlPh3RRbfr5Yds+b
         HcT+2IYDiHw2yRGqNwx1auzpVY6KP/GAYFxQtIb0IRzmS9cBHilFFYDYg33OEOIYWsWB
         +AjQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=N4BySAmo;
       spf=pass (google.com: domain of srs0=4sl/=ix=gmail.com=akiyks@kernel.org designates 198.145.29.99 as permitted sender) smtp.mailfrom="SRS0=4SL/=IX=gmail.com=akiyks@kernel.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <SRS0=4SL/=IX=gmail.com=akiyks@kernel.org>
Received: from mail.kernel.org (mail.kernel.org. [198.145.29.99])
        by mx.google.com with ESMTPS id u12si4927371plf.396.2021.03.25.04.00.10
        for <paulmckrcu@gmail.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 25 Mar 2021 04:00:10 -0700 (PDT)
Received-SPF: pass (google.com: domain of srs0=4sl/=ix=gmail.com=akiyks@kernel.org designates 198.145.29.99 as permitted sender) client-ip=198.145.29.99;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=N4BySAmo;
       spf=pass (google.com: domain of srs0=4sl/=ix=gmail.com=akiyks@kernel.org designates 198.145.29.99 as permitted sender) smtp.mailfrom="SRS0=4SL/=IX=gmail.com=akiyks@kernel.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: by mail.kernel.org (Postfix)
	id 4675461A16; Thu, 25 Mar 2021 11:00:10 +0000 (UTC)
Delivered-To: paulmck@kernel.org
Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0D63C60240
	for <paulmck@kernel.org>; Thu, 25 Mar 2021 11:00:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0D63C60240
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=akiyks@gmail.com
Received: by mail-pf1-f173.google.com with SMTP id 11so1649998pfn.9
        for <paulmck@kernel.org>; Thu, 25 Mar 2021 04:00:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=eQ48ra6E9OjPRLN/oY5YG/l56YffIFywUEUg9vFUCH4=;
        b=N4BySAmoXxttiLiNbrnnQMluTpzpnbdH8ln4bJQjPt/MgUIP5Jvvb+1AzCxtrV9yuu
         XNxXOm7zmX5y3EP7pQQzxaLuywqF2p7eEar9mAdOB7Hxw2RKKIdDgDnLQGRyQIn2w3ev
         b6PWLTcDhTCEyxnG5LPh+yOwyLJR1za1Fn7uWUEeJOUp1Kk5lRbFpQcQGckcD3KRPwMq
         uJljbiPsvUh6/ILwf209vHywxecenrxHngCwM7FKsLoOy+kOkLuz2J7fvPVFfbE1uMdc
         2iklY4gvRiIr7Wr1CO1xDNruZFotb+1mNe8ZyxGbY28DAQQeYBu7leoVqOGqB+ivpJUu
         ycDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=eQ48ra6E9OjPRLN/oY5YG/l56YffIFywUEUg9vFUCH4=;
        b=QBCV5qv63gL9km8aCGJHw3qTcQVVtwRgFGH/+OlT1AXxzMi++hilrcEFYL6LKeFCeL
         PS4ulAPgLozpUb44pwf68t2USX1TPROOZeWqzRLbY2Kp0yDnV5LGrZ+SI8d04nCGKJnO
         i0nB3tJK5mp+fJ9kGfP6JFJ+JhWHo66B44QXjmssK9ejC6l99fPow4A4vgWv5VT+ccRO
         elaSdIn5ZgBUyAeFKp0O4HL2WWzo/NZPiA6vWv5WySznjBrseSBt4wom259c64xM1pZe
         0nRoIYJ9RvsvjQNRRA6iRPo5eTVTJVBcvfH6kMtyLEHR8GAs4NGaaTb62YS4uMx4z9SZ
         ZRnA==
X-Gm-Message-State: AOAM532X2iIBDgChzkJ67J3jdU+sOt4CXSQabz9W5RHWJL2gA0wXr57D
	n8zWzfZ0OUAa61PrZ6OfnbA=
X-Received: by 2002:a63:f959:: with SMTP id q25mr7323617pgk.104.1616670009598;
        Thu, 25 Mar 2021 04:00:09 -0700 (PDT)
Received: from [192.168.11.2] (KD106167171201.ppp-bb.dion.ne.jp. [106.167.171.201])
        by smtp.gmail.com with ESMTPSA id g22sm5278631pju.30.2021.03.25.04.00.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 25 Mar 2021 04:00:09 -0700 (PDT)
Subject: [PATCH -perfbook 5/5] Makefile: Add info on ebooksize build in help
 and help-full
To: Balbir Singh <bsingharora@gmail.com>,
 "Paul E. McKenney" <paulmck@kernel.org>
Cc: perfbook@vger.kernel.org
References: <20210323010153.GH77072@balbir-desktop>
 <64419413-f54f-a737-bcae-e03b8ecaf606@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <7c31e637-8a04-672d-71e5-3a3009e182f3@gmail.com>
Date: Thu, 25 Mar 2021 20:00:07 +0900
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <64419413-f54f-a737-bcae-e03b8ecaf606@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Content-Length: 2086
Lines: 52

"(WIP)" will be removed size adjustments of floats are done.

Also promote paper-size specific targets to "make help".

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 Makefile | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/Makefile b/Makefile
index 415bcef3..16c85edf 100644
--- a/Makefile
+++ b/Makefile
@@ -500,8 +500,15 @@ help: help-official
 	@echo "Set env variable PERFBOOK_PAPER to change paper size:"
 	@echo "   PERFBOOK_PAPER=A4: a4paper"
 	@echo "   PERFBOOK_PAPER=HB: hard cover book"
+	@echo "   PERFBOOK_PAPER=EB: ebook reader, always 1c layout (WIP)"
 	@echo "   other (default):   letterpaper"
 	@echo
+	@echo "Paper size variations (independent of PERFBOOK_PAPER):"
+	@echo "  perfbook-lt.pdf,   lt:   2-column layout on letterpaper"
+	@echo "  perfbook-hb.pdf,   hb:   2-column layout for hard cover book"
+	@echo "  perfbook-a4.pdf,   a4:   2-column layout on a4paper"
+	@echo "  perfbook-eb.pdf,   eb:   1-column layout for ebook reader (WIP)"
+	@echo
 	@echo "\"make help-full\" will show the full list of available targets."
 
 help-full: help-official
@@ -510,6 +517,7 @@ help-full: help-official
 	@echo "  perfbook-lt.pdf,   lt:   2-column layout on letterpaper"
 	@echo "  perfbook-hb.pdf,   hb:   2-column layout for hard cover book"
 	@echo "  perfbook-a4.pdf,   a4:   2-column layout on a4paper"
+	@echo "  perfbook-eb.pdf,   eb:   1-column layout for ebook reader (WIP)"
 	@echo
 	@echo "Experimental targets:"
 	@echo "  Full,              Abbr."
@@ -540,8 +548,9 @@ help-full: help-official
 	@echo "  - Set env variable PERFBOOK_PAPER to change paper size:"
 	@echo "      PERFBOOK_PAPER=A4: a4paper"
 	@echo "      PERFBOOK_PAPER=HB: hard cover book"
+	@echo "      PERFBOOK_PAPER=EB: ebook reader, always 1c layout (WIP)"
 	@echo "      other (default):   letterpaper"
-	@echo "    (PERFBOOK_PAPER has no effect on targets \"lt\", \"hb\", and \"a4\".)"
+	@echo "    (PERFBOOK_PAPER has no effect on targets \"lt\", \"hb\", \"a4\", and \"eb\".)"
 
 clean:
 	find . -name '*.aux' -o -name '*.blg' \
-- 
2.17.1




--u3/rZRmxL6MmkK24--
