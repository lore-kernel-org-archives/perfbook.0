Return-Path: <perfbook-owner@vger.kernel.org>
Received: from mail.kernel.org ([198.145.29.99]:36766 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726366AbgAQDgJ (ORCPT <rfc822;perfbook@vger.kernel.org>);
        Thu, 16 Jan 2020 22:36:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1579232168;
        bh=nt7f9gmD5vWr1FDjZrorrTIKXXyOkTCUVZp9d44OymA=;
        h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
        b=DaNkIne4hO/5PrBGO0h6agDQ36lynqVOFr7bKr33e3VTnldUpqMJ9eFNP/ss8VjkE
         AfDnb9FGJeGK+E+XwGqFStCNVKZfBvbrAuFlz3JIVoXUbV/l7nQFxfZWrJ0HgWh91p
         b0uuPFCyMb3EJ+lPgT/S0ajDBu/uhxIxHfZHSy9o=
Date: Thu, 16 Jan 2020 19:36:08 -0800
From: "Paul E. McKenney" <paulmck@kernel.org>
Subject: Re: [PATCH 2/3] howto: Fix typo
Message-ID: <20200117033608.GD2935@paulmck-ThinkPad-P72>
Reply-To: paulmck@kernel.org
References: <805bd7c5-477f-c398-b025-34a630f663f9@gmail.com>
 <7d340ee9-e333-67f5-863f-9d81fbf068db@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7d340ee9-e333-67f5-863f-9d81fbf068db@gmail.com>
Sender: perfbook-owner@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>
To: Akira Yokosawa <akiyks@gmail.com>
Cc: perfbook@vger.kernel.org

On Fri, Jan 17, 2020 at 06:59:10AM +0900, Akira Yokosawa wrote:
> >From cd352d3dfd20d8fcfdddafe5547ad191cbdda37e Mon Sep 17 00:00:00 2001
> From: Akira Yokosawa <akiyks@gmail.com>
> Date: Mon, 13 Jan 2020 16:18:19 +0900
> Subject: [PATCH 2/3] howto: Fix typo
> 
> Signed-off-by: Akira Yokosawa <akiyks@gmail.com>

I took the other two, thank you very much!

I treated this one as a bug report, again, thank you!  Please see below
for the corresponding commit.  Thoughts?

							Thanx, Paul

> ---
>  howto/howto.tex | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/howto/howto.tex b/howto/howto.tex
> index bbdacbf1..fe80cca8 100644
> --- a/howto/howto.tex
> +++ b/howto/howto.tex
> @@ -23,7 +23,7 @@ Parallel programming is not as hard as some say, and we hope
>  that this book makes your parallel-programming projects easier and
>  more fun.
>  
> -In short, where parallel programming once focused on science, research,
> +In short, while parallel programming once focused on science, research,
>  and grand-challenge projects, it is quickly becoming an engineering
>  discipline.
>  We therefore examine specific parallel-programming tasks
> -- 
> 2.17.1

------------------------------------------------------------------------

commit b094718ddbe4256e606a41c660b4d4f1836baa66
Author: Paul E. McKenney <paulmck@kernel.org>
Date:   Thu Jan 16 19:31:26 2020 -0800

    howto: Word parallel-programming-as-engineering less obscurely
    
    The "where ... once ... becoming" wording might be legal English, it
    is a bit obscure and less than friendly to those whose native language
    is not English.  This commit therefore rewrites the offending paragraph.
    
    Reported-by: Akira Yokosawa <akiyks@gmail.com>
    Signed-off-by: Paul E. McKenney <paulmck@kernel.org>

diff --git a/howto/howto.tex b/howto/howto.tex
index bbdacbf..8a93774 100644
--- a/howto/howto.tex
+++ b/howto/howto.tex
@@ -23,11 +23,12 @@ Parallel programming is not as hard as some say, and we hope
 that this book makes your parallel-programming projects easier and
 more fun.
 
-In short, where parallel programming once focused on science, research,
-and grand-challenge projects, it is quickly becoming an engineering
-discipline.
-We therefore examine specific parallel-programming tasks
-and describe how to approach them.
+In short, the focus of parallel programming is quickly shifting away
+from science, research, and grand-challenge projects.
+And this is all to the good, because it means that parallel programming
+is finally becoming an engineering discipline.
+Therefore, as befits an engineering discipline, this book examines
+specific parallel-programming tasks and describes how to approach them.
 In some surprisingly common cases, they can even be automated.
 
 This book is written in the hope that presenting the engineering
