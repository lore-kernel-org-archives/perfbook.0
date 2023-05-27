Return-Path: <perfbook-owner@vger.kernel.org>
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48778 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232343AbjE0KjQ (ORCPT
        <rfc822;perfbook@vger.kernel.org>); Sat, 27 May 2023 06:39:16 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3C0921A7
        for <perfbook@vger.kernel.org>; Sat, 27 May 2023 03:39:13 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id A933260B67
        for <perfbook@vger.kernel.org>; Sat, 27 May 2023 10:39:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1685183952;
        bh=H+whb6ApKievb9FSS9b5DTiQQ0XtAUgpPLxzK8GQOy0=;
        h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
        b=Lah8BVIOXpzAcSSczTXdq5AQy0X5t97S4L0bj16oSNKG7rNJRKkLWJSUzY1+4+Z7U
         HvsZspaIMchv3MS4nP3NnEVW4XS4MxKncfMHFwEkF+9nekBSpauDidH9NanzkrDRrF
         x+UlhPhYhJWBH5b2Iky+Ux5V3MpV8zqPuSNoNW5iI0CYb0XbD43kqn9zaWGY4g9pd1
         SQtE1HUpDherynR6S+QujNMLrtML/MmDvRF/IQESFW682OBaNNfxG8DIJ6kZptH9Ko
         qwREKkhEe3PkPSSiR2L6hnqk06g9spaMImL4UIr8ZleOms2PVEm/Wyax0gDn5lijhs
         qTEjlxRZBI6/A==
Date: Sat, 27 May 2023 03:39:09 -0700
From: "Paul E. McKenney" <paulmck@kernel.org>
Subject: Re: [PATCH] formal/spinhint: Clarify the proof
Message-ID: <209486bf-2ad8-4625-a67e-85e56d9877de@paulmck-laptop>
Reply-To: paulmck@kernel.org
References: <20230514145123.37079-1-mmpgouride@gmail.com>
 <779cf72a-ab43-4b52-96be-8cd02ced105e@paulmck-laptop>
 <1FF6F171-B66C-47B0-91AB-36D4AF10F426@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1FF6F171-B66C-47B0-91AB-36D4AF10F426@gmail.com>
List-ID: <perfbook.vger.kernel.org>
To: Alan Huang <mmpgouride@gmail.com>
Cc: perfbook@vger.kernel.org

On Sun, May 21, 2023 at 07:35:56PM +0800, Alan Huang wrote:
> 
> > 2023年5月21日 18:20，Paul E. McKenney <paulmck@kernel.org> 写道：
> > 
> > On Sun, May 14, 2023 at 02:51:23PM +0000, Alan Huang wrote:
> >> The third step and the fourth step seem to have no causal relationship between them.
> >> Therefore, this patch explains under what circumstances both counters will be at least 1.
> >> 
> >> Signed-off-by: Alan Huang <mmpgouride@gmail.com>
> >> ---
> >> formal/spinhint.tex | 5 +++--
> >> 1 file changed, 3 insertions(+), 2 deletions(-)
> >> 
> >> diff --git a/formal/spinhint.tex b/formal/spinhint.tex
> >> index 16764aef..dd2e88cc 100644
> >> --- a/formal/spinhint.tex
> >> +++ b/formal/spinhint.tex
> >> @@ -1103,8 +1103,9 @@ follows:
> >> execution.
> >> \item The counter corresponding to this reader will have been
> >> at least 1 during this time interval.
> >> -\item The \co{synchronize_qrcu()} code forces at least one
> >> - of the counters to be at least 1 at all times.
> > 
> > So this part is true and fundamental to understanding the code.  You can
> > see this on lines 31-33 of Listing 12.14 ("QRCU Updater Process").
> > This code increments the next counter before decrementing the previous
> > counter.  I therefore don't see how we can reasonably delete this item.
> 
> Yes, this item is completely correct.
> 
> > 
> >> +\item If the counter corresponding to this reader is 1, then
> >> + the other counter is at least 1 because of the completion of
> >> + counter flip.
> > 
> > However, we could potentially add this as an intermediate consequence
> > of items 2 and 3.  Maybe something like this?
> > 
> > \item The above two items imply that if the counter corresponding
> > to this reader is exactly one, then the other counter must be
> > greater than or equal to one.  Similarly, if the other counter
> > is equal to zero, then the counter corresponding to the
> > reader must be greater than or equal to two.
> 
> That will be very helpful, adding an item will be better than deleting one!

Very good, thank you!  I have added the following, with your
Reported-by.

							Thanx, Paul

------------------------------------------------------------------------

commit cbef7a09aa845ca2eded65a124970c6508d4b2b2
Author: Paul E. McKenney <paulmck@kernel.org>
Date:   Sat May 27 03:35:55 2023 -0700

    spinhint: Add clarifying step to QRCU by-hand proof
    
    Reported-by: Alan Huang <mmpgouride@gmail.com>
    Signed-off-by: Paul E. McKenney <paulmck@kernel.org>

diff --git a/formal/spinhint.tex b/formal/spinhint.tex
index 16764aef..9e68198e 100644
--- a/formal/spinhint.tex
+++ b/formal/spinhint.tex
@@ -1105,6 +1105,11 @@ follows:
 	at least 1 during this time interval.
 \item	The \co{synchronize_qrcu()} code forces at least one
 	of the counters to be at least 1 at all times.
+\item	The above two items imply that if the counter corresponding
+	to this reader is exactly one, then the other counter must be
+	greater than or equal to one.
+	Similarly, if the other counter is equal to zero, then the counter
+	corresponding to the reader must be greater than or equal to two.
 \item	Therefore, at any given point in time, either one of the
 	counters will be at least 2, or both of the counters will
 	be at least one.
