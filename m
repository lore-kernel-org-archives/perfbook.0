Return-Path: <perfbook-owner@vger.kernel.org>
Received: from ams.source.kernel.org ([145.40.68.75]:46176 "EHLO
        ams.source.kernel.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229951AbiAVANB (ORCPT
        <rfc822;perfbook@vger.kernel.org>); Fri, 21 Jan 2022 19:13:01 -0500
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 25017B82139
        for <perfbook@vger.kernel.org>; Sat, 22 Jan 2022 00:13:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1642810378;
        bh=MxqkpPTcjwyWeOBcvV0EMrM8y6uDz2p53vNjqH3Pce0=;
        h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
        b=kRrtxqKTzclpQLQliYPPL3QV0aXKSf+3gPswmwsXMh4yhOAB6dFNKJXR4kS46D0Om
         i5ZAlv5DCUgKt6TuXHePMQJc+TgXwj+Gnv4U5AZRcuxdEUZUyiAyEO/+TUg1AboAFg
         itC4mo9xMuonDhBqK1Xlt+uXDWgVn8NzBgwFkppDaz32B+QvDohfMJo4iNKsxJFoCX
         qsAaDwpUhFXa+qR1xn47cvXpvnH3e00+Mo6entMy94kaOeA825rrmqokERqDry9yOx
         xncwAQO84pomkQDZSoNmM2HWyb01H7W/putDfP70j0EUqzFxEUdOmdPZ+KZDF1k8DP
         hKMQfywrPUM0w==
Date: Fri, 21 Jan 2022 16:12:58 -0800
From: "Paul E. McKenney" <paulmck@kernel.org>
Subject: Re: [NOT A PATCH -perfbook] index of 'Non-Blocking' in Glossary
Message-ID: <20220122001258.GB947480@paulmck-ThinkPad-P17-Gen-1>
Reply-To: paulmck@kernel.org
References: <c4add712-74a7-cb57-77c8-6ee8d9b529a4@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c4add712-74a7-cb57-77c8-6ee8d9b529a4@gmail.com>
List-ID: <perfbook.vger.kernel.org>
To: Akira Yokosawa <akiyks@gmail.com>
Cc: perfbook@vger.kernel.org

On Fri, Jan 21, 2022 at 09:29:24AM +0900, Akira Yokosawa wrote:
> Not-signed-off-by: Akira Yokosawa <akiyks@gmail.com>
> ---
> Hi Paul,
> 
> This is a reminder in sent as a patch.
> 
> I find the indexing tag you put to "Non-Blocking" looks strange.
> This entry talks about some classes of forward-progress guarantees,
> not much about synchronization.
> Also, the existing tags of NBS are \IXacr{}.  You therefore
> need to use \glsuseriii{nbs} as shown below in a separate entry
> of "Non-Blocking Synchronization (NBS)".
> 
> I think NBS deserves its own entry in the Glossary.
> 
>         Thanks, Akira
> 
> --
>  glossary.tex | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/glossary.tex b/glossary.tex
> index 86d9a025..4ea87f60 100644
> --- a/glossary.tex
> +++ b/glossary.tex
> @@ -425,7 +425,7 @@
>  	These are used for hardware-specific purposes such as profiling.
>  	The advantage of using NMIs for profiling is that it allows you
>  	to profile code that runs with interrupts disabled.
> -\item[\IXGaltr{Non-Blocking}{Non-blocking synchronization (NBS)}:]
> +\item[\IXG{Non-Blocking}:]
>  	A group of academic forward-progress guarantees that includes
>  	bounded population-oblivious wait free,
>  	bounded wait free,
> @@ -437,6 +437,8 @@
>  	deadlock free.
>  	See \cref{sec:advsync:Non-Blocking Synchronization}
>  	for more information.
> +\item[Non-Blocking Synchronization (NBS):]\glsuseriii{nbs}
> +	%@@@ Need expansion @@@
>  \item[NUCA:]\glsuseriii{nuca}
>  	Non-uniform cache architecture, where groups of CPUs share
>  	caches and/or store buffers.

Good points!

How about like this?

							Thanx, Paul

------------------------------------------------------------------------

commit a8152ff934df7cfaccb8bdc1fa376c5d11737995
Author: Paul E. McKenney <paulmck@kernel.org>
Date:   Fri Jan 21 16:11:09 2022 -0800

    glossary: Update non-blocking and add NBS
    
    Took index-addition commands from Akira's email dated January 20.
    
    Suggested-by: Akira Yokosawa <akiyks@gmail.com>
    Signed-off-by: Paul E. McKenney <paulmck@kernel.org>

diff --git a/glossary.tex b/glossary.tex
index 86d9a025..1d4a2404 100644
--- a/glossary.tex
+++ b/glossary.tex
@@ -425,7 +425,7 @@
 	These are used for hardware-specific purposes such as profiling.
 	The advantage of using NMIs for profiling is that it allows you
 	to profile code that runs with interrupts disabled.
-\item[\IXGaltr{Non-Blocking}{Non-blocking synchronization (NBS)}:]
+\item[\IXG{Non-Blocking}:]
 	A group of academic forward-progress guarantees that includes
 	bounded population-oblivious wait free,
 	bounded wait free,
@@ -437,6 +437,13 @@
 	deadlock free.
 	See \cref{sec:advsync:Non-Blocking Synchronization}
 	for more information.
+\item[Non-Blocking Synchronization (NBS):]\glsuseriii{nbs}
+	The use of algorithms, mechanisms, or techniques that provide
+	non-blocking forward-progress guarantees.
+	NBS is often used in a more restrictive sense of providing one
+	of the stronger forward-progress guarantee, usually wait free or
+	lock free, but sometimes also obstruction free.
+	(See ``Non-blocking''.)
 \item[NUCA:]\glsuseriii{nuca}
 	Non-uniform cache architecture, where groups of CPUs share
 	caches and/or store buffers.
