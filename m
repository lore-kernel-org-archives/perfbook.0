Return-Path: <perfbook-owner@vger.kernel.org>
Received: from mail.kernel.org ([198.145.29.99]:59956 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1351573AbhERSiB (ORCPT <rfc822;perfbook@vger.kernel.org>);
        Tue, 18 May 2021 14:38:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1621363002;
        bh=HaQQEot3etGiOvVEaHk/rAgROAL6Fk3WdMA83L2+p34=;
        h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
        b=WK4w2hpRU2f0mAgEi6e6OWc+IGCniysEOzVx+PAZ70d1uA2Uh0nRvzmdN9DvZSj55
         9MN3SrBFN1fOLKrjHhHZwPiBWZ2tEO63AUCHG0WUUIOXiI6CjCOtOz+P6JzscpU9Cl
         Duuv7PI7WS2InDaiwwFn8UjC2haQ96hca/AhriRZy207M+a3I5M2OYOitiOTqofzN4
         OkGKQTNzEU92+rCiWIv/UN/LMAYgtu2o4M5zHWEc2A65leKI/UDI/0vl+xfQt7+2y7
         3K3rXJ1kj+GUg6vDdoQiI3VWMLwNZV6NBKlZKaahJyh0HRZh/CVM4TFKsOhFR5qvsN
         i8ceIbrc2Mqeg==
Date: Tue, 18 May 2021 11:36:42 -0700
From: "Paul E. McKenney" <paulmck@kernel.org>
Subject: Re: [PATCH] RFC: possible fixing a preposition
Message-ID: <20210518183642.GP4441@paulmck-ThinkPad-P17-Gen-1>
Reply-To: paulmck@kernel.org
References: <20210518161244.7340-1-zhouzhouyi@gmail.com>
 <20210518173524.GN4441@paulmck-ThinkPad-P17-Gen-1>
 <CAABZP2zJD40KwPH0mqSLU5Dvh-pNsaHYxFg7A4WmDSMd15H22A@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAABZP2zJD40KwPH0mqSLU5Dvh-pNsaHYxFg7A4WmDSMd15H22A@mail.gmail.com>
List-ID: <perfbook.vger.kernel.org>
To: Zhouyi Zhou <zhouzhouyi@gmail.com>
Cc: Yang Lu <luyang.co@gmail.com>, perfbook@vger.kernel.org

On Wed, May 19, 2021 at 02:21:54AM +0800, Zhouyi Zhou wrote:
> Thanks Paul for reviewing my incorrect proposal.

No problem!  After all, if I were ever to have to write a document
in Chinese, I would need quite a bit of help.  Like the help you are
currently providing by doing this translation.  ;-)

> On Wed, May 19, 2021 at 1:35 AM Paul E. McKenney <paulmck@kernel.org> wrote:
> >
> > In this case, "add" as in "addition" as in arithmetic, similar to the
> > C-language "+=" operator.  But...
> I see, my English is improved a lot by this case, thank you
> >
> > Would "add the value one to the global free-running rcu_gp_ctr variable"
> > work better for you?
> "add the value one to the global free-running rcu_gp_ctr variable" looks
> great to me.

Very good!  How about as shown below?

							Thanx, Paul

------------------------------------------------------------------------

commit 498ad5f93ea7a531bd79592b08c072ebd73bb188
Author: Paul E. McKenney <paulmck@kernel.org>
Date:   Tue May 18 11:34:25 2021 -0700

    appendix/toyrcu: Wordsmith "add the value one to"
    
    Reported-by: Zhouyi Zhou <zhouzhouyi@gmail.com>
    Signed-off-by: Paul E. McKenney <paulmck@kernel.org>

diff --git a/appendix/toyrcu/toyrcu.tex b/appendix/toyrcu/toyrcu.tex
index 9e5c01d5..39e43e30 100644
--- a/appendix/toyrcu/toyrcu.tex
+++ b/appendix/toyrcu/toyrcu.tex
@@ -976,7 +976,7 @@ The resulting \co{rcu_read_lock()} implementation is extremely
 straightforward.
 \begin{fcvref}[ln:defer:rcu:read_lock_unlock:lock]
 \Clnref{gp1,gp2} simply
-add one to the global free-running \co{rcu_gp_ctr}
+add the value one to the global free-running \co{rcu_gp_ctr}
 variable and stores the resulting odd-numbered value into the
 \co{rcu_reader_gp} per-thread variable.
 \Clnref{mb} executes a memory barrier to prevent the content of the
