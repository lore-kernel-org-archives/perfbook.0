Return-Path: <perfbook-owner@vger.kernel.org>
Received: from mail.kernel.org ([198.145.29.99]:32896 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229632AbhGTQxA (ORCPT <rfc822;perfbook@vger.kernel.org>);
        Tue, 20 Jul 2021 12:53:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1626802418;
        bh=37cvP7JDZXmqb0nQQIWhGE6r/h1eK98okCaDXtjvK6I=;
        h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
        b=jKL0/8XQuVcPswPWfi+MT06Kx02rSQQyGya4+fySrQLEJBNefRdn+I4Obe3C/YhUy
         DBrxDE2VuGBPWFvnNw7NiKjrhyMIHAM93izGweq9IlO8u+Qs8vqaoAMSB+KkMhLPfz
         TiqkE3MRPwp5ZVgMd24b5pHVo+PEaUQQHpv1ihwcy+I0MPmMz3IL4GLphF6vLBsKTx
         /0fdJvOoZftbZpqX4WeCq9oKBt8KFFFNewYPQpfk04I2APZ9f1i/E1FazOn+8fPZ2F
         RvASRRu25nNgUR01XZSj2temF4JOJAAiwhZlhwC4wqdYNtnDZR11s4kUxRqUsfveO2
         TAaAs5nfwcQMg==
Date: Tue, 20 Jul 2021 10:33:37 -0700
From: "Paul E. McKenney" <paulmck@kernel.org>
Subject: Re: [PATCH -perfbook] defer: remove superfluous preposition
Message-ID: <20210720173337.GL4397@paulmck-ThinkPad-P17-Gen-1>
Reply-To: paulmck@kernel.org
References: <1626765445-5916-1-git-send-email-zhouzhouyi@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1626765445-5916-1-git-send-email-zhouzhouyi@gmail.com>
List-ID: <perfbook.vger.kernel.org>
To: Zhouyi Zhou <zhouzhouyi@gmail.com>
Cc: perfbook@vger.kernel.org, luyang.co@gmail.com

On Tue, Jul 20, 2021 at 03:17:25PM +0800, Zhouyi Zhou wrote:
> Hi, Paul
>  I think preposition 'on' here is superfluous, correct me if I am wrong.
> Best Wishes
> Zhouyi

The current text is technically grammatically correct, but as you
noticed, rather awkward.  I should rework that sentence and the one
following.  Huh.  Actually, I should rework that entire paragraph.

How about the following?

							Thanx, Paul

------------------------------------------------------------------------

commit 5eb7525e2f7338ea6b817c145a9b4da60e6871d1
Author: Paul E. McKenney <paulmck@kernel.org>
Date:   Tue Jul 20 10:31:03 2021 -0700

    defer/rcufundamental: Wordsmith QQ answer about writes in RCU readers
    
    Reported-by: Zhouyi Zhou <zhouzhouyi@gmail.com>
    Signed-off-by: Paul E. McKenney <paulmck@kernel.org>

diff --git a/defer/rcufundamental.tex b/defer/rcufundamental.tex
index 66f9b702..054512e0 100644
--- a/defer/rcufundamental.tex
+++ b/defer/rcufundamental.tex
@@ -330,12 +330,17 @@ greater detail in \cref{sec:memorder:RCU}.
 	\co{P1()}'s grace period.
 
 	It might seem strange to have RCU read-side critical sections
-	containing writes, but RCU is just fine with this.
-	This capability is used frequently in the Linux kernel, for
-	example, acquiring a lock on or reference to a data structure.
-	Acquiring either a lock or a reference results in a write
-	to memory, and it is OK to do these within an RCU read-side
-	critical section.
+	containing writes, but this capability is not only permitted,
+	but also highly useful.
+	For example, the Linux kernel frequently carries out an
+	RCU-protected traversal of a linked data structure and then
+	acquires a reference to the destination data element.
+	Because this data element must not be freed in the meantime,
+	that element's reference counter must necessarily be incremented
+	within the traversal's RCU read-side critical section.
+	However, that increment entails a write to memory.
+	Therefore, it is a very good thing that memory writes are
+	permitted within RCU read-side critical sections.
 
 	If having writes in RCU read-side critical sections still seems
 	strange, please review
