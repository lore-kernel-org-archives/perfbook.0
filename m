Return-Path: <perfbook-owner@vger.kernel.org>
Received: from mail.kernel.org ([198.145.29.99]:36090 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231904AbhCIXD6 (ORCPT <rfc822;perfbook@vger.kernel.org>);
        Tue, 9 Mar 2021 18:03:58 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1615331038;
        bh=Uqvq0+yzL7OcPef2R8QHChZoiyNHuBHuuyceeE66Dts=;
        h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
        b=GQvXlFwLo3sYVp+SMCsa6rPNKo6RHrKvlvZBwVWy6RDJNh8xTTQaaorxpgYVky+kn
         T16XwPgs+hPqFws8cCCOxAOLqtrZh/KEFDylc1RRQdeUaebH5G3GbEKe+GKrxSz/Ab
         52nxSOWODQZk7lK+vEtqMhL3EVNFSUkKDrK1E/PRKqP8qmsG6DB8ya8sOISTYAjC/a
         ZpWev3FPJENLw6sNKohuftmNk6vpoWQ6A6LpPfXNVUgiaM/FTZlbPItbSiB3NXDJ4a
         fZASgKNxjGm24bhFfiHmW6GV3uVGEIr3MyFRzAxIaDUH5SUpnwzIeO0JBNeEuQTavD
         wK9DjfCf1rU1Q==
Date: Tue, 9 Mar 2021 15:03:58 -0800
From: "Paul E. McKenney" <paulmck@kernel.org>
Subject: Re: [perfbook] Possible improvements of Figures 9.11 -- 9.13
Message-ID: <20210309230358.GU2696@paulmck-ThinkPad-P72>
Reply-To: paulmck@kernel.org
References: <25130536-3b28-3cef-30f7-17da90c9ccdb@gmail.com>
 <20210309194638.GS2696@paulmck-ThinkPad-P72>
 <288d3995-1f3d-760a-c79b-a063774adb6e@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <288d3995-1f3d-760a-c79b-a063774adb6e@gmail.com>
List-ID: <perfbook.vger.kernel.org>
To: Akira Yokosawa <akiyks@gmail.com>
Cc: perfbook@vger.kernel.org

On Wed, Mar 10, 2021 at 07:43:40AM +0900, Akira Yokosawa wrote:
> On Tue, 9 Mar 2021 11:46:38 -0800, Paul E. McKenney wrote:
> > On Wed, Mar 10, 2021 at 12:32:30AM +0900, Akira Yokosawa wrote:
> >> Hi Paul,
> >>
> >> I'm reviewing Section 9.5.
> >> I find Figures 9.11 -- 9.13 are somewhat hard to grasp.
> >>
> >> In those figures, P0() is called "RCU Reader" due to the
> >> RCU read-side critical section.
> >>
> >> However, it updates x and y, and you are talking about
> >> final values of x and y.
> >>
> >> At first glance, it looked as though P0() would read from
> >> x and y, and get values 1 or 2.
> >>
> >> Some clarification would help new readers of Edition 2,
> >> I suppose.
> > 
> > How about as shown below?  (Not particularly human-readable given that
> > I modified the figures as well.)
> 
> So, I was totally confused by those figures!
> P0() is literally a reader from the beginning.  Oh well...
> 
> Updated text and figures would not have confused me.

Very good, thank you!

Unfortunately, it is perfectly legal to have writes in RCU read-side
critical sections.  I have added a QQ on this, shown below.

This is not just RCU!  Please see section 5.4.6 ("Applying Exact Limit
Counters") for an example with writes in reader-writer locking read-side
critical sections.  Names can be slippery things.  ;-)

							Thanx, Paul

------------------------------------------------------------------------

commit 35fbf113d662365d5f8717e273af55838038f52e
Author: Paul E. McKenney <paulmck@kernel.org>
Date:   Tue Mar 9 13:44:55 2021 -0800

    defer/rcufundamental: Add QQ about writes in RCU readers
    
    Signed-off-by: Paul E. McKenney <paulmck@kernel.org>

diff --git a/defer/rcufundamental.tex b/defer/rcufundamental.tex
index d8ca411..f2e643f 100644
--- a/defer/rcufundamental.tex
+++ b/defer/rcufundamental.tex
@@ -312,6 +312,29 @@ Section~\ref{sec:formal:Axiomatic Approaches and RCU}.
 In addition, RCU's ordering properties are examined in much
 greater detail in Section~\ref{sec:memorder:RCU}.
 
+\QuickQuiz{
+	What would happen if \co{P0()}'s accesses in
+	\crefrange{fig:defer:RCU Reader and Later Grace Period}{fig:defer:RCU Reader Within Grace Period}
+	were stores?
+}\QuickQuizAnswer{
+	The exact same ordering rules would apply, that is,
+	(1)~If any part of \co{P0()}'s RCU read-side critical section
+	preceded the beginning of \co{P1()}'s grace period, all of
+	\co{P0()}'s RCU read-side critical section would precede the
+	end of \co{P1()}'s grace period, and
+	(2)~If any part of \co{P0()}'s RCU read-side critical section
+	followed the end of \co{P1()}'s grace period, all of \co{P0()}'s
+	RCU read-side critical section would follow the beginning of
+	\co{P1()}'s grace period.
+
+	It might seem strange to have RCU read-side critical sections
+	containing writes, but RCU is just fine with this.  This
+	capability is used frequently in the Linux kernel, for example,
+	acquiring a lock on or reference to a data structure.  Acquiring
+	either a lock or a reference results in a write to memory,
+	and it is OK to do these within an RCU read-side critical section.
+}\QuickQuizEnd
+
 Although RCU's wait-for-readers capability really is sometimes used to
 order the assignment of values to variables as shown in
 \crefrange{fig:defer:RCU Reader and Later Grace Period}
