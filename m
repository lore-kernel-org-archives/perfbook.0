Return-Path: <perfbook-owner@vger.kernel.org>
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40540 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229503AbjDJTGr (ORCPT
        <rfc822;perfbook@vger.kernel.org>); Mon, 10 Apr 2023 15:06:47 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4AC981718
        for <perfbook@vger.kernel.org>; Mon, 10 Apr 2023 12:06:46 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id D87F861B5F
        for <perfbook@vger.kernel.org>; Mon, 10 Apr 2023 19:06:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1681153605;
        bh=OLEwEqGiN+TKsQjtbms8cUkQUt4yHYR6UY/9c8bZHKo=;
        h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
        b=ptkGI2ht7U6cdD4T84k86l2l+bOhrU7VS1fhjGC/oSTyJsZ8UhId7hVGZMw1070+t
         MaP2MEo0FTyjvM5GbJTmQ21tLHdxSPGaCZZAiRxYncn8yrWZm7k0t5YEK0PHmZCUgW
         OM2mQ593P5QbtmEuHgBx5LO8VDMXDRR2FGK8pKuHlEZz5TzY/S4xrRGXmP8EjfKdtQ
         WrmbH/gDQc4pWMgN8uYDrUXWK1Xh+qpvgqPvoPyR9aamnBO/1Vlz8xwkyBYprbrVt3
         myFEpGISai7TovniU0olJsZyjr4rb4rUhDZfyad5kYtPIFzmEUjczsunclT7ggw8ox
         MTGmSSE4rNNHg==
Date: Mon, 10 Apr 2023 12:06:44 -0700
From: "Paul E. McKenney" <paulmck@kernel.org>
Subject: Re: [PATCH] CodeSamples/count: Remove unnecessary memory barriers
Message-ID: <a1cf12cc-0f93-4958-a5f1-63827eccba48@paulmck-laptop>
Reply-To: paulmck@kernel.org
References: <20230407175813.1334028-1-mmpgouride@gmail.com>
 <81ADBFE2-3576-48EC-A892-B49A5C265487@gmail.com>
 <e425c28d-c285-0fc6-b692-744df0bde3a8@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <e425c28d-c285-0fc6-b692-744df0bde3a8@gmail.com>
List-ID: <perfbook.vger.kernel.org>
To: Akira Yokosawa <akiyks@gmail.com>
Cc: Alan Huang <mmpgouride@gmail.com>, perfbook@vger.kernel.org

On Sun, Apr 09, 2023 at 09:11:58AM +0900, Akira Yokosawa wrote:
> Hi,
> 
> On Sat, 8 Apr 2023 02:04:24 +0800, Alan Huang wrote:
> > Hi Paul and Akira,
> > 
> > This is the patch v3, I forgot to add a version tag…
> > 
> > And I think it may be better to add a question in a subsequent path.
> 
> So I'm looking at Quick Quizzes on count_lim_sig.c.
> It looks to me Quick Quiz 5.50 lost its context due to the
> removal of smp_mb() and the use of smp_store_release().
> 
> A band-aide fix would be to change the quiz to:
> 
>     In Listing 5.18's function flush_local_count_sig(), why
>     are there READ_ONCE(), WRITE_ONCE(), and smp_store_release()
>     wrappers around the uses of the theft per-thread variable?
> 
> , and to adjust the line count in its Answer.
> 
> However, smp_store_release() is by no means a simple wrapper.
> So I'm wondering if it is worthwhile to keep this quiz.
> 
> Paul, how about replacing the quiz with the new quiz asking:
> 
>      In Listing 5.18, doesn't flush_local_count_sig() need
>      a stronger memory barrier or two?
> 
> , and picking Alan's reasoning in the answer?

How about something like this?

							Thanx, Paul

------------------------------------------------------------------------

diff --git a/count/count.tex b/count/count.tex
index 2aade053..ccc2e839 100644
--- a/count/count.tex
+++ b/count/count.tex
@@ -2441,28 +2441,11 @@ the fastpath happens before this change of \co{theft} to READY\@.
 
 \QuickQuiz{
 	In \cref{lst:count:Signal-Theft Limit Counter Value-Migration Functions}'s
-	function \co{flush_local_count_sig()}, why are there
-	\co{READ_ONCE()} and \co{WRITE_ONCE()} wrappers around
-	the uses of the
-	\co{theft} per-thread variable?
+	doesn't \co{flush_local_count_sig()} need stronger memory barriers?
 }\QuickQuizAnswer{
-	\begin{fcvref}[ln:count:count_lim_sig:migration:flush_sig]
-	The first one (on \clnref{check:REQ}) can be argued to be unnecessary.
-	The last two (\clnref{set:ACK,set:READY}) are important.
-	If these are removed, the compiler would be within its rights
-	to rewrite \clnrefrange{set:ACK}{set:READY} as follows:
-	\end{fcvref}
-
-\begin{VerbatimN}[firstnumber=14]
-theft = THEFT_READY;
-if (counting) {
-	theft = THEFT_ACK;
-}
-\end{VerbatimN}
-
-	This would be fatal, as the slowpath might see the transient
-	value of \co{THEFT_READY}, and start stealing before the
-	corresponding thread was ready.
+	No, that \co{smp_store_release()} suffices because this code
+	communicates only with \co{flush_local_count()}, and there is
+	no need for store-to-load ordering.
 }\QuickQuizEnd
 
 \begin{fcvref}[ln:count:count_lim_sig:migration:flush]
